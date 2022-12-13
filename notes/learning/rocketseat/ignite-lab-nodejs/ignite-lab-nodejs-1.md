---
dg-publish: true
---
# Ignite Lab - 1 - Fundamentos do Nest.js & Prisma

Chave: `# BACK-END`


Começa em 25 minutos.

## Introdução do NestJS

Documentação do NestJS: <https://docs.nestjs.com/>

```shell
npm i -g @nestjs/cli
nest new notifications-service

cd notifications-service
rm README.md

# run the project
npm run start:dev
```

Dar uma olhada na estrutura de arquivos e diretórios. Dar uma zoiada no `src/main.ts` e `app.module.ts`.

31 minutos: Um dos conceitos primordiais do Nest é que ele usa **Decorator**.

> **Controller** é usado sempre que eu quiser definir rotas da minha aplicação, e o **Service** é todo o resto.

> O **Module** é basicamente um acoplador. Ele acopla vários Controlers e vários Services.

> Se você vai trabalhar com Nest é importante saber de **inversão de dependência** e de **injeção de dependência**.


## Introdução do Prisma

Começa aos 50 minutos.

Documentação do Prisma: </https://www.prisma.io/docs/getting-started/quickstart>

**Observação**: instalar a extensão do Prisma no VSCode.

```shell
# instalando como dependência de desenvolvimento
npm instal prisma -D

# instalando o pacote que será usado em produção
npm install @prisma/client

# vamo usar o sqlite
npx prisma init --datasource-provider SQLite
```

isso vai criar um arquivo `prisma/schema.prisma` e também um arquivo `.env` na raiz do projeto.

53 minutos, começa a codar o `model Notification` no `schema.prisma`.

```prisma
model Notification {
  id String @id
  recipientId String
  content String
  readAt DateTime?
  createdAt DateTime @default(now())
  
  @@index([recipientId])
}
```

```shell
npx prisma migrate dev
# nomear como 'create notifications'

# para visualizar o conteúdo do database
npx prisma studio
```

## Integrando o Prisma no Nest

Em 1 hora e 2 minutos.

Documentação relacionada no Nest: <https://docs.nestjs.com/recipes/prisma>

Conforme mencionado [aqui](https://docs.nestjs.com/recipes/prisma#use-prisma-client-in-your-nestjs-services), criar o arquivo `src/prisma.service.ts`:
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

1:04:25 - em `app.module.ts`, importar o `PrismaService`:
```ts
// import some stuff...

// aos 49 minutos ele fala desse HttpModule
// como um exemplo. Acho que ficou como leftover.

@Module({
  imports: [HttpModule],
  controllers: [AppController],
  providers: [PrismaService],
})

// ...
```

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


## Insomnia

Em 1:08:15, usar o Insomnia para testar...


## Validação dos dados enviados no POST


```shell
npm install class-validator class-transformer
```

Para validar, é necessário adicionar o seguinte no `main.ts`:
```ts
async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  // adicionar a linha abaixo 👇
  app.useGlobalPipes(new ValidationPipe());

  await app.listen(3000);
}
```


Em 1:13:50 - `src/create-notification-body.ts`:
```ts
export class CreateNotificationBody {
  @IsNotEmpty()
  @IsUUID()
  recipientId: string;

  @IsNotEmpty()
  @Length(5, 240)
  content: string;

  @IsNotEmpty()
  category: string;
}
```

Voltar no `app.controller.ts` 

```ts
  @Post()
  async create(@Body() body: CreateNotificationBody) {
    const { recipientId, content, category } = body;

    await this.prisma.notification.create({
      data: {
        id: randomUUID(),
        content,
        category,
        recipientId,
      },
    });
  }
```

Test notification creation sending this json as body:
```json

```


