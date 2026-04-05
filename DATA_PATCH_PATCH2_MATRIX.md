# Data → Patch → Patch2 Matrix
## Cómo se forma la base que luego hay que usar para adaptar Patch11

Este documento resume la relación entre:

- `Data` = archivos base del juego
- `Patch` = archivos modificados por la actualización oficial
- `Patch2` = archivos traducidos/adaptados al inglés sobre la base actualizada

La idea es entender primero esta cadena antes de tocar `Patch11`, ya que `Patch11` agrega contenido nuevo que no siempre existe en `Patch2`.

---

## Regla general

La secuencia correcta de lectura es:

1. **Data**  
   Base original del juego.

2. **Patch**  
   Capa de actualización oficial que reemplaza archivos del juego base.

3. **Patch2**  
   Capa de traducción/adaptación al inglés sobre la base ya actualizada.

---

## Qué significa esto en la práctica

Patch2 no debe leerse como “el juego completo traducido desde cero”.

Patch2 debe entenderse como:

- traducción de texto visible
- adaptación de UI al inglés
- ajustes de render para que el inglés se vea bien
- soporte adicional para traducciones especiales
- capa de presentación que se monta sobre la base ya modificada por `Patch`

---

## Estructura base

### `Data`
Contiene la base original del juego, incluyendo:

- `map`
- `scenario`
- `script`
- `system`
- `startup.tjs`

### `Patch`
Reemplaza archivos del juego base.  
Entre ellos aparecen archivos clave del sistema/UI como:

- `MainWindow.tjs`
- `YesNoDialog.tjs`
- `addfunc.tjs`
- `bar.tjs`

### `Patch2`
Vuelve a reemplazar varios archivos anteriores y agrega/adapta otros para la representación del inglés, como:

- `master.tjs`
- `addfunc.tjs`
- `yesnodialog.tjs`
- `MainWindow.tjs`
- `bar.tjs`
- `board.tjs`
- `inventory.tjs`
- `option.tjs`
- `inn.tjs`
- `party.tjs`

---

## Matriz principal

| Archivo | Rol en la cadena Data → Patch → Patch2 | Qué se aprende de Patch2 | Qué servirá luego para Patch11 |
|---|---|---|---|
| `master.tjs` | Parte de la lógica base/traducción del sistema. | Patch2 introduce una capa de presentación y traducción especial, incluyendo `displayName` y soporte tipo `extraTranslations`. | Base para no romper lógica interna al traducir contenido nuevo del mod. |
| `addfunc.tjs` | Archivo de soporte reutilizado por la UI. Patch lo reemplaza y Patch2 lo sigue usando como apoyo. | Lugar natural para helpers de recorte y control visual del texto. | Portar utilidades de recorte/ancho visual a Patch11. |
| `yesnodialog.tjs` | Patch reemplaza el diálogo de confirmación del juego base. Patch2 vuelve a tocarlo. | Patch2 adapta la ventana al inglés: `Confirm`, `Yes`, `No`, y elimina límites rígidos hechos para japonés. | Mantener esta lógica para cuadros de confirmación del mod. |
| `MainWindow.tjs` | Patch reemplaza la ventana principal del juego. Patch2 la adapta después. | Traducción y limpieza de prompts/mensajes visibles del sistema. | Mantener los textos visibles del frontend principal en inglés. |
| `bar.tjs` | Patch reemplaza este archivo sobre la base; Patch2 vuelve a modificarlo. | Es uno de los casos más importantes de adaptación inglesa en menús/listas. | Hacer merge fino en Patch11, sin perder la lógica nueva del mod. |
| `board.tjs` | No quedó confirmado como parte del update oficial en esta etapa, pero sí aparece en Patch2. | Sirve como referencia para boards/listados/comandos adaptados al inglés. | Muy útil si Patch11 agrega menús o paneles nuevos. |
| `inventory.tjs` | Parte de la UI visible que Patch2 adapta. | La pantalla de inventario también necesita lógica de presentación inglesa. | Aplicar el mismo criterio en Patch11 para nombres y listas visibles. |
| `option.tjs` | Parte de la UI de opciones/configuración. | Patch2 trata también labels y textos visibles de opciones. | Revisar opciones del mod con el mismo enfoque. |
| `inn.tjs` | Parte de una UI más pequeña y sensible al ancho del texto. | Patch2 lo adapta también dentro de la capa inglesa. | Útil para cuartos, labels pequeños y menús compactos. |
| `party.tjs` | Parte de la UI de grupo/personajes. | Patch2 también interviene aquí. | Revisar nombres, mensajes o listas de party con el criterio inglés. |

---

## Principios que deja claros Patch2

### 1. Separar lógica interna y texto visible

Patch2 no depende solo de reemplazar nombres crudos.

Usa una lógica del tipo:

- `name` = dato interno / lógica
- `displayName` = texto visible en inglés

### 2. Traducir también la UI del sistema

No solo se traducen diálogos o nombres de objetos.

También se adaptan:

- captions
- prompts
- labels
- botones
- menús del sistema
- mensajes de error o confirmación

### 3. Evitar reglas rígidas pensadas para japonés

Patch2 muestra que muchas reglas japonesas no sirven para inglés, por ejemplo:

- dividir por cantidad fija de caracteres
- usar espacios fijos para alinear
- asumir que todas las cadenas ocupan ancho parecido

### 4. Agregar soporte para traducciones especiales

Con estructuras como `extraTranslations`, Patch2 puede resolver textos que no conviene traducir reemplazando el valor interno original.

---

## Conclusión de esta matriz

La lectura correcta del proyecto es esta:

- `Data` = base original
- `Patch` = update oficial sobre la base
- `Patch2` = traducción + adaptación de render sobre la base actualizada

Por eso, antes de aplicar la lógica de Patch2 en `Patch11`, primero conviene entender qué parte de cada archivo viene:

- del juego base
- del update oficial
- de la capa de traducción inglesa

---

## Qué NO hacer todavía

Antes de analizar `Patch11`, no conviene:

- tratar Patch2 como si fuera el juego completo
- sobrescribir archivos del mod con Patch2 sin comparar
- asumir que todo cambio de Patch2 es “solo traducción”

---

## Qué hacer después de este archivo

El siguiente documento recomendado es:

`PATCH2_TO_PATCH11_MATRIX.md`

Ese archivo debería responder, para cada `.tjs` importante:

- qué patrón inglés usa Patch2
- qué parte ya existe en Patch11
- qué conviene copiar
- qué conviene mergear
- qué no conviene sobrescribir

---

## Archivos prioritarios para el siguiente análisis

### Prioridad alta
- `master.tjs`
- `addfunc.tjs`
- `yesnodialog.tjs`
- `MainWindow.tjs`
- `bar.tjs`
- `board.tjs`

### Prioridad media
- `inventory.tjs`
- `option.tjs`
- `inn.tjs`
- `party.tjs`

---

## Regla final

**Patch2 no solo traduce texto.**
**Patch2 adapta la forma en que el juego lo presenta en pantalla.**

Ese principio es el que luego debe trasladarse a `Patch11`.
