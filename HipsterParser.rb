require "json"
require "open-uri"

def create_word_list(array)
  array.each do |word|
    word.delete! "."
    word.delete! ","
  end
  array.uniq! { |w| w.downcase }
end

def output(array)
  output = File.open("hipster_nonsense.yml", "w")
  output << array
  output.close
end

def parse_hipster_nonsense
  uri = "http://hipsterjesus.com/api/"
  param1 = "html=false"
  param2 = "paras=99"
  param3 = "type=hipster-centric"
  url = "#{uri}?#{param1}&#{param2}&#{param3}"

  buffer = open(url).read
  result = JSON.parse(buffer)["text"].split
  output(create_word_list(result))
end

parse_hipster_nonsense
