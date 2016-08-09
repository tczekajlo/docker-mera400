for PKG in emawp emcrk emelf emdas em400 emas emlin assem ; do
    if [ "$1" == "git" ]; then
        echo "Building from git source"
	    git clone https://github.com/jakubfi/$PKG
    elif [ "$1" == "release" ]; then
        echo "Building from release channel"
        wget http://mera400.pl/releases/$PKG/$PKG-latest.tar.gz
        tar zxf $PKG-latest.tar.gz
    else
        echo "Unknown source. Exit."
        exit 1
    fi
	mkdir $PKG/build
	cd $PKG/build
	cmake ..
	make
	sudo make install
	sudo ldconfig
	cd ../..
done
