Rails.application.routes.draw do
  root 'geocode_lookups#index'

  resources :geocode_lookups do
    collection do
      post 'lookup'
    end
  end
end
