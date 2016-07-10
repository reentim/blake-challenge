Rails.application.routes.draw do
  resources :enrollments, only: [:update]
end
