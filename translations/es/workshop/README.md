<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Taller en Construcción 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Este taller está actualmente en desarrollo activo.</strong><br>
      El contenido puede estar incompleto o sujeto a cambios. ¡Vuelve pronto para más actualizaciones!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Última actualización: Octubre 2025
      </span>
    </div>
  </div>
</div>

# Taller AZD para Desarrolladores de IA

Bienvenido al taller práctico para aprender a usar Azure Developer CLI (AZD) con un enfoque en el despliegue de aplicaciones de IA. Este taller te ayudará a obtener un entendimiento aplicado de las plantillas de AZD en 3 pasos:

1. **Descubrimiento** - encuentra la plantilla adecuada para ti.
1. **Despliegue** - despliega y valida que funcione.
1. **Personalización** - modifica e itera para adaptarla a tus necesidades.

A lo largo de este taller, también se te presentarán herramientas y flujos de trabajo esenciales para desarrolladores, que te ayudarán a optimizar tu proceso de desarrollo de principio a fin.

<br/>

## Guía Basada en Navegador

Las lecciones del taller están en formato Markdown. Puedes navegar directamente en GitHub o lanzar una vista previa en el navegador como se muestra en la captura de pantalla a continuación.

![Taller](../../../translated_images/es/workshop.75906f133e6f8ba0.webp)

Para usar esta opción, haz un fork del repositorio en tu perfil y lanza GitHub Codespaces. Una vez que el terminal de VS Code esté activo, escribe este comando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

En unos segundos, verás un cuadro de diálogo emergente. Selecciona la opción `Abrir en el navegador`. La guía basada en la web se abrirá en una nueva pestaña del navegador. Algunos beneficios de esta vista previa:

1. **Búsqueda integrada** - encuentra palabras clave o lecciones rápidamente.
1. **Icono de copiar** - pasa el cursor sobre los bloques de código para ver esta opción.
1. **Cambio de tema** - alterna entre temas oscuro y claro.
1. **Obtén ayuda** - haz clic en el icono de Discord en el pie de página para unirte.

<br/>

## Resumen del Taller

**Duración:** 3-4 horas  
**Nivel:** Principiante a Intermedio  
**Requisitos previos:** Familiaridad con Azure, conceptos de IA, VS Code y herramientas de línea de comandos.

Este es un taller práctico donde aprenderás haciendo. Una vez que completes los ejercicios, te recomendamos revisar el currículo de AZD Para Principiantes para continuar tu aprendizaje en mejores prácticas de Seguridad y Productividad.

| Tiempo | Módulo  | Objetivo |
|:---|:---|:---|
| 15 mins | [Introducción](docs/instructions/0-Introduction.md) | Establecer el contexto, entender los objetivos |
| 30 mins | [Seleccionar Plantilla de IA](docs/instructions/1-Select-AI-Template.md) | Explorar opciones y elegir un inicio | 
| 30 mins | [Validar Plantilla de IA](docs/instructions/2-Validate-AI-Template.md) | Desplegar solución predeterminada en Azure |
| 30 mins | [Descomponer Plantilla de IA](docs/instructions/3-Deconstruct-AI-Template.md) | Explorar estructura y configuración |
| 30 mins | [Configurar Plantilla de IA](docs/instructions/4-Configure-AI-Template.md) | Activar y probar funciones disponibles |
| 30 mins | [Personalizar Plantilla de IA](docs/instructions/5-Customize-AI-Template.md) | Adaptar la plantilla a tus necesidades |
| 30 mins | [Desmontar Infraestructura](docs/instructions/6-Teardown-Infrastructure.md) | Limpiar y liberar recursos |
| 15 mins | [Conclusión y Próximos Pasos](docs/instructions/7-Wrap-up.md) | Recursos de aprendizaje, desafío del taller |

<br/>

## Lo que Aprenderás

Piensa en la Plantilla AZD como un espacio de aprendizaje para explorar diversas capacidades y herramientas para el desarrollo de principio a fin en Azure AI Foundry. Al final de este taller, deberías tener una comprensión intuitiva de varias herramientas y conceptos en este contexto.

| Concepto  | Objetivo |
|:---|:---|
| **Azure Developer CLI** | Entender comandos y flujos de trabajo de la herramienta |
| **Plantillas AZD** | Comprender la estructura del proyecto y la configuración |
| **Agente de Azure AI** | Provisión y despliegue del proyecto Azure AI Foundry |
| **Azure AI Search** | Habilitar ingeniería de contexto con agentes |
| **Observabilidad** | Explorar trazabilidad, monitoreo y evaluaciones |
| **Red Teaming** | Explorar pruebas adversariales y mitigaciones |

<br/>

## Estructura del Taller

El taller está estructurado para llevarte en un viaje desde el descubrimiento de plantillas, hasta el despliegue, descomposición y personalización, utilizando la plantilla oficial [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) como base.

### [Módulo 1: Seleccionar Plantilla de IA](docs/instructions/1-Select-AI-Template.md) (30 mins)

- ¿Qué son las Plantillas de IA?
- ¿Dónde puedo encontrar Plantillas de IA?
- ¿Cómo puedo empezar a construir Agentes de IA?
- **Laboratorio**: Inicio rápido con GitHub Codespaces

### [Módulo 2: Validar Plantilla de IA](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- ¿Cuál es la arquitectura de la Plantilla de IA?
- ¿Cuál es el flujo de trabajo de desarrollo con AZD?
- ¿Cómo puedo obtener ayuda con el desarrollo en AZD?
- **Laboratorio**: Desplegar y validar la plantilla de Agentes de IA

### [Módulo 3: Descomponer Plantilla de IA](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Explorar tu entorno en `.azure/` 
- Explorar tu configuración de recursos en `infra/` 
- Explorar tu configuración de AZD en `azure.yaml`s
- **Laboratorio**: Modificar variables de entorno y volver a desplegar

### [Módulo 4: Configurar Plantilla de IA](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Explorar: Generación Aumentada por Recuperación
- Explorar: Evaluación de Agentes y Red Teaming
- Explorar: Trazabilidad y Monitoreo
- **Laboratorio**: Explorar Agente de IA + Observabilidad 

### [Módulo 5: Personalizar Plantilla de IA](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Definir: PRD con Requisitos de Escenario
- Configurar: Variables de Entorno para AZD
- Implementar: Hooks de Ciclo de Vida para tareas adicionales
- **Laboratorio**: Personalizar plantilla para mi escenario

### [Módulo 6: Desmontar Infraestructura](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Recapitulación: ¿Qué son las Plantillas AZD?
- Recapitulación: ¿Por qué usar Azure Developer CLI?
- Próximos Pasos: ¡Prueba una plantilla diferente!
- **Laboratorio**: Desprovisionar infraestructura y limpiar

<br/>

## Desafío del Taller

¿Quieres desafiarte a hacer más? Aquí tienes algunas sugerencias de proyectos, ¡o comparte tus ideas con nosotros!

| Proyecto | Descripción |
|:---|:---|
|1. **Descomponer una Plantilla de IA Compleja** | Usa el flujo de trabajo y las herramientas que hemos descrito y ve si puedes desplegar, validar y personalizar una plantilla de solución de IA diferente. _¿Qué aprendiste?_|
|2. **Personalizar con tu Escenario**  | Intenta escribir un PRD (Documento de Requisitos del Producto) para un escenario diferente. Luego usa GitHub Copilot en tu repositorio de plantillas en el modelo de Agente y pídele que genere un flujo de trabajo de personalización para ti. _¿Qué aprendiste? ¿Cómo podrías mejorar estas sugerencias?_|
| | |

## ¿Tienes comentarios?

1. Publica un issue en este repositorio - etiquétalo como `Workshop` para mayor comodidad.
1. Únete al Discord de Azure AI Foundry - conecta con tus compañeros.


| | | 
|:---|:---|
| **📚 Inicio del Curso**| [AZD Para Principiantes](../README.md)|
| **📖 Documentación** | [Comenzar con plantillas de IA](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Plantillas de IA** | [Plantillas de Azure AI Foundry](https://ai.azure.com/templates) |
|**🚀 Próximos Pasos** | [Acepta el Desafío](../../../workshop) |
| | |

<br/>

---

**Anterior:** [Guía de Solución de Problemas de IA](../docs/troubleshooting/ai-troubleshooting.md) | **Siguiente:** Comienza con [Laboratorio 1: Fundamentos de AZD](../../../workshop/lab-1-azd-basics)

**¿Listo para comenzar a construir aplicaciones de IA con AZD?**

[Comienza el Laboratorio 1: Fundamentos de AZD →](./lab-1-azd-basics/README.md)

---

**Descargo de responsabilidad**:  
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por lograr precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o imprecisiones. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por humanos. No nos hacemos responsables de malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.