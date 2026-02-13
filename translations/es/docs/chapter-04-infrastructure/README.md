# Capítulo 4: Infraestructura como Código y Despliegue

**📚 Curso**: [AZD para Principiantes](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Descripción general

This chapter covers Infrastructure as Code (IaC) patterns with Bicep templates, resource provisioning, and deployment strategies using Azure Developer CLI.

## Objetivos de aprendizaje

By completing this chapter, you will:
- Comprender la estructura y sintaxis de las plantillas Bicep
- Aprovisionar recursos de Azure con `azd provision`
- Desplegar aplicaciones con `azd deploy`
- Implementar estrategias de despliegue azul-verde y rolling

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Aprovisionamiento de recursos](provisioning.md) | Gestión de recursos de Azure con AZD | 45 min |
| 2 | [Guía de Despliegue](deployment-guide.md) | Estrategias de despliegue de aplicaciones | 45 min |

---

## 🚀 Inicio Rápido

```bash
# Inicializar desde la plantilla
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

## 🔧 Comandos Esenciales

| Comando | Descripción |
|---------|-------------|
| `azd init` | Inicializar proyecto |
| `azd provision` | Crear recursos de Azure |
| `azd deploy` | Desplegar código de la aplicación |
| `azd up` | provisionar + desplegar |
| `azd down` | Eliminar todos los recursos |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |
| **Siguiente** | [Capítulo 5: Soluciones Multi-Agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos Relacionados

- [Comprobaciones previas al despliegue](../chapter-06-pre-deployment/README.md)
- [Ejemplos de aplicaciones en contenedores](../../examples/container-app/README.md)
- [Ejemplo de aplicación de base de datos](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Descargo de responsabilidad:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. La versión original del documento en su idioma nativo debe considerarse la fuente oficial. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->