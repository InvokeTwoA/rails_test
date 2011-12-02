Pokemon::Application.routes.draw do

  resources :hoges

  resources :tests

  resources :buhibuhis
  resources :redcarpet

	resources :messages do
    resources :comments
		collection do
			get '/recent' => 'messages#recent'
			get '/old' => 'messages#old'
			get '/hot' => 'messages#hot'

			get '/test' => 'messages#test'


			get '/updated/desc' => 'messages#index', :defaults  => { :order_type => 'created_desc'  }
			get '/updated/asc' => 'messages#index', :defaults  => { :order_type => 'created_asc'  }
			get '/name/desc' => 'messages#index', :defaults  => { :order_type => 'name_desc'  }
			get '/name/asc' => 'messages#index', :defaults  => { :order_type => 'name_asc'  }

			get '/search' => 'messages#search'
		end 
	end
end
