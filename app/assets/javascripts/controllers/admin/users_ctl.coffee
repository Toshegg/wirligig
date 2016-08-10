angular
.module('students')
.controller 'AdminUsersCtl', ['$scope', '$auth', 'User', ($scope, $auth, User) ->
  if $auth.user.id
    $scope.users = User.index(except_id: $auth.user.id)
  $scope.$on('auth:validation-success', (ev, user) ->
    $scope.users = User.index(except_id: $auth.user.id)

  $scope.update = (u) ->
    User.update(id: u.id, u)
  )
]
