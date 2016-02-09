class RemoveForenameFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :forename 
  end
end
