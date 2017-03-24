DESTDIR=
COMPONENT=azkaban
AZKABAN_TYPE=azkaban-solo-server

#TODO: Create different make targets for each azkaban server type
START_SCRIPT=azkaban-solo-start
STOP_SCRIPT=azkaban-solo-shutdown

BIN=$(DESTDIR)/usr/bin
LIB=$(DESTDIR)/usr/lib/$(AZKABAN_TYPE)
CONF=$(DESTDIR)/etc/$(AZKABAN_TYPE)
CONF_PLUGINS=$(DESTDIR)/etc/$(AZKABAN_TYPE)/plugins
SQL_DEST=$(DESTDIR)/usr/share/${AZKABAN_TYPE}/sql
WEB_DEST=$(DESTDIR)/usr/share/${AZKABAN_TYPE}/web
BIN_DEST=$(DESTDIR)/usr/share/${AZKABAN_TYPE}/bin

BUILD=src/$(AZKABAN_TYPE)/build/install/$(AZKABAN_TYPE)

DEB_VERSION:=$(shell dpkg-parsechangelog | grep Version | cut -d' ' -f2)

PACKAGE="${COMPONENT}_${DEB_VERSION}_all.deb"

all:

deb:
	+dpkg-buildpackage -b -rfakeroot -uc -us && mv ../$(PACKAGE) .

install:
	install -d $(CONF) $(CONF_PLUGINS) $(LIB) $(SQL_DEST) $(WEB_DEST) $(BIN_DEST) $(BIN)
	cp -R $(BUILD)/conf/* $(CONF)
	cp -R $(BUILD)/plugins/* $(CONF_PLUGINS)
	cp -R $(BUILD)/lib/* $(LIB)
	cp -R $(BUILD)/sql/* $(SQL_DEST)
	cp -R $(BUILD)/web/* $(WEB_DEST)
	cp -R $(BUILD)/bin/* $(BIN_DEST)
	ln -s $(CONF) $(BIN_DEST)/../conf
	ln -s $(CONF_PLUGINS) $(BIN_DEST)/../plugins
	ln -s $(LIB) $(BIN_DEST)/../lib
	@./install-binaries.sh "$(DESTDIR)" "$(AZKABAN_TYPE)"

localtest: deb
	dpkg -i $(PACKAGE) || sudo dpkg -i $(PACKAGE)

