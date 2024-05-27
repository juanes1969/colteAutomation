Feature: Register Transaction

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def urlBase = config.url
    * configure ssl = true
    * path '/payment-management/v0/transaction/registrar'

  @ValidateTransaction
  Scenario Outline: Validate transaction
    * def resposeInitial = karate.call('authCore.feature@GetToken')
    * print resposeInitial
    * def tokenId = resposeInitial.token
    * print tokenId
    * def paymentValidate = karate.call('validate_payment.feature@ValidateTransaction')
    * def otp = paymentValidate.idOtp
    * def numberOtp = paymentValidate.numeroOtp
    * def transaction =  read('../csv/dataRegister.csv')
    * def typeRegister = transaction[<index>].tipoRegistro
    * def codTransaction = transaction[<index>].codTransaccion
    * def codReceptor = transaction[<index>].codEntidadReceptora
    * def codOriginator = transaction[<index>].codEntidadOriginadora
    * def nameOriginator = transaction[<index>].nombreOriginador
    * def accountOriginator = transaction[<index>].cuentaOrigenOriginador
    * def idOriginator = transaction[<index>].idOriginador
    * def descTransaction = transaction[<index>].descTransaccion
    * def date = transaction[<index>].fechaTransaccion
    * def accountReceptor = transaction[<index>].cuentaReceptor
    * def amount = transaction[<index>].monto
    * def nameReceptor = transaction[<index>].nombreReceptor
    * def idReceptor = transaction[<index>].idReceptor
    * def discReceptor = transaction[<index>].discrecReceptor
    * def infoPayment = transaction[<index>].infoPago
    * def idTransaction = transaction[<index>].idTransaccion
    * def idLot = transaction[<index>].idLote
    * def reversion = transaction[<index>].reversion
    * def descLot = transaction[<index>].descLote
    * def rtaACH = transaction[<index>].rtaACH
    * def rtaLocal = transaction[<index>].rtaLocal
    * def recurrent = transaction[<index>].recurrente
    * def idOtp = otp
    * def numeroOtp = numberOtp
    * def dataJson = read('../data/registerTransaction.json')
    Given url urlBase
    And header Authorization = 'Bearer ' + tokenId
    And request dataJson
    When method POST
    Then status 200
    * print response
    Examples:
      | index |
      | 0     |
