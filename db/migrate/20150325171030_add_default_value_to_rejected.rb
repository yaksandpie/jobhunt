class AddDefaultValueToRejected < ActiveRecord::Migration
  def up
    change_column :positions, :rejected, :boolean, default: false
  end

  def down
    change_column :positions, :rejected, :boolean, default: nil
  end
end
