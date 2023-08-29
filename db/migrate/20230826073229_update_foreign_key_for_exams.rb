# frozen_string_literal: true

class UpdateForeignKeyForExams < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :exams, :users # Remove the existing foreign key constraint
    add_foreign_key :exams, :users, on_delete: :nullify # Add a new foreign key constraint with ON DELETE SET NULL
  end
end
