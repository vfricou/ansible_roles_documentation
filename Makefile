.PHONY: install
.DEFAULT_GOAL=serve

# install environment
install:
	@cd docs && bundle install

serve:
	@cd docs && bundle exec jekyll serve --incremental
