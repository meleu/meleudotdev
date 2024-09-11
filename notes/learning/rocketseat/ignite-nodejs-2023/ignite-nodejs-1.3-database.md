---
dg-publish: true
---
# ignite-nodejs-1.3-database

Criar um path para `db.json` (OBS.: pré-requisito `type: module` no `package.json`):
```js
const databasePath = new URL("../db.json", import.meta.url);
```
