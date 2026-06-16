# Capítulo 1: Fundamentos y Inicio Rápido

**📚 Curso**: [AZD para Principiantes](../../README.md) | **⏱️ Duración**: 30-45 minutos | **⭐ Complejidad**: Principiante

---

## Resumen

Este capítulo presenta los fundamentos de Azure Developer CLI (azd). Aprenderás los conceptos básicos, instalarás las herramientas y desplegarás tu primera aplicación en Azure.

> Validado con `azd 1.25.6` en junio de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Comprender qué es Azure Developer CLI y en qué se diferencia de Azure CLI
- Instalar y configurar AZD en tu plataforma
- Desplegar tu primera aplicación en Azure con `azd up`
- Eliminar los recursos con `azd down`

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Conceptos básicos de AZD](azd-basics.md) | Conceptos básicos, terminología y estructura del proyecto | 15 min |
| 2 | [Instalación y configuración](installation.md) | Guías de instalación específicas para cada plataforma | 10 min |
| 3 | [Tu primer proyecto](first-project.md) | Práctica: Desplegar una aplicación web en Azure | 20 min |
| 4 | [Usa tu propia aplicación](bring-your-own-app.md) | Agregar azd a un proyecto existente que ya tengas | 15 min |
| 5 | [Contenedores de desarrollo y Codespaces](dev-containers.md) | Entornos reproducibles de azd con contenedores de desarrollo | 15 min |

---

## ✅ Empieza aquí: Valida tu configuración

Antes de comenzar, confirma que tu máquina local esté lista para la plantilla del Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Si el script informa que faltan herramientas, corrígelas primero y luego continúa con el capítulo.

---

## 🚀 Inicio Rápido

```bash
# Comprobar la instalación
azd version

# Autenticarse para AZD
# Opcional: az login si planeas ejecutar comandos de Azure CLI directamente
azd auth login

# Desplegar tu primera aplicación
azd init --template todo-nodejs-mongo
azd up

# Limpiar al finalizar
azd down --force --purge
```

---

## ✅ Criterios de éxito

Después de completar este capítulo, deberías poder:

```bash
azd version              # Muestra la versión instalada
azd init --template todo-nodejs-mongo  # Inicializa el proyecto
azd up                   # Despliega en Azure
azd show                 # Muestra la URL de la aplicación en ejecución
azd down --force --purge # Limpia los recursos
```

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Siguiente** | [Capítulo 2: Desarrollo centrado en IA](../chapter-02-ai-development/README.md) |
| **Saltar a** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |

---

## 📖 Recursos relacionados

- [Hoja de referencia de comandos](../../resources/cheat-sheet.md)
- [Preguntas frecuentes](../../resources/faq.md)
- [Glosario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->