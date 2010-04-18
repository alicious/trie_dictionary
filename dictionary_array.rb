class Dictionary

	def initialize
		@words = []	
	end

	def words
		@words
	end

	def add (word)
		@words << word
	end

	def include? (word)
		@words.include? (word)
	end

	def find (prefix)
		@words.find_all {|word| word.include? (prefix) } 
	end
end
