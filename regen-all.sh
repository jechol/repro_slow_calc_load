#!/usr/bin/env bash

rm -rf priv/repo/migrations/202* || true
rm -rf priv/resource_snapshots || true

mix ash.codegen create_all_resources
mix do ash_postgres.drop --force-drop, ash_postgres.create, ash_postgres.migrate

mix format
mix seed
