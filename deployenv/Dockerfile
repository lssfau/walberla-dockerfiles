FROM walberla/buildenv-ubuntu-basic
MAINTAINER Martin Bauer "martin.bauer@fau.de"

# Secrets that have to be set in the environment:
# - WALBERLA_CI_TOKEN            CI Token for gitlab waLBerla repository 
# - WALBERLA_WEBSITE_CI_TOKEN    CI Token for gitlab repo of waLBerla website
# - ANACONDA_DEPLOY_PASSWORD     Password of user lssdeploy at anaconda cloud, which is used to upload package to lssfau channel
# - DOCKERHUB_DEPLOY_PASSWORD    Password of user lssdeploy at dockerhub, to upload runenv-ubuntu-python package


RUN apt-get update && apt-get install -y doxygen wget apt-transport-https ca-certificates curl lxc iptables

    
# install mini conda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh && \
    /bin/bash Miniconda3-latest-Linux-x86_64.sh -b &&  \
    rm Miniconda3-latest-Linux-x86_64.sh && \
    export PATH=$PATH:/root/miniconda3/bin && \
    conda install -y sphinx pyyaml anaconda-client anaconda-build scipy matplotlib sympy jinja2 && \
    pip install pint sphinx_rtd_theme && \
    curl -sSL https://get.docker.com/ | sh
    

ADD deploy.sh  /usr/bin/deploy

ENTRYPOINT ["/bin/bash", "/usr/bin/deploy"]
