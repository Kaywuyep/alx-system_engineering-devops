#!/usr/bin/env ruby
# a simple TextMe exercise using the non-greedy way
# \[(.*?)\] -  non-greedy match for any char (except newline) within d brackets
# \s - matches whitespace characters
# join(',')- This joins the captured groups for each
# match using a comma as a separator.
puts ARGV[0].scan(/\[from:(.*?)\]\s\[to:(.*?)\]\s\[flags:(.*?)\]/).join(',')
