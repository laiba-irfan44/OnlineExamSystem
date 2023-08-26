class CreateQues < ActiveRecord::Migration[7.0]
  def change
    create_table :ques do |t|
      t.string :content
      t.string :ques_type
      t.integer :marks
      t.references :exam, null: false, foreign_key: true

      t.timestamps
    end
  end
end
