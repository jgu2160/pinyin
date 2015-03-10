class WordsController < ApplicationController
  def index
    #@sentence = '2007年太平洋颶風季是每年一度全球熱帶氣旋產生週期的一部分。'
    #@sentence = '提康德羅加號航空母艦是一艘隸屬於美國海軍的航空母艦，為艾塞克斯級航空母艦的六號艦。'
    @sentence = '我读书奉行九个字，就是“读书好，好读书，读好书”。'
    @numeralized_array, @simplified_array, @definition_array, @def_tracking_array = WordsHelper.numeralize_sentence(@sentence)
  end

  def show

  end
end
