# Capítulo 4: Infraestructura como Código y Despliegue

**📚 Curso**: [AZD For Beginners](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Descripción general

Este capítulo cubre patrones de Infraestructura como Código (IaC) con plantillas Bicep, aprovisionamiento de recursos y estrategias de despliegue usando Azure Developer CLI.

> Validado contra `azd 1.23.12` en marzo de 2026.

## Objetivos de aprendizaje

Al completar este capítulo, usted:
- Comprender la estructura y sintaxis de las plantillas Bicep
- Aprovisionar recursos de Azure con `azd provision`
- Desplegar aplicaciones con `azd deploy`
- Implementar estrategias de despliegue blue-green y rodante

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Provisionamiento de recursos](provisioning.md) | Gestión de recursos de Azure con AZD | 45 min |
| 2 | [Guía de despliegue](deployment-guide.md) | Estrategias de despliegue de aplicaciones | 45 min |

---

## 🚀 Inicio rápido

```bash
# Inicializar desde plantilla
azd init --template azure-functions-python-v2-http

# Previsualizar lo que se creará
azd provision --preview

# Provisionar solo la infraestructura
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

| Comando | Descripción |
|---------|-------------|
| `azd init` | Inicializar el proyecto |
| `azd provision` | Crear recursos de Azure |
| `azd deploy` | Desplegar el código de la aplicación |
| `azd up` | provisionar + desplegar |
| `azd down` | Eliminar todos los recursos |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |
| **Siguiente** | [Capítulo 5: Soluciones multi-agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos relacionados

- [Comprobaciones previas al despliegue](../chapter-06-pre-deployment/README.md)
- [Ejemplos de aplicaciones en contenedores](../../examples/container-app/README.md)
- [Ejemplo de aplicación de base de datos](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr la máxima precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->