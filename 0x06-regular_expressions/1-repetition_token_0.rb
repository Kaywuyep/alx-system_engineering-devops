#!/usr/bin/env ruby
# a script that uses a repetative token
# this matches the exact occurence of the token
puts ARGV[0].scan(/hbt{2,5}n/).join
