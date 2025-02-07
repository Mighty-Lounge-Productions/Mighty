### Promise

**Author:** @nuliux

**Description:**

The `Promise` library provides an implementation of promises for asynchronous programming in Luau. Promises help manage asynchronous operations, such as network requests or long computations, in a convenient and readable manner.

**Key Functions and Methods:**

1. **Promise.new(executor):**
   - Creates a new promise. The `executor` function takes three arguments: `resolve`, `reject`, and `notifyProgress`.
   - `resolve(value)`: Sets the promise's status to "Fulfilled" and stores the value.
   - `reject(reason)`: Sets the promise's status to "Rejected" and stores the reason.
   - `notifyProgress(progress)`: Calls progress callback functions to notify about progress.

2. **Promise:Then(onFulfilled, onRejected, onProgress):**
   - Returns a new promise that executes after the current one completes.
   - `onFulfilled`: Function called upon successful completion.
   - `onRejected`: Function called upon rejection.
   - `onProgress`: Function called to notify about progress.

3. **Promise:Catch(onRejected):**
   - Shorthand for `Then(nil, onRejected)`, used for error handling.

4. **Promise:Timeout(ms):**
   - Sets a timeout for the promise. If the promise is not fulfilled within the specified time, it is rejected with the message "Promise timed out".

5. **Promise:Progress(onProgress):**
   - Shorthand for `Then(nil, nil, onProgress)`, used for tracking progress.

6. **Promise:Chain(...):**
   - Chains promises, where each subsequent promise executes after the previous one completes.

7. **Promise.Resolve(value):**
   - Creates a promise that is immediately fulfilled with the given value.

8. **Promise.Reject(reason):**
   - Creates a promise that is immediately rejected with the given reason.

9. **Promise.All(...):**
   - Returns a promise that fulfills when all given promises are fulfilled. If any promise is rejected, the returned promise is also rejected.

10. **Promise.Race(...):**
    - Returns a promise that fulfills or rejects as soon as one of the given promises fulfills or rejects.

**Usage:**

The `Promise` library allows developers to write asynchronous code in Lua in a more structured and readable way, avoiding "callback hell." It is suitable for projects that require managing asynchronous operations, such as network requests, file operations, or long computations.