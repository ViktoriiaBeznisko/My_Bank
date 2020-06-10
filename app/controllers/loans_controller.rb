class LoansController < ApplicationController
    include MoneyRequestsHelper, LoansHelper
    before_action :require_login

    def new
        @loan = Loan.new
    end

    def create
        @loan = current_user.loans.build(loan_params)
        if @loan.save
            current_money_request.update(status: 1)
            redirect_to new_loan_payment_path(@loan.id)
        else
            render :new
        end
    end

    def index
        @loans_borrowed = Loan.where(borrowed_id: current_user.id)
        @loans_lender = Loan.where(lender_id: current_user.id)
    end

    def update
        @loan = my_loan.update(loan_params)
        redirect_to loan_path(@loan)    
    end
  
    def show
        @loan = my_loan
    end
   
    private
    def loan_params
        params.require(:loan).permit(:money_request_id, :lender_id, :borrowed_id, :amount_cents, :closing_loan_day, :opening_loan_day, :percentage, :open_transaction_id, :close_transaction_id, :total_paid)
    end
end

