'use strict'

###*
 # @ngdoc function
 # @name iamApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the iamApp
###
angular.module('iamApp')
  .controller 'MainCtrl', ($scope) ->
    $scope.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
