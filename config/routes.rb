Rails.application.routes.draw do
  get '/items/for_category/:category', to: 'items#category'
  get '/items/for_seller/:seller/for_status/:status', to: 'items#seller_status'
  get '/items/:id', to: 'items#show', constraints: { id: /[\d]/ }
  get '/items/', to: 'items#index'
end
