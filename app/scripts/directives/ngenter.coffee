'use strict'

###*
 # @ngdoc directive
 # @name iamApp.directive:ngEnter
 # @description
 # # ngEnter
###
angular.module('iamApp')
  .directive('ngEnter', ->
    return (scope, element, attrs) ->
      element.bind 'keydown keypress', (event) ->
        if event.which == 13
          scope.$apply ->
            scope.$eval attrs.ngEnter
            return
          event.preventDefault()
        return
      return
  )
