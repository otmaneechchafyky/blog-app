class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      ## Database authenticatable (skip if already exists)
      unless column_exists?(:users, :email)
        t.string :email, null: false, default: ""
      end

      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      ## Recoverable
      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
      end

      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      ## Rememberable
      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## Confirmable (skip if already exists)
      unless column_exists?(:users, :confirmation_token)
        t.string :confirmation_token
      end

      unless column_exists?(:users, :confirmed_at)
        t.datetime :confirmed_at
      end

      unless column_exists?(:users, :confirmation_sent_at)
        t.datetime :confirmation_sent_at
      end

      unless column_exists?(:users, :unconfirmed_email)
        t.string :unconfirmed_email
      end

      ## Lockable (skip if already exists)
      unless column_exists?(:users, :failed_attempts)
        t.integer :failed_attempts, default: 0, null: false
      end

      unless column_exists?(:users, :unlock_token)
        t.string :unlock_token
      end

      unless column_exists?(:users, :locked_at)
        t.datetime :locked_at
      end
    end

    ## Add indexes if they do not exist
    unless index_exists?(:users, :email)
      add_index :users, :email, unique: true
    end

    unless index_exists?(:users, :reset_password_token)
      add_index :users, :reset_password_token, unique: true
    end

    # Add other indexes here if needed
  end
end
