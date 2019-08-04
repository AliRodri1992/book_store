Rails.application.routes.draw do
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
