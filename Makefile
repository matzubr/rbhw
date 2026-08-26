SHELL := /bin/bash

cr := cargo run --quiet
cbr := cargo build --quiet

.PHONY: hello ba01 ba02

hello:
	@$(cr) -p hello

ba01:
	@$(cbr) -p ba01

	@echo "hello" && \
	printf "hello" | target/debug/ba01 && \
	echo

	@echo "foo\n" && \
	echo foo | target/debug/ba01 && \
	echo

	@echo "/dev/null" && \
	target/debug/ba01 < /dev/null && \
	echo

	@echo "1000 yes" && \
	yes | head -c 1000 | target/debug/ba01 && \
	echo

	@echo "Hello, world!" && \
	$(cbr) -p hello && \
	target/debug/hello | target/debug/ba01 && \
	echo

	@echo "🦀" && \
	echo "🦀" | target/debug/ba01 && \
	echo

ba02:
	@$(cbr) -p ba02

	@echo "spaces" && \
	printf " \t\n" | target/debug/ba02 && \
	echo

	@echo "foo\n" && \
	echo foo | target/debug/ba02 && \
	echo

	@echo "/dev/null" && \
	target/debug/ba02 < /dev/null && \
	echo

	@echo "1000 yes" && \
	yes | head -c 1000 | target/debug/ba02 && \
	echo

	@echo "1000 Hello" && \
	yes Hello | head -c 1000 | target/debug/ba02 && \
	echo

	@echo "Hello, world!" && \
	$(cbr) -p hello && \
	target/debug/hello | target/debug/ba02 && \
	echo

	@echo "  hi  " && \
	echo "  hi  " | target/debug/ba02 && \
	echo

	@echo "empty" && \
	printf "" | target/debug/ba02 && \
	echo

	@echo "hello" && \
	printf "hello" | target/debug/ba02 && \
	echo

	@echo "hello\n" && \
	printf "hello\n" | target/debug/ba02 && \
	echo

	@echo "hello rust\n" && \
	printf "hello rust\n" | target/debug/ba02 && \
	echo

	@echo "  hello  rust  \n" && \
	printf "  hello  rust  \n" | target/debug/ba02 && \
	echo

	@echo "a\tb\nc" && \
	printf "a\tb\nc" | target/debug/ba02 && \
	echo
