class AddSlugToUserDetails < ActiveRecord::Migration[6.0]
  def change
    add_column :user_details, :slug, :string
    add_index :user_details, :slug, unique: true
  end
end
