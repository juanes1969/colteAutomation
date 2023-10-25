Feature: Members get post update delete

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def createUser = read('../data/CreateUser.json')
    * def urlBase = config.baseUrl
    * def apiKey = config.xApiKey
    * def secretKey = config.secretKey
    * def bodyEncrypt = config.bodyEncrypt
    * configure ssl = true

  @create-members
  Scenario Outline: post members
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUser
    When method POST
    Then status 200
    Examples:
      | read('../csv/customer.csv') |


  @create-members2
  Scenario Outline: post members2
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUser
    When method POST
    Then status 200
    * def resposeInitial =  karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId })
    * print resposeInitial.response 

    Examples:
      | read('../csv/customer.csv') |

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


