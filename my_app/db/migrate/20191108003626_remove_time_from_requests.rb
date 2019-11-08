class RemoveTimeFromRequests < ActiveRecord::Migration[6.0]
  def change
    remove_column :requests, :time
  end
end
