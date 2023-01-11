#!/usr/bin/env ruby
puts "Type in your port (default 4567) or enter for default\n make sure to run script as sudo"
portnumber = gets
if portnumber == "\n"
	port = ARGV.first || 4567
else
	clean_input = portnumber.chomp.to_i
	port = ARGV.first || clean_input
end
system("sudo echo kill server on #{port}")

pid = `sudo lsof -iTCP -sTCP:LISTEN -n -P | grep #{port} | awk '{ print $2 }' | head -n 1`.strip
`kill -9 #{pid}` unless pid.empty?
