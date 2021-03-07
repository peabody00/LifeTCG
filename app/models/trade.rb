class Trade < ActiveRecord::Base
    belongs_to :user
    belongs_to :other_user, :class_name => "User"
    belongs_to :card
    belongs_to :other_card, :class_name => "Card"
end