class Author < ApplicationRecord
  has_secure_password
  validates_presence_of   :email
  validates_format_of :email, with: /\b[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/, on: :create
  validates_uniqueness_of :email, case_sensitive: false
  before_save { self.email = email.downcase }
  has_many :likes
  has_many :post
  has_many :comments
  has_one_attached :avatar
  PASSWORD_RULES = /\A
    (?=.{8,255})
    (?=.*\d)
    (?=.*[a-z])
    (?=.*[A-Z])
  /x.freeze
  validates :password, format: { with: PASSWORD_RULES }, on: :create
  def display_author
    "#{first_name} #{last_name}"
  end
end
