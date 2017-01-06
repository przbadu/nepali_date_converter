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
    it { expect(described_class.get_nepali_month(3)).to eq('Asar')}
    it { expect(described_class.get_nepali_month(4)).to eq('Shrawan')}
    it { expect(described_class.get_nepali_month(5)).to eq('Bhadra')}
    it { expect(described_class.get_nepali_month(6)).to eq('Aswin')}
    it { expect(described_class.get_nepali_month(7)).to eq('Kartik')}
    it { expect(described_class.get_nepali_month(8)).to eq('Mansir')}
    it { expect(described_class.get_nepali_month(9)).to eq('Poush')}
    it { expect(described_class.get_nepali_month(10)).to eq('Magh')}
    it { expect(described_class.get_nepali_month(11)).to eq('Falgun')}
    it { expect(described_class.get_nepali_month(12)).to eq('Chaitra')}
  end
end
