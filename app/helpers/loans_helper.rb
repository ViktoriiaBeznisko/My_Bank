module LoansHelper

    PERCENTAGE = {
        :short_term => 2,
        :long_term => 5
    }

    def set_terms
        if (current_money_request.terms - Date.today) >= 60
            PERCENTAGE[:short_term]
        else
            PERCENTAGE[:long_term]
        end
    end

    def current_loan
        Loan.find(params[:loan_id])
    end

    def my_loan
        Loan.find(params[:id])
    end

    def loan_terms
        TimeDifference.between(my_loan.money_request.terms, my_loan.opening_loan_day).humanize
    end

    def days_left
        TimeDifference.between(my_loan.money_request.terms, Date.today).humanize
    end

    def total_paid
        a = current_loan.percentage.to_f / 100 + 1
        current_loan.amount_cents.to_f * a
    end
end
