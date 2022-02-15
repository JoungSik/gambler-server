class CreateServers < ActiveRecord::Migration[7.0]
  def change
    create_table :servers, id: false do |t|
      t.bigint :id, null: false

      t.timestamps null: false
    end

    add_index :servers, :id, unique: true

    execute "ALTER TABLE servers ADD PRIMARY KEY (id);"
  end
end
