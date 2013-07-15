of:=/dev/null

build:
	sudo chown -R root:root root-image
	sudo ./build.sh -v

write: build
	sudo dd if=$(shell find out -name '*.iso' | sort -h | tail -n1) of=$(of)

clean:
	sudo rm -rf work

dist-clean: clean
	sudo rm -rf out
