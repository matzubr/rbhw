SHELL := /bin/bash

crq := cargo run --quiet
cbrq := cargo build --release --quiet

.PHONY: hello ba01

hello:
	@$(crq) -p hello

ba01:
	@$(cbrq) -p ba01

	@echo "hello" && \
	printf "hello" | target/release/ba01 && \
	echo

	@echo "foo\n" && \
	echo foo | target/release/ba01 && \
	echo

	@echo "/dev/null" && \
	target/release/ba01 < /dev/null && \
	echo

	@echo "1000 yes" && \
	yes | head -c 1000 | target/release/ba01 && \
	echo

	@echo "Hello, world!" && \
	$(cbrq) -p hello && \
	target/release/hello | target/release/ba01 && \
	echo

	@echo "🦀" && \
	echo "🦀" | target/release/ba01 && \
	echo

ba02:
	@cd ba02 && $(cbrq)

	@echo "hello" && \
	printf "hello" | ba02/target/release/ba02 && \
	echo

	@echo "foo\n" && \
	echo foo | ba02/target/release/ba02 && \
	echo
