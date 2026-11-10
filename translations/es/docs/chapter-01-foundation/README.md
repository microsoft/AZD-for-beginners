# Capítulo 1: Fundamentos y Comienzo Rápido

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 75-120 minutos incluyendo el primer despliegue; ejercicios adicionales tardan más | **⭐ Complejidad**: Principiante

---

## Resumen

Este capítulo introduce los fundamentos de Azure Developer CLI (azd). Aprenderás conceptos básicos, instalarás las herramientas y desplegarás tu primera aplicación en Azure.

> Objetivo de revisión de comandos y configuración: `azd 1.37.2` (noviembre 2026). No se ejecutó provisión en vivo de Azure durante la revisión.

## Objetivos de Aprendizaje

Al completar este capítulo, podrás:
- Entender qué es Azure Developer CLI y cómo se diferencia de Azure CLI
- Instalar y configurar AZD en tu plataforma
- Desplegar tu primera aplicación en Azure con `azd up`
- Limpiar recursos con `azd down`

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Conceptos Básicos de AZD](azd-basics.md) | Conceptos clave, terminología y estructura del proyecto | 15 min |
| 2 | [Instalación y Configuración](installation.md) | Guías de instalación específicas por plataforma | 10 min |
| 3 | [Tu Primer Proyecto](first-project.md) | Práctica: Desplegar una aplicación web en Azure | 20 min |
| 4 | [Agrega Tu Propia App](bring-your-own-app.md) | Añadir azd a un proyecto existente que ya tienes | 15 min |
| 5 | [Contenedores de Desarrollo y Codespaces](dev-containers.md) | Entornos azd reproducibles con contenedores de desarrollo | 15 min |

---

## ✅ Empieza Aquí: Valida Tu Configuración

Antes de comenzar, confirma que tu máquina local esté lista para la plantilla del Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Si el script informa de herramientas faltantes, soluciona eso primero y luego continúa con el capítulo.

---

## 🚀 Comienzo Rápido

```bash
# Check installation
azd version

# Authenticate for AZD
# Optional: az login if you plan to run Azure CLI commands directly
azd auth login

# Deploy your first app
mkdir chapter1-demo
cd chapter1-demo
azd init --template todo-nodejs-mongo .
azd up

# Clean up when done
azd down --force --purge
```

---

## ✅ Criterios de Éxito

Después de completar este capítulo, deberías ser capaz de:

```bash
azd version              # Shows installed version
azd env list             # Lists the initialized environment
azd up                   # Deploys to Azure
azd show                 # Displays running app URL
azd down --force --purge # Cleans up resources
```

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Siguiente** | [Capítulo 2: Desarrollo con IA Primero](../chapter-02-ai-development/README.md) |
| **Saltar a** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Hoja de Referencia de Comandos](../../resources/cheat-sheet.md)
- [Preguntas Frecuentes](../../resources/faq.md)
- [Glosario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->