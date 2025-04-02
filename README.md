# Ash Calculation Load Performance Issue Reproduction

This repository demonstrates a performance issue in the Ash framework where calculation DSL-based relationship loading is approximately 10 times slower than manual loading by anonymous function.

## Reproduction Steps

1. Initialize database and seed data:
```bash
mix reset
```

2. Run benchmark:
```bash
mix run bench/bench_postgres_nested.exs # 10 times slow
mix run bench/bench_postgres.exs # 3 times slow
```

Note: There is also an ETS benchmark available at `mix run bench/bench_ets.exs`, but it's not meaningful for performance comparison due to missing indexes.

## Expected Results

The benchmark results will show that DSL-based calculation loading is approximately 10 times slower than manual calculation loading.

## Data Structure

- Author: Author information
- Post: Post information (1:N relationship with Author)
- Comment: Comment information (1:N relationship with Post)

There are 1000 Authors, each Author has 5 Posts, and each Post has 5 Comments.

## Environment

- Elixir ~> 1.18
- Ash ~> 3.0
- AshPostgres ~> 2.0
- PostgreSQL >= 16.0.0