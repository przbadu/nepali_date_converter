require 'nepali_date_converter/version'
require 'nepali_date_converter/calendar'

module NepaliDateConverter
  class Convert
    
    def self.to_bs(yy, mm, dd)
      valid = NepaliDateConverter::Calendar.valid_english_date?(yy, mm, dd)
      if valid
        # Month data
        months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        # Months for leap year
        leap_months = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        english_year = 1944 # initial english date
        nepali_year = 2000 # initial nepali year
        nepali_month = 9 # initial nepali month
        nepali_day = 17 - 1 # initial nepali daynames
        total_english_days = 0
        day = 7 - 1

        # Count total no. of days in terms of year
        (yy - english_year).times do |i|
          # for english month calculation
          if NepaliDateConverter::Calendar.is_leap_year?(english_year + i)
            12.times do |j|
              total_english_days += leap_months[j]
            end
          else
            12.times do |j|
              total_english_days += months[j]
            end
          end
        end

        # Count total no. of days in terms of month
        (mm - 1).times do |i|
          if NepaliDateConverter::Calendar.is_leap_year?(yy)
            total_english_days += leap_months[i]
          else
            total_english_days += month[i]
          end
        end

        # Count total no. of days in terms of date
        total_english_days += dd

        i = 0
        j = nepali_month
        total_nepali_days = nepali_day
        m = nepali_month
        y = nepali_year

        # Count nepali date from array
        while total_english_days != 0
          a = NepaliDateConverter::Calendar::BS_CALENDAR[i][j]
          total_nepali_days += 1 # count the days
          day += 1 # count the days interms of 7 days

          if total_nepali_days > a
            m += 1
            total_nepali_days = 1
            j += 1
          end

          day = 1 if day > 7

          if m > 12
            y += 1
            m = 1
          end

          if j > 12
            j = 1
            i += 1
          end

          total_english_days -= 1
        end

        num_day = day

        {
          year: y,
            month: m,
            date: total_nepali_days,
            day: NepaliDateConverter::Calendar.get_day_of_week(day),
            nepali_month: NepaliDateConverter::Calendar.get_nepali_month(m),
            num_day: num_day
        }
      end
    end

    # right now only calculate the date between BS (2000-2089)
    # 
    def self.to_ad(yy, mm, dd)
      # Initial english date
      english_year = 1943
      english_month = 4
      english_day = 14 - 1
      # initial equivalent nepali date
      nepali_year = 2000
      # calculation part
      total_nepali_days = 0
      day = 4 - 1
      k = 0

      month_format = [0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
      leap_month_format = [0, 31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

      if NepaliDateConverter::Calendar.valid_nepali_date?(yy, mm, dd)
        # Count total days in terms of year
        (yy - nepali_year).times do
          12.times { |j| total_nepali_days += NepaliDateConverter::Calendar::BS_CALENDAR[k][j+1] }
          k += 1
        end

        # Count total days in terms of month
        mm.times {|j| total_nepali_days += NepaliDateConverter::Calendar::BS_CALENDAR[k][j+1] }

        # count total days in terms of day
        total_nepali_days += dd

        # calculate equivalent english datetotal_english_days
        total_english_days = english_day
        m = english_month
        y = english_year

        while total_nepali_days != 0
          if NepaliDateConverter::Calendar.is_leap_year?(y)
            a = leap_month_format[m]
          else
            a = month_format[m]
          end

          total_english_days += 1
          day += 1

          if total_english_days > a
            m += 1
            total_english_days = 1
            if m > 12
              y += 1
              m = 1
            end
          end

          day = 1 if day > 7

          total_nepali_days -= 1
        end

        num_day = day

        {
          year: y,
            month: m,
            date: total_english_days,
            day: NepaliDateConverter::Calendar.get_day_of_week(day),
            nmonth: NepaliDateConverter::Calendar.get_english_month(m),
            num_day: num_day
        }
      end
    end
  end
end
