class SentencesController < ApplicationController
  def index
    default_sentence = '我读书奉行九个字，就是“读书好，好读书，读好书”。'
    sentence = session[:sentence] || default_sentence
    session.clear
    numeralized_array, simplified_array, word_array, pinyin_array, def_tracking_array = WordsHelper.make_sentence(sentence)
    englishTrans = "Patience is a virtue."
    @payload = {  charsPerPhrase: numeralized_array,
                  chinese: simplified_array,
                  wordArray: word_array,
                  pinyin: pinyin_array,
                  defTrackingArray: def_tracking_array,
                  englishTrans: englishTrans }.to_json
    translator = BingTranslator.new(Figaro.env.bing_id, Figaro.env.bing_secret)
    @trans_chinese = simplified_array.join
    @chinese = translator.translate(@trans_chinese, :from => 'zh-CHS', :to => 'en')
  end

  def create
    session[:sentence] = sentence_params[:words]
    redirect_to sentences_path
  end

  def sentence_params
    params.require(:sentence).permit(:words)
  end
end
