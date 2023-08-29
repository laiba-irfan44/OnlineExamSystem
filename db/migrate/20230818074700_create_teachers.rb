# frozen_string_literal: true

class CreateTeachers < ActiveRecord::Migration[7.0]
  def change
    create_table :teachers, &:timestamps
  end
end
