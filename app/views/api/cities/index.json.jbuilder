json.cities do
  json.array! @cities, partial: 'api/cities/model', as: :city
end

