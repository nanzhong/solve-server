class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.integer :problem_id
      t.string :name
      t.string :input
      t.string :output

      t.timestamps
    end
  end
end
