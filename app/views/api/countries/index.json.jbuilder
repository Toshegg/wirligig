json.countries do
  json.array! @countries, partial: 'api/countries/model', as: :country
end

