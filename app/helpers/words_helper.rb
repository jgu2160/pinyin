module WordsHelper
  class << self
    def numeralize_sentence(sentence)
      char_array = sentence.chars
      numeralized_array = []
      simplified_array = []
      word_array = []
      def_tracking_array = []
      dta_size = 0
      k = 0
      while k < char_array.length
        if char_array[k][regex]
          numeralized_array << 1
          simplified_array << char_array[k]
          def_tracking_array << nil
          k += 1
        else
          search_result = nil
          j = k + 6
          until search_result
            search_chars = char_array[k..j].join
            search_result = Word.find_by_simplified(search_chars) || Word.find_by_traditional(search_chars)
            j -= 1
          end
          if search_chars.length == 1 && search_result.definitions[/surname/]
            multiples = Word.where(simplified: search_chars)
            if multiples.length > 1
              search_result = multiples.second
            end
          end
          count = search_result.char_count
          numeralized_array << count
          simplified_array << search_result.simplified
          word_array << search_result
          def_tracking_array << Array.new(count, dta_size)
          dta_size += 1
          k += count
        end
      end
      numeralized_array = numeralized_array.each_with_index do |x, index|
        if x > 1
          numeralized_array[index] = (1..x).to_a.reverse
        end
      end.flatten
      return numeralized_array, simplified_array, word_array, def_tracking_array.flatten
    end

    def regex
      /\d|。|，|“|”/
    end
  end
end
