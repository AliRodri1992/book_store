Rails.application.routes.draw do
  get "catalogs" => "catalogs#index"
  get "catalogs/index"
  get "catalogs/new"

  root 'home#index'
end
