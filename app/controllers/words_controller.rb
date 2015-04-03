class WordsController < ApplicationController
  def index
    session.clear
    @sentence = '我读书奉行九个字，就是“读书好，好读书，读好书”。'
    @numeralized_array, @simplified_array, @word_array, @pinyin_array, @def_tracking_array = WordsHelper.make_sentence(@sentence)
  end

  def show
  end
end
