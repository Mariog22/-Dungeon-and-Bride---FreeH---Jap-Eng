# Patch2 → Patch11 Matrix
## Qué tomar de Patch2 para implementar correctamente el inglés en Patch11

Este documento resume cómo usar **Patch2** como modelo de representación inglesa al trabajar sobre **Patch11**.

La idea no es sobrescribir Patch11 con Patch2 de forma ciega.  
La idea correcta es:

- conservar la lógica nueva del mod
- portar desde Patch2 la capa de presentación del inglés
- evitar romper contenido nuevo que solo existe en Patch11

---

## Regla general

### Patch2 aporta principalmente:
- representación correcta del texto en inglés
- separación entre texto interno y visible
- adaptación de UI
- recorte/alineación por ancho visual
- captions, labels y prompts traducidos

### Patch11 aporta principalmente:
- contenido nuevo del mod
- eventos, escenas, sistemas y menús adicionales
- lógica nueva que no existe en Patch2

### Conclusión:
**Patch11 no debe ser sobrescrito por Patch2.**  
**Patch11 debe absorber el método de representación inglesa de Patch2.**

---

## Cómo trabajar correctamente

Para cada archivo compartido entre Patch2 y Patch11, separar los cambios en 3 grupos:

### 1. Lógica del mod
Cambios exclusivos de Patch11 que agregan funciones, eventos, opciones, personajes, variables o flujos nuevos.

### 2. Traducción simple
Cambio de texto visible japonés → inglés.

### 3. Adaptación de render/UI
Cambios estructurales para que el inglés se vea bien:
- `displayName`
- `font.getTextWidth(...)`
- recorte por ancho visual
- ajuste de fuente
- captions y prompts adaptados
- eliminación de cortes rígidos pensados para japonés

---

## Matriz principal

| Archivo | Está en Patch2 | Está en Patch11 | Qué aporta Patch2 | Qué hacer en Patch11 |
|---|---|---|---|---|
| `master.tjs` | Sí | Sí | Base del sistema de traducción visible: `displayName`, traducciones especiales, separación entre lógica interna y texto visible. | **Merge obligatorio.** Mantener toda lógica nueva del mod y portar la infraestructura de presentación inglesa. |
| `addfunc.tjs` | Sí | Puede ser necesario aunque no siempre sea tocado por el mod | Helpers para tratamiento de strings, recorte por ancho visual y soporte general de UI. | **Portar como base de soporte** si Patch11 usa ventanas con textos largos o compactos. |
| `yesnodialog.tjs` | Sí | No necesariamente | Traduce y adapta el diálogo de confirmación: `Confirm`, `Yes`, `No`, y elimina reglas rígidas pensadas para japonés. | **Mantener versión de Patch2 o copiar su lógica** si Patch11 no trae una versión propia. |
| `MainWindow.tjs` | Sí | No necesariamente | Traduce prompts y mensajes visibles del frontend principal. | **Mantener lógica de Patch2** salvo que Patch11 agregue algo específico sobre la ventana principal. |
| `bar.tjs` | Sí | Sí | Uno de los mejores ejemplos de adaptación al inglés: nombres visibles, alineación de listas, tratamiento de menús. | **Merge fino y prioritario.** Conservar lógica nueva del mod y portar la presentación inglesa de Patch2. |
| `board.tjs` | Sí | No siempre | Referencia importante para boards/listados/comandos visibles en inglés. | **Usarlo como modelo** si Patch11 agrega paneles o listados similares. |
| `inventory.tjs` | Sí | Sí | Manejo del inventario con criterios de presentación inglesa. | **Merge obligatorio.** No traducir solo strings: revisar representación visual completa. |
| `option.tjs` | Sí | Sí | Labels, opciones y textos de configuración adaptados al inglés. | **Merge recomendado.** Portar centrado, labels visibles y tratamiento del ancho del texto. |
| `inn.tjs` | Sí | Sí | Ajustes útiles para ventanas compactas y labels cortos. | **Merge recomendado.** Especialmente importante si Patch11 agrega nombres largos o nuevas opciones. |
| `party.tjs` | Sí | Sí | Ajustes de presentación para party/personajes, incluyendo posibles límites de ancho o tamaño. | **Merge recomendado.** Revisar toda salida visible del grupo y nombres de personajes. |

---

## Archivos de prioridad máxima

Estos son los más importantes para trasladar correctamente el método de Patch2 a Patch11.

### `master.tjs`
Es el archivo más importante del merge conceptual.

#### Qué debe conservarse de Patch2:
- uso de `displayName`
- separación entre nombre interno y visible
- soporte para traducciones especiales
- cualquier helper que evite reemplazar claves internas del juego

#### Qué NO debe perderse de Patch11:
- lógica nueva del mod
- contenido exclusivo
- referencias internas nuevas
- sistemas agregados por el mod

#### Regla:
**Nunca reemplazar `master.tjs` de Patch11 por el de Patch2 a ciegas.**  
Hay que hacer merge manual.

---

### `bar.tjs`
Uno de los archivos con más riesgo de romperse visualmente.

#### Qué debe conservarse de Patch2:
- uso de nombres visibles traducidos
- tratamiento correcto de menús/listas
- adaptación del render para inglés

#### Qué NO debe perderse de Patch11:
- nuevas opciones del mod
- nuevas rutas de menú
- nuevas acciones o lógicas

#### Regla:
Si Patch11 agrega opciones nuevas, esas opciones deben adoptar el mismo sistema visual que Patch2 usa para el resto de la UI.

---

### `inventory.tjs`
Archivo muy importante cuando el mod agrega objetos, categorías o listas nuevas.

#### Qué debe conservarse de Patch2:
- salida visible apta para inglés
- nombres visibles correctamente traducidos
- criterios de render para strings largas

#### Qué NO debe perderse de Patch11:
- objetos nuevos
- categorías nuevas
- lógica nueva del inventario del mod

#### Regla:
Todo objeto nuevo del mod debe pasar por la misma capa de presentación inglesa.

---

### `option.tjs`
Archivo sensible por la cantidad de labels y textos compactos.

#### Qué debe conservarse de Patch2:
- labels ingleses
- centrado o alineación correcta
- control visual del ancho del texto

#### Qué NO debe perderse de Patch11:
- nuevas opciones del mod
- configuraciones nuevas
- comandos nuevos

#### Regla:
No alcanza con traducir botones.  
También hay que revisar si el texto cabe bien visualmente.

---

## Archivos de prioridad media

### `inn.tjs`
Útil para:
- labels cortos
- menús compactos
- nombres de cuartos/opciones pequeñas

### `party.tjs`
Útil para:
- nombres visibles de personajes
- menús del grupo
- mensajes o ventanas del party

### `board.tjs`
Útil como referencia para:
- boards
- listados
- menús de comandos
- centrado y presentación visible

---

## Reglas prácticas de merge

### Regla 1: conservar `name`, mostrar `displayName`
Cuando Patch11 agregue contenido nuevo, no conviene traducir reemplazando nombres internos si esos nombres participan de la lógica.

Usar el patrón:

```js
var visibleName = obj.displayName ? obj.displayName : obj.name;
```

### Regla 2: no centrar ni alinear por cantidad de caracteres

Si Patch11 agrega:

listas
precios
estados
cantidades
nombres de skills/items/quests

No usar:

padding con espacios
longitud fija
cortes por número de caracteres

Usar:

ancho visual
helpers del sistema
lógica de render tomada de Patch2
Regla 3: no cortar inglés con reglas japonesas

Buscar y revisar especialmente patrones como:

length > ...
substr(...)
slice(...)
" ".repeat(...)

Si aparecen en Patch11, revisar si hay que reemplazarlos por el criterio visual de Patch2.

Regla 4: la traducción visible debe pasar por una capa

No mostrar directamente en pantalla:

valores internos de datos
nombres crudos de objetos
strings de sistema sin revisar

Todo texto visible debería pasar por:

displayName
helper de traducción
restauración de nombre limpio
función de recorte si aplica
Regla 5: no copiar archivos completos si el mod los expandió

Si Patch11 trae una versión mucho más grande o más compleja de un archivo que también existe en Patch2:

no copiar Patch2 encima
no usar reemplazo directo
hacer merge por bloques
trasladar el patrón, no solo el texto
Checklist por archivo compartido
master.tjs
 ¿Usa displayName?
 ¿Hay traducciones especiales?
 ¿Se mantiene la lógica interna del mod?
 ¿El contenido nuevo del mod tiene nombre visible separado?
bar.tjs
 ¿Los nombres visibles salen desde displayName?
 ¿Las listas se alinean correctamente?
 ¿Los menús nuevos del mod siguen la misma lógica visual?
 ¿Hay texto japonés hardcodeado aún visible?
inventory.tjs
 ¿Los objetos nuevos usan nombre visible?
 ¿Las listas largas se ven bien en inglés?
 ¿Hay categorías o labels nuevas sin adaptar?
option.tjs
 ¿Los labels caben correctamente?
 ¿Las nuevas opciones del mod siguen el mismo estilo visual?
 ¿Hay textos compactos que necesiten recorte o centrado?
inn.tjs
 ¿Los nombres de cuartos/opciones caben?
 ¿Hay labels nuevos sin traducción visible?
party.tjs
 ¿Los nombres visibles del grupo están separados del dato interno?
 ¿Los menús del party mantienen legibilidad en inglés?
Estrategia recomendada de implementación
Fase 1

Portar a Patch11 la base conceptual:

displayName
helpers de traducción
helpers de recorte y presentación
Fase 2

Aplicar esa base a archivos compartidos más importantes:

master.tjs
bar.tjs
inventory.tjs
option.tjs
Fase 3

Revisar UI secundaria y ventanas compactas:

inn.tjs
party.tjs
board.tjs
yesnodialog.tjs
MainWindow.tjs
Fase 4

Adaptar contenido exclusivo del mod con esas mismas reglas

Todo lo nuevo que exista solo en Patch11 debe seguir el mismo criterio visual que Patch2, aunque no haya un equivalente exacto en la traducción base.

Qué NO hacer
No sobrescribir Patch11 entero con Patch2
No traducir reemplazando ciegamente claves internas
No asumir que una traducción visible arregla sola la UI
No confiar en longitud de caracteres para inglés
No copiar solo strings sin copiar también el método de presentación
Conclusión

Patch2 es el modelo de representación inglesa.
Patch11 es la capa de contenido nuevo del mod.

La meta no es elegir uno u otro.
La meta es:

mantener la lógica y el contenido de Patch11
injertar en él el sistema de presentación inglesa que ya resolvió Patch2
Regla final

Cuando Patch2 y Patch11 se superponen, se debe portar el método, no solo el texto.
