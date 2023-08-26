class Question < ApplicationRecord
  belongs_to :exam
  enum question_type: { text: 'Text Question', mcq: 'Multiple Choice Question' }
  serialize :choices, Array
end
