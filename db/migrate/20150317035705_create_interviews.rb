class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|
      t.datetime :interview_date
      t.string :approx_length
      t.text :notes
      t.boolean :thank_you_sent

      t.timestamps null: false
    end
  end
end
