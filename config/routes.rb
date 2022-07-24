Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts do
    collection do
      get 'search'
    end
  end
  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  resources :maps, only: [:index]
end