Feature: create POST

 Background:
   * def config = karate.call('classpath:karate-config.js')
   * def urlDataRemesas = config.urlCreteClientsRemesas
   * def urlRemitenses = config.urlRemitenses
   * def xApiKeyRemesas = config.xApiKeyRemesas
   * def contentTypeRemesas = config.contentTypeRemesas
   * configure ssl = true

  @create-data-remesas
  Scenario: create data remesas
    Given url urlDataRemesas + "recibir"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = xApiKeyRemesas
    And header Content-Type = contentTypeRemesas
    And request encryptedToken
    When method POST
    Then status 200

  @for-loop-data-remesas
  Scenario: for loop data remesas
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

  @create-data-remesas-receive
  Scenario: create data remesas receive
    Given url urlRemitenses + "remesas/api/transaccion/recibir"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = xApiKeyRemesas
    And header Content-Type = contentTypeRemesas
    And request encryptedToken
    When method POST
    Then status 200

  @for-loop-remesas-receive
  Scenario: for loop remesas receive
    * def encryptedDataList = read('../../csv/remesas_autogestion/data_remesas.csv')

    * def stepsToRepeat =
    """
      function(index, item) {
        karate.log('Executing iteration ' + item + ', Encrypted Data: ' + index);
        var currentEncryptedToken = karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId, data: index });
        karate.log('Encrypted Token: ' + currentEncryptedToken);
        karate.call('create_clients_remesas.feature@create-data-remesas-receive', { encryptedToken: currentEncryptedToken.response });
      }
    """
    * karate.forEach(encryptedDataList, stepsToRepeat)

  @create-data-remesas-send
  Scenario: create data remesas send
    Given url urlRemitenses + "remesas/api/transaccion/enviar"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = xApiKeyRemesas
    And header Content-Type = contentTypeRemesas
    And request encryptedToken
    When method POST
    Then status 200

  @for-loop-remesas-send
  Scenario: for loop remesas send
    * def encryptedDataList = read('../../csv/remesas_autogestion/data_remesas_enviar.csv')

    * def stepsToRepeat =
    """
      function(index, item) {
        karate.log('Executing iteration ' + item + ', Encrypted Data: ' + index);
        var currentEncryptedToken = karate.call('encript_data.feature@encrypt-data', { tokenId: tokenId, data: index });
        karate.log('Encrypted Token: ' + currentEncryptedToken);
        karate.call('create_clients_remesas.feature@create-data-remesas-send', { encryptedToken: currentEncryptedToken.response });
      }
    """
    * karate.forEach(encryptedDataList, stepsToRepeat)

