require 'date'

d = Date.parse("20150101")

date_arr = []
i = 0;
while d <= Date.parse("20151231")
  date_arr << d
  d += 1
end
date_string_arr = []
date_arr.each do |date|
  date_string_arr << (date.year.to_s + date.mon.to_s + date.mday.to_s)
end

date_i_arr = []

date_i = 0


date_string_arr.each do |str|
  date_i = 0
  str.each_char do |c|
    date_i += c.to_i
  end
  date_i_arr << date_i
end

total_date_num = date_i_arr.inject(0) do |sum, n|
  sum += n
end


def day_value(num, date_arr)

  friday_arr = date_arr.select{|date| date.wday == num}

  friday_string_arr = []

  friday_arr.each do |date|
    friday_string_arr << (date.year.to_s + date.mon.to_s + date.mday.to_s)
  end

  friday_i_arr = []

  friday_i = 0

  friday_string_arr.each do |str|
    friday_i = 0
    str.each_char do |c|
      friday_i += c.to_i
    end
    friday_i_arr << friday_i
  end

  total_friday_num = friday_i_arr.inject(0) do |sum, n|
    sum += n
    # p sum
  end

  return total_friday_num
end
week_values = (0..6).map do |num|
  day_value(num, date_arr)
end

weekdays = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
output_days = weekdays.zip(week_values)
output_days.each do |output|
  puts "Total number in "+output[0].to_s+": "+output[1].to_s
end
puts "Total number in 2015:" + total_date_num.to_s
