.PHONY: install
.DEFAULT_GOAL=serve

# install environment
install: gem_install
serve: gem_install run_serve

gem_install:
	@bundle install

run_serve:
	@bundle exec jekyll serve
