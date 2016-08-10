json.infos do
  json.array! @infos, partial: 'api/infos/model', as: :info
end

