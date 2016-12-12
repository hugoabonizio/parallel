require "../src/parallel/each"

def fib(n)
  n <= 1 ? n : fib(n - 1) + fib(n - 2)
end

Parallel.each(['a', 'b', 'c', 'd', 'e', 'f', 'g']) do |char|
  1000.times { fib(20) }
  puts char
end

Parallel.each((1..30)) do |char|
  10000.times { fib(20) }
  puts char
end
