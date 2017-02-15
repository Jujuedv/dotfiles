#!/bin/zsh

if [ -z ${SYMLINKS_REL+x} ]; then echo "this should not be run on its own"; exit 1; fi

SYMLINKS_REL+=(".i3\0.config/i3")
SYMLINKS_REL+=(".powerline\0.config/powerline")
SYMLINKS_REL+=("compton\0.config/compton")
SYMLINKS_REL+=(".fehbg\0.fehbg")
