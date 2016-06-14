angular.module('TestApp')
  .controller('HomeCtrl', [
    '$scope'
    'MusicService'
    ($scope, MusicService) ->
      $scope.modals =
        'first': false
        'second': false

      $scope.selectList = []
      $scope.indexList = []
      $scope.modalIsOpen = false;

      $scope.showModal = (target) ->
        $scope.modals[target] = true

      $scope.closeModal = (target) ->
        $scope.modals[target] = false

      $scope.toggleSelectItem = (item) ->
        if item.select
          item.select = false
          index = $scope.selectList.indexOf(item)
          $scope.selectList.splice(index,1)
        else
          item.select = true
          $scope.selectList.push(item)

      $scope.submitSelected = ->
        angular.copy($scope.selectList, $scope.indexList)
        $scope.closeModal('first')

  ])
  .controller('PaginationCtrl',[
    '$scope'
    'MusicService'
    ($scope, MusicService) ->
      $scope.list = MusicService.getMusicList()

      $scope.itemsPerPage = 10
      $scope.currentPage = 0

      $scope.numberOfPage = ->
        Math.ceil($scope.list.length / $scope.itemsPerPage)

      $scope.firstPage = ->
        $scope.currentPage == 0

      $scope.lastPage = ->
        $scope.currentPage == $scope.numberOfPage() - 1

      $scope.toNextPage = ->
        $scope.currentPage++

      $scope.toPrevPage = ->
        $scope.currentPage--

      $scope.firsItemOnPage = ->
        $scope.currentPage * $scope.itemsPerPage

    ])
