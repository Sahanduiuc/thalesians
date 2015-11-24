#!/bin/bash
FOLDER="$(cd "$(dirname "$0")" && pwd)"
${FOLDER}/env/bin/ipython notebook #--notebook-dir=${FOLDER}/notebooks --ipython-dir=${FOLDER}/ipy --profile=nbserver
