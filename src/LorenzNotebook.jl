### A Pluto.jl notebook ###
# v0.14.5

using Markdown
using InteractiveUtils

# ╔═╡ 45eac400-da75-11eb-3fd1-738832c14aae
using Plots

# ╔═╡ 852ba003-053c-4d0b-9364-4a9120672aec
Base.@kwdef mutable struct Lorenz
    dt::Float64 = 0.02
    σ::Float64 = 10
    ρ::Float64 = 28
    β::Float64 = 8/3
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end

# ╔═╡ d191aed4-4bb7-48a5-9668-dbfb97872cb1
function step!(l::Lorenz)
    dx = l.σ * (l.y - l.x)
    dy = l.x * (l.ρ - l.z) - l.y
    dz = l.x * l.y - l.β * l.z
    l.x += l.dt * dx
    l.y += l.dt * dy
    l.z += l.dt * dz
end

# ╔═╡ 7281e570-a47b-45f0-a3dc-04e4c51099e4
attractor = Lorenz()

# ╔═╡ fbd27a8d-35e0-40d0-a331-3bd0c560796a
plt = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    title = "Lorenz Attractor",
    marker = 2,
)

# ╔═╡ 91e358df-cd81-43ca-871a-80cd96311fb1
@gif for i=1:1000
    step!(attractor)
    push!(plt, attractor.x, attractor.y, attractor.z)
end every 10

# ╔═╡ 510ef55e-f375-49b8-afa5-892fb3bd9b18
modified_attractor = Lorenz(ρ=14)

# ╔═╡ 6dd75093-8829-4a7c-a958-88af1bec43bf
plt2 = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    title = "Modified Attractor",
    marker = 2,
)

# ╔═╡ 1f6da765-d612-4da5-b361-70dbc2d387e2
@gif for i=1:1000
	step!(modified_attractor)
	push!(plt2, modified_attractor.x, modified_attractor.y, modified_attractor.z)
end every 10

# ╔═╡ Cell order:
# ╠═45eac400-da75-11eb-3fd1-738832c14aae
# ╠═852ba003-053c-4d0b-9364-4a9120672aec
# ╠═d191aed4-4bb7-48a5-9668-dbfb97872cb1
# ╠═7281e570-a47b-45f0-a3dc-04e4c51099e4
# ╠═fbd27a8d-35e0-40d0-a331-3bd0c560796a
# ╠═91e358df-cd81-43ca-871a-80cd96311fb1
# ╠═510ef55e-f375-49b8-afa5-892fb3bd9b18
# ╠═6dd75093-8829-4a7c-a958-88af1bec43bf
# ╠═1f6da765-d612-4da5-b361-70dbc2d387e2
