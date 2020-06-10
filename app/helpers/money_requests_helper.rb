module MoneyRequestsHelper
    
    def my_request
        MoneyRequest.find(params[:id])
    end

    def current_money_request
        MoneyRequest.find(params[:money_request_id])
    end

    def request_terms
        TimeDifference.between(current_money_request.terms, Date.today).humanize
    end

end
