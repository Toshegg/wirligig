#= require jquery

#= require angular.min
#= require angular-ui-router
#= require angular-route
#= require angular-resource
#= require angular-rails-templates
#= require angular-cookie.min
#= require angular-animate.min
#= require angularjs-file-upload
#= require jquery.mCustomScrollbar.min
#= require scrollbars
#= require ng-token-auth.min
#= require ui-bootstrap-tpls-1.3.2.min
#= require underscore-min

#= require sugar.min

#= require modules

#= require_tree ./services
#= require_tree ./controllers
#= require_tree ./templates

config = ['$httpProvider', '$stateProvider', '$urlRouterProvider', ($httpProvider, $stateProvider, $urlRouterProvider) ->

  $httpProvider.defaults.headers.common["Accept"] = 'application/json'

  $urlRouterProvider.otherwise('/index')

  $stateProvider
    .state 'main',
      abstract: true
      url: ''
      views:
        'navbar@':
          templateUrl: 'navbar.html'
          controller: 'NavbarCtl'

    .state 'main.index',
      url: '/index'
      views:
        'content@':
          templateUrl: 'index.html'
          controller: 'IndexCtl'
      onEnter: ['$rootScope', ($rootScope) ->
        $rootScope.title = 'Добро пожаловать!'
      ]

    .state 'main.universities',
      abstract: true
      url: '/universities'
   
    .state 'main.universities.index',
      url: '/index'
      views:
        'content@':
          templateUrl: 'universities/index.html'
          controller: 'UniversitiesIndexCtl'
      params:
        filter: {}
      onEnter: ['$rootScope', ($rootScope) ->
        $rootScope.title = 'Список университетов'
      ]

    .state 'main.universities.create',
      url: '/create'
      views:
        'content@':
          templateUrl: 'universities/create.html'
          controller: 'UniversitiesCreateCtl'
      onEnter: ['$rootScope', ($rootScope) ->
        $rootScope.title = 'Создать университет'
      ]

    .state 'main.universities.update',
      url: '/update/:id'
      views:
        'content@':
          templateUrl: 'universities/update.html'
          controller: 'UniversitiesUpdateCtl'
      onEnter: ['$rootScope', ($rootScope) ->
        $rootScope.title = 'Обновить университет'
      ]

    .state 'main.universities.show',
      url: '/show/:id'
      views:
        'content@':
          templateUrl: 'universities/show.html'
          controller: 'UniversitiesShowCtl'
      onEnter: ['$rootScope', ($rootScope) ->
        $rootScope.title = 'Просмотр университета'
      ]

    .state 'main.vocs',
      url: '/vocs'
      views:
        'content@':
          templateUrl: 'vocs.html'
          controller: 'VocsCtl'
      onEnter: ['$rootScope', ($rootScope) ->
        $rootScope.title = 'Vocabularies'
      ]

    .state 'main.admin',
      url: '/admin'
      abstract: true

    .state 'main.admin.users',
      url: '/users_manage'
      views:
        'content@':
          templateUrl: 'admin/users.html'
          controller: 'AdminUsersCtl'
      onEnter: ['$rootScope', ($rootScope) ->
        $rootScope.title = 'Users manage'
      ]


]
      
angular.module('students').config(config).filter('isEmpty', [() ->
  return (object) ->
    return angular.equals({}, object)
]).directive('ngConfirmClick', [
  () ->
    return link:  (scope, element, attr) ->
        msg = attr.ngConfirmClick || "Are you sure?"
        clickAction = attr.confirmedClick
        element.bind('click', (event) ->
          if window.confirm(msg)
            scope.$eval(clickAction)
        )
]).config(['$authProvider', ($authProvider) ->
  $authProvider.configure({
    omniauthWindowType: 'newWindow'
  })
])
