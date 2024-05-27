Feature: Validate payment

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def urlBase = config.url
    * configure ssl = true
    * path '/payment-management/v0/transaction/validar'

  @ValidateTransaction
  Scenario Outline: Validate transaction
    * def resposeInitial = karate.call('authCore.feature@GetToken')
    * print resposeInitial
    * def tokenId = resposeInitial.token
    * print tokenId
    * def transaction =  read('../csv/dataTransaction.csv')
    * def codTransaction = transaction[<index>].codTransaccion
    * def codReceptor = transaction[<index>].codEntidadReceptora
    * def codOrigen = transaction[<index>].codEntidadOriginadora
    * def name = transaction[<index>].nombreOriginador
    * def account = transaction[<index>].cuentaOrigenOriginador
    * def idOrigen = transaction[<index>].idOriginador
    * def dateOrigen = transaction[<index>].fechaTransaccion
    * def amount = transaction[<index>].monto
    * def dataJson = read('../data/transactionBody.json')
    Given url urlBase
    And header Authorization = 'Bearer ' + tokenId
    And request dataJson
    When method POST
    Then status 200
    * print response
    Examples:
      | index |
      | 0     |

