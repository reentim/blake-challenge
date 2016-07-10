Rails.application.routes.draw do
  resources :enrollments, only: [:update]
  resources :students, only: [:show]
end
