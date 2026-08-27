SHELL := /bin/bash

cr := cargo run --quiet
cbr := cargo build --quiet
ct := cargo test --quiet

.PHONY: hello ba01 ba02 ba03 ba04

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

ba03:
	@$(cbr) -p ba03

	@echo "a b c" && \
	./target/debug/ba03 a b c && \
	echo

	@echo "e d c b a" && \
	./target/debug/ba03 e d c b a && \
	echo

	@echo "A a A a A a" && \
	./target/debug/ba03 A a A a A a && \
	echo

	@echo "hello, world, this is a program" && \
	./target/debug/ba03 hello, world, this is a program && \
	echo

	@echo "empty" && \
	./target/debug/ba03 && \
	echo

ba04:
	@$(ct) -p ba04
