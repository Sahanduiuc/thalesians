#!./env/bin/python
"""
Usage: python remove_output.py notebook.ipynb [ > without_output.ipynb ]
Modified from remove_output by:
damianavila (https://gist.github.com/damianavila/5305869)
"""
import io
import os
from nbformat import read, write


def remove_outputs(nb):
    """remove the outputs from a notebook"""
    for cell in nb.cells:
        if cell.cell_type == 'code':
            cell.outputs = []
            cell.execution_count = None


if __name__ == '__main__':
    BASEPATH = os.getcwd()
    for fname in [f for f in os.listdir(BASEPATH) if f.endswith(".ipynb")]:
        print(fname)
        with io.open(fname, 'r') as f:
            nb = read(f, 4)
            remove_outputs(nb)
        with io.open(fname, 'w', encoding='utf8') as f:
            write(nb, f, 4)
            #print("wrote {0}".format(new_ipynb))
