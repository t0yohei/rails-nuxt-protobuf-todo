Rails.application.routes.draw do
  namespace :api do
    resources :tasks
  end

  namespace :proto do
    resources :tasks
  end
end
