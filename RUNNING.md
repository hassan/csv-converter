# RUNNING

## Installation

### MacOS

Assuming that you have homebrew installed (doesn't everybody?)

	> brew install elixir
	
(Will install erlang as a dependency.)	

Check out project, `cd` to project root.

From the project root, enter

	> mix deps.get
	> mix compile
	> mix escript.build

## Tests

From the project root, enter

	> mix test
	
For more verbose output:

	> mix test --trace	

## Run

From the project root, enter

	> cat sample.csv | ./converter
	> cat sample-with-broken-utf8.csv | ./converter

## Notes

This went over the 4-hour wall time limit, because

1. Saturday interruptions
2. Belated realization I hadn't written a command-line app in Elixir before and there are definitely some wrinkles involved compared to running as a Mix task or as a release. 😀
3. It turns out that the preferred date/time library for Elixir (Timex) has a dependency on a library (TZData) whose current version has a conflict with running an Elixir command-line function through `escript` [GitHub issue #86](https://github.com/bitwalker/timex/issues/86) and needed to be downgraded. FOSS, eh? 
