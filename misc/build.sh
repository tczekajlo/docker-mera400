for PKG in emawp emcrk emelf emdas em400 emas emlin assem ; do
	git clone https://github.com/jakubfi/$PKG
	mkdir $PKG/build
	cd $PKG/build
	cmake ..
	make
	sudo make install
	sudo ldconfig
	cd ../..
done
