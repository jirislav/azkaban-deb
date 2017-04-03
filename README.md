#### What's this about

This project provides bundle of debian packages for azkaban's servers. Particularly it's web server, executor server, or combined solo server, which has web server & exec server bundled in it, it's own database included, so that you can install it & run jobs right away without any hassle.

#### Installation

##### 1. Initialize submodules
After cloning this repository, run also update for submodules:
```bash
git submodule update --init --recursive
```

Or clone this repository directly with all submodules:
```bash
git clone --recursive
```

##### 2. Checkout version

It's time to checkout some stable version in src (maybe (latest tag)[https://github.com/azkaban/azkaban/releases]?) .. that depends on you ..

##### 3. Bootstrapping

Now you should build the azkaban at current version by running just
```bash
./configure
```

Make sure, you have NPM installed. There is npm bundled in upstream azkaban repo, but it's not configurable, e.g. for your own NPM registry.

Note that if the configure timeout's on NPM's install, you should check that you can access configured NPM registry. Edit ./configure if needed.

##### 4. Package building

Now pick a server you'd like to install, cd into it & run `make deb`

Or, alternatively, if you want to make the debian package and install it right away on current machine, run `make localtest`

##### 5. MySQL Database setup

Note that DB setup is not needed in case you are OK with running only solo server, which has it's own database bundled.

However, web server & exec server needs dedicated MySQL.

###### 5.1. DB initialization

Create azkaban database
```mysql
mysql> CREATE DATABASE azkaban;
```

Create user with access to azkaban database
```mysql
mysql> CREATE USER 'azkaban-user'@'%' IDENTIFIED BY 'azkaban-password';
mysql> GRANT CREATE,SELECT,INSERT,UPDATE,DELETE,INDEX ON azkaban.* to 'azkaban-user'@'%' WITH GRANT OPTION;
mysql> FLUSH PRIVILEGES;
```

Enlarge `max_allowed_packet` to something like 1024M.
```bash
sudo editor /etc/mysql/my.cnf
```
```ini
[mysqld]
...
max_allowed_packet=1024M
```

And restart MySQL:
```bash
sudo /sbin/service mysqld restart || sudo /sbin/service mysql restart
```

##### 6. Configuration setup

After an server is installed, set up the preferences into the configuration file `/etc/azkaban-{solo,web,exec}-server/azkaban.properties` (login, pw, database, host, port)
```ini
# DB connection setup
database.type = mysql
mysql.port = 3306
mysql.host = localhost
mysql.database = azkaban
mysql.user = azkaban-user
mysql.password = azkaban-password
mysql.numconnections = 100
```

##### 7. Run/stop the server

All start/stop scripts are installed in /usr/bin

For web-server
```bash
azkaban-web-start
azkaban-web-shutdown
```

For exec-server
```bash
azkaban-exec-start
azkaban-exec-shutdown
```

For solo-server
```bash
azkaban-solo-start
azkaban-solo-shutdown
```

#### Official project documentation
 - [Latest Docs](http://azkaban.github.io/azkaban/docs/latest/)
 - [Getting Started](http://azkaban.github.io/azkaban/docs/latest/#getting-started)
 - [Configuration](http://azkaban.github.io/azkaban/docs/latest/#configuration)
 - [Creating Flows](http://azkaban.github.io/azkaban/docs/latest/#creating-flows)


