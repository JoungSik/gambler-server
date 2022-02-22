class AddColumnServerOwner < ActiveRecord::Migration[7.0]
  def change
    add_reference :servers, :owner, references: :users, after: :id
  end
end
