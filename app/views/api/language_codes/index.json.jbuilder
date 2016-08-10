json.language_codes do
  json.array! @language_codes, partial: 'api/language_codes/model', as: :language_code
end

