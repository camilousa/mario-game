# Guion de demostración — Juego Mario Bros con IA
## Programa de Inteligencia Artificial — Feria de colegios

---

## ANTES DE EMPEZAR (preparación)

```bash
# 1. Instalar Claude Code (si no lo tienes)
npm install -g @anthropic-ai/claude-code

# 2. Verificar que tienes la clave de Anthropic configurada
echo $ANTHROPIC_API_KEY   # debe mostrar sk-ant-...

# 3. Tener abierta la terminal en esta carpeta
cd mario-ia-demo

# 4. Tener el navegador listo en una pantalla separada
```

---

## PASO 1 — Presentación al público (2 minutos)

**Dices al público:**
> "Hoy van a diseñar un videojuego. No necesitan saber programar —
> solo elegir. La Inteligencia Artificial va a escribir TODO el código
> por ustedes, en tiempo real, frente a sus ojos."

**Abres la demo interactiva en el navegador** (archivo `demo-selector/index.html`)
y el público vota por:
- Personaje principal
- Tipo de enemigo
- Paisaje / mundo
- Tipo de balas

**Anotas las respuestas** — por ejemplo:
- Personaje: **Robot IA**
- Enemigos: **Fantasmas neón**
- Mundo: **Ciudad espacial**
- Arma: **Rayos láser**

---

## PASO 2 — El comando mágico a Claude Code (EN VIVO)

**Dices al público:**
> "Ahora voy a pedirle a la IA que construya exactamente
> lo que ustedes eligieron. Un solo comando. Observen."

**Abres la terminal y ejecutas:**

```bash
claude "Crea un juego completo tipo Mario Bros con estas características exactas:

PERSONAJE PRINCIPAL: [OPCIÓN ELEGIDA POR EL PÚBLICO]
ENEMIGOS: [OPCIÓN ELEGIDA POR EL PÚBLICO]
MUNDO / PAISAJE: [OPCIÓN ELEGIDA POR EL PÚBLICO]
TIPO DE DISPARO: [OPCIÓN ELEGIDA POR EL PÚBLICO]

REQUISITOS TÉCNICOS:
- Un solo archivo index.html autocontenido (sin dependencias externas)
- Canvas HTML5 con JavaScript puro, sin frameworks
- El personaje se mueve con flechas o WASD
- Salto con Espacio o flecha arriba
- Disparo con Z o tecla X
- Plataformas generadas dinámicamente con scroll lateral
- Sistema de puntuación visible en pantalla
- 3 vidas con indicador visual
- Los enemigos caminan y tienen colisión real con el personaje
- El personaje muere si lo tocan los enemigos sin disparar
- Pantalla de Game Over con opción de reiniciar
- Música de fondo simple con Web Audio API (tonos generados, sin archivos)
- Diseño visual pixel art usando Canvas 2D
- El juego debe funcionar al abrir el archivo en cualquier navegador
- Comentarios en el código explicando cada sección en español

Genera SOLO el archivo index.html completo y listo para ejecutar."
```

> **Tip para la presentación:** mientras Claude genera,
> narra lo que está pasando:
> *"Está escribiendo el sistema de física, ahora las colisiones,
> ahora el render del personaje..."*

---

## PASO 3 — Mostrar el juego en vivo (1 minuto)

```bash
# Abre el juego generado en el navegador
open index.html          # Mac
start index.html         # Windows
xdg-open index.html      # Linux
```

**Dices al público:**
> "Eso es todo. 60 segundos. Un juego funcional escrito por IA
> con exactamente lo que ustedes pidieron."

**Juegas 30 segundos en vivo frente al público.**

---

## PASO 4 — Deploy a AWS S3 (opcional, si tienes tiempo)

**Dices al público:**
> "Ahora lo publicamos en internet para que cualquier persona
> en el mundo pueda jugarlo desde su celular."

```bash
# Un solo comando — sube y abre el juego automáticamente
./aws/deploy.sh
```

> La URL aparece en la terminal en segundos y el navegador
> se abre automáticamente. Sin caché que invalidar —
> S3 sirve el archivo directamente.
>
> Edita `aws/config.sh` con tu bucket y región antes de la demo.

**Muestras la URL en pantalla grande y el público puede jugar desde su celular.**

---

## PASO 5 — El mensaje final (1 minuto)

**Dices al público:**
> "Lo que acaban de ver — un robot escribiendo código,
> un juego en internet en 60 segundos — eso es Inteligencia Artificial aplicada.
>
> En nuestro programa de pregrado van a aprender a construir
> exactamente esto: a diseñar sistemas de IA, a programarlos,
> a desplegarlos en la nube.
>
> No solo a USAR la IA — sino a CREARLA."

---

## COMANDOS DE RESPALDO (si algo falla)

### Si Claude Code no responde rápido:
```bash
# Versión más corta del prompt (genera en ~20 segundos)
claude "Crea un juego Mario Bros simple en un solo index.html.
Personaje: [OPCIÓN]. Enemigos: [OPCIÓN]. Canvas HTML5, JavaScript puro.
WASD para moverse, Espacio para saltar, Z para disparar.
Plataformas, puntuación, 3 vidas, game over. Sin dependencias externas."
```

### Si quieres regenerar con cambios:
```bash
claude "El juego se ve bien pero quiero que los enemigos sean más rápidos
y que el fondo tenga más estrellas animadas. Modifica el index.html."
```

### Si quieres agregar algo en vivo (¡impresiona al público!):
```bash
claude "Agrega al juego: power-up que aparece cada 30 segundos,
si el personaje lo toca dispara el doble de rápido por 10 segundos."
```

---

## VARIANTES DEL PROMPT SEGÚN LO QUE ELIJA EL PÚBLICO

Copia y pega el bloque completo según las elecciones:

### Robot IA + Fantasmas neón + Ciudad espacial + Rayos láser
```bash
claude "Crea un juego tipo Mario Bros en un solo index.html autocontenido.

Personaje principal: Robot androide de color violeta con ojos que brillan,
  se mueve con física de plataformas (gravedad, salto, inercia).
Enemigos: Fantasmas neón de color rosa que flotan de lado a lado
  y atraviesan plataformas lentamente.
Mundo: Ciudad espacial futurista — fondo negro con estrellas animadas,
  plataformas de metal azul con bordes luminosos.
Disparo: Rayos láser rojos horizontales que eliminan fantasmas al contacto.

Controles: WASD / flechas para moverse, Espacio para saltar, Z para disparar.
Sistema: 3 vidas, puntuación, game over, reinicio. Web Audio API para sonidos.
Pixel art con Canvas 2D. Sin dependencias externas. Comentarios en español."
```

### Astronauta + Robots locos + Volcán de lava + Bolas de fuego
```bash
claude "Crea un juego tipo Mario Bros en un solo index.html autocontenido.

Personaje principal: Astronauta con traje blanco y visor azul,
  física de plataformas con gravedad normal.
Enemigos: Robots amarillos que caminan de lado a lado lanzando rayos
  cada 3 segundos.
Mundo: Volcán activo — fondo naranja oscuro, plataformas de roca gris,
  lava animada en el fondo que sube y baja.
Disparo: Bolas de fuego naranja que rebotan una vez en el suelo.

Controles: WASD / flechas para moverse, Espacio para saltar, Z para disparar.
Sistema: 3 vidas, puntuación, game over, reinicio. Web Audio API para sonidos.
Pixel art con Canvas 2D. Sin dependencias externas. Comentarios en español."
```

### Ninja + Virus pixelados + Selva tech + Estrellas ninja
```bash
claude "Crea un juego tipo Mario Bros en un solo index.html autocontenido.

Personaje principal: Ninja de negro con banda roja, movimiento ágil
  y salto doble.
Enemigos: Virus pixelados rojos de 8 bits que se mueven erráticamente
  y se duplican si no se eliminan en 10 segundos.
Mundo: Selva tecnológica — árboles verdes con pantallas LED incrustadas,
  fondo verde oscuro con lluvia de código binario.
Disparo: Shurikens plateados que rebotan en paredes y techo hasta 2 veces.

Controles: WASD / flechas para moverse, Espacio para saltar (doble salto con Z).
Sistema: 3 vidas, puntuación, game over, reinicio. Web Audio API para sonidos.
Pixel art con Canvas 2D. Sin dependencias externas. Comentarios en español."
```

### Dragón bebé + Piratas + Océano profundo + Código binario
```bash
claude "Crea un juego tipo Mario Bros en un solo index.html autocontenido.

Personaje principal: Dragón bebé verde que puede planear al mantener Espacio.
Enemigos: Esqueletos pirata grises que caminan con espadas y lanzan monedas
  al jugador.
Mundo: Océano profundo — fondo azul marino oscuro, plataformas de coral,
  burbujas animadas que suben desde el fondo.
Disparo: Bloques de código binario (muestran '1010') que corrompen enemigos
  al tocarlos.

Controles: WASD / flechas para moverse, Espacio para saltar/planear, Z para disparar.
Sistema: 3 vidas, puntuación, game over, reinicio. Web Audio API para sonidos.
Pixel art con Canvas 2D. Sin dependencias externas. Comentarios en español."
```

---

## CHECKLIST ANTES DE LA PRESENTACIÓN

- [ ] `node --version` → debe ser v18 o superior
- [ ] `claude --version` → Claude Code instalado
- [ ] `echo $ANTHROPIC_API_KEY` → muestra la clave
- [ ] `aws s3 ls` → conexión a AWS funciona (si vas a hacer deploy)
- [ ] Bucket S3 creado y configurado: `./aws/setup-bucket.sh` (solo la primera vez)
- [ ] Navegador en pantalla secundaria listo
- [ ] Demo selector abierto en `demo-selector/index.html`
- [ ] Terminal con fuente grande (mínimo 18pt) para que el público vea
- [ ] Ensaya el prompt al menos una vez antes de la presentación

---

*Generado para el Programa de Inteligencia Artificial — Demo de Vibe Coding*
