Feature: Members get post update delete

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def createUser = read('../../data/customerAlly/CreateUser.json')
    * def createUserAlly = read('../../data/customerAlly/userAlly.json')
    * def createUserAllyWithPeps = read('../../data/customerAlly/createUserWithPep.json')
    * def createUserAllyWithFinancialInformation = read('../../data/customerAlly/createCustomerWithFinancialInformation.json')
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

  @create-with-peps
  Scenario Outline: Create natural prospect with peps
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUserAllyWithPeps
    When method POST
    Then status 200
    Examples:
      | read('../../csv/customerAlly/customerWithPep.csv') |

  @create-with-financial-information
  Scenario Outline: create with financial information
    Given url urlBase + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request createUserAllyWithFinancialInformation
    When method POST
    Then status 200
    Examples:
      | read('../../csv/customerAlly/customerWithFinancialInformation.csv') |

  @create-account-natural-person
  Scenario: create account natural person
    Given url accountUrl + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request encryptedToken
    When method PUT
    Then status 200


  @create-client-natural
  Scenario: create natural client
    * def encryptedDataList = read('../../csv/encryp/encrypted.csv')

    * def stepsToRepeat =
    """
      function(index, item) {
        karate.log('Executing iteration ' + item + ', Encrypted Data: ' + index);
        var currentEncryptedToken = karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId, data: index });
        karate.log('Encrypted Token: ' + currentEncryptedToken);
        karate.call('members.feature@create-account-natural-person', { encryptedToken: currentEncryptedToken.response });
      }
    """
    * karate.forEach(encryptedDataList, stepsToRepeat)

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
    * def resposeInitial =  karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId })
    Given url accountUrl + "accounts"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = apiKey
    And request resposeInitial.response
    When method PUT
    Then status 200