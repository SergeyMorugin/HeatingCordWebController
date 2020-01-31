Rails.application.routes.draw do
  resources :weather_measures
  resources :meter_moment_measures
  get 'heating_cords/index'
  match '/heating_cords/update_mode', to: 'heating_cords#update_mode', via: 'put'
  root 'heating_cords#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
