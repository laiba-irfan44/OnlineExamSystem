# frozen_string_literal: true

class AddTextAnsToResults < ActiveRecord::Migration[7.0]
  def change
    add_column :results, :text_ans, :text
  end
end
