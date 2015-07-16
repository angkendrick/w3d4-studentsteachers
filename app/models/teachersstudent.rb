class StudentsTeacher < ActiveRecord::Base #reference schema.rb ar adds s at the end
  belongs_to :teacher #singular bec belongs_to
  belongs_to :student

end