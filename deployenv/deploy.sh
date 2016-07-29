#!/bin/bash


# This script deploys:
# - waLBerla website including C++ and Python documentation
# - conda package of waLBerla's Python module
# - docker image to run IPython notebook with waLBerla


# Clone repositories
git clone https://gitlab-ci-token:${WALBERLA_CI_TOKEN}@i10git.cs.fau.de/software/walberla.git
git clone https://gitlab-ci-token:${WALBERLA_WEBSITE_CI_TOKEN}@i10git.cs.fau.de/administration/walberla-website.git
git clone https://github.com/lssfau/walberla-dockerfiles.git 

#!/bin/bash

BASE_DIR=`pwd`
WALBERLA_DIR=$BASE_DIR/walberla
WEBSITE_DIR=$BASE_DIR/walberla-website
DEPLOY_REPO_DIR=$BASE_DIR/walberla-dockerfiles


export PATH=$PATH:/root/miniconda3/bin

# -------------------  Build conda package and upload it to conda cloud ---------------------

echo " ---- Building conda package ----- "
cd $DEPLOY_REPO_DIR/conda/walberla 
WALBERLA_CI_TOKEN=$WALBERLA_CI_TOKEN python generateMetaYaml.py
conda build -c lssfau . 
anaconda login --username lssdeploy --password $ANACONDA_DEPLOY_PASSWORD
anaconda upload --user lssfau /root/miniconda3/conda-bld/linux-64/walberla-*.dev0-0.tar.bz2 
conda install -y -q -c lssfau walberla  # install the package that has been uploaded just now



# -------------------------  Create website and upload it to i10web -------------------------

echo " ---- Generating Website  ----- "
cd $WEBSITE_DIR
mkdir generated
python main.py generated --walberla-dir $WALBERLA_DIR
sshpass -p $I10WEB_DEPLOY_PASSWORD ssh -o 'StrictHostKeyChecking no' deploy@i10web rm -rf ~deploy/www.walberla.net
sshpass -p $I10WEB_DEPLOY_PASSWORD scp -r -o 'StrictHostKeyChecking no' generated deploy@i10web:~deploy/www.walberla.net
sshpass -p $I10WEB_DEPLOY_PASSWORD ssh deploy@i10web sudo /srv/www/deploy_walberla_net.sh


# ---------------------  Create docker image and upload it to dockerhub  ---------------------

echo " ---- Create docker run environment for waLBerla  ----- "

cd $DEPLOY_REPO_DIR/runenv/ubuntu-ipython3/
cp -r $WALBERLA_DIR .
docker build -t walberla/runenv-ubuntu-python-build -f Dockerfile.build .
docker run --rm walberla/runenv-ubuntu-python-build > pywaLBerla.tar.gz
docker build -t walberla/runenv-ubuntu-python -f Dockerfile.dist .
docker login -u lssdeploy -p $DOCKERHUB_DEPLOY_PASSWORD
docker push walberla/runenv-ubuntu-python


