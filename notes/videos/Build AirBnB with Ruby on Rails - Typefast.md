---
dg-publish: true
---
# Build AirBnB with Ruby on Rails - Typefast

[youtube playlist](https://youtube.com/playlist?list=PLCawOXF4xaJK1_-KVgXyREULRVy_W_1pe)

- Overview: Build Airbnb with Rails by TypeFast
  1. Modal & user Auth (parts: 1-10) 5h 30min
  2. Properties & Geolocation (11-19) 3h 10min
  3. Review & Favorites (20-25) 2h 10min 
  4. Reservations (26-29) 
  5. Share Modal (30-36)  
  5. Reviews (37-39) 
  6. Reservations (40-45) 
  7. Payments (46-50) 
  8. Profile & Authz (51-58) 
  9. Property Host (59-63) 
  10. Property Search (64-67)

## Part 1

starts the project and then navbar rabbit hole

[video](https://youtu.be/D889P37r3bc)

4:00

```bash
rails new airbnb-clone \
  -T \
  -d postgresql \
  --css tailwind
# he googled for "rails new tailwind"

cd airbnb-clone
rails db:create
rails server
# test Rails splash screen
```


- 7:00 - clean `application.html.erb`
- 8:00 - installing rspect as the test framework
    - 11:42 - uses version 5.1
- 15:40 - set favicon in a rails app
    - 16:50 - set favicon from a local asset
- 18:00 - rails generate home controller
- 19:22 - home_spec.rb
- 22:12 - installing devise
    - 25:40 - `rails generate devise:views`
- 27:20 - tailwindUI is paid 💸 
- 31:40 - choosing the tailwindUI navbar
- 34:20 - `config/tailwind.config.js`
- 35:00 - cloning/inspecting the navbar
- 40: 25 - create an `app/assets/stylesheets/_header.scss`
- 41:00 - rename `application.css` to `application.scss`
- enable `sass-rails` in the Gemfile
- 50:00 - creating some custom CSS
- 57:15 - `class="logo-link"`


## Part 2

Still working in the navbar

[video](https://youtu.be/2gajlyfNB2s)

starts after 5 min

- 16:00 - el-transition npm package
- 20:00 - header_controller.js (stimulusJS)
- 37:00 - finished header_controller