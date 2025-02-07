local RaycastingUtils = {}
RaycastingUtils.__index = RaycastingUtils

function RaycastingUtils.new()
	local self = setmetatable({}, RaycastingUtils)
	return self
end


function RaycastingUtils:Raycast(origin, direction, maxLength, ignoreList)
	maxLength = maxLength or 100 
	ignoreList = ignoreList or {} 
	local rayParams = RaycastParams.new()
	rayParams.FilterType = Enum.RaycastFilterType.Include
	rayParams.FilterDescendantsInstances = ignoreList
	rayParams.MaxDistance = maxLength

	local result = workspace:Raycast(origin, direction * maxLength, rayParams)

	return result
end

function RaycastingUtils:LineOfSight(origin, target, ignoreList)
	ignoreList = ignoreList or {} 

	local direction = (target - origin).unit
	local distance = (target - origin).magnitude

	local hit = self:Raycast(origin, direction, distance, ignoreList)

	return hit == nil
end

return RaycastingUtils