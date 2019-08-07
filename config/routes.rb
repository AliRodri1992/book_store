Rails.application.routes.draw do
  get "search_books/search"

  get "asign_books" => "asign_books#index"
  get "asign_books/index"
  get "asign_books/new"
  get "asign_books/show"
  get "asign_books/edit"
  get "asign_books/find"
  get "asign_books/destroy"
  post "asign_books/create"
  post "asign_books/update"

  get "catalogs" => "catalogs#index"
  get "catalogs/index"
  get "catalogs/new"
  get "catalogs/show"
  get "catalogs/edit"
  get "catalogs/find"
  get "catalogs/destroy"
  post "catalogs/create"
  post "catalogs/update"

  root 'home#index'
end
