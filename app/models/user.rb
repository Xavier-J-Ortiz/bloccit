class User < ActiveRecord::Base
  before_save  do
    self.email = email.downcase if email.present?
    if name.present?
      split_name = name.split(' ')
      answer = []
      split_name.each do |word|
        answer.push(word.capitalize)
      end
      self.name = answer.join(' ')
    end
  end


  # #3
  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  # #4
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  # #5
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  # #6
  has_secure_password
end
