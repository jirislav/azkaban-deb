#### This repository provides debian package for [azkaban execution server](http://azkaban.github.io/azkaban/docs/latest/#executor-setup) 

Executor server serves as a worker processing flows of jobs defined at azkaban-exec-server.

#### Installation

 - You have checked-out the original azkaban project as a submodule, see main README.md
 - You run (with missing dependencies always run just `sudo apt-get install -f`)
```bash
make localtest
```
 - You should initialize your database, see main README.md

#### Project hiearchy (azkaban-exec-server)

 - Package installs azkaban using Filesystem Hiearchy Standard
 - Configuration files are in /etc/azkaban-exec-server + /etc/azkaban-exec-server/plugins
 - Library files are in /usr/lib/azkaban-exec-server
 - Executables are created in /usr/bin to provide non-link access to azkaban run/stop scripts (this is because they cannot run when symlinked ..)
