Rails.application.routes.draw do 

  resources :exercicios, :path => "exercicios" do
    collection do
      get "/pesquisaexercicio"  => "exercicios#pesquisaexercicio", :as => "pesquisaexercicio"
    end
  end    
  resources :treinos, :path =>  "treinos" do 
    collection do
      get "/exercicio/:idexe/:tam" => "treinos#exercicio", :as => "exercicio"
    end
  end
  root "users#sign_in"
  devise_for :users , controllers: {
      registrations: "users/registrations",
        sessions: 'users/sessions'
      }
  devise_scope :user do
    get 'signup', to: 'users/registrations#new'
    get 'signin', to: 'users/sessions#new'
    get 'signout', to: 'users/registrations#destroy'
  end
  resources :users, :path => "users" do
    collection do
      post "/createuser" => "users#createuser", :as => "createuser"      
          
    end
  end
  resources :saidas
  resources :entradas, :path => "entradas" do
    collection do

      get "/showpdf"  => "entradas#showpdf", :as => "showpdf"

    end
  end  
  resources :planos
  resources :modalidades
  resources :fornecedors
  resources :clientes

  get "caixa/index" => "caixa/index" , :as => "caixa/index"

  #get "treinos/exercicio/:idexc/:tam", to: "treinos#exercicio"

  get "treinos/exercicio/:id/:idcliente/:idplano/:exercicio_id", to: "treinos#exercicio"

  get "entradas/buscarvalorplano/:idplano"  => "entradas#buscarvalorplano", :as => "buscarvalorplano"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
