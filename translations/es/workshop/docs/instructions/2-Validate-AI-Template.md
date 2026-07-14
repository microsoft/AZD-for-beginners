# 2. Validar una plantilla

> Validado contra `azd 1.27.1` en julio de 2026.

!!! tip "AL FINALIZAR ESTE MÓDULO PODRÁS"

    - [ ] Analizar la arquitectura de la solución de IA
    - [ ] Entender el flujo de trabajo de implementación de AZD
    - [ ] Usar GitHub Copilot para obtener ayuda sobre el uso de AZD
    - [ ] **Lab 2:** Implementar y validar la plantilla de agentes de IA

---


## 1. Introducción

El [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` es una herramienta de línea de comandos de código abierto que agiliza el flujo de trabajo del desarrollador al construir e implementar aplicaciones en Azure.

[Las plantillas AZD](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) son repositorios estandarizados que incluyen código de aplicación de ejemplo, activos de infraestructura como código y archivos de configuración `azd` para una arquitectura de solución cohesiva. El aprovisionamiento de la infraestructura se vuelve tan simple como el comando `azd provision`, mientras que el uso de `azd up` permite aprovisionar la infraestructura **y** desplegar tu aplicación de una sola vez.

Como resultado, iniciar tu proceso de desarrollo de aplicaciones puede ser tan sencillo como encontrar la plantilla _AZD Starter_ adecuada que se acerque a tus necesidades de aplicación e infraestructura, y luego personalizar el repositorio para adaptarlo a los requisitos de tu escenario.

Antes de comenzar, asegúrate de tener instalado el Azure Developer CLI.

1. Abre una terminal en VS Code y escribe este comando:

      ```bash title="" linenums="0"
      azd version
      ```

1. ¡Deberías ver algo como esto!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Ahora estás listo para seleccionar y desplegar una plantilla con azd**

---

## 2. Selección de plantilla

La plataforma Microsoft Foundry viene con un [conjunto de plantillas AZD recomendadas](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cubren escenarios populares como la _automatización de flujos de trabajo multiagente_ y el _procesamiento de contenido multimodal_. También puedes descubrir estas plantillas visitando el portal Microsoft Foundry.

1. Visita [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Inicia sesión en el portal Microsoft Foundry cuando se te solicite; verás algo así.

![Pick](../../../../../translated_images/es/01-pick-template.60d2d5fff5ebc374.webp)


Las opciones **Básicas** son tus plantillas de inicio:

1. [ ] [Comenzar con AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) que despliega una aplicación de chat básica _con tus datos_ en Azure Container Apps. Úsala para explorar un escenario básico de chatbot con IA.
1. [X] [Comenzar con AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) que también despliega un agente de IA estándar (con los Agentes Foundry). Úsalo para familiarizarte con soluciones de IA agentica que involucran herramientas y modelos.

Visita el segundo enlace en una pestaña nueva del navegador (o haz clic en `Open in GitHub` en la tarjeta relacionada). Deberías ver el repositorio para esta plantilla AZD. Tómate un momento para explorar el README. La arquitectura de la aplicación se ve así:

![Arch](../../../../../translated_images/es/architecture.8cec470ec15c65c7.webp)

---

## 3. Activación de la plantilla

Intentemos desplegar esta plantilla y asegurarnos de que es válida. Seguiremos las pautas en la sección [Empezando](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Elige un entorno de trabajo para el repositorio de plantilla:

      - **GitHub Codespaces**: Haz clic en [este enlace](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) y confirma `Create codespace`
      - **Clonación local o contenedor dev**: Clona `Azure-Samples/get-started-with-ai-agents` y ábrelo en VS Code

1. Espera hasta que la terminal de VS Code esté lista, luego escribe el siguiente comando:

   ```bash title="" linenums="0"
   azd up
   ```

Completa los pasos del flujo de trabajo que esto activará:

1. Se te pedirá iniciar sesión en Azure - sigue las instrucciones para autenticarte
1. Ingresa un nombre único para tu entorno - por ejemplo, usé `nitya-mshack-azd`
1. Esto creará una carpeta `.azure/` - verás una subcarpeta con el nombre del entorno
1. Se te pedirá seleccionar un nombre de suscripción - selecciona la predeterminada
1. Se te pedirá una ubicación - usa `East US 2`

Ahora, espera a que el aprovisionamiento termine. **Esto toma de 10 a 15 minutos**

1. Cuando termine, tu consola mostrará un mensaje de ÉXITO como este:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. El Portal de Azure ahora tendrá un grupo de recursos aprovisionado con ese nombre de entorno:

      ![Infra](../../../../../translated_images/es/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Ahora estás listo para validar la infraestructura y aplicación desplegadas**.

---

## 4. Validación de la plantilla

1. Visita la página de [Grupos de recursos](https://portal.azure.com/#browse/resourcegroups) del Portal Azure - inicia sesión cuando se te solicite
1. Haz clic en el grupo de recursos para el nombre de tu entorno - verás la página mostrada arriba

      - haz clic en el recurso Azure Container Apps
      - haz clic en la URL de la aplicación en la sección _Esenciales_ (arriba a la derecha)

1. Deberías ver una interfaz de usuario frontal de la aplicación alojada como esta:

   ![App](../../../../../translated_images/es/03-test-application.471910da12c3038e.webp)

1. Prueba haciendo un par de [preguntas de ejemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pregunta: ```¿Cuál es la capital de Francia?``` 
      1. Pregunta: ```¿Cuál es la mejor tienda de campaña por menos de $200 para dos personas, y qué características incluye?```

1. Deberías obtener respuestas similares a las mostradas abajo. _¿Pero cómo funciona esto?_

      ![App](../../../../../translated_images/es/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Validación del Agente

La aplicación Azure Container App despliega un endpoint que se conecta al agente de IA aprovisionado en el proyecto Microsoft Foundry para esta plantilla. Veamos qué significa esto.

1. Regresa a la página _Resumen_ del portal Azure para tu grupo de recursos

1. Haz clic en el recurso `Microsoft Foundry` en esa lista

1. Deberías ver esto. Haz clic en el botón `Ir al portal Microsoft Foundry`.
   ![Foundry](../../../../../translated_images/es/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Deberías ver la página del proyecto Foundry para tu aplicación de IA
   ![Project](../../../../../translated_images/es/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Haz clic en `Agentes` - verás al agente predeterminado aprovisionado en tu proyecto
   ![Agents](../../../../../translated_images/es/06-visit-agents.bccb263f77b00a09.webp)

1. Selecciónalo - y verás los detalles del agente. Nota lo siguiente:

      - El agente usa Búsqueda de Archivos por defecto (siempre)
      - El campo `Conocimiento` del agente indica que tiene 32 archivos subidos (para búsqueda de archivos)
      ![Agents](../../../../../translated_images/es/07-view-agent-details.0e049f37f61eae62.webp)

1. Busca la opción `Datos+índices` en el menú lateral y haz clic para ver los detalles.

      - Deberías ver los 32 archivos de datos subidos para el conocimiento.
      - Estos corresponderán a los 12 archivos de clientes y 20 archivos de productos bajo `src/files`
      ![Data](../../../../../translated_images/es/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**¡Has validado la operación del Agente!**

1. Las respuestas del agente están fundamentadas en el conocimiento en esos archivos.
1. Ahora puedes hacer preguntas relacionadas con esos datos, y obtener respuestas fundamentadas.
1. Ejemplo: `customer_info_10.json` describe las 3 compras hechas por "Amanda Perez"

Regresa a la pestaña del navegador con el endpoint de la aplicación Container App y pregunta: `¿Qué productos posee Amanda Perez?`. Deberías ver algo como esto:

![Data](../../../../../translated_images/es/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Área de pruebas del Agente

Construyamos un poco más de intuición sobre las capacidades de Microsoft Foundry, probando el agente en el área de pruebas Agents Playground.

1. Regresa a la página `Agentes` en Microsoft Foundry - selecciona el agente predeterminado
1. Haz clic en la opción `Probar en Playground` - deberías obtener una interfaz como esta
1. Haz la misma pregunta: `¿Qué productos posee Amanda Perez?`

    ![Data](../../../../../translated_images/es/09-ask-in-playground.a1b93794f78fa676.webp)

Obtienes la misma (o similar) respuesta, pero también obtienes información adicional que puedes usar para entender la calidad, costo y desempeño de tu aplicación agentica. Por ejemplo:

1. Nota que la respuesta cita los archivos de datos usados para "fundamentar" la respuesta
1. Pasa el ratón sobre cualquiera de estas etiquetas de archivo - ¿coincide la data con tu consulta y respuesta mostrada?

También ves una fila de _estadísticas_ debajo de la respuesta.

1. Pasa el cursor sobre cualquier métrica - por ejemplo, Seguridad. Verás algo así
1. ¿Coincide la calificación evaluada con tu intuición sobre el nivel de seguridad de la respuesta?

      ![Data](../../../../../translated_images/es/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidad incorporada

La observabilidad se trata de instrumentar tu aplicación para generar datos que puedan usarse para entender, depurar y optimizar sus operaciones. Para tener una idea:

1. Haz clic en el botón `Ver información de ejecución` - deberías ver esta vista. Este es un ejemplo de [seguimiento de agentes](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) en acción. _También puedes obtener esta vista haciendo clic en Registros de Hilo en el menú superior_.

   - Entiende los pasos de ejecución y las herramientas usadas por el agente
   - Comprende el conteo total de Tokens (vs. tokens de salida usados) para la respuesta
   - Entiende la latencia y dónde se está invirtiendo tiempo en la ejecución

      ![Agent](../../../../../translated_images/es/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Haz clic en la pestaña `Metadatos` para ver atributos adicionales de la ejecución, que pueden proporcionar contexto útil para depurar problemas después.

      ![Agent](../../../../../translated_images/es/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Haz clic en la pestaña `Evaluaciones` para ver autoevaluaciones hechas sobre la respuesta del agente. Incluyen evaluaciones de seguridad (por ejemplo, autolesiones) y evaluaciones específicas del agente (por ejemplo, resolución de intenciones, cumplimiento de tareas).

      ![Agent](../../../../../translated_images/es/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último, haz clic en la pestaña `Monitoreo` en el menú lateral.

      - Selecciona la pestaña `Uso de recursos` en la página mostrada y visualiza las métricas.
      - Rastrea el uso de la aplicación en términos de costos (tokens) y carga (solicitudes).
      - Rastrea la latencia de la aplicación hasta el primer byte (procesamiento de entrada) y el último byte (salida).

      ![Agent](../../../../../translated_images/es/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variables de entorno

Hasta ahora, hemos recorrido el despliegue en el navegador y validado que nuestra infraestructura está aprovisionada y la aplicación está operativa. Pero para trabajar con el código de la aplicación de manera _code-first_, necesitamos configurar nuestro entorno de desarrollo local con las variables relevantes necesarias para trabajar con estos recursos. Usar `azd` lo hace fácil.

1. El Azure Developer CLI [usa variables de entorno](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para almacenar y gestionar configuraciones de despliegue de aplicaciones.

1. Las variables de entorno se almacenan en `.azure/<env-name>/.env` - esto las limita al entorno `env-name` usado durante el despliegue y ayuda a aislar entornos entre distintos objetivos de despliegue en el mismo repositorio.

1. Las variables de entorno se cargan automáticamente con el comando `azd` cada vez que se ejecuta un comando específico (por ejemplo, `azd up`). Nota que `azd` no lee automáticamente variables de entorno a nivel de OS (por ejemplo, configuradas en el shell); en cambio, usa `azd set env` y `azd get env` para transferir información en scripts.


Probemos algunos comandos:

1. Obtén todas las variables de entorno establecidas para `azd` en este entorno:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Verás algo como:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obtén un valor específico - por ejemplo, quiero saber si configuramos `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Verás algo como esto - ¡no estaba configurado por defecto!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Establece una nueva variable de entorno para `azd`. Aquí, actualizamos el nombre del modelo del agente. _Nota: cualquier cambio hecho se reflejará inmediatamente en el archivo `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ahora, deberíamos encontrar que el valor está configurado:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Nota que algunos recursos son persistentes (por ejemplo, los despliegues de modelos) y requerirán algo más que un `azd up` para forzar el redepliegue. Probemos desmantelar el despliegue original y redeplegar con variables de entorno cambiadas.

1. **Actualizar** Si previamente desplegaste infraestructura usando una plantilla azd, puedes _actualizar_ el estado de tus variables de entorno locales basándote en el estado actual de tu despliegue en Azure usando este comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Esta es una forma poderosa de _sincronizar_ variables de entorno entre dos o más entornos de desarrollo locales (por ejemplo, equipo con múltiples desarrolladores), permitiendo que la infraestructura desplegada sirva como la verdad fundamental para el estado de las variables de entorno. Los miembros del equipo simplemente _actualizan_ las variables para volver a sincronizarse.

---

## 9. Felicitaciones 🏆

Acabas de completar un flujo de trabajo de extremo a extremo donde:

- [X] Seleccionaste la plantilla AZD que deseas usar
- [X] Abriste la plantilla en un entorno de desarrollo compatible
- [X] Desplegaste la plantilla y validaste que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->