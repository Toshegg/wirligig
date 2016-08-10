angular
.module('students')
.controller 'VocsCtl', ['$scope', '$state', '$log', 'StudyLanguage', 'Exam', 'Graduate', ($scope, $state, $log, StudyLanguage, Exam, Graduate) ->
  $scope.study_languages = StudyLanguage.index()
  $scope.exams = Exam.index()
  $scope.graduates = Graduate.index()

  $scope.add_study_language = () ->
    $scope.study_languages.push({editting: true})

  $scope.edit_study_language = (study_language) ->
    study_language.editting = true

  $scope.save_study_language = (study_language) ->
    if study_language.id
      StudyLanguage.update(study_language.id, study_language).$promise.then () ->
        study_language.editting = false
    else
      StudyLanguage.create(study_language).$promise.then (res) ->
        study_language.id = res.id
        study_language.editting = false

  $scope.destroy_study_language = (study_language) ->
    if study_language.id
      StudyLanguage.destroy(study_language).$promise.then () ->
        $scope.study_languages.splice($scope.study_languages.indexOf(study_language), 1)

  $scope.add_exam = () ->
    $scope.exams.push({editting: true})

  $scope.edit_exam = (exam) ->
    exam.editting = true

  $scope.save_exam = (exam) ->
    console.log exam
    if exam.id
      Exam.update(exam.id, exam).$promise.then () ->
        exam.editting = false
    else
      Exam.create(exam).$promise.then (res) ->
        exam.id = res.id
        exam.editting = false

  $scope.destroy_exam = (exam) ->
    if exam.id
      Exam.destroy(exam).$promise.then () ->
        $scope.exams.splice($scope.exams.indexOf(exam), 1)

  $scope.add_graduate = () ->
    $scope.graduates.push({editting: true})

  $scope.edit_graduate = (graduate) ->
    graduate.editting = true

  $scope.save_graduate = (graduate) ->
    if graduate.id
      Graduate.update(graduate.id, graduate).$promise.then () ->
        graduate.editting = false
    else
      Graduate.create(graduate).$promise.then (res) ->
        graduate.id = res.id
        graduate.editting = false

  $scope.destroy_graduate = (graduate) ->
    if graduate.id
      Graduate.destroy(graduate).$promise.then (res) ->
        $scope.graduates.splice($scope.graduates.indexOf(graduate), 1)


]

