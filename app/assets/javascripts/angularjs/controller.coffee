angular.module('TestApp')
  .controller('HomeCtrl', [
    '$scope'
    'MusicService'
    ($scope, MusicService) ->
      $scope.modals =
        'first': false
        'second': false

      $scope.selectList = []
      $scope.pendingList = []
      $scope.indexList = []
      $scope.modalIsOpen = false

      $scope.showModal = (target) ->
        $scope.modals[target] = true

      $scope.closeModal = (target) ->
        $scope.modals[target] = false

      $scope.toggleSelectItem = (item) ->
        if item.select
          item.select = false
          index = $scope.pendingList.indexOf(item)
          $scope.pendingList.splice(index,1)
        else
          item.select = true
          $scope.pendingList.push(item)

      $scope.submitSelected = ->
        angular.copy($scope.selectList, $scope.indexList)
        $scope.closeModal('first')

      $scope.submitPending = ->
        angular.copy($scope.pendingList, $scope.selectList)
        $scope.closeModal('second')

      $scope.page = 1
      $scope.limit = 1000
      $scope.list = []

      $scope.loadNewItems = ->
        MusicService.getMusicList(
          page: $scope.page
          limit: $scope.limit
        ).then (response) ->
          $scope.list = $scope.list.concat(response.data)
          $scope.page++

  ])
