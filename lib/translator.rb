# require modules here
require "yaml"
require "pp"

def load_library(load_yaml)
  # code goes here
loading = YAML.load_file(load_yaml)
result = Hash.new
a = Hash[loading.collect{|key,value| [value.last, key]}]
b = Hash[loading.collect{|key,value| [value.first, value.last]}]
result[:get_meaning] = a
result[:get_emoticon] = b
result
end

def get_japanese_emoticon(load_yaml, emoticon)
  # code goes here
  result = load_library(load_yaml)
  translate_answer = "Sorry, that emoticon was not found"
    result.each do |key, value|
      if result[key].include?(emoticon) == true
        translate_answer = result[key][emoticon]
        else
          translate_answer
        end
  end
  return translate_answer
end

def get_english_meaning(load_yaml, emoticon)
  # code goes here
  # result = load_library(load_yaml)
  # translate_answer = "Sorry, that emoticon was not found"
  #   result.each do |key, value|
  #     if result[key].has_key?(emoticon) == true
  #       translate_answer = result[key][emoticon]
  #       else
  #         translate_answer
  #       end
  # end
  # return translate_answer
   get_japanese_emoticon(load_yaml, emoticon)
end
