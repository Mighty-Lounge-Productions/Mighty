local VectorUtils = {}

-- Calculates the distance between two points in 3D space
function VectorUtils.distance(pointA, pointB)
	return (pointB - pointA).magnitude
end

-- Calculates the direction from one point to another
function VectorUtils.direction(fromPoint, toPoint)
	return (toPoint - fromPoint).unit
end

-- Calculates the angle between two vectors in degrees
function VectorUtils.angleBetween(vec1, vec2)
	return math.acos(Vector3.new(vec1.x, 0, vec1.z):Dot(Vector3.new(vec2.x, 0, vec2.z)) / (vec1.magnitude * vec2.magnitude)) * (180 / math.pi)
end

-- Checks if a point is within a certain range of another point
function VectorUtils.isInRange(pointA, pointB, range)
	return VectorUtils.distance(pointA, pointB) <= range
end

-- Checks if a point is within a certain angle of another point
function VectorUtils.isInAngle(fromPoint, toPoint, maxAngle)
	local directionA = VectorUtils.direction(fromPoint, toPoint)
	local directionB = fromPoint.Unit
	local angle = VectorUtils.angleBetween(directionA, directionB)
	return angle <= maxAngle
end

return VectorUtils