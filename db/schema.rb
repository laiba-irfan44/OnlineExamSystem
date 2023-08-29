# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_826_073_229) do
  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'admins', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'answers', force: :cascade do |t|
    t.text 'content'
    t.boolean 'is_correct'
    t.integer 'question_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['question_id'], name: 'index_answers_on_question_id'
  end

  create_table 'exam_enrollments', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'exams', force: :cascade do |t|
    t.string 'subject'
    t.datetime 'start_time', precision: nil
    t.datetime 'end_time', precision: nil
    t.integer 'status'
    t.integer 'teacher_id'
    t.datetime 'created_at', precision: nil
    t.datetime 'updated_at', precision: nil
    t.integer 'user_id'
    t.boolean 'approved', default: false
    t.boolean 'request_sent', default: true
  end

  create_table 'profiles', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_profiles_on_user_id'
  end

  create_table 'ques', force: :cascade do |t|
    t.string 'content'
    t.string 'ques_type'
    t.integer 'marks'
    t.integer 'exam_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['exam_id'], name: 'index_ques_on_exam_id'
  end

  create_table 'questions', force: :cascade do |t|
    t.string 'content'
    t.integer 'score'
    t.string 'question_type'
    t.integer 'exam_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'qs_type'
    t.string 'correct_option'
    t.string 'choices'
    t.string 'text_ans'
    t.index ['exam_id'], name: 'index_questions_on_exam_id'
  end

  create_table 'results', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'exam_id', null: false
    t.integer 'total_score'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.text 'text_ans'
    t.index ['exam_id'], name: 'index_results_on_exam_id'
    t.index ['user_id'], name: 'index_results_on_user_id'
  end

  create_table 'students', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'teachers', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'invitation_token'
    t.datetime 'invitation_created_at'
    t.datetime 'invitation_sent_at'
    t.datetime 'invitation_accepted_at'
    t.integer 'invitation_limit'
    t.string 'invited_by_type'
    t.integer 'invited_by_id'
    t.integer 'invitations_count', default: 0
    t.string 'role', default: 'student'
    t.integer 'teacher_id'
    t.string 'full_name'
    t.integer 'pending_exam_id'
    t.boolean 'request_sent', default: true
    t.integer 'total_score'
    t.string 'avatar'
    t.boolean 'exam_taken'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['invitation_token'], name: 'index_users_on_invitation_token', unique: true
    t.index ['invited_by_id'], name: 'index_users_on_invited_by_id'
    t.index %w[invited_by_type invited_by_id], name: 'index_users_on_invited_by'
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['teacher_id'], name: 'index_users_on_teacher_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'answers', 'questions'
  add_foreign_key 'exams', 'users', on_delete: :nullify
  add_foreign_key 'profiles', 'users'
  add_foreign_key 'ques', 'exams'
  add_foreign_key 'questions', 'exams'
  add_foreign_key 'results', 'exams'
  add_foreign_key 'results', 'users'
end
