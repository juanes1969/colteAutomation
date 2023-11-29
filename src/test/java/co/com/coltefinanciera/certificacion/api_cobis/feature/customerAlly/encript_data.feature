Feature: encript data

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def bodyEncrypt = read('../../data/encrypt/encrypted.json')
    * def urlEncrypt = config.urlDecrypt


  @encrypt-data
  Scenario: encrypt data
    Given url urlEncrypt + "encrypt"
    And params { appName: 'co.com.coltefinanciera.masterdebit' }
    And header Authorization = 'Bearer ' + tokenId
    And request data
    When method POST
    Then status 200

