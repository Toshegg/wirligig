json.users do
  json.array! @users, partial: 'api/users/model', as: :user
end

