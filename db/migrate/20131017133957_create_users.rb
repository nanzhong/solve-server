class CreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      t.string :username
      t.string :api_key

      t.timestamps
    end

    add_index :users, :username, unique: true
    add_index :users, :api_key, unique: true
  end
end
