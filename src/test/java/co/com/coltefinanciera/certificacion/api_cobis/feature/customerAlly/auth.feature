Feature: Auth post

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def urlBase = config.baseUrl
    * def accountUrl = config.urlAccount
    * def apiKey = config.xApiKeyAuth
    * def authToken = read('../../data/customerAlly/auth.json')
    * configure ssl = true

  Scenario: Create clients natural person
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create', { tokenId: token })


  Scenario: Create clients prospect
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create-client-juridic', { tokenId: token })


  Scenario: Create clients natural
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create-client-natural', { tokenId: token })
