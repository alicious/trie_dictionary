require 'rubygems'
require 'ruby-prof'
require 'animal_names'

#type = ARGV[0]
#type = "trie" if type.nil?
#file_name = "#{type}_dictionary"
#puts "Performance test for: #{file_name}.rb"
#require file_name
require "dictionary"

add_result = RubyProf.profile do
d = Dictionary.new
	$animal_names.each do |name|
	  d.add(name)
	end
end

# Profile the code
find_result = RubyProf.profile do
  ('a'..'z').each do |chr|
     d.find(chr)
  end
             
end

# Print a graph profile to text
printer = RubyProf::FlatPrinter.new(add_result)
printer.print(STDOUT, 0)

printer = RubyProf::FlatPrinter.new(find_result)
printer.print(STDOUT, 0)
