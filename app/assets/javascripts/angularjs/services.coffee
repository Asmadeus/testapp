angular.module('TestApp')
  .factory('MusicService', [
    '$resource'
    '$http'
    ($resource, $http) ->


      getMusicList = (params) ->
        $http
          method: 'GET'
          url: '/list'
          # params:
          #   page: params.page


      getMusicList: getMusicList
    ])
