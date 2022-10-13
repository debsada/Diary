class Diary 
    def initialize 
        @entries = []
        @words = 0
    end 

    def add(entry)
        @entries << entry
    end

    def all
        return @entries
    end

    def count_words
        @entries.each do |entry|  
            @words += entry.count_words 
        end

        return @words
    end

    def reading_time(wpm)
        if @words <= wpm 
            return wpm 
        else 
            return (@words / wpm.to_f).ceil
        end 
    end

    def find_best_entry_for_reading_time(wpm, minutes)
        words_to_read = wpm * minutes
        current_words = 0
        most_accurate_entry = nil
        @entries.each do |entry|
            if entry.count_words == words_to_read
                return entry
            elsif entry.count_words < words_to_read && entry.count_words > current_words
                current_words = entry.count_words
                most_accurate_entry = entry
            end
        end
       return most_accurate_entry

    end
end

