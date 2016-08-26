Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'teachers#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :teachers do
    resources :classrooms do
      resources :students do
        resources :absences
      end
      resources :teams
      resources :questions
    end
  end
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'teachers#new'
  post '/teachers' => 'teachers#create'
end
