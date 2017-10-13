require_relative 'app'

file = ARGV[0]
contents = File.read(file)
puts WordFrequency.new(contents).top_words(10)
