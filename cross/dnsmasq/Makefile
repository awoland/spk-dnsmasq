PKG_NAME = dnsmasq
PKG_VERS = 2.80
PKG_EXT = tar.xz
PKG_DIST_NAME = $(PKG_NAME)-$(PKG_VERS).$(PKG_EXT)
PKG_DIST_SITE = http://thekelleys.org.uk/dnsmasq/
PKG_DIR = $(PKG_NAME)-$(PKG_VERS)

DEPENDS = cross/libidn cross/nettle cross/gmp

HOMEPAGE = http://thekelleys.org.uk/dnsmasq/doc.html
COMMENT  = A lightweight DNS, TFTP, PXE, router advertisement and DHCP server. It is intended to provide coupled DNS and DHCP service to a LAN.
LICENSE  = GPLv2/GPLv3

ENV += CURDIR="$(WORK_DIR)/$(PKG_DIR)"

CONFIGURE_TARGET = nop
COMPILE_TARGET = myCompile
INSTALL_TARGET = myInstall

include ../../mk/spksrc.cross-cc.mk

.PHONY: myCompile
myCompile:
	$(RUN) $(MAKE) dnsmasq COPTS="-DHAVE_BROKEN_RTC" VERSION=$(PKG_VERS) PREFIX=$(INSTALL_PREFIX)

.PHONY: myInstall
myInstall:
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/sbin
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/var/dnsmasq.d
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/share
	touch $(STAGING_INSTALL_PREFIX)/var/dnsmasq.leases
	install -m 0755 $(WORK_DIR)/$(PKG_DIR)/dnsmasq $(STAGING_INSTALL_PREFIX)/sbin
	install -m 0644 $(WORK_DIR)/$(PKG_DIR)/trust-anchors.conf $(STAGING_INSTALL_PREFIX)/share
	install -m 0644 $(WORK_DIR)/$(PKG_DIR)/dnsmasq.conf.example $(STAGING_INSTALL_PREFIX)/var
