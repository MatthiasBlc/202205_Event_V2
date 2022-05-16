class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.text :description
      t.datetime :start_date
      t.integer :duration
      t.string :title
      t.integer :price
      t.string :location

      t.timestamps
    end
  end
end
