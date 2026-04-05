\# Notes



\## Estado actual

Objetivo inmediato: aislar qué archivos del Patch2 son necesarios para que la UI en inglés funcione correctamente, sin depender del patch completo.



\## Resultados de pruebas



\### Dependencia global de arranque / traducción

Archivos:

\- first.ks

\- script.ks

\- master.tjs

\- extraTranslations.csv



Resultado:

\- Si se quitan, el juego rompe en arranque.

\- Errores vistos:

&#x20; - Cannot open storage extraTranslations.csv

&#x20; - Member "displayName" does not exist



Conclusión:

\- Este bloque es dependencia global del sistema de traducción / arranque.

\- No conviene quitarlo mientras se aísla la UI.



\---



\### Menú Config

Archivo principal:

\- option.tjs



Conclusión actual:

\- option.tjs controla el menú Config, pero por sí solo no alcanza.

\- Para que Config funcione bien en inglés también depende del bloque global:

&#x20; - first.ks

&#x20; - script.ks

&#x20; - master.tjs

&#x20; - extraTranslations.csv



\---



\### Menú principal y Save/Load

Archivos:

\- board.tjs

\- MainWindow.tjs



Resultado:

\- Al quitarlos, menú principal y save/load quedan desplazados.

\- El menú Config sigue funcionando bien.



Conclusión:

\- board.tjs y MainWindow.tjs afectan menú principal / save-load.

\- No son la causa principal del problema de Config.



\---



\### Archivos NO críticos para Config según pruebas actuales

Archivos probados sin romper Config:

\- gvolume.tjs

\- historylayer.tjs

\- yesnodialog.tjs

\- menus.tjs

\- messagelayer.tjs

\- initialize.tjs

\- config.tjs

\- addfunc.tjs

\- component.tjs



Conclusión:

\- Son auxiliares o afectan otras partes, pero no parecen núcleo del menú Config.



\## Mapa provisional



\### Arranque / traducción global

\- first.ks

\- script.ks

\- master.tjs

\- extraTranslations.csv



\### Config

\- option.tjs

\- apoyado por el bloque global



\### Menú principal / Save-Load

\- board.tjs

\- MainWindow.tjs



\### Auxiliares

\- gvolume.tjs

\- historylayer.tjs

\- yesnodialog.tjs

\- menus.tjs

\- messagelayer.tjs

\- initialize.tjs

\- config.tjs

\- addfunc.tjs

\- component.tjs



\### Prueba 6

Quitados:

\- board.tjs

\- MainWindow.tjs



Resultado:

\- menú principal desplazado

\- save/load desplazado

\- Config sigue bien



Conclusión:

\- board.tjs y MainWindow.tjs afectan menú principal y save/load

\- no son necesarios para Config



\### Prueba 8

Dejados:

\- first.ks

\- script.ks

\- master.tjs

\- extraTranslations.csv

\- option.tjs

\- board.tjs

\- MainWindow.tjs



Quitados:

\- addfunc.tjs

\- component.tjs

\- gvolume.tjs

\- historylayer.tjs

\- yesnodialog.tjs

\- menus.tjs

\- messagelayer.tjs

\- initialize.tjs

\- config.tjs



Resultado:

\- arranque bien

\- menú principal bien

\- save/load bien

\- Config bien



Conclusión:

\- Bloque mínimo funcional actual para UI inglesa:

&#x20; - first.ks

&#x20; - script.ks

&#x20; - master.tjs

&#x20; - extraTranslations.csv

&#x20; - option.tjs

&#x20; - board.tjs

&#x20; - MainWindow.tjs



\### Prueba 10

Validación completa de UI



Resultado:

\- menú principal bien

\- save/load bien

\- camp menu bien

\- todas las pestañas de Config bien



Conclusión:

\- El bloque mínimo funcional provisional para la UI inglesa queda en:

&#x20; - first.ks

&#x20; - script.ks

&#x20; - master.tjs

&#x20; - extraTranslations.csv

&#x20; - option.tjs

&#x20; - board.tjs

&#x20; - MainWindow.tjs

