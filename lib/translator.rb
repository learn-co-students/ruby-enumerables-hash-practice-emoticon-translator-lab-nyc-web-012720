# require modules here
require "yaml"



def load_library(library)
  # code goes here
  library = YAML.load_file("./lib/emoticons.yml")
  returned_hash = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  library.each do |key, value|
    english = value[0]
    japan = value[1]
    returned_hash["get_meaning"][japan] = key
    returned_hash["get_emoticon"][english] = japan
  end
  returned_hash
end


def get_japanese_emoticon(file, emoticon)
  lib = load_library(file)
  sorry_message = "Sorry, that emoticon was not found"
  if lib["get_emoticon"][emoticon] == nil
    sorry_message
  else
    lib["get_emoticon"][emoticon]
  end
end

def get_english_meaning(file, emoticon)
  lib = load_library(file)
  sorry_message = "Sorry, that emoticon was not found"
  if lib["get_meaning"][emoticon] == nil
    sorry_message
  else
    lib["get_meaning"][emoticon]
  end
end
