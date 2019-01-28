NPM=yarn
ESY=esy

all: esy-install yarn-install

esy-setup:
ifeq (, $(shell which esy))
	npm i -g esy
else
	echo esy already installed
endif

esy-install: esy-setup
	$(ESY) install

yarn-install:
	$(NPM) --cwd lens install

install: esy-install yarn-install

esy-build: esy-install
	$(ESY) build

yarn-build: yarn-install
	$(NPM) --cwd lens build

build: esy-build yarn-build

esy-clean:
	rm -fr _esy _build esy.lock

yarn-clean:
	rm -fr lens/node_modules lens/lib

clean: esy-clean yarn-clean

format:
	esy format
