# Capítulo 4: Infraestructura como Código y Despliegue

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 2-3 horas de lectura; reserva tiempo adicional para ejercicios de despliegue | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo abarca patrones de Infraestructura como Código (IaC) con plantillas Bicep, aprovisionamiento de recursos y estrategias de despliegue usando Azure Developer CLI.

> Objetivo de revisión de comandos y configuración: `azd 1.37.2` (noviembre 2026). No se ejecutó aprovisionamiento en vivo en Azure durante la revisión.

## Objetivos de Aprendizaje

Al completar este capítulo, usted:
- Entenderá la estructura y sintaxis de plantillas Bicep
- Aprovisionará recursos Azure con `azd provision`
- Desplegará aplicaciones con `azd deploy`
- Implementará estrategias de despliegue blue-green y rolling

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Aprovisionamiento de Recursos](provisioning.md) | Gestión de recursos Azure con AZD | 45 min |
| 2 | [Guía de Despliegue](deployment-guide.md) | Estrategias de despliegue de aplicaciones | 45 min |
| 3 | [Creación de Tu Propia Plantilla](custom-templates.md) | Construcción y publicación de plantillas azd reutilizables | 30 min |

---

## 🚀 Inicio Rápido

```bash
# Initialize from template
mkdir infrastructure-practice
cd infrastructure-practice
azd init --template todo-nodejs-mongo .
azd auth login

# Preview what will be created
azd provision --preview

# Provision infrastructure only
azd provision

# Deploy code only
azd deploy

# Or both together
azd up
```

---

## 📁 Estructura del Proyecto AZD

```
my-project/
├── azure.yaml            # ← Project definition
├── infra/                # ← Infrastructure as Code
│   ├── main.bicep        # Entry point
│   ├── main.parameters.json
│   └── modules/          # Reusable components
│       ├── web.bicep
│       └── database.bicep
└── src/                  # Application code
    └── api/
```

---

## 🔧 Comandos Esenciales

| Comando | Descripción |
|---------|-------------|
| `azd init` | Inicializar proyecto |
| `azd provision` | Crear recursos Azure |
| `azd deploy` | Desplegar código de la aplicación |
| `azd up` | aprovisionar + desplegar |
| `azd down` | Eliminar todos los recursos |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |
| **Siguiente** | [Capítulo 5: Soluciones Multi-Agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos Relacionados

- [Verificaciones Previas al Despliegue](../chapter-06-pre-deployment/README.md)
- [Ejemplos de Aplicación Contenedorizada](../../examples/container-app/README.md)
- [Ejemplo de Aplicación de Base de Datos](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->