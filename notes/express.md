# ExpressJS

"Hello World" with ExpressJS:
```js
const express = require('express');
const server = express();

server.get('/', (request, response) => {
  return response.json({ message: 'Hello World!' });
});

server.listen(3000)
```
