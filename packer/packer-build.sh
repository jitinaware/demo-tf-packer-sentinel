#!/bin/bash

set -e

packer validate .
packer build .