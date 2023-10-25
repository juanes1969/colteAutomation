Feature: Auth post

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def urlBase = config.baseUrl
    * def apiKey = config.xApiKeyAuth
    * def authToken = read('../data/auth.json')
    * configure ssl = true

  Scenario: Get auth Token
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create-client-cobis', { tokenId: token })
