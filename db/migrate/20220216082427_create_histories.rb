class CreateHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :histories do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :server, null: false, foreign_key: true
      t.bigint :invest
      t.bigint :principal
      t.bigint :result
      t.bigint :tax
      t.bigint :total
      t.integer :diameter

      t.timestamps
    end
  end
end
