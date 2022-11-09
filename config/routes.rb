Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: %i[create] do
        resources :registrations, only: %i[create]
      end
      resources :elections, only: %i[index show create] do
        resources :ballots, only: %i[index show create] do
          resources :votes, only: %i[index show create update]
        end
      end
    end
  end
end
