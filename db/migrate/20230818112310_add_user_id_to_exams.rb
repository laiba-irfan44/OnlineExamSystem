# frozen_string_literal: true

class AddUserIdToExams < ActiveRecord::Migration[7.0]
  def change
    add_reference :exams, :user, null: false, foreign_key: true
  end
end
