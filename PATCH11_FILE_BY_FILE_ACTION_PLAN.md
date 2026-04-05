# Patch11 File-by-File Action Plan
## Plan de trabajo concreto para aplicar el método de Patch2 sobre Patch11

Este documento convierte la documentación previa en acciones prácticas.

Documentos de referencia:

- `PATCH2_UI_RENDER_NOTES.md`
- `DATA_PATCH_PATCH2_MATRIX.md`
- `PATCH2_TO_PATCH11_MATRIX.md`

La meta es clara:

- conservar la lógica y contenido nuevo de `Patch11`
- portar desde `Patch2` la forma correcta de representar el inglés
- evitar reemplazos ciegos que rompan el mod

---

## Regla general de trabajo

Para cada archivo de `Patch11`, primero separar sus cambios en estas categorías:

### A. Lógica nueva del mod
Contenido que solo existe en Patch11:
- nuevas opciones
- nuevas escenas
- nuevos eventos
- nuevas estructuras de datos
- nuevas rutas o menús

### B. Traducción visible
Texto que ve el jugador:
- labels
- captions
- prompts
- botones
- nombres visibles
- menús
- mensajes

### C. Presentación inglesa
Reglas necesarias para que el inglés se vea bien:
- `displayName`
- `font.getTextWidth(...)`
- recorte por ancho visual
- ajuste de tamaño de fuente
- limpieza/restauración de nombres
- eliminación de límites rígidos hechos para japonés

---

## Criterios de decisión

### Copiar
Solo cuando:
- Patch11 no tenga ese archivo
- o Patch11 no modifique esa parte de la lógica

### Mergear
Cuando:
- el archivo exista en Patch2 y Patch11
- Patch11 tenga lógica nueva que no se puede perder
- Patch2 aporte una mejor forma de mostrar el inglés

### Revisar manualmente
Cuando:
- haya texto hardcodeado
- haya coordenadas fijas
- haya cortes por longitud
- haya listas con nombres largos
- haya nombres visibles que sigan saliendo desde `name`

---

# Plan por archivo

---

## 1) `master.tjs`
### Estado
**Acción: MERGE MANUAL OBLIGATORIO**

### Por qué
Es el archivo más importante para la base conceptual del proyecto.

Patch2 aporta aquí:
- uso de `displayName`
- separación entre texto interno y visible
- soporte de traducciones especiales
- infraestructura de traducción que evita romper claves internas

Patch11 probablemente aporta:
- contenido nuevo del mod
- nuevas estructuras o referencias
- lógica nueva que no existe en Patch2

### Qué portar desde Patch2
- cualquier estructura basada en `displayName`
- helpers para obtener texto visible
- lógica de traducciones especiales
- cualquier fallback seguro entre `displayName` y `name`

### Qué NO perder de Patch11
- nuevas variables
- nuevas referencias
- nuevas tablas del mod
- nuevas funciones de control
- cualquier contenido exclusivo del mod

### Qué buscar dentro del archivo
- `.name`
- `displayName`
- `extraTranslations`
- funciones de carga de datos
- generación de nombres visibles
- quests, jobs, magias, razas, items, mapas o categorías nuevas

### Patrón recomendado
```js
var visibleName = obj.displayName ? obj.displayName : obj.name;
```

### Checklist
- ¿Existe displayName para contenido nuevo del mod?
- ¿Las nuevas entradas del mod siguen separando nombre interno y visible?
- ¿Se mantiene toda lógica nueva de Patch11?
- ¿Hay textos visibles que todavía salen desde valores internos crudos?

## 2) `addfunc.tjs`
### Estado
**Acción: PORTAR COMO BASE DE SOPORTE**

### Por qué
Es el archivo natural para helpers de strings, recortes y utilidades de UI.

### Qué portar desde Patch2
- helpers de recorte por ancho visual
- funciones reutilizables para limitar strings largas
- utilidades que dependan de font.getTextWidth(...)
- Qué revisar en Patch11
- si el mod ya agregó helpers propios
- si esos helpers chocan o se duplican
- si hay ventanas nuevas del mod que podrían usar estas funciones

### Qué buscar dentro del archivo
- `font.getTextWidth(`
- funciones de recorte
- funciones utilitarias de texto
- tratamiento de strings largas

### Checklist
- ¿Hay helper de recorte por ancho visual?
- ¿Se puede reutilizar desde otros .tjs del mod?
- ¿El mod necesita helpers nuevos para menús agregados?

## 3) `bar.tjs`
### Estado

**Acción: MERGE PRIORITARIO**

### Por qué
Es uno de los archivos más sensibles al cambio de idioma.

### Suele manejar:

- menús
- listas
- nombres visibles
- precios
- estados
- quests o acciones

Patch2 aporta aquí uno de los modelos más claros de adaptación inglesa.

Qué portar desde Patch2
uso de displayName
alineación por ancho visual
abandono de padding fijo por espacios
labels visibles correctamente traducidos
tratamiento correcto de listas con nombre + valor
Qué NO perder de Patch11
nuevas opciones del mod
nuevos comandos
nuevos caminos del menú
nuevas condiciones o validaciones
Qué buscar dentro del archivo
" ".repeat(
obj.name
drawText(
write(
precios
listas
nombres de quest/item/meal/action
botones o labels en japonés
Señales de riesgo
cadenas alineadas por cantidad de caracteres
nombres visibles saliendo desde name
botones nuevos del mod sin traducción visible
listas que se rompen con nombres ingleses largos
### Checklist
- ¿Las listas usan displayName?
- ¿La alineación se basa en ancho visual?
- ¿Los menús nuevos del mod usan el mismo criterio?
- ¿Quedan labels en japonés?
- ¿Los nombres largos siguen viéndose bien?
4) inventory.tjs
Estado

Acción: MERGE OBLIGATORIO

Por qué

El inventario suele romperse fácil con inglés por:

nombres largos
categorías
cantidades
descripciones
columnas ajustadas al japonés
Qué portar desde Patch2
nombres visibles traducidos
uso de displayName
tratamiento correcto de listas y columnas
helpers de recorte o ancho visual si aplica
Qué NO perder de Patch11
nuevos ítems del mod
nuevas categorías
filtros nuevos
lógica nueva del inventario
Qué buscar dentro del archivo
.name
listas de items
columnas
cantidades
drawText(
write(
length
substr(
labels en japonés
Checklist
 ¿Los ítems del mod tienen nombre visible separado?
 ¿Las columnas resisten nombres ingleses más largos?
 ¿Las categorías nuevas están adaptadas?
 ¿Hay recorte visual seguro donde haga falta?
5) option.tjs
Estado

Acción: MERGE RECOMENDADO

Por qué

La UI de opciones suele tener:

labels cortos
botones pequeños
valores centrados
nombres de teclas
textos compactos

Eso hace que el inglés choque más fácil con el layout original.

Qué portar desde Patch2
labels ingleses
centrado por ancho visual
uso de font.getTextWidth(...)
recorte o ajuste cuando el texto sea demasiado largo
Qué NO perder de Patch11
nuevas opciones del mod
nuevas teclas o configuraciones
lógica nueva de controles
Qué buscar dentro del archivo
labels
nombres de teclas
font.getTextWidth(
drawText(
write(
coordenadas fijas
cadenas japonesas
Checklist
 ¿Todos los labels visibles están en inglés?
 ¿Los textos quedan centrados correctamente?
 ¿Las opciones nuevas del mod mantienen ese criterio?
 ¿Hay algún label que se salga del área?
6) inn.tjs
Estado

Acción: MERGE RECOMENDADO

Por qué

Las interfaces de posada o selección de habitación suelen tener poco espacio.
El inglés suele ocupar más que el japonés en botones y placas pequeñas.

Qué portar desde Patch2
lógica de nombres visibles
adaptación de labels pequeños
control de ancho visual
posibles ajustes de posición o recorte
Qué NO perder de Patch11
nuevas opciones de posada
nuevas rutas del mod
eventos nuevos relacionados
Qué buscar dentro del archivo
nombres de cuarto
opciones pequeñas
drawText(
write(
labels en japonés
coordenadas ajustadas al límite
Checklist
 ¿Los nombres caben correctamente?
 ¿Las opciones nuevas del mod se ven bien en inglés?
 ¿Hay elementos que necesiten recorte visual?
7) party.tjs
Estado

Acción: MERGE RECOMENDADO

Por qué

La pantalla de party puede tener:

nombres de personajes
estados
globo o cuadros pequeños
listas laterales
información compacta
Qué portar desde Patch2
uso de nombres visibles
ajustes de fuente si el ancho se excede
tratamiento visual del texto del grupo
Qué NO perder de Patch11
personajes nuevos
estados nuevos
lógicas nuevas del party
menús extra del mod
Qué buscar dentro del archivo
nombres visibles
font.size
font.getTextWidth(
drawText(
cajas pequeñas
labels en japonés
Checklist
 ¿Los nombres del party usan salida visible separada?
 ¿El texto sigue siendo legible si el nombre es largo?
 ¿Los menús nuevos del mod mantienen la misma lógica?
8) yesnodialog.tjs
Estado

Acción: MANTENER LÓGICA DE PATCH2 O COPIAR SI PATCH11 NO LO REEMPLAZA

Por qué

Patch2 ya resuelve correctamente un caso típico de UI rota por herencia japonesa:

caption traducido
botones traducidos
eliminación del corte fijo perjudicial para inglés
Qué portar desde Patch2
Confirm
Yes
No
eliminación de corte rígido por longitud fija
fuente apta para inglés
Qué revisar
si Patch11 introduce cuadros similares en otro archivo
si hay prompts nuevos que usan la misma lógica antigua
Checklist
 ¿Los confirm dialogs del mod siguen este criterio?
 ¿Hay otros cuadros similares aún usando lógica japonesa?
9) MainWindow.tjs
Estado

Acción: MANTENER LÓGICA DE PATCH2 SALVO CONFLICTO DIRECTO

Por qué

Patch2 ya adapta:

prompts principales
mensajes de cierre
mensajes de error
información de versión
mensajes visibles del frontend
Qué portar desde Patch2
toda traducción visible de sistema
cualquier mejora de presentación que no choque con lógica del mod
Qué revisar
si Patch11 toca también flujos del frontend principal
si hay mensajes nuevos del mod visibles desde esa ventana
Checklist
 ¿Los mensajes del sistema siguen en inglés?
 ¿El mod agrega textos nuevos en esta capa?
 ¿Se puede mantener la versión de Patch2 sin conflicto?
10) board.tjs
Estado

Acción: USAR COMO MODELO O PORTAR SI HACE FALTA

Por qué

Sirve como referencia para:

listados
boards
selección de comandos
cuadros donde el texto se centra o alinea
Qué portar desde Patch2
uso de nombres visibles
restauración/limpieza antes de mostrar texto
centrado por ancho real
Qué revisar en Patch11
si el mod agrega paneles similares
si hay listados nuevos que puedan heredar este método
Checklist
 ¿Hay paneles nuevos del mod con comportamiento parecido?
 ¿Conviene reutilizar la lógica visual de este archivo?
Orden de implementación recomendado
Fase 1 — Base conceptual

Trabajar primero estos archivos:

master.tjs
addfunc.tjs

Objetivo:

asegurar la infraestructura para texto visible, traducción especial y helpers de ancho
Fase 2 — Menús principales

Trabajar después:

bar.tjs
inventory.tjs
option.tjs

Objetivo:

hacer que las interfaces más expuestas del mod ya respeten el método inglés de Patch2
Fase 3 — Menús compactos y secundarios

Luego:

inn.tjs
party.tjs
board.tjs

Objetivo:

adaptar pantallas más chicas o sensibles a overflow
Fase 4 — Prompts y sistema

Finalmente:

yesnodialog.tjs
MainWindow.tjs

Objetivo:

cerrar la consistencia general de la UI
Patrones a buscar en todos los archivos

Buscar especialmente estas señales:

obj.name
.name
drawText(
write(
length
substr(
slice(
" ".repeat(
font.getTextWidth(
font.size
labels en japonés
captions en japonés
botones en japonés
Regla de oro
No copiar texto solamente

Si Patch2 arregla un archivo, casi nunca alcanza con copiar solo las cadenas traducidas.

También hay que revisar:

cómo se elige el texto visible
cómo se mide
cómo se alinea
cómo se recorta
cómo se dibuja
Resultado esperado

Cuando este plan esté aplicado correctamente:

Patch11 conservará todo su contenido nuevo
la UI del mod mostrará el inglés con el mismo criterio sólido de Patch2
los nombres visibles no romperán lógica interna
los menús serán más estables frente a cadenas largas
se reducirá el riesgo de texto cortado, desalineado o mal representado
Cierre

Patch2 resuelve el método.
Patch11 aporta el contenido nuevo.
Este plan existe para unir ambos sin perder ni la traducción ni el mod.
