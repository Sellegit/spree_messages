Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  namespace :admin do
    resources :universal_messages, only: [:new, :create, :index, :destroy, :edit, :update] do
    end
    resources :personal_messages, only: [:index] do
    end
  end
end
