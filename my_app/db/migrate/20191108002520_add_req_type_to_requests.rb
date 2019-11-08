class AddReqTypeToRequests < ActiveRecord::Migration[6.0]
    def change
        remove_column :requests, :type, :string
        add_column :requests, :req_type, :string
    end
end
