### RemoteWrapper

**Author:** @nuliux

**Description:**

The `RemoteWrapper` library provides a convenient way to wrap Roblox RemoteEvents and RemoteFunctions with promises, enabling asynchronous handling of remote communications in a more structured and readable manner. This library leverages the `Promise` library to manage the asynchronous nature of remote invocations and events.

**Key Functions and Methods:**

1. **RemoteWrapper.new(remoteObject):**
   - Creates a new `RemoteWrapper` instance for a given `remoteObject`, which can be either a `RemoteEvent` or `RemoteFunction`.

2. **RemoteWrapper:InvokeServerAsync(...):**
   - Asynchronously invokes a server method using the wrapped `RemoteFunction`.
   - Returns a promise that resolves with the result of the invocation or rejects with an error if the invocation fails.

3. **RemoteWrapper:InvokeClientAsync(player, ...):**
   - Asynchronously invokes a client method for a specific player using the wrapped `RemoteFunction`.
   - Returns a promise that resolves with the result of the invocation or rejects with an error if the invocation fails.

4. **RemoteWrapper:ConnectClientAsync(callback):**
   - Asynchronously connects a callback function to the `OnClientEvent` of the wrapped `RemoteEvent`.
   - Returns a promise that resolves with the connection object. If the callback throws an error, the connection is disconnected, and the promise is rejected with the error.

**Usage:**

The `RemoteWrapper` library simplifies the process of handling remote communications in Roblox by providing a promise-based interface. This allows developers to write cleaner and more maintainable code when dealing with asynchronous operations, such as network requests or remote procedure calls.

By using promises, developers can avoid deeply nested callbacks and handle errors more gracefully. This library is particularly useful in scenarios where multiple asynchronous operations need to be chained or coordinated.

**Integration with Promise Library:**

The `RemoteWrapper` library relies on the `Promise` library to manage the asynchronous behavior of remote invocations and events. It uses the `Promise.new` method to create promises that resolve or reject based on the success or failure of the remote operations.