Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do 
    get "/contacts" => "contacts_list#index"
    post "/contacts" => "contacts_list#create"
    get "/contacts/:id" => "contacts_list#show"
    patch "/contacts/:id" => "contacts_list#update"
    delete "/contacts/:id" => "contacts_list#destroy"

    post "/users" => "users#create"
  end
end
