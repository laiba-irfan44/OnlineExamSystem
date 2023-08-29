Rails.application.routes.draw do
  devise_for :users, controllers: {
    invitations: 'devise/invitations',
    registrations: 'users/registrations'
  }


# --------------------------------- STUDENT ----------------------------------
  get 'student_view', to: 'student#student_view'
  get 'student_view_exam_questions', to: 'student#student_view_exam_questions'
  get 'student_exams', to: 'student#student_exams'
  post 'student/submit_student_exam/:id', to: 'student#submit_student_exam', as: 'submit_student_exam'

#----------------------------------- EXAMS Questions----------------------------------------
  resources :exams do
    resources :questions
end

resources :questions, only: [:edit, :update]

resources :questions do
  resources :answers, only: [:new, :create, :show]
end

#------------------------------- Teacher ---------------------------------------
resources :teachers, only: [:index] do
  collection do
    get 'review_scores', to: 'teacher#review_scores', as: :review_scores
    get 'review_exam', to: 'teacher#review_exam', as: :review_exam
  end
  member do
    get 'approval_request/:id', to: 'teacher#approval_request', as: :approval_request
  end
end

#--------------------------------- Admin ----------------------------------------
namespace :admin do
  resources :invitations, only: [:new, :create], path: '' do
    collection do
      get :new_invitation
      post :create_invitation
    end
  end
end

resources :admin, only: [] do
  collection do
    get 'admin_view', to: 'admin#admin_view'
    get 'review_scores', to: 'admin#review_scores'
    get 'admin_question/:id', to: 'admin#admin_question', as: :admin_question
    post 'approve/:id', to: 'admin#approve', as: :approve_exam
    put 'cancel/:id', to: 'admin#cancel', as: :admin_cancel_exam
  end
end

#----------------------------------- USER ---------------------------------------
 devise_scope :user do
  root 'devise/sessions#new'
  get 'devise/invitations/new', to: 'devise/invitations#new', as: :send_user_invitation
  get 'users/sign_out' ,to: 'devise/sessions#destroy'
end

#-------------------------------------------------------------------------------------
resources :results

 
get '/admin', to: 'admin#index', as: :admin_index_path
get '/teacher', to: 'teacher#index', as: :teacher_index_path
get '/student', to: 'student#index', as: :student_index_path
end
