angular
.module('students')
.controller 'UniversitiesIndexCtl', ['$scope', '$state', '$log', '$stateParams', 'University', 'City', 'Country', 'Course', '$uibModal', '$auth', ($scope, $state, $log, $stateParams, University, City, Country, Course, $uibModal, $auth) ->
  $scope.filter = $stateParams.filter

  $scope.countries = Country.index()
  $scope.cities = City.index()
  $scope.courses = Course.index()

  $scope.$watch 'filter', (newV, oldV) ->
    $scope.universities = University.index($scope.filter)
  , true

  $scope.show = (university_id) ->
    $state.go("main.universities.show")

  $scope.pay_modal = () ->
    if $auth.user.id
      modalInstance = $uibModal.open({
        animation: true,
        templateUrl: 'modals/pay_modal.html',
        controller: 'PayModalCtl'
      })
    else
      modalInstance = $uibModal.open({
        animation: true,
        templateUrl: 'modals/login_modal.html',
        controller: 'LoginModalCtl'
      })


  $scope.destroy = (university) ->
    University.destroy(id: university.id).$promise.then () ->
      $scope.universities.splice($scope.universities.indexOf(university), 1)
]
