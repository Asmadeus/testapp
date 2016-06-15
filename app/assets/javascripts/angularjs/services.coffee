angular.module('TestApp')
  .factory('MusicService', [
    '$http'
    ($http) ->
      getMusicList = (params) ->
        $http
          method: 'GET'
          url: '/list'
          params:
            page: params.page
            limit: params.limit

      getMusicList: getMusicList
    ])
