# frozen_string_literal: true

class AddExamTakenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :exam_taken, :boolean
  end
end
