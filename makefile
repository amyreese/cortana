of:=/dev/null

build: prep
	chown -R root:root root-image
	./build.sh -v
ifdef SUDO_UID
	chown -R $(SUDO_UID):$(SUDO_GID) root-image
endif

prep:
	git submodule update --init --recursive

write: build
	dd if=$(shell find out -name '*.iso' | sort -h | tail -n1) of=$(of)
	sync

clean:
	rm -rf work

dist-clean: clean
	rm -rf out
