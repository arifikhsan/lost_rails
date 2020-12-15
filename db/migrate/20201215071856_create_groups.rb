class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :username
      t.string :location
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
