# Replace with your Talsec repo location
TALSEC_CPP=/Users/oprikryl/ahead/Talsec_Android_Security_Library/talsec_security/src/main/cpp

ARCHS=("arm64-v8a" "armeabi-v7a" "x86" "x86_64")

echo "Removing old openssl and curl files in the project."
# Purge old openssl and curl
for ARCH in "${ARCHS[@]}"; do
	if [ -d "$TALSEC_CPP/openssl/$ARCH" ]; then
		rm -rf $TALSEC_CPP/openssl/$ARCH/*
	fi
	
	if [ -d "$TALSEC_CPP/curl/$ARCH" ]; then	
		rm -rf $TALSEC_CPP/curl/$ARCH/*
	fi
done
echo "Files removed..."


if [ -d "build" ]; then

	# Go to build directory
	cd build

	# Copy new openssl and curl
	for ARCH in "${ARCHS[@]}"; do
		# copy new openssl
		OPENSSL_LIB_PATH=$TALSEC_CPP/openssl/$ARCH/lib
		OPENSSL_INCLUDE_PATH=$TALSEC_CPP/openssl/$ARCH/include/openssl
		mkdir -p $OPENSSL_LIB_PATH
		mkdir -p $OPENSSL_INCLUDE_PATH
		cp -r openssl/$ARCH/lib/libcrypto.a $OPENSSL_LIB_PATH
		cp -r openssl/$ARCH/lib/libssl.a $OPENSSL_LIB_PATH
		cp -r openssl/$ARCH/include/openssl/* $OPENSSL_INCLUDE_PATH
	
		# copy new curl
		CURL_LIB_PATH=$TALSEC_CPP/curl/$ARCH/lib
		CURL_INCLUDE_PATH=$TALSEC_CPP/curl/$ARCH/include/curl
		mkdir -p $CURL_LIB_PATH
		mkdir -p $CURL_INCLUDE_PATH
		cp -r curl/$ARCH/lib/libcurl.a $CURL_LIB_PATH
		cp -r curl/$ARCH/include/curl/* $CURL_INCLUDE_PATH
	done

	echo "Done. New openssl and curl libraries are copied to the Talsec project."
else
	echo "The build folder with new openssl and curl is missing. You need to build these components first!"
fi

