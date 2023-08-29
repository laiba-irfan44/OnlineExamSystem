# frozen_string_literal: true

class CreateExams < ActiveRecord::Migration[7.0]
  def change
    create_table :exams do |t|
      t.string :subject
      t.datetime :start_time
      t.datetime :end_time
      t.integer :status

      t.references :teacher, foreign_key: { to_table: :users, column: :teacher_id }, index: true
      t.timestamps
    end
  end
end
