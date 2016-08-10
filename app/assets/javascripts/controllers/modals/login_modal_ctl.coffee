angular
.module('students')
.controller 'LoginModalCtl', ['$scope', '$uibModalInstance', '$auth', ($scope, $uibModalInstance, $auth) ->
  $scope.signing_in = true
  $scope.registration = false
  $scope.login_form = {}
  $scope.registration_form = {}

  $scope.switch = () ->
    $scope.signing_in = !$scope.signing_in
    $scope.registration = !$scope.registration

  $scope.register = () ->
    $auth.submitRegistration($scope.registration_form)

  $scope.facebook_auth = () ->
    $auth.authenticate('facebook')
  
  $scope.google_auth = () ->
    $auth.authenticate('google')

  $scope.$on('auth:registration-email-success', (ev, message) ->
    $uibModalInstance.close()
  )

  $scope.$on('auth:login-success', (ev, message) ->
    $uibModalInstance.close()
  )

  $scope.cancel = () ->
    $uibModalInstance.close()

  $scope.$on('auth:registration-email-error', (ev, message) ->
    console.log message
    if message.errors.full_messages
      $scope.errors = message.errors.full_messages
    else
      $scope.errors = message.errors
  )
  
  $scope.$on('auth:login-error', (ev, message) ->
    $scope.errors = message.errors
  )

  $scope.login = () ->
    $auth.submitLogin($scope.login_form)
  ]
