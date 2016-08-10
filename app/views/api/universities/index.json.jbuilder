json.universities do
  json.array! @universities, partial: 'api/universities/model', as: :university
end

