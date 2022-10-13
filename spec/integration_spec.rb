require "diary"
require "diary_entry_2"

RSpec.describe "integration" do 
    context "when an entry is added" do 
        it "returns a list of the entries" do 
            diary = Diary.new
            entry = DiaryEntry.new("my_title", "my_contents")
            diary.add(entry)
            expect(diary.all).to eq [entry]
        end
    end

    context "when call count_words" do 
        it "gives number of all words in all entries" do 
            diary = Diary.new
            entry_1 = DiaryEntry.new("my title1", "my contents1")
            entry_2 = DiaryEntry.new("my title2", "my contents2")
            diary.add(entry_1)
            diary.add(entry_2)
            expect(diary.count_words).to eq 4
        end
    end

    context "when call reading_time" do 
        it "gives the estimated reading time for words of all the entries" do 
            diary = Diary.new
            entry_1 = DiaryEntry.new("my title1", "my contents1")
            entry_2 = DiaryEntry.new("my title2", "my contents2")
            diary.add(entry_1)
            diary.add(entry_2)
            diary.count_words
            expect(diary.reading_time(1)).to eq 4
        end
    end

    context "when find_best_entry_for_reading_time is called" do
        it "gives entry with closest reading time" do
            diary = Diary.new
            entry_1 = DiaryEntry.new("my title1", "This is my contents")
            entry_2 = DiaryEntry.new("my title2", "This is my contents plus two")
            entry_3 = DiaryEntry.new("my title3", "This is my content plus plus three")
            diary.add(entry_1)
            diary.add(entry_2)
            diary.add(entry_3)
            results = diary.find_best_entry_for_reading_time(1, 2)
            expect(results).to eq nil
        end
    end

end
