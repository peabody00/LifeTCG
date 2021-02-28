class Cards < ActiveRecord::Migration[4.2]
    def change
        create_table :cards do |t|
            t.string :rarity
            t.string :type
            t.integer :value
            t.string :name
            t.string :text
            t.string :image
        end
    end
end