### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 0941fc7e-da7c-11eb-0f45-8924c24cac90
using Plots

# ╔═╡ 3ce8240e-c523-49b1-aac0-9ffde287ec34
Base.@kwdef mutable struct Rossler
	dt::Float64=0.02
	a::Float64=0.2
	b::Float64=0.2
	c::Float64=5.7
	x::Float64=1
	y::Float64=1
	z::Float64=1
end

# ╔═╡ 9d3a4945-8d5e-4f97-9a64-5302fc0ff916
function step!(r::Rossler)
	dx = -r.y - r.z
	dy = r.x + r.a * r.y
	dz = r.b + r.z * (r.x - r.c)
	r.x += r.dt * dx
	r.y += r.dt * dy
	r.z += r.dt * dz
end

# ╔═╡ 6dfcc2ef-ea90-4ad1-8609-1ade2dc37c5c
attractor = Rossler()

# ╔═╡ 96110126-caa8-410a-b3de-a74f2d90ff35
plt = plot3d(
	1,
	xlim = (-15, 15),
	ylim = (-15, 15),
	zlim = (0, 40),
	title = "Rossler Attractor",
	marker = 2
)

# ╔═╡ 370e3bbc-ba98-4600-b4e7-fa3099b7be3b
@gif for i=1:1000
	step!(attractor)
	push!(plt, attractor.x, attractor.y, attractor.z)
end every 10

# ╔═╡ Cell order:
# ╠═0941fc7e-da7c-11eb-0f45-8924c24cac90
# ╠═3ce8240e-c523-49b1-aac0-9ffde287ec34
# ╠═9d3a4945-8d5e-4f97-9a64-5302fc0ff916
# ╠═6dfcc2ef-ea90-4ad1-8609-1ade2dc37c5c
# ╠═96110126-caa8-410a-b3de-a74f2d90ff35
# ╠═370e3bbc-ba98-4600-b4e7-fa3099b7be3b
