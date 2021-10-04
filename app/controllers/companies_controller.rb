# Controller of companies
class CompaniesController < ApplicationController
  require 'json'

  def companies_formatted
    # http://localhost:3000/api/companies_format?country=usa
    name_country = params[:country]

    @response_companies = Company.get_companies_formatted(name_country)

    if @response_companies.key?('error')
      render json: { message: @response_companies['error'] }, status: :not_found
    else
      render json: @response_companies, status: :ok
    end
  end
end
