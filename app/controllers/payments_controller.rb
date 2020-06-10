class PaymentsController < ApplicationController
    include LoansHelper
    before_action :require_login

    def new
        @payment = Payment.new
    end

    def create
        @payment = Payment.new(payment_params)
        if @payment.save && @payment.lender.id == current_user.id
            current_loan.update(open_transaction_id: @payment.id)
            redirect_to loans_path
        elsif @payment.save && @payment.borrowed.id == current_user.id
            current_loan.update(status: 1, total_paid: @payment.amount, close_transaction_id: @payment.id, closing_loan_day: @payment.created_at)
            redirect_to loans_path
        else
            render :new
        end
    end

    def index
        @payment_borrowed = Payment.where(borrowed_id: current_user.id)
        @payment_lender = Payment.where(lender_id: current_user.id)
    end

    def show
        @payment = Payment.find(params[:id])
    end
   
    private
    def payment_params
        params.require(:payment).permit(:borrowed_id, :lender_id, :loan_id, :amount, :card_token, :card_type)
    end

end
