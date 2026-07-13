# Capítulo 1: Fundamentos y Inicio Rápido

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 30-45 minutos | **⭐ Complejidad**: Principiante

---

## Resumen

Este capítulo introduce los fundamentos de Azure Developer CLI (azd). Aprenderás conceptos básicos, cómo instalar las herramientas y desplegar tu primera aplicación en Azure.

> Validado con `azd 1.27.1` en julio de 2026.

## Objetivos de Aprendizaje

Al completar este capítulo, podrás:
- Entender qué es Azure Developer CLI y cómo se diferencia de Azure CLI
- Instalar y configurar AZD en tu plataforma
- Desplegar tu primera aplicación en Azure con `azd up`
- Limpiar los recursos con `azd down`

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|---------|-------------|-------|
| 1 | [Conceptos Básicos de AZD](azd-basics.md) | Conceptos clave, terminología y estructura del proyecto | 15 min |
| 2 | [Instalación y Configuración](installation.md) | Guías de instalación específicas por plataforma | 10 min |
| 3 | [Tu Primer Proyecto](first-project.md) | Práctica: Despliega una aplicación web en Azure | 20 min |
| 4 | [Usa Tu Propia Aplicación](bring-your-own-app.md) | Añade azd a un proyecto existente que ya tengas | 15 min |
| 5 | [Contenedores de Desarrollo y Codespaces](dev-containers.md) | Entornos reproducibles con contenedores de desarrollo | 15 min |

---

## ✅ Comienza Aquí: Valida Tu Configuración

Antes de comenzar, confirma que tu máquina local está lista para la plantilla del Capítulo 1:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Si el script reporta herramientas faltantes, soluciona eso primero y luego continúa con el capítulo.

---

## 🚀 Inicio Rápido

```bash
# Verificar instalación
azd version

# Autenticar para AZD
# Opcional: az login si planeas ejecutar comandos de Azure CLI directamente
azd auth login

# Despliega tu primera aplicación
azd init --template todo-nodejs-mongo
azd up

# Limpia cuando termines
azd down --force --purge
```

---

## ✅ Criterios de Éxito

Después de completar este capítulo, deberías ser capaz de:

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
|-----------|----------|
| **Siguiente** | [Capítulo 2: Desarrollo basado en IA](../chapter-02-ai-development/README.md) |
| **Saltar a** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |

---

## 📖 Recursos Relacionados

- [Hoja de Comandos](../../resources/cheat-sheet.md)
- [Preguntas Frecuentes](../../resources/faq.md)
- [Glosario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->