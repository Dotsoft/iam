'use strict'

###*
 # @ngdoc directive
 # @name iamApp.directive:entry
 # @description
 # # entry
###
angular.module('iamApp')
  .directive('entry', ->
    templateUrl: '/views/directives/entry.html'
    restrict: 'E'
    link: (scope, element, attrs) ->

  )
