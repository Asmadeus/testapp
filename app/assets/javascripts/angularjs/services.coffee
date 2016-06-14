angular.module('TestApp')
  .factory('MusicService', [
    '$resource'
    ($resource) ->
      
      data = $resource('/list').query()
      getMusicList = ->
        return data

      getMusicList: getMusicList
    ])
