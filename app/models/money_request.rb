class MoneyRequest< ApplicationRecord
    validates :amount, presence: true
    validates :terms, presence: true
    validates_date :terms, :after => lambda { Date.current },
                               :before_message => "please change your estimated payment day, must be future"

    has_one :loan
    has_one :user
    belongs_to :borrowed, class_name: 'User', foreign_key: 'borrowed_id'

    STATUS = {
        :incomplete => 0,
        :complete => 1
    }
    DATE = {
        :actual => Date.today + 7,
    }

    scope :completed, -> { where(status: STATUS[:complete]) }
    scope :incompleted, -> { where(status: STATUS[:incomplete]) }
    scope :actual_and_incompleted, -> { incompleted.where('terms > ?', DATE[:actual]) }

    def incomplete?
        self.status == STATUS[:incomplete]
    end

    def complete?
        self.status == STATUS[:complete]
    end

    def actual?
        self.terms > DATE[:actual]
    end

end
