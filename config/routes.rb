Mika::Application.routes.draw do
  root "pages#home"
  get '/contact' => "pages#contact"
  get '/about' => 'pages#about'
  get '/privacy' => 'pages#privacy'
  get '/tos' => 'pages#terms_of_service'

  resources :projects, :only => [:index]
  resources :projects, :only => [:create, :update, :new, :edit, :destroy, :show], :constraints => { :subdomain => 'admin' }
end
