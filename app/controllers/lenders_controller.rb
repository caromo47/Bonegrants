class LendersController < ApplicationController
	def create
			lender = Lender.new(lender_params)
			if lender.valid?
				lender.save
				session[:user_id] = lender.id
				redirect_to "/sessions/login"
			else
				flash[:errors] = lender.errors.full_messages
				redirect_to :back
			end
	end

	def index
			@current_user = Lender.find(session[:user_id])
			@capital = @current_user.capital
			@donated = @current_user.loans.sum(:amount_loaned)
			@current_capital = @current_user.capital - @current_user.loans.sum(:amount_loaned)
			@borrowers = Borrower.all
			@loans = Loan.where(lender_id: session[:user_id])
	end

	def update
		@lender = Lender.find(session[:user_id])
		if @lender.update lender_params
			redirect_to :back
		else
			puts @lender.errors.full_messages
			redirect_to :back
		end
	end

	private
			def lender_params
					params.require(:lender).permit(:first_name, :last_name, :email, :password, :password_confirmation, :capital)
			end
end
