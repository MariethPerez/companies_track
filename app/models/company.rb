class Company < ApplicationRecord

  def self.get_companies_formatted(name_country = "")

    begin
      data_json = File.read("db/data/#{name_country}.json")
    rescue => e
      return { error: e.message }
    end
    @companies = []
    @companies_hash = {}
  
    @companies_data = JSON.parse(data_json)
    if @companies_data.instance_of? Hash
      @companies_data = @companies_data.values.first
    elsif @companies_data.instance_of? Array
      @companies_data
    end

    @companies = @companies_data.map do |company|
      company_formatted = {}
      company.each do |key, value|
        if ['companyName', 'short-name', 'name'].include? key
          company_formatted['name'] = value
        elsif ['companyID', 'code', 'id'].include? key
          company_formatted['id'] = value
        elsif ['icon', 'image-url', 'icon_url'].include? key
          company_formatted['icon'] = value
        end
      end
      company_formatted
    end

    @companies_hash['companies'] = @companies
    @companies_hash
  end
end
