angular
.module('students')
.controller 'UniversitiesUpdateCtl', ['$scope', '$state', '$log', '$stateParams', 'University', 'StudyLanguage', 'LanguageCode', 'Exam', 'Graduate', 'Info', 'Course', 'CoursesExam', 'CoursesGraduate', 'City', 'Country', 'Photo', 'FileUploader', 'InfosStudyLanguage', ($scope, $state, $log, $stateParams, University, StudyLanguage, LanguageCode, Exam, Graduate, Info, Course, CoursesExam, CoursesGraduate, City, Country, Photo, FileUploader, InfosStudyLanguage) ->
  $scope.university = University.show(id: $stateParams.id)
  $scope.uploader = new FileUploader({url: 'api/photos', formData: [{category: "Avatar", university_id: $stateParams.id}]})
 
  $scope.study_languages = StudyLanguage.index()
  $scope.language_codes = LanguageCode.index()
  $scope.exams = Exam.index()
  $scope.graduates = Graduate.index()
  $scope.countries = Country.index()
  $scope.cities = City.index()
  $scope.photos = Photo.index(university_id: $stateParams.id)
  

  $scope.exams_to_destroy = []
  $scope.graduates_to_destroy = []
  $scope.courses_to_destroy = []
  $scope.study_languages_to_destroy = []

  $scope.$watch('language', (newV, oldV) ->
    $scope.info = _.find($scope.university.infos, (item) ->
      item.language_code_id == newV
    )
  )

  $scope.destroy_photo = (photo) ->
    Photo.destroy(id: photo.id).$promise.then () ->
      $scope.photos.splice($scope.photos.indexOf(photo), 1)

  $scope.add_course = () ->
    $scope.info.courses.push({})

  $scope.add_study_language = () ->
    $scope.info.infos_study_languages.push({})

  $scope.remove_study_language = (study_language) ->
    $scope.info.infos_study_languages.splice($scope.info.infos_study_languages.indexOf(study_language), 1)
    if study_language.id
      $scope.study_languages_to_destroy.push(study_language)

  $scope.remove_course = (course) ->
    $scope.info.courses.splice($scope.info.courses.indexOf(course), 1)
    if course.id
      $scope.courses_to_destroy.push(course)

  $scope.remove_exam = (course, exam) ->
    course.courses_exams.splice(course.courses_exams.indexOf(exam), 1)
    if exam.id
      $scope.exams_to_destroy.push(exam)

  $scope.remove_graduate = (course, graduate) ->
    course.courses_graduates.splice(course.courses_graduates.indexOf(graduate), 1)
    if graduate.id
      $scope.graduates_to_destroy.push(graduate)

  $scope.add_exam = (course) ->
    if !course.courses_exams
      course.courses_exams = []
    course.courses_exams.push({})

  $scope.add_graduate = (course) ->
    if !course.courses_graduates
      course.courses_graduates = []
    course.courses_graduates.push({})

  $scope.update = () ->
    University.update(id: $scope.university.id, $scope.university).$promise.then (_university) ->
    
      $scope.uploader.uploadAll()

      $scope.courses_to_destroy.forEach (course) ->
        Course.destroy(id: course.id)

      $scope.exams_to_destroy.forEach (exam) ->
        CoursesExam.destroy(id: exam.id)

      $scope.graduates_to_destroy.forEach (graduate) ->
        CoursesGraduate.destroy(id: graduate.id)

      $scope.study_languages_to_destroy.forEach (study_language) ->
        InfosStudyLanguage.destroy(id: study_language.id)
      $state.go('main.universities.index')
]


