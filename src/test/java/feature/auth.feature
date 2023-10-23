Feature: Auth post

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def urlBase = config.baseUrl
    * def apiKey = config.xApiKey
    * def authToken = read('../data/auth.json')
    * configure ssl = true

  Scenario: Obtener Token
    Given url urlBase + 'auth'
    And header x-api-key = 'f6fc4c72-d79a-4429-92f1-39f6753602c6'
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create-members', { tokenId: token })
