#!/bin/bash
sudo docker run -it  -v /var/run/docker.sock:/var/run/docker.sock --env-file secrets.env  walberla/deploy
