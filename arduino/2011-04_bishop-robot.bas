'*************************************************************
'    BISHOP I CODE. Robot built by savesglances & katalan91   
'*************************************************************

'Initializing Constants & Variables --------------------------
	symbol time_led = 500
	'Alerta de proximidad'
	symbol proxwarning = 25
	'Numero de errores para detectar bucle en pared por imprecisión del sensor'
	symbol errormax = 7
	symbol onoff = 0 'Activar y desactivar persistencia del giro 90º desde el comienzo. 0 desactivado. 1 activado'
	'Para contar el tiempo en cualquier movimiento'
	symbol rango = w0
	symbol time_go = w1
	symbol time_max = w2
	symbol active = w3
	symbol errorofficer = w4
	errorofficer = 0
	
'Initializing Servos -----------------------------------------
    	SERVO 1,85
    	SERVO 2,78
   
'Initializing Routine & Check --------------------------------
	'Led signals: 3 pulses means OK
	time_go = 0
	checkroutine:
		if time_go>2 then
			time_go = 0
			gosub MAIN
		endif
		HIGH 0
		PAUSE time_led
		LOW 0
		PAUSE time_led
		time_go = time_go+1
		GOTO checkroutine

'Intializing Movement ----------------------------------------
	MAIN:
      'Initializing Proximity sensor
	'investigar
	pulsout 4,2
    	pulsin 4,1,rango
    	'sensorvalues to cm conversion
    	let rango = rango * 10 / 58
      'Proximity CHECK
      if rango<proxwarning then
      	if active=1 then
      		gosub turns
      	else
        		gosub dontgo
        	endif
      else
      	active=onoff
        	gosub goforward
      endif
    
    	'### MOVIMIENTOS ##################
    	goforward:
    		HIGH 0
    		'mov1
    		SERVOPOS 1,63
    		SERVOPOS 2,58
    		PAUSE 500
    		'mov2
    		SERVOPOS 1,110
    		SERVOPOS 2,98
    		LOW 0
    		PAUSE 500
    		GOTO MAIN

    	turns:
    		if time_go>time_max then
    			time_go =  0
    			time_max = 0
    			active = 0
    			errorofficer = 0
    			gosub goforward
    		endif
  		'mov1
		HIGH 0
		SERVOPOS 1,110
    		SERVOPOS 2,0
    		PAUSE 300
    		LOW 0
    		PAUSE 200
    		'mov2
    		HIGH 0
    		SERVOPOS 1,100
    		SERVOPOS 2,78
    		PAUSE 100
    		LOW 0
    		PAUSE 100
    		time_go = time_go + 1
    		errorofficer = errorofficer + 1
    		if errorofficer>errormax then
    			active=0
    			GOTO turns
    		else
    			GOTO MAIN
    		endif
    		
    dontgo:
    		if time_go>3 then
    			time_go = 0
    			'14 segundos estimados - 90º, 14/0,7 el ciclo, 20, le pongo 21 por redundancia
    			time_max = 21
    			active=1
	    		gosub turns
	    	endif
   		HIGH 0
   		'stop
    		SERVOPOS 1,85
    		SERVOPOS 2,78
    		PAUSE 1000
    		LOW 0
    		time_go = time_go + 1 
    		GOTO MAIN
    	'##################################
   
    	
    	'--------------------------------------------------- ANOTACIONES
    	'INDICACIONES LED
    		'3 iniciales, todo OK
   		'1 pausado, goforward
   		'2 rápidos, goback
   		'1 constante, dontgo
    	'CONVERSIONES ÚTILES'
    		'0,7 segundos cada cilo goback, maniobra 14 segundos estimados, por tanto, 20 ciclos necesarios
    		'gobackright tiene sentido en determinadas ocasiones, estudiar más a fondo'  
    	'ERRORES de construcción estimados:
    		'servo posiciones. del servo 1, 80 es +5 (85)
    		'servo 2 posiciones. del servo 2, 80 es -2 (78)
    	'OBSERVACIONES
    		'mirando desde atras, mas de 80 servo 1 y 2 mueven part.izq hacia abajo

    	
 
    