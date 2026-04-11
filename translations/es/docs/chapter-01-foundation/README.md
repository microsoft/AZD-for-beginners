# Capítulo 1: Fundamentos & Inicio rápido

**📚 Course**: [AZD For Beginners](../../README.md) | **⏱️ Duration**: 30-45 minutes | **⭐ Complexity**: Beginner

---

## Overview

This chapter introduces Azure Developer CLI (azd) fundamentals. You'll learn core concepts, install the tools, and deploy your first application to Azure.

> Validated against `azd 1.23.12` in March 2026.

## Learning Objectives

By completing this chapter, you will:
- Understand what Azure Developer CLI is and how it differs from Azure CLI
- Install and configure AZD on your platform
- Deploy your first application to Azure with `azd up`
- Clean up resources with `azd down`

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Conceptos básicos de AZD](azd-basics.md) | Conceptos clave, terminología y estructura del proyecto | 15 min |
| 2 | [Instalación y configuración](installation.md) | Guías de instalación por plataforma | 10 min |
| 3 | [Tu primer proyecto](first-project.md) | Práctica: Implementar una aplicación web en Azure | 20 min |

---

## ✅ Comienza aquí: Valida tu configuración

Before you begin, confirm that your local machine is ready for the Chapter 1 template:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

If the script reports missing tools, fix those first and then continue with the chapter.

---

## 🚀 Inicio rápido

```bash
# Comprobar la instalación
azd version

# Autenticarse para AZD
# Opcional: az login si planea ejecutar comandos de la CLI de Azure directamente
azd auth login

# Despliegue su primera aplicación
azd init --template todo-nodejs-mongo
azd up

# Limpiar al terminar
azd down --force --purge
```

---

## ✅ Criterios de éxito

After completing this chapter, you should be able to:

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
| **Next** | [Chapter 2: AI-First Development](../chapter-02-ai-development/README.md) |
| **Skip to** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |

---

## 📖 Recursos relacionados

- [Hoja de referencia de comandos](../../resources/cheat-sheet.md)
- [Preguntas frecuentes](../../resources/faq.md)
- [Glosario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido usando el servicio de traducción automática de IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automatizadas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->