Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # http://localhost:3000/api/companies_format?country=usa
  scope '/api' do
    get '/companies_format', to: 'companies#companies_formatted'
  end
end
