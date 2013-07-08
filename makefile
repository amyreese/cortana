of:=/dev/null

build:
	./build.sh -v

write: build
	dd if=$(shell find out -name '*.iso' | sort -h | tail -n1) of=$(of)

clean:
	rm -rf work

dist-clean: clean
	rm -rf out
