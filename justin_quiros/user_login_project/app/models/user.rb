class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :email, :age, presence: true
	validates :first_name, :last_name, length: { in: 2..50 }
	validates_numericality_of :age, greater_than: 10
	validates_numericality_of :age, less_than: 150
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }, length: { in: 4..40 }
end