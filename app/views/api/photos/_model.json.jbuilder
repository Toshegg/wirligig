json.(photo, :id, :image_file_name)

json.thumb photo.image.url(:thumb)
json.medium photo.image.url(:medium)
json.original photo.image.url
