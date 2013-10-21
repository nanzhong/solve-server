class IncreaseProblemDescriptionLength < ActiveRecord::Migration
  def change
    change_column :problems, :description, :string, :limit => 10000
  end
end
