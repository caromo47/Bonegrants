class Borrower < ActiveRecord::Base
	has_secure_password
	has_many :loans, dependent: :destroy
	has_many :lenders, :through => :loans, :source => :lender

	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, :loan_name, :loan_detail, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates_numericality_of :capital_needed, presence: true, minimum: { greater_than_or_equal_to: 500 }

	before_save :downcase_email

	private
		def downcase_email
				self.email.downcase!
		end
end
