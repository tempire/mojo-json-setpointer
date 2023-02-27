DOTENV := $(if $(DOTENV),$(DOTENV),.env)
-include $(DOTENV)
export

.PHONY: test
test:
	carton exec prove -t -lv t/basic.t

dist:
	minil dist

release:
	minil release

version:
	@perl -I lib -MMojo::JSON::SetPointer -E 'say $$Mojo::JSON::SetPointer::VERSION'

version-bump:
	@perl-bump-version
	@make version
