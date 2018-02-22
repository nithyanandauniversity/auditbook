Sequel.migration do
  up do
    create_table :audit_logs do
      primary_key :id
      DateTime :request_time
      String :http_method
      String :url
      String :http_status
      String :ip_address
      Text :query_params
      String :namespace
      Text :raw_request_body
      Text :http_response
      String :current_user
      String :audit_category
      String :audit_sub_category
      Text :audit_resource
    end
  end

  down do
    drop_table :audit_logs
  end
end
