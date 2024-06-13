class FixEventsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :events, :date, :string
    change_column :events, :event_date, 'date USING CAST(event_date AS date)'
  end
end
