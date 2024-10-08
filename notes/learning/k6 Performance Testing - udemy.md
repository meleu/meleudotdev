---
dg-publish: true
---
# k6 Performance Testing - udemy

- <https://udemy.com/course/k6-load-testing-performance-testing/>

Very good at showing the basics of k6 and load/performance testing in general.

During the course I knew an interesting webservice: <https://designer.mocky.io/>

## Basic Concepts

Test Types:

- Load Testing
    - Smoke
    - Load (for performance)
    - Stress
        - Spike
        - Breakpoint
    - Soak/Endurance

Acronyms:

- SLA: Service-Level Agreement
    - the agreement you make with your clients
- SLO: Service-Level Objective
    - the objective your team must hit to meet that agreement
- SLI: Service-Level Indicators
    - the real numbers on your performance

## Test Types

### Smoke Testing

[doc](https://k6.io/docs/test-types/smoke-testing/)

Validate that your script works and that the system performs adequately under **minimal load**.

#### code

Run the code below with `k6 run <script.js>`.

```js
import http from 'k6/http';
import { sleep } from 'k6';

export const options = {
  // only one Virtual User
  vus: 1,
  duration: '30s'
}

export default function() {
  http.get('https://test.k6.io');
  sleep(1);
  http.get('https://test.k6.io/contact.php');
  sleep(2);
  http.get('https://test.k6.io/news.php');
  sleep(2);
}
```

### Average Load Testing

[doc](https://k6.io/docs/test-types/load-testing/)

Asses how your system performs under **expected normal conditions** (aka **typical load**).

![[k6 average load testing.png]]

#### code

```js
import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for avg load test in this section
  stages: [
    // traffic ramp-up from 1 to 100 users over 5 minutes.
    { duration: '5m', target: 100 },
    // stay at 100 users for 30 minutes
    { duration: '30m', target: 100 },
    // ramp-down to 0 users
    { duration: '5m', target: 0 },
  ],
};

export default () => {
  const urlRes = http.get('https://test-api.k6.io');
  sleep(1);
  // Here you can have more steps or complex script...
};
```

### Stress Testing

[doc](https://k6.io/docs/test-types/stress-testing/)

Asses how a system performs at **its limits** when load exceeds the expected average

![[k6 stress testing.png]]
#### code

pretty similar to average load testing, but with a greater target
```js
import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for Stress in this section
  stages: [
    // traffic ramp-up from 1 to a higher 200 users over 10 minutes.
    { duration: '10m', target: 200 },
    // stay at higher 200 users for 30 minutes
    { duration: '30m', target: 200 },
    // ramp-down to 0 users
    { duration: '5m', target: 0 },
  ],
};

export default () => {
  const urlRes = http.get('https://test-api.k6.io');
  sleep(1);
  // Here you can have more steps or complex script...
};
```

### Spike Testing

Verifies whether the system survives and performs under sudden and massive rushes of utilization.

```js
import http from 'k6/http';
import {sleep} from 'k6';

export const options = {
  // Key configurations for spike in this section
  stages: [
    // fast ramp-up to a high point
    { duration: '2m', target: 2000 },

    // No plateau

    // quick ramp-down to 0 users
    { duration: '1m', target: 0 },
  ],
};

export default () => {
  const urlRes = http.get('https://test-api.k6.io');
  sleep(1);
  // Add only the processes that will be on high demand
};
```

### Breakpoint Testing

Aims to find system limits.

Reasons to know limits include:

- to tune or care for the system's weak spots to relocate those higher limits at higher levels.
- to help plan remediation steps in those cases and prepare for when the system nears those limits.

Considerations:

- run breakpoints only when the system is known to perform under all other test types (smoke, average load, stress)
- avoid breakpoint tests in elastic cloud environments
- increase the load gradually
- system failure could mean different things to different teams

### Soak Testing

Assess the reliability and performance of your system over **extended periods** (e.g.: 12h-24h).

Analyzing the system's degradation of performance and resource consumption over extended periods.

It's basically the same as the average load testing, but for extended periods of time in the plateau stage (do not change the ramp up/down stages).

You typically run this test to:

- Verify that your system doesn't suffer from bugs or memory leaks, which result in a crash or restart after several hours of operation.
- Verify that expected application restarts don't lose requests.
- Find bugs related to race-conditions that appear sporadically.
- Make sure your database doesn't exhaust the allotted storage space and stops
- Make sure your logs don't exhaust the allotted disk storage.
- Make sure the external services you depend on don't stop working after a certain amount of requests are executed.


---

## k6 scripts

### structure of a k6 script

```js
// import some stuff from k6
// ...

console.log('-- init stage --')

// this is happening during init stage
export const options = {
  // configure some options
};



export function setup() {
  console.log('-- setup stage --')
}

export default function() {
  console.log('-- VU stage --')
}

export function teardown() {
  console.log('-- teardown stage --')
}
```


### environment variables

We can get the content of environment variables inside a k6 script by using `__ENV.<varname>`.

Example:

```js
const baseUrl = __ENV.BASE_URL
```



### http responses

[official docs](https://k6.io/docs/javascript-api/k6-http/response/)

```js
import http from 'k6/http';

export default function() {
  // save the response in a var
  const res = http.get('https://test.k6.io/');

  // try res.<c-space> to see the options
  console.log(res.status)
}
```


### assertions

```js
import http from 'k6/http';
import { check } from 'k6';

export default function() {
  const res = http.get('https://test.k6.io/')
  check(res.status, {
    'status is 200': (statusCode) => statusCode === 200
  });
}
```


### jsutils - random numbers, random strings, etc.

#### random intenger:

```js
import { randomIntBetween } from 'https://jslib.k6.io/k6-utils/1.2.0/index.js';

// ...
const my_int = randomIntBetween(1, 5);
```

It's useful to use `sleep()` with a random number, to prevent a block of requests when testing with several VUs.


#### random string

```js
import { randomString } from 'https://jslib.k6.io/k6-utils/1.2.0/index.js';

// ...
const username = `test_${randomString(8)}`; // random string with 8 chars
```


#### random item from an array

```js
import { randomItem } from 'https://jslib.k6.io/k6-utils/1.2.0/index.js';

// ...
const item = randomItem(my_array);
```

### thresholds

example:
```js
// ...
export const options = {
  thresholds: {
    http_req_duration: [{

      // 99% must be "solved" in less than 1 second
      threshold: "p(99) < 1000",

      // abort the test if the threshold is crossed, but...
      abortOnFail: true,

      // ... wait for 10s before considering the 'abortOnFail'
      delayAbortEval: "10s"
    }]
  },
  //...
}
```


### metric types and aggregation methods

| metric type                                                     | description                                                                     |
| --------------------------------------------------------------- | ------------------------------------------------------------------------------- |
| [Counter](https://k6.io/docs/javascript-api/k6-metrics/counter) | cumulatively sums added values.                                                 |
| [Gauge](https://k6.io/docs/javascript-api/k6-metrics/gauge)     | stores the min, max and last values added to it.                                |
| [Rate](https://k6.io/docs/javascript-api/k6-metrics/rate)       | tracks the percentage of added values that are non-zero.                        |
| [Trend](https://k6.io/docs/javascript-api/k6-metrics/trend)     | calculates statistics on the added values (min, max, average, and percentiles). |

- Counter
    - count
- Gauge
    - min
    - max
    - value
- Rate
    - rate (note: 0.1 == 10%; 1 == 100%)
- Trend
    - min
    - max
    - med
    - avg
    - p(N)


---
## suggestions for improvements

### custom thresholds

One important thing to teach is the `abortOnFail` option, which is specially useful when doing breakpoint test. Don't forget to mention the `delayAbortEval` option too!

Here's an example:
```js
export const options = {
  thresholds: {
    http_req_duration: [{

      // 99% must be "solved" in less than 1 second
      threshold: "p(99) < 1000",

      // abort the test if the threshold is crossed, but...
      abortOnFail: true,

      // ... wait for 10s before considering the 'abortOnFail'
      delayAbortEval: "10s"
    }]
  },
  //...
}
```


### show some options for a better final output

Use case: I used k6 at my job, and after all the tests the managers asked for a report to summarize the conclusions.

We had to copy'n'paste the k6 output and do some manual work to get only the info we wanted. It would be awesome if the course taught this kind of thing...

Examples of useful little things I learned from the docs:

- time unit consistency (for example, milliseconds)
    -  CLI option: `--summary-time-unit ms`
    - in the code: `options = { summaryTimeUnit: 'ms' }`
- decrease output verbosity showing only a few stats
    - CLI option: `--summary-trend-stats="avg,min,max,p(90)"`
    - In code: `options = { summaryTrendStats: ['avg', 'min', 'max', 'p(90)'] }`

Another thing I'd like to know but didn't looked that much in the docs: **How to specify the few metrics I'm interested in?**

Example: I only want the `http_req_duration` and `http_req_waiting`.

### how to better organize your code

[This page in the k6 docs](https://k6.io/docs/examples/tutorials/get-started-with-k6/reuse-and-re-run-tests/) gives good hints about better organizing the code. I think the course should mention this kind of thing.


### examples for specific tests

The [Examples page](https://k6.io/docs/examples/) can be an awesome inspiration for examples to be shown and explained in the course.

[This article](https://k6.io/blog/learning-js-through-load-testing/) also can give some nice insights for k6 things to teach.

