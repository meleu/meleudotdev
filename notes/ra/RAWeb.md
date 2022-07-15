---
dg-publish: true
---
## RAWeb

### development

- Clone RAWeb repo and `docker compose up` is enough to have a local instance
    - use alpine-based images in the `docker-compose.yml`
    - solve the permissions problem (maybe [this info](https://www.udemy.com/course/docker-mastery/learn/lecture/31063670#questions) can help).
    - run the migrations inside `database/`


### new features

- An option to update the unlock timestamp so people can join events without creating new accounts or having to reset their progress.
- The concept of "maintainers" for achievement sets
- The possibility to create "custom rankings"
    - 1st. only for friends
    - 2nd. for specific events


### alpine images

before:
```
$ docker image ls
REPOSITORY              TAG       IMAGE ID       CREATED         SIZE
raweb/app               latest    6e7962b39a54   4 hours ago     625MB
minio/minio             latest    3d7e74da8f8b   10 hours ago    220MB
mysql                   8         33037edcac9b   2 days ago      444MB
phpmyadmin/phpmyadmin   latest    4a4023c7e22a   2 months ago    510MB
nginx                   1.18      c2c45d506085   15 months ago   133MB
mailhog/mailhog         latest    4de68494cd0d   23 months ago   392MB
```

after:
```
$ docker image ls
REPOSITORY              TAG           IMAGE ID       CREATED         SIZE
raweb/app               latest        18f312db50bc   2 minutes ago   304MB
minio/minio             latest        3d7e74da8f8b   13 hours ago    220MB
mysql                   8             33037edcac9b   2 days ago      444MB
phpmyadmin/phpmyadmin   latest        4a4023c7e22a   2 months ago    510MB
nginx                   1.18-alpine   684dbf9f01f3   15 months ago   21.9MB
mailhog/mailhog         latest        4de68494cd0d   23 months ago   392MB

```

