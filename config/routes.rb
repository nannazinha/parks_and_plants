Rails.application.routes.draw do
  resources :gardens do
    resources :plants, only: :create
  end
end
