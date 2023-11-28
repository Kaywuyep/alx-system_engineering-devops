#!/usr/bin/env ruby
#  regular expression must match a 10 digit phone number '/^[0-9]{10]$/'
puts ARGV[0].scan(/^\d{10}$/).join
