# frozen_string_literal: true

class AddChoicesAndTextAnsToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :choices, :string, array: true, default: nil
    add_column :questions, :text_ans, :string
  end
end
