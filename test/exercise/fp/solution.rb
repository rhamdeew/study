module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(arr)
        rates = []
        arr.each do |i|
          next if i['country'].nil? || i['rating_kinopoisk'].nil?

          if i['country'].split(',').count > 1 && i['rating_kinopoisk'].to_f > 0
            rates.push(i['rating_kinopoisk'].to_f)
          end
        end
        rates.reduce(:+) / rates.length
      end

      def chars_count(films, threshold)
        letters_count = 0
        films.each do |i|
          next if i['rating_kinopoisk'].to_f < threshold

          i['name'].split('').each do |c|
            letters_count += 1 if c == 'и'
          end
        end
        letters_count
      end
    end
  end
end
