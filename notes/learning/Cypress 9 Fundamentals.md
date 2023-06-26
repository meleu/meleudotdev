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

## Practice

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


## Selectors

> Prefer to use `data-*` attributes to provide context to your selectors and isolate them from CSS or JS changes.

**NOTE**: a friend recommended this: <https://testing-library.com/>

![[Cypress 9 Fundamentals - selectors.png]]

In this 👆 approach you need to add the `data-cy` in your HTML.


## Assertions

<https://docs.cypress.io/guides/references/assertions>

> [!note]
> Apparently the official doc doesn't list TDD assertions anymore.

### BDD vs. TDD assertions

#### Behavior-Driven Development

Assertions with `expect` or `should`.

#### Test-Driven Development

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



## Cypress Retry-ability

