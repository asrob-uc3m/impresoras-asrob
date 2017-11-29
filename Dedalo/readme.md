# Información sobre Dedalo

ARCHIVOS DE CONFIGURACIÓN DE LA IMPRESORA DEDALO:

Configuration.h -> Fichero de configuración de Marlin Firmware (a bordo de la SANGUINO). Contiene
parámetros imprescindibles para el correcto funcionamiento de la impresora.

Configuration_adv.h -> Fichero de configuración de Marlin Firmware (a bordo de la SANGUINO). Contiene
los parámetros del Thermal Control.

Dedalo_Slic3r_config_bundle.ini -> Archivo de configuración más importante, exportado desde Slic3r,
para usarlo seguir las siguientes instrucciones dentro del programa 
Repetier-Host -> Slic3r/Configure/-> File -> Load Config..

DEDALO EEPROM DATA.mepr -> Archivo de configuracion de Repetier. Actualmente no necesario, dado que tiene los 
parametros cargados en Marlin Firmware.

Parts -> Carpeta con piezas utilizadas en la impresora. En caso de rotura de alguna de ellas o malfuncionamiento
de alguna de ellas.
