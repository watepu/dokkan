Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  get "books/title/:title" => "books#title"
  get "books/headline/:headline" => "books#headline"
  resources :books

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
