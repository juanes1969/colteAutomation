Feature: Members get post update delete

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def createUser = read('../data/CreateUser.json')
    * def urlBase = config.baseUrl
    * def apiKey = config.xApiKey
    * configure ssl = true

  @create-members
  Scenario Outline: post members
    Given url karate.get('baseUrl') + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUser
    When method POST
    Then status 200
    Examples:
      | read('../csv/customer.csv') |




