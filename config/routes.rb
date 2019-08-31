Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :articles, only: [:index, :show, :new, :create]
  
  # edit route - handles rendering the edit form -> has to dynamically find by id
  get 'articles/:id/edit', to: 'articles#edit', as: :edit_article  
 
  # patch route - the method that updates the database -> has to dynamically accept the id in the edit form
  # is patch because we're not sending data to the server (GET)
  # also is patch because we're not creating a new record (POST)
  patch 'articles/:id', to: 'articles#update'




end
