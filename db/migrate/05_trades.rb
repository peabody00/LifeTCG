class Trades < ActiveRecord::Migration[4.2]
    def change
        create_table :trades do |t|
            t.integer :user_id
            t.integer :card_id
            t.integer :other_user_id
            t.integer :other_card_id
            t.string :status            
        end
    end
end