class Users < ActiveRecord::Migration[4.2]
    def change
        create_table :users do |t|
            t.string :username
            # t.string :email
            t.string :password_digest
            t.integer :life_value
        end
    end
end