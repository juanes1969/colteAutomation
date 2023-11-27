Feature: Members get post update delete

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def createUser = read('../../data/customerAlly/CreateUser.json')
    * def createUserAlly = read('../../data/customerAlly/userAlly.json')
    * def urlBase = config.baseUrl
    * def accountUrl = config.urlAccount
    * def apiKey = config.xApiKey
    * def secretKey = config.secretKey
    * def bodyEncrypt = config.bodyEncrypt
    * configure ssl = true

  @create-client-juridic
  Scenario Outline: Create juridic client
    * def resposeInitial =  karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId })
    * print resposeInitial
    * print resposeInitial.response
    Given url accountUrl + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request resposeInitial.response
    When method PUT
    Then status 200
    Examples:
      | read('../../csv/juridicClient.csv') |

  @create
  Scenario Outline: Create natural prospect
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUserAlly
    When method POST
    Then status 200
    Examples:
      | read('../../csv/customerAlly/otherClient.csv') |

  @create-client-natural
  Scenario: create natural client
   # * karate.call('members.feature@create-members', { tokenId: token })
    * def resposeInitial =  karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId })
    * print resposeInitial
    * print resposeInitial.response
    Given url accountUrl + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request resposeInitial.response
    When method PUT
    Then status 200




  @create-propect-juridic
  Scenario Outline: Create juridic prospect
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUserAlly
    When method POST
    Then status 200
    Examples:
      | read('../../csv/customerAlly/juridicClient.csv') |


  @create-account
  Scenario: post account
    Given url karate.get('baseUrl') + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request resposeInitial
    When method POST
    Then status 200