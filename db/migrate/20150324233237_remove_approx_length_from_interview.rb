class RemoveApproxLengthFromInterview < ActiveRecord::Migration
  def change
    remove_column :interviews, :approx_length, :string
  end
end
