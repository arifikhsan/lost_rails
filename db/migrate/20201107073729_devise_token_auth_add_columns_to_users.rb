class DeviseTokenAuthAddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change

    # create_table(:users) do |t|
      ## Required
      add_column :users, :provider, :string, null: false, default: "email"
      add_column :users, :uid, :string, null: false, default: ""

      ## Database authenticatable
      # t.string :encrypted_password, :null => false, :default => ""

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at
      add_column :users, :allow_password_change, :boolean, :default => false

      ## Rememberable
      # t.datetime :remember_created_at

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      add_column :users, :name, :string
      add_column :users, :nickname, :string
      add_column :users, :image, :string
      # t.string :email

      ## Tokens
      add_column :users, :tokens, :json

      # t.timestamps
    # end

    # add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    # add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,       unique: true
  end
end
