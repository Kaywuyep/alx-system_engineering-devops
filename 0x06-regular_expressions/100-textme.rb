#!/usr/bin/env ruby
# a simple TextMe exercise
puts ARGV[0].scan(/\[from:(.*?)\]\s\[to:(.*?)\]\s\[flags:(.*?)\]/).join(',')
