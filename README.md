# seafile客户端交叉编译到windows运行，fedora28  
auto-install-qt-tools.sh 安装依赖库   
copy_dependent_dll.sh 拷贝软件依赖的库到exe目录下   
download-source-code.sh 下载相关源码，本脚本主要是从官方路径下下载   
Makefile.mak make构建文件   
CMakeLists.txt 修改后的seafile-client-{版本}的cmake构建文件   
toolchain-i686-w64-mingw32.cmake 交叉编译用到的文件，作为补充  
cross-compile-guide.docx 交叉编译的指南  
