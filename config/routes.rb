Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :v1 do 
    get "/first_contact" => "contacts_list#first_contact"
    get "/second_contact" => "contacts_list#second_contact"
    get "/third_contact" => "contacts_list#third_contact"
  end
end
