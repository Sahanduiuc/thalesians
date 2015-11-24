rd /S /Q env
conda create --yes -p env python=2.7.10 pip=7.1.2 pandas=0.17.0 nose=1.3.7 coverage=3.7.1 scipy=0.16.0 ipython-notebook=4.0.4 matplotlib=1.4.3 statsmodels=0.6.1
env\Scripts\pip.exe install -r requirements.txt
env\python RISE-3.x/setup.py install




