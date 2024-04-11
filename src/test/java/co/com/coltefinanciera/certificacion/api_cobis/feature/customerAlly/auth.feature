Feature: Auth post

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def urlBase = config.baseUrl
    * def accountUrl = config.urlAccount
    * def apiKey = config.xApiKeyAuth
    * def authToken = read('../../data/customerAlly/auth.json')
    * configure ssl = true

  Scenario: Create prospect natural
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create', { tokenId: token })

  Scenario: Create prospect natural with peps
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
   # * karate.call('members.feature@create-with-peps', { tokenId: token })
    * karate.call('members.feature@create-client-natural', { tokenId: token })

  Scenario: Create prospect natural with financial information
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create-with-financial-information', { tokenId: token })
    #* karate.call('members.feature@create-client-natural', { tokenId: token })


  Scenario: Create juridic prospect
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create', { tokenId: token })


  Scenario: Create juridic client
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('members.feature@create-client-juridic', { tokenId: token })


  Scenario: create natural client and account
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    #* karate.call('members.feature@create', { tokenId: token })
    * karate.call('members.feature@create-client-natural', { tokenId: token })

  Scenario: create data autogestion remesas
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('create_clients_remesas.feature@for-loop-data-remesas', { tokenId: token })

  Scenario: create data autogestion remesas recibir
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('create_clients_remesas.feature@for-loop-remesas-receive', { tokenId: token })

  Scenario: create data autogestion remesas enviar
    Given url urlBase + 'auth'
    And header x-api-key = apiKey
    And request authToken
    When method POST
    Then status 200
    * def token = response.token
    * print 'Token:', token
    * karate.call('create_clients_remesas.feature@for-loop-remesas-send', { tokenId: token })