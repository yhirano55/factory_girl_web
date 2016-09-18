FactoryGirlWeb::Engine.routes.draw do
  root "fixtures#index"
  post "/" => "fixtures#create", as: :fixtures
end
