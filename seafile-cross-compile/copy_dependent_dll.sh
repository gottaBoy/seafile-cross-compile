#!/bin/bash

MING32_PATH="/usr/i686-w64-mingw32/sys-root/mingw"
SEAFILE_CLIENT="/seafile/src/ms-build/bin/"

#seafile-client-6.2.4
cp ${MING32_PATH}/bin/libcrypto-10.dll \
   ${MING32_PATH}/bin/libcurl-4.dll \
   ${MING32_PATH}/bin/libgcc_s_sjlj-1.dll \
   ${MING32_PATH}/bin/libglib-2.0-0.dll \
   ${MING32_PATH}/bin/libgobject-2.0-0.dll \
   ${MING32_PATH}/bin/libsqlite3-0.dll \
   ${MING32_PATH}/bin/libssl-10.dll  \
   ${MING32_PATH}/bin/zlib1.dll  \
   ${MING32_PATH}/bin/libintl-8.dll \
   ${MING32_PATH}/bin/iconv.dll \
   ${MING32_PATH}/bin/libpcre-1.dll \
   ${MING32_PATH}/bin/libffi-6.dll \
   ${MING32_PATH}/bin/libssh2-1.dll \
   ${MING32_PATH}/bin/libstdc++-6.dll \
   ${MING32_PATH}/bin/libwinpthread-1.dll \
   ${MING32_PATH}/bin/libharfbuzz-0.dll \
   ${MING32_PATH}/bin/libpng16-16.dll \
   ${MING32_PATH}/bin/libbz2-1.dll \
   ${MING32_PATH}/bin/libfreetype-6.dll \
$SEAFILE_CLIENT

cp ${MING32_PATH}/bin/Qt5Core.dll \
   ${MING32_PATH}/bin/Qt5Gui.dll \
   ${MING32_PATH}/bin/Qt5Network.dll \
   ${MING32_PATH}/bin/Qt5Svg.dll \
   ${MING32_PATH}/bin/Qt5Widgets.dll \
   ${MING32_PATH}/bin/Qt5Xml.dll \
   ${MING32_PATH}/bin/Qt5WebKit.dll \
   ${MING32_PATH}/bin/Qt5WebKitWidgets.dll \
$SEAFILE_CLIENT

cp -r ${MING32_PATH}/lib/qt5/plugins/bearer \
      ${MING32_PATH}/lib/qt5/plugins/iconengines \
      ${MING32_PATH}/lib/qt5/plugins/imageformats \
      ${MING32_PATH}/lib/qt5/plugins/platforms \
      ${MING32_PATH}/lib/qt5/plugins/styles \
$SEAFILE_CLIENT

#seafile-client-6.2.11 add
cp ${MING32_PATH}/bin/libpcre2-16-0.dll \
   $SEAFILE_CLIENT

chmod 777 -R $SEAFILE_CLIENT


