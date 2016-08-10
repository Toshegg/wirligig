json.university do
  json.partial! 'api/universities/model', university: @university

  json.(@university, :admission_from, :admission_to, :pass_exams_from, :pass_exams_to, :foreign_students, :provides_dormitory, :show_name)

  json.infos do
    json.array! @university.infos, partial: 'api/infos/model', as: :info
  end
  
  json.current_info do
    json.partial! 'api/infos/model', info: @university.infos.joins(:language_code).where("language_codes.name = ?", 'en').first
  end
end
