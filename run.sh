#!/bin/sh
# No TS loader installed, config path in package.json points at a .ts file.
cd "$(dirname "$0")"

echo '### 1. no TS loader, no MIKRO_ORM_* env vars'
npx mikro-orm debug
npx mikro-orm schema:create --dump; echo "exit=$?"

echo
echo '### 2. no TS loader, MIKRO_ORM_HOST set (e.g. from .env)'
MIKRO_ORM_HOST=localhost npx mikro-orm schema:create --dump; echo "exit=$?"

echo
echo '### 3. control: jiti installed'
npm install --no-save --no-audit --no-fund --silent jiti@2.7.0
npx mikro-orm debug
npm uninstall --no-save --silent jiti
