# frozen_string_literal: true

class AddCorrectOptionToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :correct_option, :string
  end
end
