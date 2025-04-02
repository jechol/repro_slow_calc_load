# Used by "mix format"
[
  inputs: ["{mix,.formatter}.exs", "{config,lib,test}/**/*.{ex,exs}", "priv/bench.exs"],
  plugins: [Spark.Formatter],
  import_deps: [:ash_postgres, :ash, :reactor]
]
