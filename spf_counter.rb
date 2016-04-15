#!/usr/bin/env ruby

require 'spf/query'
require 'active_support/core_ext/object/try'

def count(domain)
  return unless (query = SPF::Query::Record.query(domain))
  query.reduce(1) do |m, e|
    m + (e.name == :include ? (count(e.value) || 1) : 0)
  end
end

ARGV.each do |domain|
  result = count(domain).try(:-, 1)
  puts [domain, result, ((result > 10 ? 'FAIL' : 'PASS') if result)].join(', ')
end
