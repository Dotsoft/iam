'use strict'

###*
 # @ngdoc service
 # @name iamApp.Entries
 # @description
 # # Entries
 # Factory in the iamApp.
###
angular.module('iamApp')
  .factory 'Entries', ($http) ->
    {
      getAll: -> return $http.get('entries.json')
    }
