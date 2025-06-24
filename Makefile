.PHONY: help clean get-version bump-version docs changelog all

help:
	@echo "make help         -- show this help"
	@echo "make clean        -- clean leftovers and build files"
	@echo "make get-version  -- get current version"
	@echo "make bump-version -- bump version"
	@echo "make docs         -- build documentation"
	@echo "make changelog    -- update changelog"
	@echo "make all          -- clean, get-version, build"

clean:
	./scripts/clean.sh $(MAKEFLAGS)

get-version:
	./scripts/get-version.sh

bump-version:
	./scripts/bump-version.sh $(MAKEFLAGS)

docs:
	./scripts/docs.sh $(MAKEFLAGS)

changelog:
	./scripts/changelog.sh $(MAKEFLAGS)

all: clean get-version docs
