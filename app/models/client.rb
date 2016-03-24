class Client < ActiveRecord::Base
  belongs_to :user
  has_many :transactions
  has_many :other_processing_fees, through: :transactions, class_name: "Service"
  validates :email, presence: false, email: true
  validates :company_name, presence: true
  validates :owner, presence: true
  validates :address, presence: true
  validates :tel_num, presence: true
  validates :tin_num, presence: true, tin_num: true

  def self.search(query)
    where('company_name like ?', "%#{query}%")
  end

  def user_email
    user.email
  end

  def total_balance_of_transaction
    transactions.inject(0) {|sum, transaction| sum + transaction.total_balance}
  end

  def user_name
    user.name
  end

  def services
    hash_result = {}

    transactions.each do |transaction|
      transaction.service_names.each do |service|
        if hash_result[service]
          hash_result[service] += 1
        else
          hash_result[service] = 1
        end
      end
    end

    hash_result
  end
end
