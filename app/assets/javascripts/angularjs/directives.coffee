angular.module('TestApp').directive('infiniteScroll', [
  ->
    restrict: 'A'
    link: (scope, element, attrs) ->
      raw = element[0]
      element.bind('scroll', _.throttle(
        ->
          if raw.scrollTop + raw.offsetHeight >= raw.scrollHeight
            scope.$apply(attrs.infiniteScroll)
        , 200 )
      )
])
