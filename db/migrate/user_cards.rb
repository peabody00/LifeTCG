class UserCards < ActiveRecord::Migration
    def change
        create_table :user_cards do |t|
            t.integer :user_id
            t.integer :card_id
        end
    end
end