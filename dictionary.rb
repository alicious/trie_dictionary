class Dictionary

	def initialize
		@word_trie = {}
	end

	def words(subtree = @word_trie, word = "")
		result = []
		return [] if @word_trie.empty?
		return [word] if subtree.empty?
		subtree.each do |key, value|
			result += words(value, word + key)	
		end
		result
	end

	def add (word, subtree = @word_trie)
		return if word.empty?

		first = word[0,1]
		if subtree[first].nil?
			subtree[first] = {}
		end
		add(word[1..-1], subtree[first])
	end

	def include? (word, subtree = @word_trie)
		return true if word.empty?
		first = word[0,1]
		if subtree[first].nil?
			false
		else
			include?(word[1..-1], subtree[first])
		end
	end

	def find (orig_prefix, subtree = @word_trie, prefix = orig_prefix)
		return words if orig_prefix.empty?
		return words(subtree).map {|w| orig_prefix + w} if prefix[1..-1].nil?

		first = prefix[0,1]
		if subtree[first].nil?
			[]
		else 
			find(orig_prefix, subtree[first], prefix[1..-1])
		end
	end

end
