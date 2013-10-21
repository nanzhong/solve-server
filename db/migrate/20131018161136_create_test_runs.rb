class CreateTestRuns < ActiveRecord::Migration
  def change
    create_table :test_runs do |t|
      t.integer :solution_id
      t.boolean :success

      t.timestamps
    end
  end
end
