class AddRelationsEventsAdmin < ActiveRecord::Migration[5.2]
  def change 
    change_table :events do |t|
    t.references :admin, index: true
    end
  end
end
