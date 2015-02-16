'use strict'

###*
 # @ngdoc function
 # @name iamApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the iamApp
###
angular.module('iamApp')
  .controller 'MainCtrl', ($scope, $http, $q, $timeout) ->
    $scope.searchProjects = (term) ->
      projList = []
      return $http.get('projects.json').then (response) ->
        angular.forEach response.data, (item) ->
          if item.title.toUpperCase().indexOf(term.toUpperCase()) >= 0
            projList.push item
          return
        $scope.projects = projList
        $q.when projList

    $scope.searchPeople = (term) ->
      peopleList = []
      return $http.get('people.json').then (response) ->
        angular.forEach response.data, (item) ->
          if item.displayName.toUpperCase().indexOf(term.toUpperCase()) >= 0
            peopleList.push item
          return
        $scope.people = peopleList
        $q.when peopleList

    $scope.getProjectText = (item) ->
      '#<strong>' + item.slug + '</strong>'

    $scope.getProjectTextRaw = (item) ->
      deferred = $q.defer()
      $timeout (->
        deferred.resolve '#' + item.slug
        return
      ), 500
      return deferred.promise

    $scope.getPeopleText = (item) ->
      return '@<i>' + (item.username) + '</i>'

    $scope.getPeopleTextRaw = (item) ->
      return '@' + item.username

    $scope.searchMinutes = (term) ->
      minuteList = []
      return $http.get('minutes.json').then (response) ->
        angular.forEach response.data, (item) ->
          if item.text.toUpperCase().replace(' ', '').indexOf(term.toUpperCase()) >= 0
            minuteList.push item
          return
        $scope.minutes = minuteList
        $q.when minuteList

    $scope.getMinuteText = (item) ->
      return '+<strong>' + (item.username) + '</strong>'

    $scope.getMinuteTextRaw = (item) ->
      return '+' + item.minutes
