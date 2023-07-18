Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'users#index'
  resourses :users, only: [:index, :show] do
    resourses :posts, only: [:index, :show]
  end
end
