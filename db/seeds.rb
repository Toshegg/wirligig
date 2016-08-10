LanguageCode.find_or_create_by(name: 'ru')
LanguageCode.find_or_create_by(name: 'en')

StudyLanguage.find_or_create_by(name: 'Russian')
StudyLanguage.find_or_create_by(name: 'English')

Exam.find_or_create_by(name: "Russian")
Exam.find_or_create_by(name: "English")
Exam.find_or_create_by(name: "Math")
Exam.find_or_create_by(name: "Literature")

Graduate.find_or_create_by(name: "Master")
Graduate.find_or_create_by(name: "Bachelor")
Graduate.find_or_create_by(name: "Speciality")

User.where(uuid: nil).find_each { |u| u.update(uuid: SecureRandom.hex)}
