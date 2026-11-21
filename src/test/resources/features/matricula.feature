# language: es
@p1
Característica: Matrícula del alumno

  Antecedentes:
    Dado que Pedro consulta la API de matricula
    Y el alumno "i202610006" inicia sesión con la clave "Cibertec2026"

  Escenario: Cotizar Base de Datos Avanzado
    Cuando cotiza el curso "BD5410"
    Entonces el codigo de respuesta es 200
    Y el total de la cotización es 480

  Escenario: Matricularse y pagar Base de Datos Avanzado
    Cuando cotiza el curso "BD5410"
    Entonces el codigo de respuesta es 200
    Cuando se matricula en el curso "BD5410"
    Entonces el codigo de respuesta es 201
    Y la matrícula queda "REGISTRADA"
    Y el monto de la matrícula coincide con la cotización
    Y la respuesta cumple el esquema "matricula.json"
    Cuando paga la matrícula sin cuerpo
    Entonces el codigo de respuesta es 200
    Y la matrícula queda "PAGADA"
    Y la fecha de pago tiene valor
    Cuando consulta sus pagos
    Entonces el codigo de respuesta es 200
    Y su matrícula tiene un pago con método "EFECTIVO" y operación con formato "OP-[0-9]{6}"

  Escenario: Rechazar matrícula en un curso sin vacantes
    Cuando se matricula en el curso "IA5513"
    Entonces el codigo de respuesta es 409
    Y el codigo de error es "SIN_VACANTES"
    Y la respuesta cumple el esquema "error.json"
