angular.module('TestApp',[
  'templates'
  'ngRoute'
  'ngResource'
]).config([
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.when('/',
      controller: 'HomeCtrl'
      templateUrl: 'angularjs/index.html')
      .otherwise redirectTo: '/'
    return
])
