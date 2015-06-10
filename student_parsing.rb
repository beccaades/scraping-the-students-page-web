require_relative './student_object.rb'
require 'open-uri'
require 'nokogiri'
require 'pry'

html = open("http://web0615.students.flatironschool.com/")

doc = Nokogiri::HTML(html)


all_students_nokogiri = doc.css("div.big-comment h3 a")
#this gets us all the people 


all_students = all_students_nokogiri.collect do |student|
  name = student.children.to_s
  #this is how you get a person's name
  #name = doc.css("div.big-comment h3 a").children.first.content
  profile_url = student.first[1]
  #this is how you get a person's profile url
  #profile_url = doc.css("div.big-comment h3 a").attribute("href").value
  {name: name, profile_url: profile_url}
end

all_students.each do |person|
  Student.new(person[:name], person[:profile_url])
  #[{name: "Becca Ades", profile_url: "str..."},{name: "Mason Jennings", profile_url: "str..."}] 
end


