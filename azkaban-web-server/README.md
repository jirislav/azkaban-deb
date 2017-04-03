#### This repository provides debian package for [azkaban web server](http://azkaban.github.io/azkaban/docs/latest/#webserver-setup) 

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

#### Project hiearchy (azkaban-web-server)

 - Package installs azkaban using Filesystem Hiearchy Standard
 - Configuration files are in /etc/azkaban-web-server + /etc/azkaban-web-server/plugins
 - Library files are in /usr/lib/azkaban-web-server
 - Web files are in /usr/share/azkaban-web-server/web
 - Executables are created in /usr/bin to provide non-link access to azkaban run/stop scripts (this is because they cannot run when symlinked ..)
