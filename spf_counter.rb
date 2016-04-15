#!/usr/bin/env ruby

require 'spf/query'

def count(domain)
  SPF::Query::Record.query(domain).reduce(1) do |m, e|
    m + (e.name == :include ? count(e.value) : 0)
  end
end

ARGV.each do |domain|
  result = count(domain) - 1 # top level doesn't count
  puts [domain, result, (result > 10 ? 'FAIL' : 'PASS')].join(', ')
end
