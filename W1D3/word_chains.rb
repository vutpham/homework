class WordChainer

  def initialize(dictionary_filename)
    @dictionary = File.readlines(dictionary_filename).map(&:chomp)
  end

  def adjacent_words(word)
    @dictionary.
  end

end

if __FILE__ == $PROGRAM_NAME
  new_game = WordChainer.new('dictionary.txt')
end
