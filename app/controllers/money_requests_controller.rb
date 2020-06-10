class MoneyRequestsController < ApplicationController
    include MoneyRequestsHelper
    before_action :require_login

    def new
        @money_request = MoneyRequest.new
    end
    
    def create
        @money_request = MoneyRequest.new(money_request_params)
        if @money_request.save 
            redirect_to money_requests_path
        else
            @error = "Some information is missing"
            redirect_to new_money_request_path
        end
    end   
    
    def index
        @my_requests = MoneyRequest.where(borrowed_id: current_user.id)
    end
    
    def show
        @incomplete_money_requests = MoneyRequest.actual_and_incompleted
    end
    
    def edit
        @request = my_request
        if @request.incomplete?
            @request.save
        else
            @error = "Cannot be updated since the request was already completed"
        end
    end
    
    def update
        my_request.update(money_request_params)
        redirect_to money_requests_path
    end

    def destroy
        request = my_request
        if request.incomplete?
            request.destroy
            redirect_to money_requests_path
        else
            @error = "Cannot be deleted since the request was already completed"
        end
    end
    
    private
    
    def money_request_params
        params.require(:money_request).permit(:terms, :amount, :borrowed_id, :status)
    end
end
