require "diary_entry_2.rb"

RSpec.describe DiaryEntry do
    it "counts the words of the entry" do 
        entry = DiaryEntry.new("my_title", "my contents")
        results = entry.count_words
        expect(results).to eq 2
    end

    context "when given wpm time"
    it "returns how much the reader can read in that time" do 
        entry = DiaryEntry.new("my_title", "my contents are great")
        entry.count_words
        results = entry.reading_time(1)
        expect(results).to eq 4
    end
end