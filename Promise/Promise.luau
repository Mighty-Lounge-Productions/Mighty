local Promise = {}
Promise.__index = Promise

function Promise.new(executor)
	local self = setmetatable({}, Promise)
	self._status = "Pending"
	self._value = nil
	self._callbacks = {}
	self._progressCallbacks = {}

	local function resolve(value)
		if self._status == "Pending" then
			self._status = "Fulfilled"
			self._value = value

			for _, callback in ipairs(self._callbacks) do
				callback()
			end
		end
	end

	local function reject(reason)
		if self._status == "Pending" then
			self._status = "Rejected"
			self._value = reason

			for _, callback in ipairs(self._callbacks) do
				callback()
			end
		end
	end

	local function notifyProgress(progress)
		for _, progressCallback in ipairs(self._progressCallbacks) do
			progressCallback(progress)
		end
	end

	executor(resolve, reject, notifyProgress)

	return self
end

function Promise:Then(onFulfilled, onRejected, onProgress)
	local newPromise = Promise.new(function(resolve, reject, notifyProgress)
		local function callback()
			if self._status == "Fulfilled" then
				if onFulfilled then
					local success, result = pcall(onFulfilled, self._value)
					if success then
						resolve(result)
					else
						reject(result)
					end
				else
					resolve(self._value)
				end
			elseif self._status == "Rejected" then
				if onRejected then
					local success, result = pcall(onRejected, self._value)
					if success then
						resolve(result)
					else
						reject(result)
					end
				else
					reject(self._value)
				end
			end
		end

		if self._status == "Pending" then
			table.insert(self._callbacks, callback)
			if onProgress then
				table.insert(self._progressCallbacks, onProgress)
			end
		else
			callback()
		end
	end)

	return newPromise
end

function Promise:Catch(onRejected)
	return self:Then(nil, onRejected)
end

function Promise:Timeout(ms)
	delay(ms / 1000, function()
		if self._status == "Pending" then
			self:Reject("Promise timed out")
		end
	end)
	return self
end

function Promise:Progress(onProgress)
	return self:Then(nil, nil, onProgress)
end

function Promise:Chain(...)
	local promises = {...}
	return self:Then(function()
		local nextPromise = promises[1]
		return nextPromise and nextPromise:Chain(table.unpack(promises, 2))
	end)
end

function Promise.Resolve(value)
	return Promise.new(function(resolve)
		resolve(value)
	end)
end

function Promise.Reject(reason)
	return Promise.new(function(_, reject)
		reject(reason)
	end)
end

function Promise.All(...)
	local promises = {...}
	return Promise.new(function(resolve, reject)
		local results = {}
		local count = 0

		for i, promise in ipairs(promises) do
			promise:Then(function(result)
				results[i] = result
				count = count + 1
				if count == #promises then
					resolve(results)
				end
			end):Catch(function(error)
				reject(error)
			end)
		end
	end)
end

function Promise.Race(...)
	local promises = {...}
	return Promise.new(function(resolve, reject)
		for _, promise in ipairs(promises) do
			promise:Then(resolve):Catch(reject)
		end
	end)
end

return Promise
