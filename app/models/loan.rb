class Loan < ApplicationRecord
    
    has_many :payments
    belongs_to :money_request
    belongs_to :borrowed, class_name: "User", foreign_key: "borrowed_id"
    belongs_to :lender, class_name: "User", foreign_key: "lender_id"
    has_many :open_transaction, class_name: "Payment", foreign_key: "open_transaction_id"
    has_many :close_transaction, class_name: "Payment", foreign_key: "close_transaction_id"
    

    scope :complited, -> { where(status: 1) }
    scope :incompleted, -> { where(status: 0) }

    STATUS = {
        :incomplete => 0,
        :complete => 1
    }
    
    scope :completed, -> { where(status: STATUS[:complete]) }
    scope :incompleted, -> { where(status: STATUS[:incomplete]) }

    
    def incomplete?
        self.status == STATUS[:incomplete]
    end

    def complete?
        self.status == STATUS[:complete]
    end

end