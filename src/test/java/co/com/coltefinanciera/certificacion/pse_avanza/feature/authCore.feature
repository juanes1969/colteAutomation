Feature: Auth post

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def urlBase = config.url
    * configure ssl = true
    * path '/authorization/api/auth/signin'

  @GetToken
  Scenario: Get token core login
    * def Login = read('../data/loginBody.json')
    Given url urlBase
    And request Login
    When method POST
    Then status 200
    * print response
    * def token = response.data[0].token
    * print 'Token:', token

