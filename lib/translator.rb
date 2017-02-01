require 'yaml'
require 'pry'

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  emoticon_list = {}
  emoticon_list["get_meaning"] = {}
  emoticon_list["get_emoticon"] = {}

  emoticons.each do |word, emojis|
    emoticon_list["get_meaning"][emojis[1]] = word
    emoticon_list["get_emoticon"][emojis[0]] = emojis[1]
  end
  emoticon_list
  return emoticon_list
end

def get_japanese_emoticon(file_path, emoji)
  emoticon_list = load_library(file_path)

  if emoticon_list["get_emoticon"].include?(emoji)
    return emoticon_list["get_emoticon"][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoji)
  emoticon_list = load_library(file_path)

  if emoticon_list["get_meaning"].include?(emoji)
    return emoticon_list["get_meaning"][emoji]
  else
    return "Sorry, that emoticon was not found"
  end
end
