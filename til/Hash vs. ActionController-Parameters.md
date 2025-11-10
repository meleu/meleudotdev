---
dg-publish: true
---

Recently I learned that in #ruby on #rails the `params` that come in a request to the controller are from the type [ActionController::Parameters](https://github.com/rails/rails/blob/e39361ab9062e23dcef5aeaf376fc48b106da66b/actionpack/lib/action_controller/metal/strong_parameters.rb#L145).

Although the `params` behave like a Hash sometimes (for example in `params[:key]`), it's not a Hash.

I noticed this when I tried to send [Hash#deep_symbolyze_key](https://api.rubyonrails.org/v6.1.7.8/classes/Hash.html#method-i-deep_symbolize_keys) to an instance of `ActionController::Parameters` and a `NoMethodError` was raised.

**Note**: funny enough, the [Hash#deep_symbolyze_key](https://api.rubyonrails.org/v6.1.7.8/classes/Hash.html#method-i-deep_symbolize_keys) is "monkey-patched" method added by Rails (not present on standard Ruby).
