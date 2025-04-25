PKG_NAME = zashboard
PKG_VERS = 1.82.0
PKG_EXT = zip
PKG_DIST_NAME = dist.$(PKG_EXT)
PKG_DIST_SITE = https://github.com/Zephyruso/zashboard/releases/download/v$(PKG_VERS)
PKG_DIR = dist

DEPENDS = 

HOMEPAGE = https://github.com/Zephyruso/zashboard
COMMENT  = A Dashboard Using Clash API
LICENSE  = GPLv3

REQUIRED_MIN_DSM = 7

override ARCH=noarch

INSTALL_TARGET = zashboard_custom_install

include ../../mk/spksrc.install-resources.mk

.PHONY: zashboard_custom_install
zashboard_custom_install:
	install -m 755 -d $(STAGING_INSTALL_PREFIX)/web
	tar -cf - -C $(EXTRACT_PATH)/$(PKG_DIR) . | tar -xf - -C "$(STAGING_INSTALL_PREFIX)/web"
