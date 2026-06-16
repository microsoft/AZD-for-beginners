# Capítulo 4: Infraestructura como Código y Despliegue

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Descripción general

This chapter covers Infrastructure as Code (IaC) patterns with Bicep templates, resource provisioning, and deployment strategies using Azure Developer CLI.

> Validado con `azd 1.25.6` en junio de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, podrás:
- Entender la estructura y la sintaxis de las plantillas Bicep
- Provisionar recursos de Azure con `azd provision`
- Desplegar aplicaciones con `azd deploy`
- Implementar estrategias de despliegue blue-green y rolling

---

## 📚 Lecciones

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Provisioning Resources](provisioning.md) | Azure resource management with AZD | 45 min |
| 2 | [Deployment Guide](deployment-guide.md) | Application deployment strategies | 45 min |
| 3 | [Authoring Your Own Template](custom-templates.md) | Build and publish reusable azd templates | 30 min |

---

## 🚀 Inicio rápido

```bash
# Inicializar desde plantilla
azd init --template azure-functions-python-v2-http

# Previsualizar lo que se creará
azd provision --preview

# Aprovisionar solo la infraestructura
azd provision

# Desplegar solo el código
azd deploy

# O ambos juntos
azd up
```

---

## 📁 Estructura del proyecto AZD

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

## 🔧 Comandos esenciales

| Command | Description |
|---------|-------------|
| `azd init` | Inicializar proyecto |
| `azd provision` | Crear recursos de Azure |
| `azd deploy` | Desplegar el código de la aplicación |
| `azd up` | provisionar + desplegar |
| `azd down` | Eliminar todos los recursos |

---

## 🔗 Navegación

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Chapter 3: Configuration](../chapter-03-configuration/README.md) |
| **Next** | [Chapter 5: Multi-Agent Solutions](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos relacionados

- [Pre-Deployment Checks](../chapter-06-pre-deployment/README.md)
- [Container App Examples](../../examples/container-app/README.md)
- [Database App Example](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->