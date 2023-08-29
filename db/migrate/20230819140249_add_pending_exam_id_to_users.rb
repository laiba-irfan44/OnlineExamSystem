# frozen_string_literal: true

class AddPendingExamIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :pending_exam_id, :integer
  end
end
