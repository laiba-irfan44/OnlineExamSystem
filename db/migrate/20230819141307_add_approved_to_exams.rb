class AddApprovedToExams < ActiveRecord::Migration[7.0]
  def change
    add_column :exams, :approved, :boolean , default:false
  end
end
