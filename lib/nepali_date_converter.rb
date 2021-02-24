require 'nepali_date_converter/version'
require 'nepali_date_converter/calendar'

  module NepaliDateConverter
  class Convert

    def self.to_nepali(yy, mm, dd)
      if NepaliDateConverter::Calendar.valid_english_date?(yy, mm, dd)
        @yy, @mm, @dd = yy, mm, dd
        # english month data
        @month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        # leap year data
        @lmonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

        @def_eyy = 1944
        @def_nyy, @def_nmm, @def_ndd = 2000, 9, 17-1
        # nepali date...
        @total_eDays, @total_nDays, @a = 0, 0, 0
        @day = 7 - 1
        # initializations...
        @m, @y, @i, @j, @numDay = 0, 0, 0, 0

        # count total no. of days in-terms of year
        # total days for month
        (@yy-@def_eyy).times do |i|
          # calculation .... (english)
          if NepaliDateConverter::Calendar.is_leap_year?(@def_eyy + i)
            12.times do |j|
              @total_eDays += @lmonth[j]
            end
          else
            12.times do |j|
              @total_eDays += @month[j]
            end
          end
        end

        # count total no. of days in-terms of month
        (@mm-1).times do |i|
          if NepaliDateConverter::Calendar.is_leap_year?(@yy)
            @total_eDays += @lmonth[i]
          else
            @total_eDays += @month[i]
          end
        end

        # count total no. of days in-terms of date
        @total_eDays += @dd

        @j = @def_nmm
        @total_nDays = @def_ndd
        @m = @def_nmm
        @y = @def_nyy

        # count nepali date from array
        while @total_eDays != 0
          @a = NepaliDateConverter::Calendar::BS_CALENDAR[@i][@j]
          @total_nDays += 1   # count the days
          @day += 1           # count the days interms of 7 days
          if @total_nDays > @a
            @m += 1
            @total_nDays = 1
            @j += 1
          end

          @day = 1 if @day > 7

          if @m > 12
            @y += 1
            @m = 1
          end

          if @j > 12
            @j = 1
            @i += 1
          end

          @total_eDays -= 1
        end

        @numDay = @day

        {
          year: @y,
          month: @m,
          date: @total_nDays,
          day: NepaliDateConverter::Calendar.get_day_of_week(@day),
          nepali_month: NepaliDateConverter::Calendar.get_nepali_month(@m),
          week_day: @numDay
        }
      end
    end

    def self.to_english(yy, mm, dd)
      @yy, @mm, @dd = yy, mm, dd

      # initialize english date
      @def_eyy, @def_emm, @def_edd = 1943, 4, 14-1
      # equivalent nepali date
      @def_nyy, @def_nmm, @def_ndd = 2000, 1, 1
      # initialization
      @total_eDays, @total_nDays, @a = 0, 0, 0
      @day=4-1
      @m, @y, @i, @k, @numDay = 0, 0, 0, 0, 0

      @month = [0,31,28,31,30,31,30,31,31,30,31,30,31]
      @lmonth = [0,31,29,31,30,31,30,31,31,30,31,30,31]

      if NepaliDateConverter::Calendar.valid_nepali_date?(@yy, @mm, @dd)
        # count total days in-terms of year
        (@yy - @def_nyy).times do |i|
          for j in (1..12)
            @total_nDays += NepaliDateConverter::Calendar::BS_CALENDAR[@k][j]
          end
          @k += 1
        end

        # count total days in-terms of month
        for j in 1...@mm
          @total_nDays += NepaliDateConverter::Calendar::BS_CALENDAR[@k][j]
        end

        # count total days in-terms of date
        @total_nDays += @dd

        # calculation of equivalent english date...
        @total_eDays = @def_edd
        @m = @def_emm
        @y = @def_eyy

        while @total_nDays != 0
          if NepaliDateConverter::Calendar.is_leap_year?(@y)
            @a = @lmonth[@m]
          else
            @a = @month[@m]
          end

          @total_eDays += 1
          @day += 1

          if @total_eDays > @a
            @m += 1
            @total_eDays = 1

            if @m > 12
              @y += 1
              @m = 1
            end
          end

          if @day > 7
            @day = 1
          end

          @total_nDays -= 1
        end

        @numDay = @day

        {
          year: @y,
          month: @m,
          date: @total_eDays,
          day: NepaliDateConverter::Calendar.get_day_of_week(@day),
          english_month: NepaliDateConverter::Calendar.get_english_month(@m),
          week_day: @numDay
        }
      end
    end
    
    def self.to_english_date(yy, mm, dd)
      date_hash = self.to_english(yy, mm, dd)
      Date::strptime("#{date_hash[:year]}-#{date_hash[:month]}-#{date_hash[:date]}", "%Y-%m-%d")
    end

  end
end
