#### This repository provides debian package for [azkaban solo server](http://azkaban.github.io/azkaban/docs/latest/#solo-setup)

Solo server contains bundled web-server & executor-server. By installing it you choose to don't have web-server & exec-server apart.

#### Installation

 - You have checked-out the original azkaban project as a submodule, see main README.md
 - You run (withi missing dependencies always run just `sudo apt-get install -f`)
```bash
make localtest
```
 - Database M2 is automatically initialized, no worries :)
  - If you want to have your own managed DB, set it up & configure it at `/etc/azkaban-solo-server`

#### Project hiearchy (azkaban-solo-server)

 - Package installs azkaban using Filesystem Hiearchy Standard
 - Configuration files are in /etc/azkaban-solo-server + /etc/azkaban-solo-server/plugins
 - Library files are in /usr/lib/azkaban-solo-server
 - Other SQL scripts & web definitions are in /var/lib/azkaban-solo-server/
 - Executables are created in /usr/bin to provide non-link access to azkaban run/stop scripts (this is because they cannot run when symlinked ..)
