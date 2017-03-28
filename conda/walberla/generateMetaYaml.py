#!/usr/bin/env python

from os import environ
from yaml import dump 
from datetime import datetime


if 'GITLAB_DEPLOY_PASSWORD' in environ:
    git_url = 'https://deploy:%s@i10git.cs.fau.de/software/walberla.git' % ( environ['GITLAB_DEPLOY_PASSWORD'], )
else:
    git_url = 'git@i10git.cs.fau.de:software/walberla.git'


now = datetime.now()
version = "%d.%02d.%02d.dev0" % (now.year, now.month, now.day)


contents = {
    'package' : {
        'name'   : 'walberla',
        'version': version,
    },
    
    'source' : {
        'git_url' : git_url,
        'git_rev' : 'master',
    },
    
    'requirements' : {
        'build' : [
                'python >=3.6',
                'git',
                'boost',
                'cmake',
                'gcc [linux]',
                'mpich2 [linux]',
            ],
        'run' : [
                'python >=3.6',
                'boost',
                'numpy',
                'mpich2 [linux]',
        ],
    },
        
    'about' : {
        'home' : 'www.walberla.net',
        'license' : 'GPLv3',
    }
}

with open('meta.yaml', 'w') as f:
    dump(contents, f, default_flow_style=False)
