Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  get 'books/title/:title' => 'books#title'
  get 'books/headline/:headline' => 'books#headline'
  resources :books do
    collection do
      post :confirm
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
