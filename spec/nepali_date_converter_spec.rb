require "spec_helper"

describe NepaliDateConverter do
  it "has a version number" do
    expect(NepaliDateConverter::VERSION).not_to be nil
  end

  context '.to_bs' do
    it { expect(NepaliDateConverter::Convert.to_bs(2017, 1, 6)).to eq({year: 2073, month: 9, date: 22, day: 'Friday', nepali_month: 'Poush', num_day: 6}) }
  end

  context '.to_ad' do
    it { expect(NepaliDateConverter::Convert.to_ad(2073, 9, 22)).to eq({year: 2017, month: 1, date: 6, day: 'Friday', english_month: 'January', num_day: 6})}
  end
end
