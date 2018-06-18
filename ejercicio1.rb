class Table
  attr_reader :table, :day1, :day2, :day3, :day4, :total, :average
  def initialize(table, day1, day2, day3, day4)
    @table = table
    @day1 = day1.to_i
    @day2 = day2.to_i
    @day3 = day3.to_i
    @day4 = day4.to_i
    @total = @day1 + @day2 + @day3 + @day4
    @average = @total/4.0
  end
end

def open_file(filename)
  file = File.open(filename.to_s, 'r')
  data = file.readlines.map(&:chomp)
  file.close
  data
end

def max_value_per_day(array)
  tables = []
  array.each do |line|
    ls = line.split(', ')
    tables << Table.new(*ls)
  end
  ## Ver como refactorizar
  max1 = tables.max_by(&:day1)
  max2 = tables.max_by(&:day2)
  max3 = tables.max_by(&:day3)
  max4 = tables.max_by(&:day4)
  puts "Mayor recaudación del dia 1: #{max1.table} con #{max1.day1}"
  puts "Mayor recaudación del dia 2: #{max2.table} con #{max2.day1}"
  puts "Mayor recaudación del dia 3: #{max3.table} con #{max3.day1}"
  puts "Mayor recaudación del dia 4: #{max4.table} con #{max4.day1}"
end

def average_per_day(array)
  tables = []
  array.each do |line|
    ls = line.split(', ')
    tables << Table.new(*ls)
  end
  average = tables.inject(0) { |sum, table| sum + table.average } / tables.length
  puts 'El promedio total por todas las mesas:'
  puts average
end

# day1 = tables.inject(0) { |sum, table| sum + table.day1 }
# day2 = tables.inject(0) { |sum, table| sum + table.day2 }
# day3 = tables.inject(0) { |sum, table| sum + table.day3 }
# day4 = tables.inject(0) { |sum, table| sum + table.day4 }

max_value_per_day(open_file('./E9CP2A1/casino.txt'))
average_per_day(open_file('./E9CP2A1/casino.txt'))
