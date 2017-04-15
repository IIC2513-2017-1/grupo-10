# **Actores**

* Usuario anónimo
* Usuario
* Organizador

# **Casos de Uso**

* Ingresar al sistema
    * Usuario u organizador pueden crear una cuenta.
    * Usuario u organizador se loguea.


* Generar rifa
    * Requiere login de Organizador.
    * Organizador elige datos para la rifa (nombre, duración, premios, etc).


* Ver rifas disponibles
    * Las rifas con fecha de término más cercano se puede ver (cualquier usuario) primero.
    * Se puede ver el tiempo que falta, cantidad de números disponible y precio de la rifa.
    * Se ve el resumen de reacciones a la rifa.


* Participar en rifa
    * Requiere login de Usuario
    * Se ve la descripción de premios.
    * Los número que se pueden comprar se pueden identificar.
    * Se pueden seleccionar los números que se quieren comprar.
    * Se muestra el total a pagar por lo números.
    * Al usuario se le confirma la compra de sus números.


* Ver resultados de rifa
    * Requiere login de usuario o organizador.
    * Es posible ver en una rifa cerrada a los ganadores.


* Ver historial de participación
    * Requiere login de Usuario.
    * Se pueden ver las rifas en las que estoy y las que he participado.


* Ver historial de rifas organizadas.
    * Requiere login de Organizador.
    * Se pueden ver las rifas en las que estoy y las que he organizado.


* Reaccionar a la rifa
    * Requiere login de Usuario.
    * El usuario puede reaccionar dependiendo de la relación premios/precio.


* Invitar amigos a una rifa
    * Requiere login de Usuario u Organizador.
    * Es posible enviar invitación a un amigo (link o Facebook).


* Generar sorteo
    * Requiere login de Organizador.
    * Se verifica que las ventas estén cerradas.
    * Se elige al azar la cantidad de números como premios haya.
    * Se notifica a los ganadores de su premio.
    * Se publican los ganadores en la página de la rifa.


* Eliminar cuenta
    * Requiere login de Usuario u Organizador.
    * Es posible eliminar cuenta y toda su información.


* Cerrar venta de rifas
    * Requiere login de Organizador.
    * Se cierran las ventas de números por el organizador.
    * Se cierran las ventas de números porque se acabaron los números.
