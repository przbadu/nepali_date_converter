require 'spec_helper'

describe NepaliDateConverter do
  it 'has a version number' do
    expect(NepaliDateConverter::VERSION).not_to be nil
  end

  context '.to_nepali' do
    Seed::DATA.each do |data|
      nepali, english = data[:nepali], data[:english]
      expected = {
          year: nepali[0],
          month: nepali[1],
          date: nepali[2],
          day: nepali[3],
          nepali_month: nepali[4],
          week_day: nepali[5]
      }

      it { expect(to_bs(english[0], english[1], english[2])).to eq(expected)}
    end
  end
  
  context '.to_nepali devanagari' do
    Seed::NEPALI_DATA.each do |data|
      nepali, english = data[:nepali], data[:english]
      expected = {
          year: nepali[0],
          month: nepali[1],
          date: nepali[2],
          day: nepali[3],
          nepali_month: nepali[4],
          week_day: nepali[5]
      }

      it { expect(to_bs(english[0], english[1], english[2], devanagari: true)).to eq(expected)}
    end
  end

  context '.to_english' do
    Seed::DATA.each do |data|
      nepali, english = data[:nepali], data[:english]
      expected = {
        year: english[0],
        month: english[1],
        date: english[2],
        day: english[3],
        english_month: english[4],
        week_day: english[5]
      }

      it { expect(to_ad(nepali[0], nepali[1], nepali[2])).to eq(expected) }
    end
  end
end


def to_bs(yy, mm, dd, devanagari: false)
  NepaliDateConverter::Convert.to_nepali(yy, mm, dd, devanagari: devanagari)
end

def to_ad(yy, mm, dd)
  NepaliDateConverter::Convert.to_english(yy, mm, dd)
end
