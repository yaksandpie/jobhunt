class ChangeHearBackColumnName < ActiveRecord::Migration
  def change
    rename_column :positions, :hear_back, :rejected
  end
end
