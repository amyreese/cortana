of:=/dev/null

build:
	chown -R root:root root-image
	./build.sh -v

write: build
	dd if=$(shell find out -name '*.iso' | sort -h | tail -n1) of=$(of)

clean:
	rm -rf work

dist-clean: clean
	rm -rf out
