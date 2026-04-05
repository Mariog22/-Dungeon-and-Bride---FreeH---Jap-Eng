# Patch2 UI Render Notes
## Cómo Patch2 adapta la representación del texto al inglés en Kirikiri Z

Este documento resume cómo **Patch2** implementa la representación del texto en inglés dentro de la UI del juego, para reutilizar ese enfoque al trabajar sobre **Patch11** sin romper la lógica del mod.

---

## Objetivo

Patch2 no se limita a traducir cadenas japonesas al inglés.  
También modifica la forma en que el juego **muestra**, **alinea**, **recorta** y **renderiza** el texto en pantalla.

La idea principal es:

- mantener los identificadores internos del juego en japonés cuando sea necesario
- separar el texto visible del texto interno
- adaptar el render a inglés usando ancho real de texto
- evitar reglas rígidas pensadas para japonés

---

## Principios generales de Patch2

### 1. Separación entre lógica interna y texto visible

Patch2 conserva muchos nombres internos (`name`) para la lógica del juego, pero usa `displayName` para mostrar texto traducido al jugador.

#### Regla:
- `name` = identificador interno / lógica
- `displayName` = texto visible en inglés

#### Ventaja:
Esto evita romper referencias internas del juego mientras permite mostrar nombres correctamente traducidos en la UI.

---

### 2. Medición por ancho real, no por cantidad de caracteres

Patch2 evita depender de:
- `length`
- `substr(...)`
- padding fijo con espacios
- cortes a N caracteres

En su lugar usa:
- `font.getTextWidth(...)`

#### Ventaja:
El japonés y el inglés no ocupan el mismo ancho visual.  
Medir caracteres no sirve para una UI bien alineada en inglés.

---

### 3. El inglés no debe forzarse dentro de reglas diseñadas para japonés

Cuando una regla original del juego está hecha para japonés y deforma el inglés, Patch2 suele preferir:

- dejar que el texto se dibuje completo
- medir su ancho real
- ajustar fuente o posición
- recortar solo cuando sea estrictamente necesario

#### Regla general:
Es mejor un pequeño overflow controlado que una división artificial que rompa el inglés.

---

### 4. Traducciones especiales fuera del flujo normal

Patch2 incorpora estructuras de apoyo como `extraTranslations` para textos que no se traducen bien con reemplazos simples.

Esto sirve para:
- nombres especiales
- textos embebidos en datos
- strings difíciles de interceptar
- contenido que necesita traducción por tabla

---

## Archivos clave y qué aprender de cada uno

---

### `master.tjs`

Es uno de los archivos más importantes del sistema de traducción.

#### Qué aporta:
- infraestructura general de traducción
- uso y propagación de `displayName`
- soporte para `extraTranslations`
- separación entre nombre interno y nombre visible
- lógica para devolver traducciones especiales cuando sea necesario

#### Qué portar a Patch11:
- estructura de `displayName`
- tabla o sistema tipo `extraTranslations`
- funciones auxiliares para recuperar texto traducido sin alterar claves internas

#### Regla:
No reemplazar `name` directamente si ese valor participa de la lógica del juego.  
Usar `displayName` para toda salida visible.

---

### `addfunc.tjs`

Archivo de soporte muy importante.

#### Qué aporta:
- helpers para trabajar con strings largos
- función tipo `Layer.chopTooLongString(str, len)`
- recorte basado en ancho real usando `font.getTextWidth(...)`

#### Qué portar a Patch11:
- cualquier helper de recorte por ancho visual
- funciones reutilizables para limitar texto en botones, save slots, labels y menús

#### Regla:
Nunca recortar texto visible por número de caracteres si el espacio disponible es visual, no lógico.

---

### `yesnodialog.tjs`

Caso muy claro de adaptación al inglés.

#### Qué cambia Patch2:
- cambia caption a `Confirm`
- cambia botones a `Yes` / `No`
- cambia fuente a una más apta para inglés
- elimina el corte rígido del mensaje por longitud fija

#### Qué se aprende:
La regla japonesa de “si supera X caracteres, dividir en dos líneas” no siempre sirve en inglés.

#### Qué portar a Patch11:
- labels ingleses
- caption inglés
- eliminación de cortes rígidos por longitud fija
- preferencia por mostrar el texto completo antes que romperlo artificialmente

---

### `MainWindow.tjs`

Ajusta la UI principal del sistema.

#### Qué cambia Patch2:
- prompts del sistema
- mensajes de cierre
- mensajes de error
- información de versión
- avisos de menú

#### Qué portar a Patch11:
- traducción de prompts y mensajes de sistema
- cualquier ajuste visible del frontend principal

#### Regla:
No olvidar que la UI principal también forma parte de la traducción.  
No todo está en diálogos o menús de gameplay.

---

### `bar.tjs`

Archivo muy importante para menús y nombres visibles.

#### Qué cambia Patch2:
- usa `displayName`
- reemplaza padding por espacios con cálculo por ancho real
- ajusta nombres y precios en listas
- traduce labels del menú

#### Qué portar a Patch11:
- reemplazar `obj.name` por `obj.displayName` donde corresponda
- reemplazar padding fijo por cálculo con `font.getTextWidth(...)`
- revisar listas con nombre + precio o nombre + estado

#### Regla:
Toda lista con columnas visuales debe alinearse por ancho real, no por cantidad de caracteres.

---

### `board.tjs`

Archivo relacionado con boards, comandos o listados.

#### Qué cambia Patch2:
- centrado por ancho real
- uso de `displayName`
- fallback a `name` cuando no existe `displayName`
- paso por funciones como `restoreName(...)` para limpiar texto visible

#### Qué portar a Patch11:
- uso de `displayName || name`
- cálculo de centrado con `font.getTextWidth(...)`
- funciones de restauración/limpieza de texto antes del render

#### Regla:
El texto a mostrar debe pasar por una capa de presentación, no salir crudo desde datos internos.

---

### `inventory.tjs`

Relacionado con items y ventanas de inventario.

#### Qué aprender de Patch2:
- uso de nombres visibles traducidos
- adaptación del render de nombres y listas
- posible ajuste de alineación o recorte según ancho real

#### Qué portar a Patch11:
- todas las salidas visibles de nombres de objeto deben usar `displayName`
- revisar columnas, detalles y nombres largos

---

### `option.tjs`

Relacionado con opciones y configuración.

#### Qué aprender de Patch2:
- centrado y cálculo visual para labels y teclas
- uso de helpers para cortar texto de forma segura
- adaptación de textos de sistema al inglés

#### Qué portar a Patch11:
- centrado por ancho real
- recorte visual en saves/configs si aplica
- traducción completa de labels

---

### `inn.tjs`

Relacionado con posada, habitaciones o menús asociados.

#### Qué aprender de Patch2:
- ajuste del ancho de placas, labels o nombres de cuarto
- render adaptado al texto inglés

#### Qué portar a Patch11:
- revisión completa de nombres visibles
- ajuste de espacios pequeños donde el inglés suele ocupar más

---

### `party.tjs`

Relacionado con grupo/personajes y posiblemente mensajes o globos.

#### Qué aprender de Patch2:
- ajuste de fuente si el texto supera cierto ancho
- prioridad a mantener legibilidad en inglés antes que aplicar cortes duros

#### Qué portar a Patch11:
- reducción controlada de fuente si el área es limitada
- uso de medición visual antes de cortar texto

---

## Reglas prácticas para implementar en Patch11

### Regla 1: no tocar identificadores internos si no hace falta
No reemplazar directamente:
- nombres internos usados por lógica
- claves de datos
- referencias entre scripts

Usar:
- `displayName`
- tablas de traducción
- helpers de presentación

---

### Regla 2: todo texto visible debe pasar por la capa de presentación
Cuando un script dibuje texto en pantalla, revisar si usa:
- `name`
- `obj.name`
- `dic.text`
- textos crudos desde CSV/datos

Y evaluar si debe pasar a:
- `displayName`
- `restoreName(...)`
- traducción especial
- helper de recorte/alineación

---

### Regla 3: evitar cortes por longitud fija
Buscar y revisar patrones como:
- `message.length > ...`
- `substr(...)`
- `slice(...)`
- `" ".repeat(...)`

Esos patrones suelen venir de una UI pensada para japonés.

Reemplazar por:
- `font.getTextWidth(...)`
- recorte por ancho visual
- ajuste de fuente
- reubicación del texto

---

### Regla 4: los menús con columnas deben alinearse visualmente
Si hay estructuras como:
- nombre + precio
- nombre + cantidad
- nombre + estado
- nombre + descripción corta

No usar padding por espacios.  
Usar ancho real del texto.

---

### Regla 5: preferir fallback seguro
Patrón recomendado:

```js
var visibleName = obj.displayName ? obj.displayName : obj.name;
