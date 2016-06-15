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
      $scope.modalIsOpen = false

      # $scope.list = MusicService.getMusicList()

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

      $scope.page = 1
      $scope.list = []

      $scope.loadNewItems = ->
        MusicService.getMusicList(page: $scope.page).then (response) ->
          $scope.list = $scope.list.concat(response.data)
          $scope.page++

  ])
