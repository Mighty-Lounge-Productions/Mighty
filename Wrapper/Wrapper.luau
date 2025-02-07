local Overture = require(game:GetService("ReplicatedStorage"):WaitForChild("Overture"))
local Promise = Overture:LoadLibrary("Promise")

local RemoteWrapper = {}
RemoteWrapper.__index = RemoteWrapper

function RemoteWrapper.new(remoteObject)
	local self = setmetatable({}, RemoteWrapper)
	self.RemoteObject = remoteObject
	return self
end

function RemoteWrapper:InvokeServerAsync(...)
	local args = {...}

	return Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			return self.RemoteObject:InvokeServer(table.unpack(args))
		end)

		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
end

function RemoteWrapper:InvokeClientAsync(player, ...)
	local args = {...}

	return Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			return self.RemoteObject:InvokeClient(player, table.unpack(args))
		end)

		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
end

function RemoteWrapper:ConnectClientAsync(callback)
	return Promise.new(function(resolve, reject)
		local connection

		connection = self.RemoteObject.OnClientEvent:Connect(function(...)
			local success, result = pcall(callback, ...)
			if not success then
				connection:Disconnect()
				reject(result)
			end
		end)

		resolve(connection)
	end)
end


return RemoteWrapper