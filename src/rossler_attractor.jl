using Plots

# Define the Rossler attractor
Base.@kwdef mutable struct Rossler
	dt::Float64=0.02
	a::Float64=0.2
	b::Float64=0.2
	c::Float64=5.7
	x::Float64=1
	y::Float64=1
	z::Float64=1
end

function step!(r::Rossler)
	dx = -r.y - r.z
	dy = r.x + r.a * r.y
	dz = r.b + r.z(r.x - r.c)
	r.x += r.dt * dx
	r.y += r.dt * dy
	r.z += r.dt * dz
end

attractor = Rossler()

plt = plot3d(
	1,
	xlim = (-30, 30),
	ylim = (-30, 30),
	zlim = (0, 60),
	title = "Rossler Attractor",
	marker = 2
)

@gif for i=1:10000
	step!(attractor)
	push!(plt, attractor.x, attractor.y, attractor.z)
end every 10