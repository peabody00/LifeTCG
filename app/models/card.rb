class Card < ActiveRecord::Base
    has_many :user_cards
    has_many :trades
    has_many :trades, :foreign_key => "other_card_id"
    has_many :users, through: :user_cards
end