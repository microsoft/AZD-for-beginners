# 5. Personalizar una plantilla

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Establecer una línea base

Usa el repositorio inicializado [Comenzar con agentes de IA](https://github.com/Azure-Samples/get-started-with-ai-agents) de los módulos anteriores. Registra la revisión de la plantilla, la versión de AZD, el entorno seleccionado, el despliegue del modelo y las preguntas de muestra antes de cambiar cualquier cosa.

La muestra implementa una aplicación de chat respaldada por un agente. No se convierte en un sistema minorista de dos agentes simplemente configurando variables de entorno o guardando archivos adicionales de instrucciones. Los agentes adicionales, manejadores de herramientas, enrutamiento, autorización y acceso a datos requieren código de aplicación.

Inspecciona las instrucciones y herramientas del agente actualmente desplegado en Foundry. Prueba una pregunta factual, una pregunta de recuperación y una pregunta que los datos de muestra no puedan responder. Verifica las citas contra los documentos fuente reales en lugar de asumir que una respuesta fluida es correcta.

## 5.2 Personalizar la recuperación de conocimiento

La plantilla admite la recuperación basada en archivos y la integración opcional de Azure AI Search. Sigue la [guía actual de AI Search](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) para la indexación y configuración de herramientas.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Habilitar el servicio es solo una parte de la recuperación. Antes de subir tus propios datos:

1. Confirma que tienes permiso para usar los documentos y elimina la información sensible.
2. Selecciona un modelo de embeddings soportado en tu región y configura su versión compatible, tipo de despliegue y dimensiones vectoriales.
3. Crea/puebla el índice usando el proceso documentado de la muestra.
4. Configura la herramienta de recuperación del agente para usar ese índice.
5. Prueba la recuperación, citas, autorización y comportamiento cuando no exista documento relevante.

No cambies de `text-embedding-3-small` a otro modelo de embeddings sin verificar dimensiones y reconstruir/reindexar vectores según sea necesario. Un nombre como `retail-products` no es un catálogo implementado ni una política de control de acceso.

## 5.3 Trazabilidad y monitoreo

Sigue la [guía de observabilidad de la muestra](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Asegúrate de que el recurso requerido de Application Insights y la conexión ya existan; si cambias configuraciones de infraestructura, usa `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Envía una solicitud de prueba, luego inspecciona los registros de aplicación del Container App y la vista de trazabilidad del agente en Foundry. Revisa latencia, llamadas a herramientas, errores y correlación entre la solicitud y la traza. No asumas que la telemetría está conectada solo porque el despliegue tuvo éxito.

Mantén `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` deshabilitado a menos que hayas revisado explícitamente el consentimiento, la redacción, la retención y los controles de acceso. Las trazas pueden contener argumentos sensibles de herramientas o contenido de documentos incluso cuando los registros ordinarios parecen inofensivos.

## 5.4 Evaluación del agente

El punto de entrada para la evaluación de la muestra es ahora [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), no un directorio `evals/`. Desde la raíz de la muestra, usa un entorno Python que cumpla con sus requisitos documentados:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Antes de ejecutar, completa los [prerrequisitos de evaluación](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Las pruebas cargan configuración desde el `.azure/<environment>/.env` seleccionado; confirma que el entorno deseado está seleccionado. Entradas importantes incluyen:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, usando el formato requerido por la muestra actual (la versión revisada usa `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, usado como implementación del modelo juez

Inspecciona las pruebas para entender la elección del evaluador, umbrales, roles requeridos y costos de modelos. Una ejecución completada no es automáticamente un paso de calidad aprobado; inspecciona puntuaciones, casos fallidos/error y los resultados vinculados en Foundry.

### Extensión de evaluaciones AZD separada

La prueba Python anterior es un **flujo de trabajo específico de la muestra**. La extensión opcional `azure.ai.evaluations` es otro flujo de trabajo, con su propia configuración `evals/azure.eval.yaml`:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Para una configuración completa de la extensión, consulta [flujos de trabajo de evaluación y migración](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Desde la versión beta.22 de la extensión de agentes, no uses los comandos `azd ai agent eval` eliminados. Instalar la extensión de evaluaciones no convierte las pruebas Python de la muestra ni crea automáticamente una configuración de evaluación.

## 5.5 Red teaming de IA y evaluación continua

La muestra actual proporciona [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Completa sus prerrequisitos y revisa el objetivo previsto y los costos antes de ejecutar:

```bash
pytest tests/test_red_teaming.py -s
```

Usa un despliegue de prueba autorizado y datos sintéticos. Revisa los ataques y resultados generados; este escaneo no establece que una aplicación sea segura o cumpla regulaciones.

La [guía de observabilidad](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) también describe la evaluación continua configurada al inicio del contenedor. Evalúa interacciones reales de usuario, no tráfico de prueba generado, y el soporte del evaluador varía según la región. Sin interacciones no hay entradas de evaluación. Verifica la versión instalada de la muestra y configuración del evaluador en lugar de asumir que todos los despliegues tienen los mismos valores predeterminados.

La autenticación es independiente de la evaluación. Sigue la configuración documentada de identidad/acceso de la muestra. No hay un “fallback” de autenticación básica documentado para proteger un endpoint público.

## 5.6 Ejercicio de diseño: personalización minorista

!!! warning "Ejercicio de diseño, no un despliegue completo"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Escribe un plan breve que aborde:

| Área | Decisión y evidencia a recopilar |
|------|----------------------------------|
| Responsabilidades del agente | Comenzar con un agente, o justificar agentes separados para Comprador y Fidelidad y lógica de enrutamiento |
| Datos | Definir un conjunto de datos sintético de catálogo/recompensas y propiedad de las actualizaciones |
| Herramientas | Implementar primero manejadores de solo lectura; especificar autorización y validación para cualquier escritura |
| Modelos | Elegir combinaciones disponibles de modelo/versión/SKU y verificar cuotas; evitar aprovisionar modelos no usados |
| Recuperación | Definir indexación, dimensiones de embedding, citas y controles de acceso a nivel de documento |
| Evaluación | Añadir casos de respuesta esperada, pregunta no soportada, uso de herramientas y seguridad con umbrales explícitos |
| Operaciones | Definir telemetría, presupuestos de latencia/error, límites de costos y propiedad de limpieza |

Guardar `custom-agents/shopper-agent-instructions.md` no hace que la muestra lo cargue. Encuentra el código de aplicación que crea/actualiza el agente, conecta tus instrucciones revisadas allí y verifica la versión del agente resultante antes de probar. Las instrucciones no pueden otorgar acceso a datos o herramientas que no hayas implementado.

Aplica un cambio a la vez, vuelve a desplegar los componentes afectados y repite tus preguntas base y evaluaciones. Mantén una revisión funcional para comparación. Para inspiración arquitectónica, consulta el [blueprint minorista](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), que tampoco es una aplicación minorista completa.

!!! quote "AL FINAL DE ESTE LAB DEBERÍAS HABER"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Continúa con [Desmontar la infraestructura](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->