angular.module('students').controller('IndexCtl', ['$scope', '$state', 'City', 'Country', 'Course', ($scope, $state, City, Country, Course) ->
    $scope.cities = City.index()
    $scope.countries = Country.index()
    $scope.courses = Course.index()
  ]
)
