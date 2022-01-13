# Waves blockchain — PostgreSQL sync scripts

A set of scripts to download and update Waves blockchain history data into a PostgreSQL 11.x database.

## Attention!

Since v0.9.0 schema has been refactored, all of the migrations were merged into the single one and it has breaking changes. Therefore to use this crawler you have to create the new one database and refill it.

Thanks to the refactoring, the result database has 0.5x smaller size and has started working faster at several queries.
## Usage

1. Clone the repository, install dependencies.
   ```bash
   npm install
   ```

2. Create `config.env` file in the project, using `config.example.env` for reference.

3. In PostgreSQL, create empty database. 

4. Run the migration:
   ```bash
   export $(cat config.env) && npm run migrate
   ```
   It will apply initial and all additional migrations to yours database.

5. ⬇️ To download a range of blocks to database:

   ```bash
   npm run download {start} {end},
   # for example
   npm run download 1 100000
   ```

   Blocks from the range get inserted in a single transaction, so either all get inserted, or none. In our experience ranges of 10000—100000 work best.

6. 🔄 To keep your database up-to-date:
   ```bash
   npm run start
   ```
   This is a continuous script, so you may want to run it in the background. We recommend using some kind of process manager (e.g. `pm2`) to restart the process on crash.

## Migrations

1. Create migration:
   ```bash
   ./node_modules/.bin/knex --migrations-directory migrations migrate:make $MIGRATION_NAME
   ```
2. Migrate latest:
   ```bash
   ./node_modules/.bin/knex migrate:latest --client postgresql --connection postgresql://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE --migrations-directory migrations
   # OR
   npm run migrate -- --connection postgresql://$PGUSER:$PGPASSWORD@$PGHOST:$PGPORT/$PGDATABASE
   ```
