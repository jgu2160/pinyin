class SentencesController < ApplicationController
  def index
    chinese = ["忍","耐","是","一","种","美","德","。"]
    pinyin = ["Rěn", "nài ", "shì ", "yì", "zhǒng ", "měi", "dé", "."]
    englishTrans = "Patience is a virtue."
    charsPerPhrase = [2, 1, 1, 2, 1, 2, 1, 1]
    @payload = { chinese: chinese, pinyin: pinyin, englishTrans: englishTrans, charsPerPhrase: charsPerPhrase }.to_json
  end
end
