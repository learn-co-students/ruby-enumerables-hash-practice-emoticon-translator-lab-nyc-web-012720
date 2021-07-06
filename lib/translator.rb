require "yaml"
require 'pry'

def load_library(emoticons_file)
  emoticon_list = YAML.load_file(emoticons_file)
  new_hash = {"get_meaning": {}, "get_emoticon": {}}
  
  emoticon_list.each do |key, value| #japanese_emoticons = hash of arrays, key = key for each emoticon, value = english/japanese emoticon english at index 0, japanese at index 1
  #binding.pry
  new_hash[:get_meaning][value[1]] = key
  new_hash[:get_emoticon][value[0]] = emoticon_list[key][1]
  end 
  new_hash
end

def get_japanese_emoticon(emoticons_file, emoticon) #emoticon file = YAML emoticon = a english emoticon
    answer = load_library(emoticons_file)[:get_emoticon][emoticon] 
    answer ? answer : "Sorry, that emoticon was not found"
end

def get_english_meaning(emoticons_file, emoticon)
    answer = load_library(emoticons_file)[:get_meaning][emoticon]
    answer ? answer : "Sorry, that emoticon was not found"
end