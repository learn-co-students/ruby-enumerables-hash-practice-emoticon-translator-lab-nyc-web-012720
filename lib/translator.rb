require "yaml"

def load_library(file)
  emoticons = YAML.load_file(file)
  hash = {"get_emoticon": {}, "get_meaning": {}}
  emoticons.each do |meaning, moti|
    hash[:get_meaning][moti[1]] = meaning
    hash[:get_emoticon][moti[0]] = moti[1]
  end
  return hash
end

def get_japanese_emoticon(file, emoticon)
  emoticons = load_library(file)
  if emoticons[:get_emoticon].keys.include?(emoticon)
    return emoticons[:get_emoticon][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  emoticons = load_library(file)
  if emoticons[:get_meaning].keys.include?(emoticon)
    return emoticons[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end