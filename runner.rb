#!/usr/bin/env ruby
require_relative './student_parsing.rb'

def interface
  puts "Welcome to Flatiron Web-0615."
  user_input = nil

  while user_input != "exit"
    puts "Please enter a command:"
    puts "'list'      - list all students"
    puts "'open'      - open student profile-page"
    puts "'total'     - total number of student"
    puts "'show all'  - show class website"
    puts "'exit'      - exit the program"
    user_input = gets.strip.downcase 

    case user_input
      when "list"
        list
      when "open"
        open
      when "total"
        total
      when "show all"
        system("open http://web0615.students.flatironschool.com")
      when "exit"
        puts "Goodbye"
    end
  end
end

def list
  Student.list_of_students{|student| puts student}
end

def find_student_by_name(student_name)
  Student.array_of_students.find {|student| student.name.downcase == student_name}
end

def open
  puts "Please enter the name of the student you would like to view: (stalk much?)"
  user_input = gets.strip.downcase
  student_url = find_student_by_name(user_input).profile_url 
  url = "http://web0615.students.flatironschool.com/#{student_url}"
  system("open #{url}") 
end

def total
  puts "There are #{Student.array_of_students.length} students in the class."
end


#list program will:

#1. List all students
#2. Show student info
#3. Show number of students
#4. Open a student profile

interface