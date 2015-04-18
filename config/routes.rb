Rails.application.routes.draw do
  scope "/:locale", constraints: Constraints::WhiteList.new do
    root controller: :users, action: :index
    resources :users
  end
end
