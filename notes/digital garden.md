---
dg-publish: true
---
# Digital Garden

Definition from <https://nesslabs.com/digital-garden-set-up>:

> A digital garden is an online space at the intersection of a notebook and a blog, where digital gardeners share seeds of thoughts to be cultivated in public. Contrary to a blog, where articles and essays have a publication date and start decaying as soon as they are published, a digital garden is evergreen: digital gardeners keep on editing and refining their notes.


Dar uma olhada nesse Hugo Theme aqui:

- <


```sh
# passos a serem executados no gitlab-ci para fazer deploy do digital-garden

git clone repo do tema

cd tema
shopt -s extglob

cp ../public/*.md .

# repetir isso para notes, learning, books, assets
rm notes/!(*.js)
cp ../public/notes/* notes/

```