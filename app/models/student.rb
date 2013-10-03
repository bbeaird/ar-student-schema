require_relative '../../db/config'

class Student < ActiveRecord::Base
  validates :email, :uniqueness => true
  validates :email, :format => { :with => /\w+@\w+.\w{2,}/}
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  :phone.to_s.gsub!(/\D/, '')
  validates :phone, :format => { :with => /(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?/ }

  def name
    "#{first_name} #{last_name}"
  end

  def age
    Time.now.year - birthday.year
  end
end


