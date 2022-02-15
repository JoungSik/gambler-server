class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :server, null: false, foreign_key: true
      t.bigint :amount, default: 0
      t.integer :init_count, default: 0

      t.timestamps
    end
  end
end
