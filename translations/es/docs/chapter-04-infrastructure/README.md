# Capítulo 4: Infraestructura como Código y Despliegue

**📚 Curso**: [AZD Para Principiantes](../../README.md) | **⏱️ Duración**: 1-1.5 horas | **⭐ Complejidad**: Intermedio

---

## Resumen

Este capítulo cubre patrones de Infraestructura como Código (IaC) con plantillas Bicep, provisión de recursos y estrategias de despliegue usando Azure Developer CLI.

> Validado con `azd 1.27.1` en julio de 2026.

## Objetivos de Aprendizaje

Al completar este capítulo, usted:
- Entenderá la estructura y sintaxis de plantillas Bicep
- Proveerá recursos de Azure con `azd provision`
- Desplegará aplicaciones con `azd deploy`
- Implementará estrategias de despliegue blue-green y rolling

---

## 📚 Lecciones

| # | Lección | Descripción | Tiempo |
|---|--------|-------------|------|
| 1 | [Provisión de Recursos](provisioning.md) | Gestión de recursos Azure con AZD | 45 min |
| 2 | [Guía de Despliegue](deployment-guide.md) | Estrategias de despliegue de aplicaciones | 45 min |
| 3 | [Escribiendo Tu Propia Plantilla](custom-templates.md) | Crear y publicar plantillas azd reutilizables | 30 min |

---

## 🚀 Inicio Rápido

```bash
# Inicializar desde plantilla
azd init --template azure-functions-python-v2-http

# Previsualizar lo que se creará
azd provision --preview

# Aprovisionar solo infraestructura
azd provision

# Desplegar solo código
azd deploy

# O ambos juntos
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
| `azd init` | Inicializa el proyecto |
| `azd provision` | Crea recursos en Azure |
| `azd deploy` | Despliega código de la aplicación |
| `azd up` | provisiona + despliega |
| `azd down` | Elimina todos los recursos |

---

## 🔗 Navegación

| Dirección | Capítulo |
|-----------|---------|
| **Anterior** | [Capítulo 3: Configuración](../chapter-03-configuration/README.md) |
| **Siguiente** | [Capítulo 5: Soluciones Multi-Agente](../chapter-05-multi-agent/README.md) |

---

## 📖 Recursos Relacionados

- [Cheques Pre-Despliegue](../chapter-06-pre-deployment/README.md)
- [Ejemplos de Aplicaciones en Contenedores](../../examples/container-app/README.md)
- [Ejemplo de Aplicación de Base de Datos](../../examples/database-app/README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->