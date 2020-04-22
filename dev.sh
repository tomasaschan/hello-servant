#!/bin/bash

set -Euxeo pipefail

find . -name '*.hs' -or -name '*.yaml' \
| grep -v .stack-work \
| entr -r \
stack build --test --exec server
