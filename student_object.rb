class Student
  attr_reader :profile_url, :name   

  @@students = [] #array of objects

  def initialize(name, profile_url)
    @name = name
    @profile_url = profile_url
    @@students << self
  end

  def self.list_of_students
    @@students.each do |student|
      yield(student.name)
    end
  end

  def self.array_of_students
    @@students #array of objects

  end           

  ###############
  #Social media
  #3. linked in profile
  #5. github
  #6. twitter
  #7. treehouse
  #8. coderwall
  #9. Codeschool
  #10 codeacademy
  #11 blog

  ###############
  #1. tagline ("textwidget")
  #2. bio
  #3. education
  #4. work history


  ###############
  #favorites
end

