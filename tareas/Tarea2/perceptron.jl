#=
Eduardo Acuña Yeomans

Código para la tarea 2 de Reconocimiento de Patrones

perceptron.jl
=#

using Gadfly

function random_line()
  x = rand(2)
  y = rand(2)
  w2, w0 = [[x[2],y[2]] [1,1]]\[-x[1],-y[1]]
  return [w0, 1, w2]
end

function generate_data(n)
  data = Array(Array{Float64,1}, n)
  for i in 1:n
    data[i] = rand(2)
  end
  return data
end

function perceptron_responses(w, pts)
  w0, w1, w2 = w
  map(p->sign(w0+w1*p[1]+w2*p[2]), pts)
end

function classified_data(n)
  points = generate_data(n)
  w = random_line()
  classes = perceptron_responses(w, points)
  return points, classes, w
end

function line_from_weights(weights)
  function f(x)
    -weights[1]/weights[3] - weights[2]*x/weights[3]
  end
  return f
end

function pla(xs, ys, steps)
  # initial random line
  h = random_line()
  for step in 1:steps
    cs = perceptron_responses(h, xs)
    for i in 1:length(cs)
      if cs[i] != ys[i]
        h += ys[i]*[1, xs[i]]
        break
      end
    end
  end
  return h
end

function pla(xs, ys)
  h = random_line()
  iteration = 0
  loop = true
  while loop
    loop = false
    iteration += 1
    cs = perceptron_responses(h, xs)
    for i in 1:length(cs)
      if cs[i] != ys[i]
        h += ys[i]*[1, xs[i]]
        loop = true
        break
      end
    end
  end
  return h, iteration
end


function pla_check(cA, cB)
  count(x->x[1]!=x[2], zip(cA,cB))
end

function pla_plot(xs, ys, h)
  xline = linspace(0,1)
  yline = (line_from_weights(h))(xline)
  xdots = map(p->p[1], xs)
  ydots = map(p->p[2], xs)
  plot(layer(x=xline, y=yline, Geom.line),
       layer(x=xdots, y=ydots, Geom.point, color=ys))
end

#
# PERCEPTRON TEST
#
xs, ys, f = classified_data(1000)
h, iterations = pla(xs, ys)
pla_check(ys, perceptron_responses(h, xs))
pla_plot(xs, ys, h)


#
# Eout approximation
#
function out_sample_error(f, h, n=1000)
  points = generate_data(n)
  f_classes = perceptron_responses(f, points)
  h_classes = perceptron_responses(h, points)
  misses = pla_check(f_classes, h_classes)
  return misses/n
end

out_sample_error(f, h)

#
#
#
function pla_avg_iterations(sample_size, n = 100)
  iterations = 0

  for i in 1:n
    xs, ys, f = classified_data(sample_size)
    h, it = pla(xs, ys)
    iterations += it
  end

  return iterations/n
end

pla_avg_iterations(10, 1000)

pla_avg_iterations(100, 1000)

function pla_avg_sample_error(sample_size, n = 100)
  error = 0

  for i in 1:n
    xs, ys, f = classified_data(sample_size)
    h, iterations = pla(xs, ys)
    error = out_sample_error(f, h)
  end

  return error/n
end

pla_avg_sample_error(100)

0.000510
2.0x10^{-5}
