Rails.application.routes.draw do
  root 'home#top'
  devise_for :users

  get 'books/title/:title', to: 'books#title'
  get 'books/headline/:headline', to: 'books#headline'
  resources :books do
    collection do
      post :confirm
    end
  end

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

end
