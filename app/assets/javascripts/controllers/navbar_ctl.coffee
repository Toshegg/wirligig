angular
.module('students')
.controller 'NavbarCtl', ['$scope', '$uibModal', '$auth', '$location', ($scope, $uibModal, $auth, $location) ->
  $scope.open_login_modal = () ->

    modalInstance = $uibModal.open({
      animation: true,
      templateUrl: 'modals/login_modal.html',
      controller: 'LoginModalCtl'
    })

  $scope.logout = () ->
    $auth.signOut()

  $scope.port = () ->
    if $location.port()
      ":" + $location.port()
    else
      ""

  $scope.pay = () ->
    window.location.replace("http://" + $location.host() + $scope.port() + "/api/pay?user_uuid=" + $auth.user.uuid)
]
