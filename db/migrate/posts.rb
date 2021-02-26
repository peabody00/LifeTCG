class Posts < ActiveRecord::Migration
    def change
        create_table :posts do |t|
            t.string :author
            t.string :text
            t.timestamps
        end
    end
end