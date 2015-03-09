module WordsHelper
  class << self
    def numeralize_sentence(sentence)
      char_array = sentence.chars
      numeralized_array = []
      phrase_array = []
      k = 0
      while k < char_array.length
        if char_array[k][/\d|。|，/]
          numeralized_array << 1
          k += 1
        else
          search_result = nil
          j = k + 6
          until search_result
            search_chars = char_array[k..j].join
            search_result = Word.find_by_simplified(search_chars) || Word.find_by_traditional(search_chars)
            j -= 1
          end
          count = search_result.char_count
          numeralized_array << count
          phrase_array << search_result
          k += count
        end
      end
      return numeralized_array, phrase_array
    end

  end
end
