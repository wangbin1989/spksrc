# Build CMake programs
#
# prerequisites:
# - cross/module depends on meson + ninja
#

# Common makefiles
include ../../mk/spksrc.common.mk
include ../../mk/spksrc.directories.mk

# meson specific configurations
include ../../mk/spksrc.cross-meson-env.mk

# meson cross-file usage definition
include ../../mk/spksrc.cross-meson-crossfile.mk

# configure using meson
ifeq ($(strip $(CONFIGURE_TARGET)),)
CONFIGURE_TARGET = meson_configure_target
endif

# call-up ninja build process
include ../../mk/spksrc.cross-ninja.mk

.PHONY: meson_configure_target

# default meson configure:
meson_configure_target: $(MESON_CROSS_FILE_PKG)
	@$(MSG) - Meson configure
	@$(MSG)    - Dependencies = $(DEPENDS)
	@$(MSG)    - Build path = $(MESON_BUILD_DIR)
	@$(MSG)    - Configure ARGS = $(CONFIGURE_ARGS)
	@$(MSG)    - Install prefix = $(INSTALL_PREFIX)
	@$(MSG) meson setup $(MESON_BUILD_DIR) -Dprefix=$(INSTALL_PREFIX) $(CONFIGURE_ARGS)
	@cd $(MESON_BASE_DIR) && env $(ENV_MESON) meson setup $(MESON_BUILD_DIR) -Dprefix=$(INSTALL_PREFIX) $(CONFIGURE_ARGS)

# call-up regular build process
include ../../mk/spksrc.cross-cc.mk
