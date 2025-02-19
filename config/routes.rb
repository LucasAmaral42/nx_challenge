Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :loans, only: [:show, :create] do
    post 'loans',     to: 'loans#create'
    get  'loans/:id', to: 'loans#show'
  end
end
