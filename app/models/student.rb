class Student < ActiveRecord::Base
  # implement your Student model here
  has_and_belongs_to_many :teachers #plural bec to many

end
