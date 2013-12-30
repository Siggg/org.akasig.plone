Here are some sorts of releases notes.

* 2013-12-29

I tried to bootstrap this buildout but it failed with an obscure "Error: None"
error message while trying to install zc.buildout. The error message seems to
be obscured by a bug in the version of distutils which is provided with Ubuntu
12.04, that is with python 2.7.3. So I had to install python 2.7.5 with the
help of pyenv. Which gives the following procedure for running this buildout
under Ubuntu 12.04 :

1/ install pyenv
2/ install python 2.7.5 using pyenv
3/ set python 2.7.5 as the default python using the "global" and the "local"
pyenv commands
4/ create a virtualenv and activate it, check that python 2.7.5 is being used
5/ enjoy your buildout with python bootstrap.py