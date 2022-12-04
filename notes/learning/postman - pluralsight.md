---
dg-publish: true
---
# postman - pluralsight

- <https://app.pluralsight.com/courses/83210591-dc61-4fda-a344-4e138ab0074e/table-of-contents>

## Getting Started

```shell
git clone git@github.com:taylonr/postman.git
cd postman
npm install
npm run start:dev
```

endpoints to play with
```
GET /landing 200 1.161 ms - 40
GET /books 403 0.053 ms - -
GET /books/2 200 4.149 ms - 235
GET /books/search 200 1.217 ms - -
GET /books/search?title=waste 200 0.312 ms - 256
GET /books/search?title=waste&author=greg 200 0.289 ms - 2
GET /books/search?author=greg 200 0.808 ms - 257
```

adding a book:
```
POST /books
```

with this JSON in the body (don't forget to configure `Content-Type`):
```json
{
  "title": "You are What You Love: The Spiritual Power of Habit",
  "author": "James K.A. Smith",
  "isbn": "158743380X",
  "releaseDate": "2016-03-05"
}
```


### Manage Header Presets

Headers -> Presets -> Manage Presets -> Add...

![[postman - header presets.png]]

### Use Postman as a Proxy

- <https://app.pluralsight.com/course-player?clipId=e3a34ce9-faed-41aa-82ce-1c0088e87458>
- [official doc](https://learning.postman.com/docs/sending-requests/capturing-request-data/capturing-http-requests/)

This seems to be very handy for troubleshooting!

Note, in the video it's using an old UI. Currently the "Capture requests" button is in the footer.

![[postman - capture requests.png]]

