'use strict'

###*
 # @ngdoc filter
 # @name iamApp.filter:words
 # @function
 # @description
 # # words
 # Filter in the iamApp.
###
angular.module('iamApp')
  .filter 'words', ->
    (input, words) ->
      if isNaN(words)
        return input
      if words <= 0
        return ''
      if input
        inputWords = input.split(/\s+/)
        if inputWords.length > words
          input = inputWords.slice(0, words).join(' ') + '…'
      return input
