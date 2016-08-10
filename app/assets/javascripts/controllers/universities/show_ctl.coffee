angular
.module('students')
.controller 'UniversitiesShowCtl', ['$scope', '$state', '$log', '$stateParams',  'University', 'StudyLanguage', 'LanguageCode', 'Exam', 'Graduate', ($scope, $state, $log, $stateParams, University, StudyLanguage, LanguageCode, Exam, Graduate) ->
  $scope.university = University.show(id: $stateParams.id)
]
