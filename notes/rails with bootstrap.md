---
dg-publish: true
---
# rails with bootstrap

```shell
rails new myapp -j esbuild --css bootstrap
```

```js
// inside app/javascript/application.js
// Entry point for the build script in your package.json
import "@hotwired/turbo-rails";
import "./controllers";
import * as bootstrap from "bootstrap";

// enabling popovers (as pointed out in documentation)
// https://getbootstrap.com/docs/5.1/components/popovers/#example-enable-popovers-everywhere
let popoverTriggerList = [].slice.call(
  document.querySelectorAll('[data-bs-toggle="popover"]')
);
let popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
  return new bootstrap.Popover(popoverTriggerEl);
});
```

Testing:

```ruby
# inside app/controllers/home_controller.rb  
class HomeController < ApplicationController  
end
```

```ruby
# inside config/routes.rb  
Rails.application.routes.draw do  
  get "home/index"  
  root to: "home#index"  
end
```

```html
<!-- inside app/views/home/index.html.erb -->
<h1>Welcome, this is the home page</h1>  
  
<button type="button" 
        class="btn btn-lg btn-danger" 
        data-bs-toggle="popover" 
        title="Popover title" 
        data-bs-content="Amazing content, right ?">
        Click to toggle popover
</button>  
```

```shell
# run the server and check in the browser
bin/dev
```