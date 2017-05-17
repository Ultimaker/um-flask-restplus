#!/bin/sh

SRC_PATH="$(pwd)"
MODULE_PATH="$(pwd)/flask-restplus"

init() {
	git submodule update --init --recursive
}

build() {
	cd "${MODULE_PATH}" &&
	python3 setup.py --command-packages=stdeb.command bdist_deb &&
	cp deb_dist/python3-flask-restplus_*.deb "${SRC_PATH}/"
	cd "${SRC_PATH}"
}

init
build
