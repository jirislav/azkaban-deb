#### This repository provides debian package for [azkaban](https://github.com/azkaban/azkaban)

After cloning this repository, run also update for submodules:
```bash
git submodule update --init --recursive
```

Or clone this repository directly with all submodules:
```bash
git clone --recursive
```

#### Official project documentation
[Latest Docs](http://azkaban.github.io/azkaban/docs/latest/)
[Getting Started](http://azkaban.github.io/azkaban/docs/latest/#getting-started)
[Configuration](http://azkaban.github.io/azkaban/docs/latest/#configuration)
[Creating Flows](http://azkaban.github.io/azkaban/docs/latest/#creating-flows)

#### Project hiearchy

    Package installs azkaban using Filesystem Hiearchy Standard
    
    Configuration files are in /etc/$AZKABAN_TYPE + /etc/$AZKABAN_TYPE/plugins
    
    Library files are in /usr/lib/$AZKABAN_TYPE
    
    Other SQL scripts & web definitions are in /usr/share/$AZKABAN_TYPE/
    
    Executables are created in /usr/bin to provide non-link access to azkaban run/stop scripts (this is because they cannot run when symlinked ..)