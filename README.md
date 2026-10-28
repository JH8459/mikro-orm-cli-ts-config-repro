# mikro-orm-cli-ts-config-repro

`package.json` sets `mikro-orm.configPaths` to `./src/mikro-orm.config.ts`. When no TypeScript loader is installed, the CLI drops that path from the search list and later fails with an error that doesn't mention it.

Node v24.11.0, `@mikro-orm/cli` 7.2.5, `@mikro-orm/mariadb` 7.2.5. No database is needed, the config never gets far enough to connect.

## Run

```sh
npm install
sh run.sh
```

`run.sh` runs three cases: no loader, no loader with `MIKRO_ORM_HOST` set, and `jiti` installed as a control.

## Output (trimmed)

No loader, no `MIKRO_ORM_*` env vars. The `.ts` path is missing from the searched paths:

```
Neither `oxc`, `swc`, `tsx`, `jiti`, `tsimp` nor `nub` found in the project dependencies, support for working with TypeScript files might not work. ...
 - searched config paths:
   - .../src/mikro-orm.config.js (not found)
   - .../mikro-orm.config.js (not found)
Error: MikroORM config file not found in ['./src/mikro-orm.config.js', './mikro-orm.config.js']
```

No loader, `MIKRO_ORM_HOST=localhost` (for example from a `.env` file). The config is built from env vars only:

```
Error: No driver specified, please fill in the `driver` option or use `defineConfig` helper ...
```

With `jiti` installed, the same config file is found:

```
 - TypeScript support enabled (jiti)
 - searched config paths:
   - .../src/mikro-orm.config.ts (found)
 - configuration found
```
