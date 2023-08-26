# app/views/exams/_exam.json.jbuilder

json.extract! exam, :id, :subject, :start_time, :end_time, :status

json.teacher do
  json.extract! exam.teacher, :id, :name, :email 
end
