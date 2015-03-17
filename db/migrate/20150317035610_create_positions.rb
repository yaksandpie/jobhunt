class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.references :company, index: true
      t.string :title
      t.string :url
      t.text :notes
      t.datetime :date_applied
      t.boolean :hear_back

      t.timestamps null: false
    end
    add_foreign_key :positions, :companies
  end
end
