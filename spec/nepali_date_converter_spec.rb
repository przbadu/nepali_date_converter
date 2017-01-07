require 'spec_helper'

describe NepaliDateConverter do
  it 'has a version number' do
    expect(NepaliDateConverter::VERSION).not_to be nil
  end

  context '.to_bs' do
    it { expect(to_bs(2017, 1, 1)).to eq({year: 2073, month: 9, date: 17, day: 'Sunday', nepali_month: 'Poush', num_day: 1}) }
    it { expect(to_bs(2017, 1, 2)).to eq({year: 2073, month: 9, date: 18, day: 'Monday', nepali_month: 'Poush', num_day: 2}) }
    it { expect(to_bs(2017, 1, 3)).to eq({year: 2073, month: 9, date: 19, day: 'Tuesday', nepali_month: 'Poush', num_day: 3}) }
    it { expect(to_bs(2017, 1, 4)).to eq({year: 2073, month: 9, date: 20, day: 'Wednesday', nepali_month: 'Poush', num_day: 4}) }
    it { expect(to_bs(2017, 1, 5)).to eq({year: 2073, month: 9, date: 21, day: 'Thursday', nepali_month: 'Poush', num_day: 5}) }
    it { expect(to_bs(2017, 1, 6)).to eq({year: 2073, month: 9, date: 22, day: 'Friday', nepali_month: 'Poush', num_day: 6}) }
    it { expect(to_bs(2017, 1, 7)).to eq({year: 2073, month: 9, date: 23, day: 'Saturday', nepali_month: 'Poush', num_day: 7}) }

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

      it { expect(to_bs(english[0], english[1], english[1])).to eq(expected)}
    end
  end

  context '.to_ad manually' do
    it { expect(to_ad(2073, 9, 22)).to eq({year: 2017, month: 1, date: 6, day: 'Friday', english_month: 'January', num_day: 6})}
  end
end


def to_bs(yy, mm, dd)
  NepaliDateConverter::Convert.to_bs(yy, mm, dd)
end

def to_ad(yy, mm, dd)
  NepaliDateConverter::Convert.to_ad(yy, mm, dd)
end
