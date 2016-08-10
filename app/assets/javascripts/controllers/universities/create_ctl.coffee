angular
.module('students')
.controller 'UniversitiesCreateCtl', ['$scope', '$state', '$log', 'University', 'StudyLanguage', 'LanguageCode', 'Exam', 'Graduate', 'Info', 'Course', 'CoursesExam', 'CoursesGraduate', 'City', 'Country', 'FileUploader', ($scope, $state, $log, University, StudyLanguage, LanguageCode, Exam, Graduate, Info, Course, CoursesExam, CoursesGraduate, City, Country, FileUploader) ->
  $scope.university = {infos: []}
  $scope.uploader = new FileUploader({url: 'api/photos', formData: [{category: "Avatar"}]})

  $scope.study_languages = StudyLanguage.index()
  $scope.language_codes = LanguageCode.index()
  $scope.exams = Exam.index()
  $scope.graduates = Graduate.index()
  $scope.cities = City.index()
  $scope.countries = Country.index()

  $scope.language_codes.$promise.then (res) ->
    res.forEach (lc) ->
      $scope.university.infos.push({language_code_id: lc.id, infos_study_languages: [], courses: []})

  $scope.$watch('language', (newV, oldV) ->
    $scope.info = _.find($scope.university.infos, (item) ->
      item.language_code_id == newV
    )
  )

  $scope.add_course = () ->
    $scope.info.courses.push({})

  $scope.add_study_language = () ->
    $scope.info.infos_study_languages.push({})

  $scope.remove_study_language = (study_language) ->
    $scope.info.infos_study_languages.splice($scope.info.infos_study_languages.indexOf(study_language), 1)

  $scope.remove_course = (course) ->
    $scope.info.courses.splice($scope.info.courses.indexOf(course), 1)

  $scope.remove_exam = (course, exam) ->
    course.courses_exams.splice(course.courses_exams.indexOf(exam), 1)

  $scope.remove_graduate = (course, graduate) ->
    course.courses_graduates.splice(course.courses_graduates.indexOf(graduate), 1)

  $scope.add_exam = (course) ->
    if !course.courses_exams
      course.courses_exams = []
    course.courses_exams.push({})

  $scope.add_graduate = (course) ->
    if !course.courses_graduates
      course.courses_graduates = []
    course.courses_graduates.push({})

  $scope.create = () ->
    University.create($scope.university).$promise.then (_university) ->

      $scope.uploader.queue.forEach (q) ->
        q.formData.push({university_id: _university.id})
      $scope.uploader.uploadAll()
              
      $state.go('main.universities.index')

]
