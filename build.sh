#!/bin/bash
FOLDER="$(cd "$(dirname "$0")" && pwd)"
rm -rf ${FOLDER}/env
conda create --yes -p ${FOLDER}/env python=2.7.10 pip=7.1.2 pandas=0.17.0 ipython-notebook=4.0.4 matplotlib=1.4.3 statsmodels=0.6.1
${FOLDER}/env/bin/pip install -r ${FOLDER}/requirements.txt
${FOLDER}/env/bin/python ${FOLDER}/RISE-3.x/setup.py install


