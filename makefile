of:=/dev/null

build:
	chown -R root:root root-image
	./build.sh -v
ifdef SUDO_UID
	chown -R $(SUDO_UID):$(SUDO_GID) root-image
endif

write: build
	dd if=$(shell find out -name '*.iso' | sort -h | tail -n1) of=$(of)

clean:
	rm -rf work

dist-clean: clean
	rm -rf out
