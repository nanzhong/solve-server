class AddStatusToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :tested, :boolean, default: false
  end
end
