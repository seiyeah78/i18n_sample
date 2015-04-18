Rails.application.routes.draw do
  get "/" => "users#index"
  scope "/:locale", constraints: Constraints::WhiteList.new do
    root controller: :users, action: :index
    resources :users
  end
end
