'use strict'

###*
 # @ngdoc function
 # @name iamApp.controller:AboutCtrl
 # @description
 # # AboutCtrl
 # Controller of the iamApp
###
angular.module('iamApp')
  .controller 'AboutCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
