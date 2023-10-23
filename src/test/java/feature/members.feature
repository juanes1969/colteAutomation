Feature: Members get post update delete

  Background:
    * def config = karate.call('classpath:karate-config.js')
    * def createUser = read('../data/CreateUser.json')
    * def urlBase = config.baseUrl
    * def apiKey = config.xApiKey
    * configure ssl = true

  @create-members
  Scenario Outline: Get members
    Given url karate.get('baseUrl') + "customers"
    And header Authorization = 'Bearer ' + tokenId
    And header x-api-key = 'a1340d9c-62a3-4636-ab62-015bc770b0a8'
    And request
  """{
  "docType": "#(docType)",
  "docNumber": "#(docNumber)",
  "generalInformation": {
  "primerNombre": "#(primerNombre)",
  "segundoNombre": "#(segundoNombre)",
  "primerApellido": "#(primerApellido)",
  "segundoApellido": "#(segundoApellido)",
  "direccionResidencia": "#(direccionResidencia)",
  "bloqueAptCasa": "#(bloqueAptCasa)",
  "barrioResidencia": "#(barrioResidencia)",
  "ciudadResidencia": "#(ciudadResidencia)",
  "departamentoResidencia": "#(departamentoResidencia)",
  "paisResidencia": "#(paisResidencia)",
  "telefonoResidencia": "#(telefonoResidencia)",
  "celular": "#(celular)",
  "correo": "#(correo)",
  "genero": "#(genero)",
  "fechaNacimiento": "#(fechaNacimiento)",
  "ciudadNacimiento": "#(ciudadNacimiento)",
  "departamentoNacimiento": "#(departamentoNacimiento)",
  "paisNacimiento": "#(paisNacimiento)",
  "profesion": "#(profesion)",
  "nivelEstudios": "#(nivelEstudios)",
  "ocupacion": "#(ocupacion)",
  "estadoCivil": "#(estadoCivil)",
  "numeroPersonasCargo": "#(numeroPersonasCargo)",
  "tipoVivienda": "#(tipoVivienda)",
  "estrato": "#(estrato)",
  "antiguedadVivienda": "#(antiguedadVivienda)",
  "recibirInformacion": "#(recibirInformacion)",
  "autorizaEnvioMensajes": "#(autorizaEnvioMensajes)",
  "medioNotificacionTransacciones": "#(medioNotificacionTransacciones)",
  "declaraOrigenFondos": "#(declaraOrigenFondos)",
  "origenFondos": "#(origenFondos)",
  "cualOtroOrigen": "#(cualOtroOrigen)",
  "autorizacion": "#(autorizacion)",
  "autorizaDestruccionDtos": "#(autorizaDestruccionDtos)",
  "cobranzaPrejudicialColte": "#(cobranzaPrejudicialColte)",
  "autorizacionDeclaraFatcaCRS": "#(autorizacionDeclaraFatcaCRS)",
  "declaracionResponsabilidad": "#(declaracionResponsabilidad)",
  "codAgencia": "#(codAgencia)",
  "codEjecutivo": "#(codEjecutivo)",
  "fechaVinculacion": "#(fechaVinculacion)",
  "ciudadRegistro": "#(ciudadRegistro)",
  "fechaExpedicion": "#(fechaExpedicion)",
  "ciudadExpedicion": "#(ciudadExpedicion)",
  "tiempoEnVivienda": "#(tiempoEnVivienda)",
  "ciudadCorrespondencia": "#(ciudadCorrespondencia)",
  "direccionCorrespondencia": "#(direccionCorrespondencia)",
  "originador": "#(originador)",
  "fuente": "#(fuente)"
  }
  }
  """
    When method POST
    Then status 200
    Examples:
      | read('../csv/customer.csv') |




