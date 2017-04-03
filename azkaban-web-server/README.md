#### This repository provides debian package for [azkaban web server](http://azkaban.github.io/azkaban/docs/latest/#webserver-setup) 

Web server serves as a www GUI for managing processed flows & jobs. It picks executors which will run the flow.

#### Installation

 - You have checked-out the original azkaban project as a submodule, see main README.md
 - You run (with missing dependencies always run just `sudo apt-get install -f`)
```bash
make localtest
```
 - You should initialize your database, see main README.md

#### Project hiearchy (azkaban-web-server)

 - Package installs azkaban using Filesystem Hiearchy Standard
 - Configuration files are in /etc/azkaban-web-server + /etc/azkaban-web-server/plugins
 - Library files are in /usr/lib/azkaban-web-server
 - Web files are in /usr/share/azkaban-web-server/web
 - Executables are created in /usr/bin to provide non-link access to azkaban run/stop scripts (this is because they cannot run when symlinked ..)
