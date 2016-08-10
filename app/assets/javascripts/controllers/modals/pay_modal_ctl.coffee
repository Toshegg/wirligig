angular
.module('students')
.controller 'PayModalCtl', ['$scope', '$uibModalInstance', '$auth', '$location', ($scope, $uibModalInstance, $auth, $location) ->

  $scope.port = () ->
    if $location.port()
      ":" + $location.port()
    else
      ""

  $scope.cancel = () ->
    $uibModalInstance.close()

  $scope.pay = () ->
    window.location.replace("http://" + $location.host() + $scope.port() + "/api/pay?user_uuid=" + $auth.user.uuid)
     

  ]
