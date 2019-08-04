Rails.application.routes.draw do
  get "catalogs" => "catalogs#index"
  get "catalogs/index"
  get "catalogs/new"
  get "catalogs/show"
  post "catalogs/create"

  root 'home#index'
end
