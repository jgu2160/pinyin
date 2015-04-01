class Word < ActiveRecord::Base
  def toned_pinyin
    numbered_pinyin = self.pronunciation
    PinyinToneConverter.number_to_utf8(numbered_pinyin)
  end

  def char_count
    self.simplified.length
  end
end
