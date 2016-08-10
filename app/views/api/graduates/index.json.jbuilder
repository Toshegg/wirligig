json.graduates do
  json.array! @graduates, partial: 'api/graduates/model', as: :graduate
end

