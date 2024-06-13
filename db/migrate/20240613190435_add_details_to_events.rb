class AddDetailsToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :details, :text
  end
end
