class AddTestIdToTestRuns < ActiveRecord::Migration
  def change
    add_column :test_runs, :test_id, :integer
  end
end
