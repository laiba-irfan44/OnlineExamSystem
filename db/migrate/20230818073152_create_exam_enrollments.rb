# frozen_string_literal: true

class CreateExamEnrollments < ActiveRecord::Migration[7.0]
  def change
    create_table :exam_enrollments do |t|
      t.references :teacher, null: false, foreign_key: { to_table: :users }
      t.references :exam, null: false, foreign_key: true
      t.index %i[student_id exam_id], unique: true
      t.timestamps
    end
  end
end
