class AddLockableToUsers < ActiveRecord::Migration[8.0]
  def change
    change_table :users, bulk: true do |t|
      t.integer :failed_attempts, default: 0, null: false unless column_exists?(:users, :failed_attempts)
      t.string  :unlock_token unless column_exists?(:users, :unlock_token)
      t.datetime :locked_at unless column_exists?(:users, :locked_at)
    end

    add_index :users, :unlock_token, unique: true unless index_exists?(:users, :unlock_token)
  end
end