# Mario IA Demo — Proyecto Claude Code

Demo de vibe coding para presentación del Programa de Inteligencia Artificial.
El público diseña un juego tipo Mario Bros y Claude Code lo genera en vivo.

## Estructura del proyecto

```
mario-ia-demo/
├── GUION_DEMO.md          ← Guion completo paso a paso (léelo primero)
├── README.md              ← Este archivo
├── guion/
│   └── TARJETA_RAPIDA.txt ← Imprime esto para tener a mano
└── aws/
    ├── config.sh          ← Edita con tu bucket y distribución
    └── deploy.sh          ← Un comando para publicar en internet
```

## Instalación (hazlo el día anterior)

### 1. Instalar Claude Code
```bash
npm install -g @anthropic-ai/claude-code
```

### 2. Configurar tu API key de Anthropic
```bash
export ANTHROPIC_API_KEY="sk-ant-..."
# o agrégalo a tu ~/.bashrc / ~/.zshrc
```

### 3. Configurar AWS (solo si vas a hacer el deploy en vivo)
```bash
# Instalar AWS CLI
pip install awscli

# Configurar credenciales
aws configure

# Editar el archivo de config con tu bucket y distribución
nano aws/config.sh
```

### 4. Probar antes de la presentación
```bash
# Genera un juego de prueba
claude "Crea un juego Mario Bros simple en index.html. 
Personaje: robot. Enemigos: fantasmas. Canvas HTML5, sin dependencias."

# Verifica que funciona
open index.html

# Prueba el deploy (opcional)
./aws/deploy.sh
```

## Uso en la presentación

Lee el archivo `GUION_DEMO.md` completo.
Ten impresa la `guion/TARJETA_RAPIDA.txt`.

## Requisitos

- Node.js 18+
- Claude Code (`npm install -g @anthropic-ai/claude-code`)
- API Key de Anthropic (en https://console.anthropic.com)
- AWS CLI configurado (solo para el deploy)
- Un bucket S3 con sitio web estático habilitado
- Una distribución CloudFront apuntando al bucket
