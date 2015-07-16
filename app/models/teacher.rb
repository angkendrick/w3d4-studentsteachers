class Teacher < ActiveRecord::Base
  has_and_belongs_to_many :students #plural bec to many

  validates :email, uniqueness: true

end