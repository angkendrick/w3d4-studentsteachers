class EmailValidation < ActiveModel::Validator
  def validate(record)# record is a constant
    unless /^(\w*@\w*..*\w{2,})$/ =~ record.email
      record.errors[:email] << 'email invalid'
    end
  end
end

class ToddlerValidation < ActiveModel::Validator
  def validate(record)
    now = Date.today
    unless (record.birthday.year - (now.year - 3) < 0)
      record.errors[:birthday] << 'toddler problem'
    end 
  end
end

class Student < ActiveRecord::Base
  # implement your Student model here
  has_and_belongs_to_many :teachers #plural bec to many
  include ActiveModel::Validations
  validates_with EmailValidation
  validates_with ToddlerValidation
  validates :email, uniqueness: true

  attr_accessor :first_name, :last_name, :birthday

  def name
    "#{@first_name} #{@last_name}"
  end

  def age
    now = Date.today
    now.year - @birthday.year - ((now.month > @birthday.month || (now.month == @birthday.month && now.day >= @birthday.day)) ? 0 : 1)
  end

end


