class AddRequestSentToUsers < ActiveRecord::Migration[7.0]
  def change
     add_column :users, :request_sent, :boolean, default: true
  end
end
