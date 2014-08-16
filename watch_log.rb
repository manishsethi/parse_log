#!/usr/bin/ruby
#require "Rubygems"

aFile = File.open("in.log", "r+")
#aFile.seek(0,IO:SEEK_END)
while true
     line = aFile.gets
      if line.include?("error") 
        puts "Found it! "
	
      else
	puts "Not found it"		 
      end
end
sleep 5
ruby input.rb

