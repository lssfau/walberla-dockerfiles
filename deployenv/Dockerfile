FROM walberla/buildenv-ubuntu-basic
MAINTAINER Martin Bauer "martin.bauer@fau.de"

# Secrets that have to be set in the environment:
# - GIBLAB_DEPLOY_PASSWORD       Password of deploy user in gitlab to clone waLBerla and waLBerla website repositories
# - ANACONDA_DEPLOY_PASSWORD     Password of user lssdeploy at anaconda cloud, which is used to upload package to lssfau channel
# - DOCKERHUB_DEPLOY_PASSWORD    Password of user lssdeploy at dockerhub, to upload runenv-ubuntu-python package
# - I10WEB_DEPLOY_PASSWORD       Password of deploy user on i10web

ADD 01_nodoc /etc/dpkg/dpkg.cfg.d/01_nodoc

RUN apt-get update && apt-get install -y doxygen wget apt-transport-https ca-certificates curl lxc iptables sshpass libice6 libsm6 libxt6 libxrender1 libfontconfig1 libcups2 perl texlive \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/* 

      
# install mini conda
RUN wget https://repo.continuum.io/miniconda/Miniconda3-4.3.11-Linux-x86_64.sh && \
    /bin/bash Miniconda3-4.3.11-Linux-x86_64.sh -b &&  \
    rm Miniconda3-4.3.11-Linux-x86_64.sh 
    
ENV PATH $PATH:/root/miniconda3/bin    
    
RUN conda install -y sphinx pyyaml anaconda-client conda-build scipy matplotlib sympy jinja2 && \
    pip install pint sphinx_rtd_theme && \
    conda clean --all 
    
RUN curl -sSL https://get.docker.com/ | sh

ADD deploy.sh  /usr/bin/deploy

CMD ["/bin/bash", "/usr/bin/deploy"]
