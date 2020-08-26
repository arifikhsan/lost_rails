class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :detail
      t.integer :condition
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
