# frozen_string_literal: true

class AddQsTypeToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :qs_type, :string
  end
end
