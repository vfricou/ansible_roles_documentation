.PHONY: install
.DEFAULT_GOAL=serve

# install environment
install: gem_install
serve: gem_install run_serve

gem_install:
	@cd docs && bundle install

run_serve:
	@cd docs && bundle exec jekyll serve
