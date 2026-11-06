# Ejemplos — Fuente en inglés y muestras de Azure

Estos son ejemplos de aprendizaje, no aplicaciones certificadas para producción. Lea los
prerrequisitos, limitaciones, costos e instrucciones de limpieza de cada ejemplo antes de
ejecutar comandos. Se debe verificar la disponibilidad y cuotas de Azure en su suscripción.

- [Inicio del curso](../README.md)
- [Instalación](../docs/chapter-01-foundation/installation.md)
- [Solución de problemas](../docs/chapter-07-troubleshooting/common-issues.md)

## Qué existe realmente localmente

Hay **cuatro ejemplos de aplicaciones** y **un andamiaje de infraestructura**:

| Ejemplo | Implementación local | Enfoque de aprendizaje | Nivel |
|---|---|---|---|
| [API Simple con Flask](../../../examples/container-app/simple-flask-api) | Flask API CRUD, Dockerfile, Bicep, `azure.yaml` | Despliegue en contenedor, sondas, registros | Principiante |
| [Microservicios con dos servicios](../../../examples/container-app/microservices) | Gateway Node.js y servicio de producto Python de solo lectura, Dockerfiles, Bicep, `azure.yaml` | Comunicación HTTPS interna, escalado independiente | Intermedio |
| [Aplicación con base de datos](../../../examples/database-app) | API de lectura Flask, Azure SQL, App Service, Bicep, `azure.yaml` | Conectividad SQL, inicialización, registros | Intermedio |
| [Chat de Azure OpenAI](../../../examples/azure-openai-chat) | CLI Python local, Azure OpenAI y Key Vault Bicep, solo infraestructura `azure.yaml` | Provisionamiento de modelos, historial de chat, estimaciones de tokens | Intermedio |
| [Infraestructura de retail](../../../examples/retail-multiagent-arm-template) | Plantilla ARM, parámetros, script de despliegue Bash; solo contenedores **hello-world** | Infraestructura para una futura aplicación multiagente | Avanzado |

El [escenario de retail](retail-scenario.md) es un **plan arquitectónico**, no una
implementación completa multiagente. No incluye código agente retail, interfaz de chat,
API de router, canal de datos de búsqueda, CLI de evaluación, conmutación por error automática
ni endurecimiento para producción. Estos deben diseñarse, construirse y probarse por separado.

La [visión general de microservicios](microservices/README.md) apunta al ejemplo
ejecutable de dos servicios; no es otro directorio de despliegue.

## Ruta de aprendizaje recomendada

1. Despliegue la API Flask y verifique `/health` y operaciones CRUD.
2. Despliegue la aplicación de base de datos y verifique sus cinco productos semilla.
3. Despliegue el ejemplo de dos servicios y verifique las solicitudes de gateway a producto.
4. Provisione los recursos de chat y ejecute el CLI interactivo **localmente**.
5. Estudie el plan de retail después de completar los ejemplos funcionales.

Reserve aproximadamente 30–60 minutos por ejemplo de aplicación, incluyendo prerrequisitos y
verificación. La implementación de retail es un proyecto de desarrollo separado, no un
taller de 30 minutos. Leer su arquitectura toma unas 2–3 horas; la implementación
y preparación para producción pueden llevar mucho más que las
ilustrativas 80–120 horas de desarrollo indicadas en la guía.

## Inicio rápido

Desde la raíz del repositorio, para el primer ejemplo de contenedor:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Esperado: HTTP 200 y JSON que contiene `"status": "healthy"`.
Necesita tener Docker en ejecución para la compilación local del contenedor.

Para chat, siga el [README de chat](azure-openai-chat/README.md): use
`azd provision`, cargue la clave API desde Key Vault al shell actual, instale
`src/requirements.txt`, y ejecute `python src/chat.py`. No hay servicio de chat alojado.

Para retail, utilice la [guía ARM](retail-multiagent-arm-template/README.md).
No tiene `azure.yaml` y **no** se despliega ni elimina con `azd up`/`azd down`.

## Costos y limitaciones

- Todos los despliegues crean recursos facturables de Azure. El escalado a cero solo se aplica a
   cómputo de la aplicación; no elimina costos de registro, base de datos, almacenamiento, búsqueda o logs.
- Los precios exactos dependen de región, moneda, tráfico, modelo/SKU y retención.
   Use la [calculadora de precios de Azure](https://azure.microsoft.com/pricing/calculator/)
   antes del despliegue y configure un presupuesto en Azure Cost Management.
- Los datos CRUD de Flask están en memoria, limitados a un trabajador y a lo sumo una réplica por
   defecto. Desaparecen al reiniciar o escalar a cero. Esto no es almacenamiento duradero.
- El microservicio de producto expone solo puntos finales GET. No se incluye servicio de pedidos, servicio de usuarios,
   base de datos, Service Bus, implementación en C# o Go.
- Los recursos de Application Insights no instrumentan automáticamente cada aplicación.
   Consulte cada ejemplo para la telemetría realmente emitida.
- Los ejemplos no implementan autenticación de aplicaciones. Añada identidad, autorización,
   almacenamiento persistente, controles de red, pruebas y procedimientos operativos antes de producción.

## Ejemplos externos de Azure — clonar por separado

Estos enlaces son referencias a repositorios separados, **no ejemplos locales**.
Sus mantenedores son responsables de las instrucciones de configuración, implementación, dependencias y costos.

| Ejemplo | Enfoque |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Aplicación Node.js con base de datos |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# y Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Frontend estático con Functions en C# y SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Aplicación serverless en Python |
| [API de tienda con Container Apps](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Backend de tienda contenerizado |
| [Inicio rápido chat AI](https://github.com/Azure-Samples/get-started-with-ai-chat) | Aplicación de chat AI |
| [Inicio rápido agentes AI](https://github.com/Azure-Samples/get-started-with-ai-agents) | Aplicación de agente |
| [Demostración búsqueda + OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG con búsqueda y citas |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Ejemplo de IA conversacional |
| [Java en Container Apps](https://github.com/Azure-Samples/java-on-aca) | Microservicios en Java |

Descubra más proyectos en la [galería de plantillas AZD](https://azure.github.io/awesome-azd/).
No asuma que un proyecto externo soporta `azd` sin verificar su README actual.

## Estructura del repositorio

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

No hay `configurations/`, `scripts/` ni directorio de pruebas compartido prometido por
este índice. Los archivos reales y las ideas opcionales de extensión se identifican en cada guía.

## Limpieza

Para las cuatro muestras AZD, ejecute esto **desde el directorio del ejemplo seleccionado**:

```bash
azd down
```

Revise el aviso de eliminación. Para retail, elimine solo el grupo de recursos dedicado
que creó, usando las instrucciones en su guía ARM. Verifique Azure Cost Management
después de la limpieza; los datos de facturación pueden llegar más tarde.

## Contribuciones

Incluya el código fuente, infraestructura, configuración de despliegue, pasos prácticos de configuración y
verificación, limitaciones e instrucciones de limpieza con cada ejemplo de aplicación.
Etiquete explícitamente el material solo de arquitectura y los fragmentos incompletos.
No afirme que está listo para producción sin pruebas de despliegue, funcionales y operativas.

[Preguntas frecuentes](../resources/faq.md) · [Guía de estudio](../resources/study-guide.md) ·
[Reportar un problema](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->