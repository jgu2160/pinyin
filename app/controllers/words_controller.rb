class WordsController < ApplicationController
  def index
    @sentence = '2007年太平洋颶風季是每年一度全球熱帶氣旋產生週期的一部分。'
    @numeralized_sentence, @phrase_array = WordsHelper.numeralize_sentence(@sentence)
  end

  def show

  end
end
