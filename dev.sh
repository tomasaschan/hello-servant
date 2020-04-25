#!/bin/bash

set -o pipefail

while true; do
  find . -name '*.hs' -or -name '*.yaml' \
  | grep -v .stack-work \
  | entr -r \
  stack build --test --exec server
done
