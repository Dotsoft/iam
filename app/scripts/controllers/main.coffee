'use strict'

###*
 # @ngdoc function
 # @name iamApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the iamApp
###
angular.module('iamApp')
  .controller 'MainCtrl', ($scope, $http, $q, $timeout, $window, Entries) ->
    Entries.getAll().then (response) ->
      $scope.entries = response.data

    matchEntry = (text = "") ->
      matchesFix = (arr) -> arr[k] = v.substr(1) for k, v of arr
      return {
        description: text
        projects: matchesFix text.match(/(?:\#)(\w+)/g)
        people: matchesFix text.match(/(?:\@)(\w+)/g)
        minutes: matchesFix text.match(/(?:\+)(\w+)/g)
      }

    $scope.checkEntry = (text, event) =>
      if event?.which is 27 and $window?.win?
        $window.win.blur()
        $window.win.close()
        $window.win = false
        return
      else if event?.which is 13 and angular.element("mentio-menu:visible").length is 0 and $scope.valid is true
        $scope.entries.push matchEntry(text)
        $scope.theText = ""
        return
      entry = matchEntry(text)
      missing = []
      missing.push "project code" if entry.projects.length is 0
      missing.push "time code" if entry.minutes.length is 0
      if missing.length isnt 0
        $scope.valid = false
        $scope.message = "Missing #{missing.join(', ')}."
      else
        $scope.valid = true
        $scope.message = ""

    $scope.checkEntry()

    # $scope.addEntry = (text) =>
    #   return if angular.element("mentio-menu:visible").length > 0
    #   return if $scope.valid is false
    #   $scope.entries.push matchEntry(text)
    #   $scope.theText = ""

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
