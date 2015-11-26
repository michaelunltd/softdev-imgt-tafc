class User < ActiveRecord::Base

  has_many :clients

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 8 }

  attr_accessor :password
  before_save :encrypt_password

  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password
  validates_uniqueness_of :email
  validates_presence_of :email

  def encrypt_password
    if @password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(@password, password_salt)
    end
  end

  def self.authenticate(email, password)
    user = find_by(email: email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    end
  end

  def signed_in?
    first_name
  end

  def self.search(query)
    q = "%#{query}%"
    where("role = 'employee' AND first_name like ? or last_name like ?", q,q)
  end
end
