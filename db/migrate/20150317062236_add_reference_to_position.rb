class AddReferenceToPosition < ActiveRecord::Migration
  def change
  	add_reference :interviews, :position
  end
end
