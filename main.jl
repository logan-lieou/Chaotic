using DifferentialEquations
using Plots

#f(u, p, t) = 1.01*u
#u0 = 1/2
#tspan = (0.0, 0.1)
#prob = ODEProblem(f, u0, tspan)

#sol = solve(prob, Tsit5(), reltol=1e-8, abstol=1e-8)

#plot(sol, linewidth=5, title="Solution to the linear ODE with a thick line",
#     xaxis="Time (t)", yaxis="u(t) (in μm)", label="My Thick Line!") # legend = false
#plot!(sol.t, t->0.5*exp(1.01t), lw=3, ls=:dash, label="True solution")
#savefig("output.png")
#wtf is this
#actually don't know what's going on
#f(u, p, t) = sin(u[1])
#x0 = π
#tspan = (0.0, 5.0)

#prob = ODEProblem(f, x0, tspan)
#sol = solve(prob)

#plot(sol, title="solution to the problem pog", yaxis="angle(Θ)", xaxis="x-value")
#savefig("sin.png")

# basic plot
plot(sin, 0:0.01:3π)
savefig("sin.png")

function f(out, du, u, p, t)
    out[1] = -0.04u[1] + 1e4*u[2]u[3] - du[1]
    out[2] = 0.04u[1] - 3e7*u[2]^2 - 1e4*u[2]*u[3] - du[2]
    out[3] = u[1] + u[2] + u[3] - 1.0
end

u0 = [1.0, 0, 0]
du0 = [-0.04, 0.04, 0.0]
tspan = (0.0, 100000.0)

diff_vars = [true, true, false]
prob = DAEProblem(f, du0, u0, tspan, differential_vars=diff_vars)

# it'll figure it out
sol = solve(prob)

plot(sol)
savefig("output.png")
