class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :req_type
      t.text :comment, default: :null

      t.timestamps
    end
  end
end
