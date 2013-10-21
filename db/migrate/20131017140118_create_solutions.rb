class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :problem_id
      t.integer :user_id
      t.string :code

      t.timestamps
    end
  end
end
