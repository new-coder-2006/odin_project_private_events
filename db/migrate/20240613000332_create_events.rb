class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :event_name
      t.string :location
      t.string :event_date
      t.string :date

      t.timestamps
    end
  end
end
