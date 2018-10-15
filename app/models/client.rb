class Client < ApplicationRecord
  has_many :bank_account
  belongs_to :bank

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :middle_name, presence: true
  validates :client_address, presence: true
  validates :client_number,presence: true, uniqueness: true
  validates :client_dob, presence: true

  before_save :format_name
  before_save :format_address
  before_save :number
  before_save :dob

  def format_name
    self.first_name = self.first_name.upcase
    self.last_name =self.last_name.upcase
    self.middle_name =self.middle_name.upcase

  end

  def format_address
    self.client_address =self.client_address.upcase
  end

  def number
    self.client_number =self.client_number
  end

  def dob
    self.client_dob =self.client_dob

  end
  def to_s
    "#{last_name},#{first_name} #{middle_name}"

  end

end
