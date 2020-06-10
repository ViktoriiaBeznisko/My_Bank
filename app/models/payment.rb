class Payment < ApplicationRecord
    validates :card_token, presence: true
    validates :card_type, presence: true

    belongs_to :loan
    belongs_to :borrowed, class_name: "User", foreign_key: "borrowed_id"
    belongs_to :lender, class_name: "User", foreign_key: "lender_id"
end