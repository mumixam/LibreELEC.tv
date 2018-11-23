# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
# Copyright (C) 2018-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="RTL8822BU"
PKG_VERSION="3adbe92d576fec1d58d2ad03a02ef56ce77a6106"
PKG_SHA256="cc00d09ef4a608f41602686837c79ea3d39abef720d680c99c770b1ccc93daf4"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/MeissnerEffect/rtl8822bu"
PKG_URL="https://github.com/MeissnerEffect/rtl8822bu/archive/$PKG_VERSION.tar.gz"


PKG_DEPENDS_TARGET="toolchain linux"
PKG_NEED_UNPACK="$LINUX_DEPENDS"
PKG_LONGDESC="Realtek RTL8822BU Linux 4.x driver"
PKG_IS_KERNEL_PKG="yes"

pre_make_target() {
  unset LDFLAGS
}

make_target() {
  make V=1 \
       ARCH=$TARGET_KERNEL_ARCH \
       KSRC=$(kernel_path) \
       CROSS_COMPILE=$TARGET_KERNEL_PREFIX \
       CONFIG_POWER_SAVING=n
}

makeinstall_target() {
  mkdir -p $INSTALL/$(get_full_module_dir)/$PKG_NAME
    cp *.ko $INSTALL/$(get_full_module_dir)/$PKG_NAME
}
