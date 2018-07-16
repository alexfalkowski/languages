.PHONY: test

test:
	mix test --trace

format:
	mix format mix.exs "lib/**/*.{ex,exs}" "test/**/*.{ex,exs}"

analysis:
	mix dialyzer --format dialyxir
	mix credo --strict
