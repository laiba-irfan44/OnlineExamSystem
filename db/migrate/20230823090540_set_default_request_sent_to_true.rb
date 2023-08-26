class SetDefaultRequestSentToTrue < ActiveRecord::Migration[7.0]
  def change
     change_column_default :exams, :request_sent, true
  end
end
