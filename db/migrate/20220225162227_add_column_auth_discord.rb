class AddColumnAuthDiscord < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :provider, :string, after: :name
    add_column :users, :uid, :string, after: :provider
  end
end
