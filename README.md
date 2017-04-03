#### What's this about

This project provides bundle of debian packages for azkaban's servers. Particularly it's web server, executor server, or combined solo server, which has web server & exec server bundled in it, it's own database included, so that you can install it & run jobs right away without any hassle.

#### Installation

After cloning this repository, run also update for submodules:
```bash
git submodule update --init --recursive
```

Or clone this repository directly with all submodules:
```bash
git clone --recursive
```

Also, don't forget to checkout some stable version in src (maybe latest tag?) .. that depends on you ..

Now pick a server you'd like to install, build a package & distribute it to your servers.

Finally, set up the database.

##### MySQL Database setup

Note that DB setup is not needed, when you are OK with running only solo server, which has it's own database bundled.

However, web server & exec server needs dedicated MySQL.

###### DB initialization

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

#### Official project documentation
 - [Latest Docs](http://azkaban.github.io/azkaban/docs/latest/)
 - [Getting Started](http://azkaban.github.io/azkaban/docs/latest/#getting-started)
 - [Configuration](http://azkaban.github.io/azkaban/docs/latest/#configuration)
 - [Creating Flows](http://azkaban.github.io/azkaban/docs/latest/#creating-flows)


