#!/bin/bash

# Clone waLBerla from internal repository ( access required )
git clone git@i10git.cs.fau.de:software/walberla.git
# Add the source code to private image and build waLBerla there
sudo docker build -t walberla/runenv-ubuntu-python-build -f Dockerfile.build .
# Copy the build results
sudo docker run --rm walberla/runenv-ubuntu-python-build > pywaLBerla.tar.gz
# Create distribution container that does not contain sources ...
sudo docker build -t walberla/runenv-ubuntu-python -f Dockerfile.dist .
# ... and publish it
sudo docker push walberla/runenv-ubuntu-python
