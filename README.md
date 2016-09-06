# thalesians
My Talk at Zurich, Nov 26

Repository for my material used for my Talk at Zurich

Thanks for coming to my talk at Zurich. I hope you all enjoyed it. 

To **browse** through my slides it is best to use the nbviewer, see http://nbviewer.jupyter.org/github/tschm/thalesians/tree/master/.
Click on any *.ipynb file. You can browse the original slides by clicking on the gift symbol in the top row...

If you are brave you can **reproduce** my results and slides locally. You have to

- clone this repository on your local computer, e.g. you need to install git and start the clone with
```
git clone https://github.com/tschm/thalesians.git
```

- build a Python environment using (mini)conda. Therefore please install http://conda.pydata.org/miniconda.html. I provide build scripts both for Windows and Linux. Note that the build script downloads Python, Jupyter, Mosek, numpy, etc., e.g. all dependencies required for my slides. This can take up to an hour for a first and fresh download. Conda will cache your downloads though and this will be much faster for any subsequent download. 

- run a local Jupyter server. Again there are two scripts to run the server on your local 8888 port. For Windows use ipy.bat and for Linux use start.sh. 

- obtain a valid Mosek license. I have dumped a 30day test license valid 'til Christmas 2015 in the license folder. Mosek is commerical software. I recommend the use of Mosek, see www.mosek.com

My slides are standard IPython notebooks. I am using the RISE extension by Damian Avila to convert them into slideshows: https://github.com/damianavila/RISE. 


Happy computing
