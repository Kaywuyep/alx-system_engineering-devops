#!/usr/bin/env ruby
# The regular expression must be exactly matching a string that starts with h
# ends with n and can have any single character in between
# i used '.' the wild card that can take the place of other symbols
puts ARGV[0].scan(/h.n/).join
