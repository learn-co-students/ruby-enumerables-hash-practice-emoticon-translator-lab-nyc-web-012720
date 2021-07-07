require "yaml"
require "pry"
def load_library(file_path)
  result = YAML.load_file(file_path)
  
  #           "japanese_emoticon":"meaning"   "english_emoticon":japanese_emoticon
                # "☜(⌒▽⌒)☞" => "angel"        " O:)" => "☜(⌒▽⌒)☞"
  final_hash = { "get_meaning":{},              "get_emoticon":{} }
  
  result.each do |meaning ,emoticon|
          # binding.pry
                if final_hash[:get_meaning][emoticon[1]]== nil 
                  final_hash[:get_meaning][emoticon[1]] =  meaning
                end
              
                if final_hash[:get_emoticon][emoticon[0]] == nil 
                  final_hash[:get_emoticon][emoticon[0]] = emoticon[1]
                end 
  end 
  final_hash
end  

def get_japanese_emoticon(file_path, emoticon)
  # binding.pry
  sheet  = load_library(file_path) 
 
  result = sheet[:get_emoticon][emoticon]

  if result == nil 
      return "Sorry, that emoticon was not found"
  end
  
  return result            
end


def get_english_meaning(file_path, emoticon)
  sheet = load_library(file_path)
  result = sheet[:get_meaning][emoticon]
  
  if result == nil 
    return "Sorry, that emoticon was not found"
  end 
  
  return result

end
