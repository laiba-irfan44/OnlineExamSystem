# frozen_string_literal: true

class AddRequestSentToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :request_sent, :boolean
  end
end
