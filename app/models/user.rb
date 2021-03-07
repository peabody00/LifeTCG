class User < ActiveRecord::Base
    has_many :posts
    has_many :trades
    has_many :trades, :foreign_key => "other_user_id"
    has_many :user_cards
    has_many :cards, through: :user_cards

    has_secure_password

    def slug
      username.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
      User.all.find{|user| user.slug == slug}
    end
end