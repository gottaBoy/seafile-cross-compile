
version = 6.2.4
THREADS = 4

HOST_OS = MINGW32


JANSSONDIR       = jansson-2.11
LIBEVENTDIR      = libevent-2.1.8-stable
LIBSEARPCDIR     = libsearpc-3.1-latest
SEAFILEDIR       = seafile-$(version)
SEAFILECLIENTDIR = seafile-client-$(version)


ifeq ($(HOST_OS),)
PREFIX = $(shell pwd)/build
export PATH = $(PREFIX)/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin
export PKG_CONFIG_PATH = $(PREFIX)/lib/pkgconfig
export C_INCLUDE_PATH = $(PREFIX)/include
export CPLUS_INCLUDE_PATH = $(PREFIX)/include
export PYTHON_DIR =  $(PREFIX)/python
else
HOST = i686-w64-mingw32
BUILD = x86_64-redhat-linux-gnu
TARGET = i686-w64-mingw32
PREFIX = $(shell pwd)/ms-build
OPTION = --host=$(HOST) --build=$(BUILD) --target=$(TARGET)
#添加交叉编译cmake文件的路径
TOOLCHAIN = -DCMAKE_TOOLCHAIN_FILE=/seafile/src/toolchain-i686-w64-mingw32.cmake
export PATH = $(PREFIX)/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/bin
export PKG_CONFIG = mingw32-pkg-config
export PKG_CONFIG_PATH = /usr/$(TARGET)/sys-root/mingw/lib/pkgconfig:$(PREFIX)/lib/pkgconfig
export C_INCLUDE_PATH = $(PREFIX)/include:/usr/$(TARGET)/sys-root/mingw/include
export CPLUS_INCLUDE_PATH = $(PREFIX)/include
export PYTHON_DIR =  $(PREFIX)/python
endif

jansson:
	cd $(JANSSONDIR);\
	./configure --prefix=$(PREFIX) $(OPTION);\
	make -j $(THREADS);\
	make install

libevent:
	cd $(LIBEVENTDIR);\
	./configure --prefix=$(PREFIX) $(OPTION);\
	make -j $(THREADS); \
	make install

libsearpc: jansson libevent
	cd $(LIBSEARPCDIR); \
	sed -i 's/build_os/host_os/g' configure.ac;\
	bash ./autogen.sh; \
	./configure --prefix=$(PREFIX) $(OPTION); \
	make -j $(THREADS); \
	make install

seafile: libsearpc
	cd $(SEAFILEDIR);\
	sed -i 's/Rpc.h/rpc.h/g' lib/utils.c;\
	sed -i 's/build_os/host_os/g' configure.ac;\
	sed -i 's/lRpcrt4/lrpcrt4/g' configure.ac;\
	sed -i 's/AccCtrl.h/accctrl.h/g' daemon/set-perm.c;\
	sed -i 's/AclApi.h/aclapi.h/g' daemon/set-perm.c;\
	bash ./autogen.sh;\
	./configure --prefix=$(PREFIX) $(OPTION);\
	make -j $(THREADS);\
	make install

seafileclient:seafile
	cd $(SEAFILECLIENTDIR);\
	sed -i 's/ShlObj.h/shlobj.h/g' src/ui/init-seafile-dialog.cpp;\
	cmake $(TOOLCHAIN) -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=$(PREFIX); \
	make -j $(THREADS); \
	make install

clean:
	make -C $(SEAFILECLIENTDIR) clean; \
	make -C $(LIBEVENTDIR) clean;  \
	make -C $(JANSSONDIR) clean; \
	make -C $(LIBSEARPCDIR) clean; \
	make -C $(SEAFILEDIR) clean

