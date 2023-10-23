Feature: Members get post update delete

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def createUser = read('../data/CreateUser.json')
    * def urlBase = config.baseUrl
    * def apiKey = config.xApiKey
    * configure ssl = true

  @create-members
  Scenario: Get members
    Given url config.baseUrl + 'customers'
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUser
    When method POST
    Then status 200




