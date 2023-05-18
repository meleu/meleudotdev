---
dg-publish: true
---
# Stimulus

installing the packages:
```bash
yarn add @hotwired/stimulus
yarn add @hotwired/stimulus-webpack-helpers
```

if using Le Wagon's boilerplates, put this in the `lib/index.js`:
```js
import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "@hotwired/stimulus-webpack-helpers"

window.Stimulus = Application.start()
const context = require.context("./controllers", true, /\.js$/)
Stimulus.load(definitionsFromContext(context))
```

put this in your `lib/controllers/${controllerName}_controller.js`:
```js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("The 'check_all_checkboxes' controller is now loaded!")
  }
}
```






## references

<https://kitt.lewagon.com/camps/1254/lectures/04-Front-End%2F07-JavaScript-Plugins>

