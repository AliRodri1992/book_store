Rails.application.routes.draw do
  get "catalogs" => "catalogs#index"
  get "catalogs/index"
  get "catalogs/new"
  post "catalogs/create"

  root 'home#index'
end
