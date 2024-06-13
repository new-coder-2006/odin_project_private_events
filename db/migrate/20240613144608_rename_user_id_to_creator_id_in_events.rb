class RenameUserIdToCreatorIdInEvents < ActiveRecord::Migration[7.1]
  def change
    rename_column :events, :user_id, :creator_id
  end
end
