---
dg-publish: true
---
# ignite-lab-nodejs-short-version

Creating a microservice for a notifications system with NodeJS, NestJS, Prisma and more...


## Initial configs

NodeJS and npm properly installed (I recommend using asdf-vm).

```shell
# assuming you have node and npm installed
npm install -g @nestjs/cli

nest new notifications-service
# choose npm as package manager

cd notifications-service

# prisma stuff
npm install prisma -D
npm install @prisma/client
npx prisma init --datasource-provider SQLite

# validator stuff
npm install class-validator class-transformer
```

Install the Prisma plugin in the VSCode.


## Prisma schema

`prisma/schema.prisma`
```
model Notification {
  id String @id
  recipientId String
  content String
  category String
  readAt DateTime?
  createdAt DateTime @default(now())

  @@index([recipientId])
}
```

```shell
npx prisma migrate dev
# nomear como  'create notifications'

# para visualizar o conteúdo do database
npx prisma studio
```


## Integrating Prisma with NestJS

NestJS doc:
- <https://docs.nestjs.com/recipes/prisma>

The code below is from [the NestJS documentation](https://docs.nestjs.com/recipes/prisma#use-prisma-client-in-your-nestjs-services)

`src/prisma.service.ts`:
```typescript
import { INestApplication, Injectable, OnModuleInit } from '@nestjs/common';
import { PrismaClient } from '@prisma/client';

@Injectable()
export class PrismaService extends PrismaClient implements OnModuleInit {
  async onModuleInit() {
    await this.$connect();
  }

  async enableShutdownHooks(app: INestApplication) {
    this.$on('beforeExit', async () => {
      await app.close();
    });
  }
}
```

`src/app.module.ts`, import `PrismaService`:
```ts
// import some stuff...

@Module({
  imports: [],
  controllers: [AppController],
  providers: [PrismaService],
})

// ...
```


## Create a Controller

1:07:24 - `app.controller.ts`:
```ts
@Controller('notification')
export class AppController {
  constructor(private readonly prisma: PrismaService) {}

  @Get()
  list() {
    return this.prisma.notification.findMany();
  }

  @Post()
  async create() {
    await this.prisma.notification.create({
      data: {
        id: randomUUID(),
        content: 'Você tem uma nova soliticitação de amizade!',
        category: 'social',
        recipientId: randomUUID(),
      },
    });
  }
}
```

```shell
# test it with
npm run start:dev

# check localhost:3000/notifications
# should return an empty array
```



