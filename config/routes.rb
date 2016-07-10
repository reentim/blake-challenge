Rails.application.routes.draw do
  resources :enrollments, only: [:update]
  resources :students, only: [:show]

  resources :teachers, only: [] do
    namespace :reports do
      resource :student_progress, only: [:show]
    end
  end
end
