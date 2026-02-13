# Capítulo 1: Fundamentos y Inicio Rápido

**📚 Curso**: [AZD para principiantes](../../README.md) | **⏱️ Duración**: 30-45 minutos | **⭐ Complejidad**: Principiante

---

## Descripción general

Este capítulo presenta los fundamentos de Azure Developer CLI (azd). Aprenderás conceptos clave, instalarás las herramientas y desplegarás tu primera aplicación en Azure.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Entender qué es Azure Developer CLI y cómo se diferencia de Azure CLI
- Instalar y configurar AZD en tu plataforma
- Desplegar tu primera aplicación en Azure con `azd up`
- Eliminar recursos con `azd down`

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Conceptos básicos de AZD](azd-basics.md) | Conceptos clave, terminología y estructura del proyecto | 15 min |
| 2 | [Instalación y Configuración](installation.md) | Guías de instalación específicas para cada plataforma | 10 min |
| 3 | [Tu primer proyecto](first-project.md) | Práctica: Despliega una aplicación web en Azure | 20 min |

---

## 🚀 Inicio Rápido

```bash
# Comprobar la instalación
azd version

# Iniciar sesión en Azure
azd auth login

# Despliega tu primera aplicación
azd init --template todo-nodejs-mongo
azd up

# Limpia cuando termines
azd down --force --purge
```

---

## ✅ Criterios de éxito

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
|-----------|---------|
| **Siguiente** | [Capítulo 2: Desarrollo con enfoque en IA](../chapter-02-ai-development/README.md) |
| **Saltar a** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |

---

## 📖 Recursos relacionados

- [Hoja de referencia de comandos](../../resources/cheat-sheet.md)
- [Preguntas frecuentes](../../resources/faq.md)
- [Glosario](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido mediante el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que pueda surgir del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->