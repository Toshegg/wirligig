json.photos do
  json.array! @photos, partial: 'api/photos/model', as: :photo
end

