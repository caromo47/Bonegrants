class BorrowersController < ApplicationController
	before_action :authorize, except: [:new, :create]
	
	def create
		borrower = Borrower.new(borrower_params)
		if borrower.valid?
			borrower.save
			session[:user_id] = borrower.id
			redirect_to "/sessions/login"
		else
			flash[:errors] = borrower.errors.full_messages
			redirect_to :back
		end
	end

	def index
		@current_user = Borrower.find(session[:user_id])
		@loans = Loan.where(borrower: session[:user_id])
	end

	private
		def borrower_params
				params.require(:borrower).permit(:first_name, :last_name, :email, :password, :password_confirmation, :loan_name, :loan_detail, :capital_needed).merge(capital_raised: 0)
		end
end
