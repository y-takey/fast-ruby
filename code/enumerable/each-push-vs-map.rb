require 'benchmark/ips'

ARRAY = (1..100).to_a

def slow
  ret = []
  ARRAY.each {|i| ret.push i }
end

def fast
  ARRAY.map {|i| i }
end

Benchmark.ips do |x|
  x.report('Array#each + push') { slow }
  x.report('Array#map')          { fast }
  x.compare!
end
