class LoansController < ApplicationController
	def create
			if params[:current_capital].to_i - params[:amount_loaned].to_i >= 0
					loan = Loan.new
					loan.amount_loaned = params[:amount_loaned].to_i
					loan.lender = Lender.find(session[:user_id])
					loan.borrower = Borrower.find(params[:borrower_id])
					loan.save
					redirect_to "/lenders/#{session[:user_id]}"
			else
					flash[:errors] = ["You can't loan more than what you have, come on"]
					redirect_to :back
			end
	end

	def update
			if params[:current_capital].to_i - params[:amount_loaned].to_i >= 0
					loan = Loan.find(params[:loan_id])
					loan.amount_loaned += params[:amount_loaned].to_i
					loan.save
					redirect_to "/lenders/#{session[:user_id]}"
			else
					flash[:errors] = ["You can't loan more than what you have, come on"]
					redirect_to :back
			end
	end
end
