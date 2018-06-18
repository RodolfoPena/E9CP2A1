## Ejercicio 2
require 'Date'
class Course
  attr_reader :name, :start_date, :end_date
  def initialize(name, start_date, end_date)
    @name = name
    @start_date = Date.parse(start_date)
    @end_date = Date.parse(end_date)
  end
end

def open_file(filename)
  file = File.open(filename.to_s, 'r')
  data = file.readlines.map(&:chomp)
  file.close
  data
end

def create_array_of_objects(array)
  new_data = []
  array.each do |line|
    ls = line.split(', ')
    new_data << Course.new(*ls)
  end
  new_data
end

filename = './E9CP2A1/courses.txt'
courses = create_array_of_objects(open_file(filename))

def courses_before(courses)
  date = Date.parse("2017-10-31")
  raise ArgumentError, 'Argument is more larger than 2018' unless date < Date.parse("2018-01-01")
  courses_available = courses.select { |course| course.start_date < date }
  puts "Cursos que comienzan antes del #{date}"
  courses_available.each do |course|
    puts course.name
  end
end

def courses_after(courses)
  date = Date.today
  raise ArgumentError, 'Argument is more larger than 2018' unless date < Date.parse("2018-01-01")
  courses_finished = courses.select { |course| course.end_date > date }
  puts "Cursos que finalizan despues del #{date}"
  courses_finished.each do |course|
    puts course.name
  end
end

courses_before(courses)
courses_after(courses)
