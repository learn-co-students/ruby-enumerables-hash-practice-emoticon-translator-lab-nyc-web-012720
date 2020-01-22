require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  outer_hash = {}
  meaning_hash = {}
  emo_hash = {}
  emoticons.each_pair do |meaning, (english, japanese)| 
    outer_hash = {"get_meaning" => meaning_hash,"get_emoticon" => emo_hash}
    meaning_hash[japanese] = meaning
    emo_hash[english] = japanese
  end 
  outer_hash
end

def get_japanese_emoticon(file, emoticon)
  outer_hash = load_library(file)
  outer_hash["get_emoticon"].each_pair do |key, val|
    if key == emoticon
      return outer_hash["get_emoticon"][key]
    end 
  end 
  "Sorry, that emoticon was not found"
end

def get_english_meaning(file, emoticon)
  outer_hash = load_library(file)
  outer_hash["get_meaning"].each_pair do |key, val|
    if key == emoticon 
      return outer_hash["get_meaning"][key]
    end 
  end 
  "Sorry, that emoticon was not found"
end