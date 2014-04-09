Mika::Application.routes.draw do
  root "pages#home"
  get '/contact' => "pages#contact"
  get '/about' => 'pages#about'
  get '/privacy' => 'pages#privacy'
  get '/tos' => 'pages#terms_of_service'

  get '/new_project' => 'projects#new', :constraints => { :subdomain => 'admin' }

  post '/contact' => 'messages#contact'

  resources :projects, :only => [:index, :show]
  resources :projects, :only => [:update, :edit, :create, :post], :constraints => { :subdomain => 'admin' }
end
