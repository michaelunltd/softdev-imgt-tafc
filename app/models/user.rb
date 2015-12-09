class EmailValidator < ActiveModel::Validator
  def validate(record)
    unless record.email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[:email] << 'Need a valid email please!'
    end
  end
end

class User < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with EmailValidator
  has_many :clients

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }, presence: true, confirmation: true
  validates :email, uniqueness: true, presence: true

  attr_accessor :password
  before_save :encrypt_password

  attr_accessor :password

  def encrypt_password
    return false unless @password.present?
    self.password_salt = BCrypt::Engine.generate_salt
    self.password_hash = BCrypt::Engine.hash_secret(@password, password_salt)
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def update_info(params)
    attributes = params
    save
  end

  def self.search_employee(query)
    q = "%#{query}%"
    where("role = 'employee' AND first_name like ? or last_name like ?", q,q)
  end

  def name
    [first_name, last_name].join " "
  end
end
