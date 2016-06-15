angular.module('TestApp')
  .filter('startFrom', ->
    (array, start) ->
      if array
        return array.slice(+start)
      return []
    )
