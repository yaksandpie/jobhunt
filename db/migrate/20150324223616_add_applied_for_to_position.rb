class AddAppliedForToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :applied_for, :boolean
  end
end
