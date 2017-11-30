class SessionsController < ApplicationController
	def create
		if lender = Lender.find_by_email(params[:email])
				if lender && lender.authenticate(params[:password])
						session[:user_id] = lender.id
						redirect_to "/lenders/#{lender.id}"
				else
						flash[:errors] = ["Invalid Combination"]
						redirect_to :back
				end
		elsif borrower = Borrower.find_by_email(params[:email])
				if borrower && borrower.authenticate(params[:password])
						session[:user_id] = borrower.id
						redirect_to "/borrowers/#{borrower.id}"
				else
						flash[:errors] = ["Invalid Combination"]
						redirect_to :back
				end
		else
				flash[:errors] = ["Invalid Combination"]
				puts "somethings wrong"
				redirect_to :back
		end
	end

	def destroy
			reset_session
			redirect_to "/sessions/new"
	end

	def new
	end

	def login
	end
end
