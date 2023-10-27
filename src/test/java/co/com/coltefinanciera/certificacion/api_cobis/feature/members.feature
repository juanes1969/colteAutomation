Feature: Members get post update delete

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def createUser = read('../data/CreateUser.json')
    * def createUserAlly = read('../data/userAlly.json')
    * def urlBase = config.baseUrl
    * def apiKey = config.xApiKey
    * def secretKey = config.secretKey
    * def bodyEncrypt = config.bodyEncrypt
    * configure ssl = true

  @create-members
  Scenario Outline: Create client prospect
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUser
    When method POST
    Then status 200
    Examples:
      | read('../csv/customer.csv') |

  @create
  Scenario Outline: Create juridic prospect
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUser
    When method POST
    Then status 200
    Examples:
      | read('../csv/otherClient.csv') |



  @create-client-account
  Scenario Outline: create natural client
    * def resposeInitial =  karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId })
    Given url urlBase + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request resposeInitial
    When method POST
    Then status 200

    Examples:
      | read('../csv/encrypted.csv') |


  @create-juridic-account
  Scenario Outline: create natural juridic
    * def resposeInitial =  karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId })
    Given url urlBase + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request resposeInitial
    When method POST
    Then status 200

    Examples:
      | read('../csv/encrypted.csv') |


  @create-account
  Scenario: post account
    Given url karate.get('baseUrl') + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request resposeInitial
    When method POST
    Then status 200



