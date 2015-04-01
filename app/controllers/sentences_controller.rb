class SentencesController < ApplicationController
  def index
    #sentence = '求学无坦途。'
    sentence = '我读书奉行九个字，就是“读书好，好读书，读好书”。'
    #sentence = '忍耐是一种美德。'
    numeralized_array, simplified_array, word_array, pinyin_array, def_tracking_array = WordsHelper.numeralize_sentence(sentence)
    #pinyin = ["Rěn", "nài ", "shì ", "yì", "zhǒng ", "měi", "dé", "。"]
    englishTrans = "Patience is a virtue."
    #chinese = ["忍","耐","是","一","种","美","德","。"]
    #charsPerPhrase = [2, 1, 1, 2, 1, 2, 1, 1]
    @payload = { chinese: simplified_array, pinyin: pinyin_array, englishTrans: englishTrans, charsPerPhrase: numeralized_array }.to_json
  end
end
