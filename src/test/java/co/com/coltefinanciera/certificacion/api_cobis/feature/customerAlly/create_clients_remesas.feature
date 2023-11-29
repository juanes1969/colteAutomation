Feature: create POST

 Background:
   * def config = karate.call('classpath:karate-config.js')
   * def urlRemesas = config.urlCreteClientsRemesas
   * def xApiKeyRemesas = config.xApiKeyRemesas
   * def contentTypeRemesas = config.contentTypeRemesas
   * configure ssl = true

  @create-data-remesas
  Scenario: create data remesas
    Given url urlRemesas + "recibir"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = xApiKeyRemesas
    And header Content-Type = contentTypeRemesas
    And request encryptedToken
    When method POST
    Then status 200

  @for-loop-remesas
  Scenario: for loop remesas
    * def encryptedDataList = read('../../csv/remesas_autogestion/data_remesas.csv')

    * def stepsToRepeat =
    """
      function(index, item) {
        karate.log('Executing iteration ' + item + ', Encrypted Data: ' + index);
        var currentEncryptedToken = karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId, data: index });
        karate.log('Encrypted Token: ' + currentEncryptedToken);
        karate.call('create_clients_remesas.feature@create-data-remesas', { encryptedToken: currentEncryptedToken.response });
      }
    """
    * karate.forEach(encryptedDataList, stepsToRepeat)
