---
dg-publish: true
---
# Cypress 9 Fundamentals

Pluralsight course: <https://app.pluralsight.com/library/courses/cypress-9-fundamentals/table-of-contents>

[TOC]

---

## Getting Started

### Setup

```sh
# https://github.com/adhithiravi/Cypress-Fundamentals
git clone git@github.com:adhithiravi/Cypress-Fundamentals.git
cd Cypress-Fundamentals

# api is the backend
cd api
npm install
npm start
cd ..

# app is the frontend
cd app
npm install
npm start
cd ..

# install the dependencies for the root folder
npm install # cypress 9.5.4 is already included

#############################################################
# once this 👆 is finished, we're ready to start with cypress
#############################################################
# on brand new projects, install cypress with this:
#npm install cypress --save-dev
#############################################################

npx cypress open

# it will create the cypress dir and a bunch of files.
# delete everything inside cypress/integration/*
```

Run Cypress in headless mode:
```sh
npx cypress run
```

### Cypress IntelliSense

To enable cypress intellisense, add this to the head of the `.spec.js` file:
```js
/// <reference types="cypress" />
```


### First Test

```js
/// <reference types="cypress" />

describe("Navigation", () => {
  it("should navigate to conference sessions page", () => {
    cy.visit("http://localhost:1337/conference");
    cy.get("h1").contains("View Sessions").click();

    cy.url().should("include", "/sessions");
  })
})
```


## Core Concepts

> [!important]
> - Test structure
> - Interacting with elements
>    - Commands
>        - parent (can only start a chain)
>        - child (can only continue the chain)
>        - dual (act as parent and child)
>    - Selectors
>        - prefer to use `data-cy`, `data-test`, or `data-testid`
>    - Assertions
>        - BDD: `expect` or `should`
>        - TDD: `assert`
>    - Retry-ability
>    - Aliases
>        - `.get('something').as('AliasName');
>        - `.get('AliasName')`


### Test Structure

cypress directories:

- fixtures
- integration
- plugins
- support


### Hooks

Borrowed from Mocka

- `before`: runs once before all tests
- `beforeEach`: runs before every single test block
- `afterEach`: runs after each test block
- `after`: runs once all tests are done

### Commands

Commands to interact with DOM elements. The commands are categorized as:

- parent
- child
- dual commands

#### Parent Commands

Begin a new chain of Cypress commands (cannot be used after the chain is started).

Examples:
```js
cy.visit('/conference');

// get an DOM element
cy.get('h1');

// make an HTTP request, default method: GET
cy.request('http://dev.local/seed');

// run system command
cy.exec('npm run build');

// manage the behavior of network requests/responses
cy.intercept('/users/**');
```



#### Child Commands

Chained off a parent command, or another child command.

Examples:
```js
cy.get('[data-cy=speakerProfile]')
  .click(); // <-- 👈 this is a child command

cy.get('[data-cy=sessionTitle]')
  .type('My new session');

cy.get('.conference')
  .find('footer');

cy.contains('ul', 'room number')
  .should('be.visible');

cy.get('footer')
  .scrollIntoView();

cy.get('form')
  .submit();
```


#### Dual Commands

Can either start a chain or be chained off an existing one. Which means they can act as a parent or child command.

Examples:
```js
cy.contains();
cy.screenshot();
cy.scrollTo();
cy.wait();
```

### Practice

So you can `cy.visit` with only the path, instead of a full URL, put your `baseUrl` in the `cypress.json`.

`submitSessions.spec.js`:
```js
/// <reference types="cypress" />

describe('Submit sessions', () => {
  beforeEach(() => {
    cy.visit('/conference');
    cy.get('h1').contains('View Sessions').click();
    cy.url().should('include', '/sessions');
    cy.get('a').contains('Submit a Session!').click();

  })

  it('should navigate to submit sessions page', () => {
    cy.url().should('include', '/sessions/new');
  });

  it('should submit a session successfully', () => {
    // filling form
    cy.contains('Title').type("New session title");
    cy.contains('Description').type('This is the greatest sessions');
    cy.contains('Day').type('Thursday');
    cy.contains('Level').type('Advanced');

    // submit the form
    cy.get('form').submit();

    // validate that form was submitted successfully
    cy.contains('Session Submitted Successfully');
  })
});
```


### Selectors

> Prefer to use `data-cy`, `data-test`, or `data-testid` attributes to provide context to your selectors and isolate them from CSS or JS changes.

**NOTE**: a friend recommended this: <https://testing-library.com/>

![[Cypress 9 Fundamentals - selectors.png]]

In this 👆 approach you need to add the `data-cy` in your HTML.


### Assertions

<https://docs.cypress.io/guides/references/assertions>

> [!note]
> Apparently the official doc doesn't list TDD assertions anymore.

#### BDD vs. TDD assertions

##### Behavior-Driven Development

Assertions with `expect` or `should`.

##### Test-Driven Development

Assertions with `assert`


### Common Cypress Assertions

```js
cy.contains('[data-cy=day]', 'Wednesday')
  .should('be.visible');

cy.url()
  .should('include', '/sessions');

cy.get('[data-cy=sessionList]')
  .should('have.length', 250);

cy.get('[data-cy=profile]')
  .should('not.exist');
```

Example:

`sessions.spec.js`:
```js
/// <reference types="cypress" />

describe('Sessions page', () => {
  it('should navigate to conference sessions page and view day filter buttons', () => {
    cy.visit('/conference');
    cy.get('h1').contains('View Sessions').click();
    cy.url().should('include', '/sessions');

    // validate buttons to filter by day
    cy.get('[data-cy=AllSessions]');
    cy.get('[data-cy=Wednesday]');
    cy.get('[data-cy=Thursday]');
    cy.get('[data-cy=Friday]');
  });

  it("should filter sessions and only display Wednesday sessions when Wednesday button is clicked", () => {
    cy.get('[data-cy=Wednesday]').click();

    // assert there are 100 sessions after Wednesday button is clicked
    cy.get('[data-cy=day]').should('have.length', 21);

    // assertions
    cy.get('[data-cy=day]').contains('Wednesday').should('be.visible');
    cy.get('[data-cy=day]').contains('Thursday').should('not.exist');
    cy.get('[data-cy=day]').contains('Friday').should('not.exist');
  })
});
```


### Cypress Retry-ability

> If assertion following a DOM query command fails - Keep retrying until timeout
> - No hardcoding of waits in code

Caveats:

- only retries commands that query the DOM (commands that don't change the state of the app)
    - `get`, `find`, `contains`, etc.
- doesn't retry commands that may change the state of the app
    - `click` - not retried!
- only last command before assertion is retried


### Aliases

```js
// declaring an alias
cy.get('[data-cy=Wednesday]').as('WednesdayBtn');

// calling an alias
cy.get('@WednesdayBtn');
```


---

## Testing Network Requests

> [!important]
> - Cypress Intercept command
>     - Spy network calls
>     - Wait and Alias command along with intercept
>     - Stub network responses
>     - Intercept with fixtures
> - Cypress Request command
>     - not commonly used...

Cypress Network Testing Strategy:

- Stub Responses (mocked responses, faster)
- Use Server Responses (actual server responses, slower)


Best practice:

> Use stubbed response tests more often for speed, simplicity and reliability.
> 
> Don't use stubbed responses for server-side rendering architecture.
>
> Avoid stubs for critical paths, like login.


### Intercept Command

[video](https://app.pluralsight.com/course-player?clipId=57304b43-d334-4bd4-bf79-08570d334be9)

According to the lecture, this strategy makes cypress wait for the server's response once the button is clicked.
```js
cy.intercept("POST", "http://localhost:4000/graphql").as("getSessionInfo");
cy.get("@WednesdayBtn").click();
cy.wait("@getSessionInfo");
```

In this case cypress is only spying the request and waiting for the response. Nothing is being changed in the request neither in the response from the server.


### Stubbing with Intercept

#### Stubbing an empty response:

```js
cy.intercept(
  {
    method: 'GET',   // intercept all GET requests...
    url: '/users/*', // ... which the URL matches '/user/*'...
  },
  [] // ... and force the response to be: []
).as('getUsers') // also assign an alias
```


#### Stubbing Response

```js
// stub headers, status code, and body, all at once
cy.intercept('/not-found', {
  statusCode: 404,
  body: '404 Not Found!',
  headers: {
    'x-not-found': 'true',
  },
});
```

#### Stubbing Fixtures

```js
cy.intercept(
  'GET',
  '/activities/*',
  { fixture: 'activities.json' }
);
```

**NOTE**: fixtures are placed inside the `cypress/fixtures/` dir.


### Request Command

#### Server Response

```js
cy.request('https://jsonplaceholder.cypress.io/comments')
  .as('comments');

cy.get('@comments').should((response) => {
  expect(response.body).to.have.length(500);
  expect(response).to.have.property('headers');
  expect(response).to.have.property('duration');
});
```


## Exploring Cypress Ecosystem

```sh
# run cypress in headless mode
npx cypress run
```

### Screenshots and Videos

Configs:

- video

When running cypress in headless mode it automatically creates videos for the tests and save them in `cypress/videos/`. To disable this behavior:

`cypress.json`:
```json
{
  "video": false
}
```
