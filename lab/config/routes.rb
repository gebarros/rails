Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: 'patients' do
    resources :patients do
      resources :exams do
        resources :samples
      end
    end
  end

  root 'patients#index'

  resources :patients, only: :index
  resources :exams
  resources :samples
end
