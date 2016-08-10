json.(university, :id, :country_id, :city_id, :creator_id)

json.name university.name
json.country university.country
json.city university.city

if university.avatar.present?

  json.avatar do
    json.partial! 'api/photos/model', photo: university.avatar
  end

else
  json.avatar do
    json.thumb '/system/photos/images/missing.png'
    json.original '/system/photos/images/missing.png'
    json.medium '/system/photos/images/missing.png'
  end
end
