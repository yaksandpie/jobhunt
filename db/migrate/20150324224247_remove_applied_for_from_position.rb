class RemoveAppliedForFromPosition < ActiveRecord::Migration
  def change
    remove_column :positions, :applied_for, :boolean
  end
end
