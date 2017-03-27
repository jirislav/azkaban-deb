#### This repository provides debian package for [azkaban execution server](http://azkaban.github.io/azkaban/docs/latest/#executor-setup) 

After cloning this repository, run also update for submodules:
```bash
git submodule update --init --recursive
```

Or clone this repository directly with all submodules:
```bash
git clone --recursive
```

Also, don't forget to checkout some stable version in src (maybe latest tag?) .. that depends on you ..

#### Official project documentation
 - [Latest Docs](http://azkaban.github.io/azkaban/docs/latest/)
 - [Getting Started](http://azkaban.github.io/azkaban/docs/latest/#getting-started)
 - [Configuration](http://azkaban.github.io/azkaban/docs/latest/#configuration)
 - [Creating Flows](http://azkaban.github.io/azkaban/docs/latest/#creating-flows)

#### Project hiearchy (azkaban-exec-server)

 - Package installs azkaban using Filesystem Hiearchy Standard
 - Configuration files are in /etc/azkaban-exec-server + /etc/azkaban-exec-server/plugins
 - Library files are in /usr/lib/azkaban-exec-server
 - Executables are created in /usr/bin to provide non-link access to azkaban run/stop scripts (this is because they cannot run when symlinked ..)
