class CreateRewards < ActiveRecord::Migration[6.0]
  def change
    create_table :rewards do |t|
      t.references :item, null: false, foreign_key: true
      t.integer :category
      t.string :value

      t.timestamps
    end
  end
end
