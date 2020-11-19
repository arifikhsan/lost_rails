class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.references :user, null: false, foreign_key: true
      # t.string :name
      t.string :username
      t.address :address
      t.string :phone_number
      t.string :whatsapp_phone_number
      t.date   :dob
      t.integer :gender

      t.timestamps
    end
  end
end
