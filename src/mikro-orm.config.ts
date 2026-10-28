import { defineConfig } from '@mikro-orm/mariadb';

const port: number = 3399;

export default defineConfig({
  entities: [],
  discovery: { warnWhenNoEntities: false },
  dbName: 'repro',
  port,
});
