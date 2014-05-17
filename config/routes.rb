Mika::Application.routes.draw do
  root "pages#home"
  get '/contact' => "pages#contact"
  get '/about' => 'pages#about'
  get '/privacy' => 'pages#privacy'
  get '/tos' => 'pages#terms_of_service'

  post '/contact' => 'messages#contact'

  resources :projects, only: [:update, :edit, :create, :post, :new], constraints: { subdomain: 'admin' }
  resources :projects, only: [:index, :show]

end
