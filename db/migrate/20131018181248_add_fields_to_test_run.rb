class AddFieldsToTestRun < ActiveRecord::Migration
  def change
    add_column :test_runs, :output, :string, :limit => 100000
    add_column :test_runs, :timeout, :boolean
  end
end
