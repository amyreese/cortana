of:=/dev/null

build:
	cd releng && ./build.sh -v

write: build
	dd if=$(shell find releng/out -name '*.iso' | sort -h | tail -n1) of=$(of)

clean:
	rm -rf releng/work

dist-clean: clean
	rm -rf releng/out
