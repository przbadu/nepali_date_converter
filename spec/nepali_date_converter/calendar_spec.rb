require 'spec_helper'

RSpec.describe NepaliDateConverter::Calendar do
  context '.get_day_of_week' do
    it { expect(described_class.get_day_of_week(1)).to eq('Sunday') }
    it { expect(described_class.get_day_of_week(2)).to eq('Monday') }
    it { expect(described_class.get_day_of_week(5)).to eq('Thursday') }
    it { expect(described_class.get_day_of_week(7)).to eq('Saturday') }
  end

  context '.get_english_month' do
    it { expect(described_class.get_english_month(1)).to eq('January') }
    it { expect(described_class.get_english_month(2)).to eq('February') }
    it { expect(described_class.get_english_month(5)).to eq('May') }
    it { expect(described_class.get_english_month(6)).to eq('June')}
    it { expect(described_class.get_english_month(11)).to eq('November')}
    it { expect(described_class.get_english_month(12)).to eq('December')}
  end

  context '.get_nepali_month' do
    it { expect(described_class.get_nepali_month(1)).to eq('Baishakh')}
    it { expect(described_class.get_nepali_month(2)).to eq('Jestha')}
    it { expect(described_class.get_nepali_month(3)).to eq('Ashad')}
    it { expect(described_class.get_nepali_month(4)).to eq('Shrawan')}
    it { expect(described_class.get_nepali_month(5)).to eq('Bhadra')}
    it { expect(described_class.get_nepali_month(6)).to eq('Ashwin')}
    it { expect(described_class.get_nepali_month(7)).to eq('Kartik')}
    it { expect(described_class.get_nepali_month(8)).to eq('Mangshir')}
    it { expect(described_class.get_nepali_month(9)).to eq('Poush')}
    it { expect(described_class.get_nepali_month(10)).to eq('Magh')}
    it { expect(described_class.get_nepali_month(11)).to eq('Falgun')}
    it { expect(described_class.get_nepali_month(12)).to eq('Chaitra')}
  end
  
  context '.get_nepali_month in devanagri' do
    it { expect(described_class.get_nepali_month(1, devanagari: true)).to eq('बैशाख')}
    it { expect(described_class.get_nepali_month(2, devanagari: true)).to eq('जेठ')}
    it { expect(described_class.get_nepali_month(3, devanagari: true)).to eq('असार')}
    it { expect(described_class.get_nepali_month(4, devanagari: true)).to eq('श्रावण')}
    it { expect(described_class.get_nepali_month(5, devanagari: true)).to eq('भदौ')}
    it { expect(described_class.get_nepali_month(6, devanagari: true)).to eq('आश्विन')}
    it { expect(described_class.get_nepali_month(7, devanagari: true)).to eq('कार्तिक')}
    it { expect(described_class.get_nepali_month(8, devanagari: true)).to eq('मंसिर')}
    it { expect(described_class.get_nepali_month(9, devanagari: true)).to eq('पुष')}
    it { expect(described_class.get_nepali_month(10, devanagari: true)).to eq('माघ')}
    it { expect(described_class.get_nepali_month(11, devanagari: true)).to eq('फाल्गुन')}
    it { expect(described_class.get_nepali_month(12, devanagari: true)).to eq('चैत्र')}
  end

  context '.valid_english_date?' do
    it { expect { described_class.valid_english_date?(1943, 1, 1)}.
         to raise_error('Supported only between 1944-2033')}

    (1944..2022).each do |year|
      it { expect(described_class.valid_english_date?(year, 1, 1)).to be_truthy}
    end

    (1..12).each do |month|
      it { expect(described_class.valid_english_date?(2000, month, 1)).to be_truthy}
    end

    (1..31).each do |day|
      it { expect(described_class.valid_english_date?(2000, 1, day)).to be_truthy}
    end
    it { expect {described_class.valid_english_date?(2000, 13, 1)}.to raise_error('Invalid month range')}
    it { expect {described_class.valid_english_date?(2000, 1, 33)}.to raise_error('Invalid day range')}
  end

  context '.valid_nepali_date?' do
    (2000..2089).each do |year|
      it {expect(described_class.valid_nepali_date?(year, 1, 1)).to be_truthy}
    end

    (1..12).each do |month|
      it {expect(described_class.valid_nepali_date?(2022, month, 1)).to be_truthy}
    end

    (1..32).each do |day|
      it {expect(described_class.valid_nepali_date?(2022, 1, day)).to be_truthy}
    end

    it {expect{described_class.valid_nepali_date?(2091, 1, 1)}.to raise_error('Supported only between 2000-2089')}
    it {expect{described_class.valid_nepali_date?(2022, 13, 1)}.to raise_error('Invalid month range')}
    it {expect{described_class.valid_nepali_date?(2022, 1, 33)}.to raise_error('Invalid day range')}
  end
end
