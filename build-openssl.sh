#!/bin/bash

if [[ "$OSTYPE" == "darwin"* ]]; then
    export CORES=$((`sysctl -n hw.logicalcpu`+1))
else
    export CORES=$((`nproc`+1))
fi

export TOOLCHAIN=$NDK/toolchains/llvm/prebuilt/$HOST_TAG

export ANDROID_NDK_ROOT=$NDK
export ANDROID_NDK_HOME=$NDK
PATH=$TOOLCHAIN/bin:$PATH

mkdir -p build/openssl
cd openssl

# arm64
export TARGET_HOST=aarch64-linux-android
export ANDROID_ARCH=arm64-v8a
export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

./Configure -fpic android-arm64 no-shared \
 enable-ec_nistp_64_gcc_128 no-apps no-argon2 no-aria no-async no-bf no-blake2 no-camellia no-cast no-cmp no-cms no-comp no-des no-dgram no-dsa no-ec2m no-engine no-gost no-http no-idea no-legacy \
 no-md4 no-mdc2 no-ml-dsa no-ml-kem no-multiblock no-nextprotoneg no-ocb no-ocsp no-quic no-rc2 no-rc4 no-rmd160 no-scrypt no-seed no-siphash no-siv no-sm2 no-sm3 no-sm4 no-srp no-srtp no-ts no-whirlpool \
 -fvisibility=hidden \
 -Os \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH

rm -rf $PWD/build/$ANDROID_ARCH/bin
rm -rf $PWD/build/$ANDROID_ARCH/lib/cmake
rm -rf $PWD/build/$ANDROID_ARCH/lib/engines-3
rm -rf $PWD/build/$ANDROID_ARCH/lib/ossl-modules
rm -rf $PWD/build/$ANDROID_ARCH/lib/pkgconfig
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# arm
export TARGET_HOST=arm-linux-androideabi
export ANDROID_ARCH=armeabi-v7a
export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

./Configure -fpic android-arm no-shared \
 no-apps no-argon2 no-aria no-async no-bf no-blake2 no-camellia no-cast no-cmp no-cms no-comp no-des no-dgram no-dsa no-ec2m no-engine no-gost no-http no-idea no-legacy \
 no-md4 no-mdc2 no-ml-dsa no-ml-kem no-multiblock no-nextprotoneg no-ocb no-ocsp no-quic no-rc2 no-rc4 no-rmd160 no-scrypt no-seed no-siphash no-siv no-sm2 no-sm3 no-sm4 no-srp no-srtp no-ts no-whirlpool \
 -fvisibility=hidden \
 -Os \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH

rm -rf $PWD/build/$ANDROID_ARCH/bin
rm -rf $PWD/build/$ANDROID_ARCH/lib/cmake
rm -rf $PWD/build/$ANDROID_ARCH/lib/engines-3
rm -rf $PWD/build/$ANDROID_ARCH/lib/ossl-modules
rm -rf $PWD/build/$ANDROID_ARCH/lib/pkgconfig
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# x86
export TARGET_HOST=i686-linux-android
export ANDROID_ARCH=x86
export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

./Configure -fpic android-x86 no-shared \
 no-apps no-argon2 no-aria no-async no-bf no-blake2 no-camellia no-cast no-cmp no-cms no-comp no-des no-dgram no-dsa no-ec2m no-engine no-gost no-http no-idea no-legacy \
 no-md4 no-mdc2 no-ml-dsa no-ml-kem no-multiblock no-nextprotoneg no-ocb no-ocsp no-quic no-rc2 no-rc4 no-rmd160 no-scrypt no-seed no-siphash no-siv no-sm2 no-sm3 no-sm4 no-srp no-srtp no-ts no-whirlpool \
 -fvisibility=hidden \
 -Os \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH

rm -rf $PWD/build/$ANDROID_ARCH/bin
rm -rf $PWD/build/$ANDROID_ARCH/lib/cmake
rm -rf $PWD/build/$ANDROID_ARCH/lib/engines-3
rm -rf $PWD/build/$ANDROID_ARCH/lib/ossl-modules
rm -rf $PWD/build/$ANDROID_ARCH/lib/pkgconfig
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

# x64
export TARGET_HOST=x86_64-linux-android
export ANDROID_ARCH=x86_64
export AR=$TOOLCHAIN/bin/llvm-ar
export CC=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang
export AS=$CC
export CXX=$TOOLCHAIN/bin/$TARGET_HOST$MIN_SDK_VERSION-clang++
export LD=$TOOLCHAIN/bin/ld
export RANLIB=$TOOLCHAIN/bin/llvm-ranlib
export STRIP=$TOOLCHAIN/bin/llvm-strip

./Configure -fpic android-x86_64 no-shared \
 enable-ec_nistp_64_gcc_128 no-apps no-argon2 no-aria no-async no-bf no-blake2 no-camellia no-cast no-cmp no-cms no-comp no-des no-dgram no-dsa no-ec2m no-engine no-gost no-http no-idea no-legacy \
 no-md4 no-mdc2 no-ml-dsa no-ml-kem no-multiblock no-nextprotoneg no-ocb no-ocsp no-quic no-rc2 no-rc4 no-rmd160 no-scrypt no-seed no-siphash no-siv no-sm2 no-sm3 no-sm4 no-srp no-srtp no-ts no-whirlpool \
 -fvisibility=hidden \
 -Os \
 -D__ANDROID_API__=$MIN_SDK_VERSION \
 --prefix=$PWD/build/$ANDROID_ARCH

make -j$CORES
make install_sw
make clean
mkdir -p ../build/openssl/$ANDROID_ARCH

rm -rf $PWD/build/$ANDROID_ARCH/bin
rm -rf $PWD/build/$ANDROID_ARCH/lib/cmake
rm -rf $PWD/build/$ANDROID_ARCH/lib/engines-3
rm -rf $PWD/build/$ANDROID_ARCH/lib/ossl-modules
rm -rf $PWD/build/$ANDROID_ARCH/lib/pkgconfig
cp -R $PWD/build/$ANDROID_ARCH ../build/openssl/

cd ..
