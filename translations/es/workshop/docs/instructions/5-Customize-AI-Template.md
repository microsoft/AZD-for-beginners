# 5. Personalizar una plantilla

!!! tip "AL FINALIZAR ESTE MÓDULO PODRÁS"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Establecer una línea base

Usa el repositorio inicializado [Comenzar con agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) de los módulos anteriores. Registra la revisión de la plantilla, la versión de AZD, el entorno seleccionado, el despliegue del modelo y las preguntas de muestra funcionales antes de cambiar algo.

La muestra implementa una aplicación de chat respaldada por un agente. No se convierte en un sistema minorista de dos agentes simplemente configurando variables de entorno o guardando archivos adicionales de instrucciones. Agentes extra, manejadores de herramientas, enrutamiento, autorización y acceso a datos requieren código de aplicación.

Inspecciona las instrucciones y herramientas del agente desplegado actualmente en Foundry. Prueba una pregunta factual, una pregunta de recuperación y una pregunta que los datos de ejemplo no puedan responder. Verifica las citas contra los documentos fuente reales en lugar de asumir que una respuesta fluida es correcta.

## 5.2 Personalizar la recuperación de conocimiento

La plantilla soporta recuperación basada en archivos e integración opcional con Azure AI Search. Sigue la [guía actual de AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para la indexación y configuración de herramientas.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Habilitar el servicio es solo una parte de la recuperación. Antes de subir tus propios datos:

1. Confirma que tienes permiso para usar los documentos y elimina información sensible.
2. Selecciona un modelo de incrustación compatible en tu región y configura su versión compatible, tipo de despliegue y dimensiones vectoriales.
3. Crea/puebla el índice usando el proceso documentado de la muestra.
4. Configura la herramienta de recuperación del agente para usar ese índice.
5. Prueba la recuperación, citas, autorización y comportamiento cuando no existe un documento relevante.

No cambies de `text-embedding-3-small` a un modelo de incrustación diferente sin verificar las dimensiones y reconstruir/reindexar vectores según se requiera. Un nombre como `retail-products` no es un catálogo implementado ni una política de control de acceso.

## 5.3 Rastreo y monitoreo

Sigue la [guía de observabilidad de la muestra](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Asegúrate de que el recurso y conexión de Application Insights requeridos ya existan; si cambias configuraciones de infraestructura, usa `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envía una petición de prueba, luego inspecciona los registros de la aplicación del Container App y la vista de rastreo del agente en Foundry. Revisa la latencia, llamadas a herramientas, errores y correlación entre la petición y el rastreo. No asumas que la telemetría está conectada solo porque el despliegue tuvo éxito.

Deja `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` deshabilitado a menos que hayas revisado explícitamente el consentimiento, la redacción, la retención y los controles de acceso. Los rastreos pueden contener argumentos sensibles de herramientas o contenido de documentos incluso cuando los registros comunes de la aplicación parecen inofensivos.

## 5.4 Evaluación del agente

El punto de entrada para evaluación de la muestra ahora es [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), no un directorio `evals/`. Desde la raíz de la muestra, usa un entorno Python que cumpla con sus requisitos documentados:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Antes de ejecutar, completa los [prerrequisitos de evaluación](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Las pruebas cargan la configuración del `.azure/<environment>/.env` seleccionado; confirma que el entorno deseado esté seleccionado. Entradas importantes incluyen:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando el formato requerido por la muestra actual (la versión revisada usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usado como despliegue del modelo juez

Inspecciona las pruebas para entender la elección del evaluador, umbrales, roles requeridos y costos de modelo. Una ejecución completada no es automáticamente una aprobación en la puerta de calidad; revisa puntuaciones, casos fallidos/con errores y los resultados vinculados en Foundry.

### Extensión de evaluaciones AZD separada

La prueba Python anterior es un **flujo de trabajo específico de la muestra**. La extensión opcional `azure.ai.evaluations` es un flujo de trabajo diferente, con su propia configuración `evals/azure.eval.yaml`. Se instala por separado, no está incluida en el paquete `microsoft.foundry` 1.0 generalmente disponible:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para una configuración completa de la extensión, consulta [flujos de trabajo de evaluación y migración](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Desde la beta.22 de la extensión de agentes, no uses los comandos `azd ai agent eval` eliminados. Instalar la extensión de evaluaciones no convierte las pruebas Python de la muestra ni crea automáticamente una configuración de evaluación.

Para un **ejercicio separado de agente alojado GA**, usa una carpeta vacía fuera de esta muestra del taller y sigue la [guía local a nube de Foundry](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Usa AZD 1.37.0+, el paquete `microsoft.foundry`, Python 3.13+ y uv actual. Inspeccionarás `azure.yaml`, probarás localmente con Agent Inspector, desplegarás fuentes para una compilación Foundry remota y generarás/revisarás un conjunto de datos y rúbrica antes de configurar `azd ai eval init --name quality`. No reemplaces las pruebas de esta muestra ni asumas que instalar el paquete cambia su modelo de alojamiento.

## 5.5 Red teaming de IA y evaluación continua

La muestra actual ofrece [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Completa sus prerrequisitos y revisa el objetivo previsto y costos antes de ejecutar:

```bash
pytest tests/test_red_teaming.py -s
```

Usa un despliegue de prueba autorizado y datos sintéticos. Revisa los ataques y resultados generados; este análisis no establece que una aplicación sea segura o cumpla con normativas.

La [guía de observabilidad](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) también describe la evaluación continua configurada al inicio del contenedor. Evalúa interacciones reales de usuarios, no tráfico de prueba generado, y el soporte del evaluador varía según región. Sin interacciones, no hay entradas de evaluación. Verifica la versión de la muestra instalada y la configuración del evaluador en lugar de asumir que todos los despliegues tienen los mismos valores predeterminados.

La autenticación es separada de la evaluación. Sigue la configuración documentada de identidad/acceso de la muestra. No existe un “fallback” documentado de autenticación básica para proteger un endpoint público.

## 5.6 Ejercicio de diseño: personalización para retail

!!! warning "Ejercicio de diseño, no un despliegue completado"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Escribe un plan corto que aborde:

| Área | Decisión y evidencia a recopilar |
|------|----------------------------------|
| Responsabilidades del agente | Comenzar con un agente, o justificar agentes separados Shopper y Loyalty y lógica de enrutamiento |
| Datos | Definir un catálogo/recompensas sintético y propiedad de actualizaciones |
| Herramientas | Implementar manejadores de solo lectura primero; especificar autorización y validación para cualquier escritura |
| Modelos | Elegir combinaciones disponibles de modelo/versión/SKU y verificar cuota; evitar aprovisionar modelos no usados |
| Recuperación | Definir indexación, dimensiones de incrustación, citas y controles de acceso a nivel de documento |
| Evaluación | Añadir casos de respuesta esperada, preguntas no soportadas, uso de herramientas y seguridad con umbrales explícitos |
| Operaciones | Definir telemetría, presupuesto de latencia/errores, límites de costo y propiedad de limpieza |

Guardar `custom-agents/shopper-agent-instructions.md` no hace que la muestra lo cargue. Encuentra el código de la aplicación que crea/actualiza el agente, conecta tus instrucciones revisadas ahí y verifica la versión resultante del agente antes de probar. Las instrucciones no pueden otorgar acceso a datos o herramientas que no hayas implementado.

Aplica un cambio a la vez, vuelve a desplegar los componentes afectados y ejecuta nuevamente tus preguntas línea base y evaluaciones. Conserva una revisión funcional para comparación. Para inspiración arquitectónica, ve el [blueprint retail](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), que tampoco es una aplicación retail completa.

!!! quote "AL FINAL DE ESTE LAB DEBERÍAS HABER"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continúa con [Desmantelar infraestructura](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->