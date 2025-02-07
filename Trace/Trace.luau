local Projectile = {}
Projectile.__index = Projectile

function Projectile.new()
	local self = setmetatable({}, Projectile)
	self.pathBeam, self.pathAttach0, self.pathAttach1 = self:createBeamInProjectileMotionPath()
	return self
end

function Projectile:createBeamInProjectileMotionPath()
	local attach0 = Instance.new("Attachment")
	local attach1 = Instance.new("Attachment")

	local beam = Instance.new("Beam")
	beam.Color = ColorSequence.new(Color3.new(0, 1, 0))  
	beam.Attachment0 = attach0
	beam.Attachment1 = attach1

	beam.Parent = workspace.Terrain
	attach1.Parent = workspace.Terrain
	attach0.Parent = workspace.Terrain

	return beam, attach0, attach1
end

function Projectile:updatePath(player,mousePosition)
	local playerPosition = player.Character.HumanoidRootPart.Position
	local g = 9.8
	local v0 = 50
	local x0 = playerPosition

	local t1 = 1  
	local curve0, curve1, cf1, cf2 = self:beamProjectile(g, v0, x0, t1)

	self.pathBeam.CurveSize0 = curve0
	self.pathBeam.CurveSize1 = curve1
	self.pathBeam.Segments = 10 * math.round(t1 * 3)

	self.pathAttach0.CFrame = self.pathAttach0.Parent.CFrame:Inverse() * cf1
	self.pathAttach1.CFrame = self.pathAttach1.Parent.CFrame:Inverse() * cf2

	local mouseDirection = (mousePosition - playerPosition).unit
	local pathOffset = mouseDirection * 5  
	self.pathAttach0.WorldPosition = playerPosition
	self.pathAttach1.WorldPosition = playerPosition + pathOffset
end

function Projectile:beamProjectile(g, v0, x0, t1)
	local c = 0.5 * 0.5 * 0.5
	local p3 = 0.5 * g * t1 * t1 + v0 * t1 + x0
	local p2 = p3 - (g * t1 * t1 + v0 * t1) / 3
	local p1 = (c * g * t1 * t1 + 0.5 * v0 * t1 + x0 - c * (x0 + p3)) / (3 * c) - p2

	local curve0 = (p1 - x0).magnitude
	local curve1 = (p2 - p3).magnitude

	local b = (x0 - p3).unit
	local r1 = (p1 - x0).unit
	local u1 = r1:Cross(b).unit
	local r2 = (p2 - p3).unit
	local u2 = r2:Cross(b).unit
	b = u1:Cross(r1).unit

	local cf1 = CFrame.new(x0.x, x0.y, x0.z, r1.x, u1.x, b.x, r1.y, u1.y, b.y, r1.z, u1.z, b.z)

	local cf2 = CFrame.new(p3.x, p3.y, p3.z, r2.x, u2.x, b.x, r2.y, u2.y, b.y, r2.z, u2.z, b.z)

	return curve0, -curve1, cf1, cf2
end

function Projectile:createAndSetBeam(g, v0, x0, endTime, color)
	local t1 = endTime or 1 
	local curve0, curve1, cf1, cf2 = self:beamProjectile(g, v0, x0, t1)
	local beam, attach0, attach1 = self:createBeamInProjectileMotionPath()
	beam.CurveSize0 = curve0
	beam.CurveSize1 = curve1
	beam.FaceCamera = true
	beam.Segments = 10 * math.round(t1 * 3)
	if color then
		beam.Color = ColorSequence.new(color)
	end
	
	
	attach0.CFrame = attach0.Parent.CFrame:Inverse() * cf1
	attach1.CFrame = attach1.Parent.CFrame:Inverse() * cf2

	return beam, attach0, attach1
end

return Projectile.new()