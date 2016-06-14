angular.module('TestApp')
  .filter('startFrom', ->
    (array, start) ->
      if array
        # start = +start
        return array.slice(+start)
      return []
    )
