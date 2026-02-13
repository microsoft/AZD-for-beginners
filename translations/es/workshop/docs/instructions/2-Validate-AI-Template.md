# 2. Validar una plantilla

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Analizar la arquitectura de la solución de IA
    - [ ] Comprender el flujo de trabajo de despliegue de AZD
    - [ ] Usar GitHub Copilot para obtener ayuda sobre el uso de AZD
    - [ ] **Laboratorio 2:** Desplegar y validar la plantilla AI Agents

---


## 1. Introducción

The [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) or `azd` is an open-source commandline tool that streamlines the developer workflow when building and deploying applications to Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) son repositorios estandarizados que incluyen código de ejemplo de la aplicación, _infraestructura como código_ y archivos de configuración de `azd` para una arquitectura de solución coherente. Provisionar la infraestructura se vuelve tan simple como un comando `azd provision` - mientras que usar `azd up` te permite provisionar la infraestructura **y** desplegar tu aplicación de una sola vez.

Como resultado, iniciar tu proceso de desarrollo de aplicaciones puede ser tan simple como encontrar la _plantilla inicial AZD_ adecuada que se acerque más a tus necesidades de aplicación e infraestructura - y luego personalizar el repositorio para adaptarlo a los requisitos de tu escenario.

Antes de comenzar, asegúrate de tener instalada la Azure Developer CLI.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. Debes ver algo parecido a esto!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Ahora estás listo para seleccionar y desplegar una plantilla con azd**

---

## 2. Selección de plantilla

La plataforma Microsoft Foundry incluye un [conjunto de plantillas AZD recomendadas](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cubren escenarios de solución populares como _automatización de flujos de trabajo multi-agente_ y _procesamiento de contenido multimodal_. También puedes descubrir estas plantillas visitando el portal Microsoft Foundry.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Inicia sesión en el portal Microsoft Foundry cuando se te solicite - verás algo como esto.

![Elegir](../../../../../translated_images/es/01-pick-template.60d2d5fff5ebc374.webp)


Las opciones **Basic** son tus plantillas iniciales:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) que despliega una aplicación de chat básica _con tus datos_ en Azure Container Apps. Úsala para explorar un escenario básico de chatbot de IA.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) que también despliega un Agente de IA estándar (con los Foundry Agents). Úsala para familiarizarte con soluciones agenticas de IA que involucran herramientas y modelos.

Visita el segundo enlace en una nueva pestaña del navegador (o haz clic en `Open in GitHub` en la tarjeta relacionada). Deberías ver el repositorio de esta plantilla AZD. Tómate un minuto para explorar el README. La arquitectura de la aplicación se ve así:

![Arquitectura](../../../../../translated_images/es/architecture.8cec470ec15c65c7.webp)

---

## 3. Activación de la plantilla

Intentemos desplegar esta plantilla y asegurarnos de que es válida. Seguiremos las pautas en la sección [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Haz clic en [este enlace](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) - confirma la acción predeterminada para `Create codespace`
1. Esto abre una nueva pestaña del navegador - espera a que se complete la carga de la sesión de GitHub Codespaces
1. Abre la terminal de VS Code en Codespaces - escribe el siguiente comando:

   ```bash title="" linenums="0"
   azd up
   ```

Complete los pasos del flujo de trabajo que esto desencadenará:

1. Se te pedirá que inicies sesión en Azure - sigue las instrucciones para autenticarte
1. Ingresa un nombre de entorno único para ti - por ejemplo, yo usé `nitya-mshack-azd`
1. Esto creará una carpeta `.azure/` - verás una subcarpeta con el nombre del entorno
1. Se te pedirá que selecciones un nombre de suscripción - selecciona el predeterminado
1. Se te pedirá una ubicación - usa `East US 2`

Ahora, espera a que se complete el aprovisionamiento. **Esto tarda 10-15 minutos**

1. Cuando termine, tu consola mostrará un mensaje de SUCCESS como este:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Tu Azure Portal ahora tendrá un grupo de recursos aprovisionado con ese nombre de entorno:

      ![Infraestructura](../../../../../translated_images/es/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Ahora estás listo para validar la infraestructura y la aplicación desplegadas**.

---

## 4. Validación de la plantilla

1. Visita la página de [Grupos de recursos](https://portal.azure.com/#browse/resourcegroups) del Azure Portal - inicia sesión cuando se te solicite
1. Haz clic en el RG correspondiente al nombre de tu entorno - verás la página anterior

      - haz clic en el recurso Azure Container Apps
      - haz clic en la Application Url en la sección _Essentials_ (arriba a la derecha)

1. Deberías ver una interfaz de usuario de front-end de la aplicación alojada como esta:

   ![Aplicación](../../../../../translated_images/es/03-test-application.471910da12c3038e.webp)

1. Intenta hacer un par de [preguntas de ejemplo](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pregunta: ```What is the capital of France?``` 
      1. Pregunta: ```What's the best tent under $200 for two people, and what features does it include?```

1. Deberías obtener respuestas similares a las que se muestran a continuación. _¿Pero cómo funciona esto?_ 

      ![Aplicación](../../../../../translated_images/es/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Validación del agente

La Azure Container App despliega un endpoint que se conecta al Agente de IA aprovisionado en el proyecto Microsoft Foundry para esta plantilla. Veamos qué significa eso.

1. Regresa a la página _Overview_ del Azure Portal para tu grupo de recursos

1. Haz clic en el recurso `Microsoft Foundry` en esa lista

1. Deberías ver esto. Haz clic en el botón `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/es/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Deberías ver la página del proyecto Foundry para tu aplicación de IA
   ![Proyecto](../../../../../translated_images/es/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Haz clic en `Agents` - verás el Agente predeterminado aprovisionado en tu proyecto
   ![Agentes](../../../../../translated_images/es/06-visit-agents.bccb263f77b00a09.webp)

1. Selecciónalo - y verás los detalles del Agente. Observa lo siguiente:

      - El agente usa File Search por defecto (siempre)
      - El `Knowledge` del agente indica que tiene 32 archivos cargados (para la búsqueda de archivos)
      ![Agentes](../../../../../translated_images/es/07-view-agent-details.0e049f37f61eae62.webp)

1. Busca la opción `Data+indexes` en el menú izquierdo y haz clic para ver detalles. 

      - Deberías ver los 32 archivos de datos cargados para el conocimiento.
      - Estos corresponderán a los 12 archivos de clientes y 20 archivos de productos bajo `src/files` 
      ![Datos](../../../../../translated_images/es/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**¡Has validado la operación del Agente!** 

1. Las respuestas del agente están fundamentadas en el conocimiento de esos archivos. 
1. Ahora puedes hacer preguntas relacionadas con esos datos y obtener respuestas fundamentadas.
1. Ejemplo: `customer_info_10.json` describe las 3 compras realizadas por "Amanda Perez"

Vuelve a la pestaña del navegador con el endpoint de la Container App y pregunta: `What products does Amanda Perez own?`. Deberías ver algo como esto:

![Datos](../../../../../translated_images/es/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agent Playground

Construyamos un poco más de intuición sobre las capacidades de Microsoft Foundry, poniendo a prueba el Agente en el Agents Playground. 

1. Regresa a la página `Agents` en Microsoft Foundry - selecciona el agente predeterminado
1. Haz clic en la opción `Try in Playground` - deberías obtener una interfaz de Playground como esta
1. Haz la misma pregunta: `What products does Amanda Perez own?`

    ![Datos](../../../../../translated_images/es/09-ask-in-playground.a1b93794f78fa676.webp)

Obtendrás la misma respuesta (o una similar) - pero también obtendrás información adicional que puedes usar para entender la calidad, el costo y el rendimiento de tu aplicación agentica. Por ejemplo:

1. Observa que la respuesta cita los archivos de datos utilizados para "fundamentar" la respuesta
1. Pasa el cursor sobre cualquiera de estas etiquetas de archivo - ¿los datos coinciden con tu consulta y la respuesta mostrada?

También verás una fila de _estadísticas_ debajo de la respuesta. 

1. Pasa el cursor sobre cualquier métrica - por ejemplo, Safety. Verás algo como esto
1. ¿La calificación evaluada coincide con tu intuición sobre el nivel de seguridad de la respuesta?

      ![Datos](../../../../../translated_images/es/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidad integrada

La observabilidad consiste en instrumentar tu aplicación para generar datos que puedan usarse para entender, depurar y optimizar sus operaciones. Para tener una idea de esto:

1. Haz clic en el botón `View Run Info` - deberías ver esta vista. Este es un ejemplo de [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) en acción. _También puedes obtener esta vista haciendo clic en Thread Logs en el menú superior_.

   - Obtén una idea de los pasos de ejecución y las herramientas activadas por el agente
   - Entiende el recuento total de Tokens (vs. el uso de tokens de salida) para la respuesta
   - Entiende la latencia y dónde se está gastando el tiempo en la ejecución

      ![Agente](../../../../../translated_images/es/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Haz clic en la pestaña `Metadata` para ver atributos adicionales de la ejecución, que pueden proporcionar contexto útil para depurar problemas más adelante.   

      ![Agente](../../../../../translated_images/es/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Haz clic en la pestaña `Evaluations` para ver las autoevaluaciones realizadas sobre la respuesta del agente. Estas incluyen evaluaciones de seguridad (por ejemplo, Self-harm) y evaluaciones específicas del agente (por ejemplo, resolución de intención, adherencia a la tarea).

      ![Agente](../../../../../translated_images/es/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Por último, haz clic en la pestaña `Monitoring` en el menú lateral.

      - Selecciona la pestaña `Resource usage` en la página mostrada - y visualiza las métricas.
      - Haz seguimiento del uso de la aplicación en términos de costos (tokens) y carga (solicitudes).
      - Haz seguimiento de la latencia de la aplicación hasta el primer byte (procesamiento de entrada) y el último byte (salida).

      ![Agente](../../../../../translated_images/es/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variables de entorno

Hasta ahora, hemos recorrido el despliegue en el navegador y validado que nuestra infraestructura está aprovisionada y la aplicación está operativa. Pero para trabajar con el código de la aplicación de manera "code-first", necesitamos configurar nuestro entorno de desarrollo local con las variables relevantes necesarias para trabajar con estos recursos. Usar `azd` facilita esto.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) para almacenar y gestionar configuraciones para los despliegues de la aplicación.

1. Las variables de entorno se almacenan en `.azure/<env-name>/.env` - esto las delimita al entorno `env-name` usado durante el despliegue y te ayuda a aislar entornos entre distintos objetivos de despliegue en el mismo repositorio.

1. Las variables de entorno se cargan automáticamente por el comando `azd` cada vez que ejecuta un comando específico (por ejemplo, `azd up`). Ten en cuenta que `azd` no lee automáticamente las variables de entorno a nivel de SO (por ejemplo, establecidas en el shell) - en su lugar usa `azd set env` y `azd get env` para transferir información dentro de scripts.


Probemos algunos comandos:

1. Obtén todas las variables de entorno configuradas para `azd` en este entorno:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Verás algo como:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Obtén un valor específico - por ejemplo, quiero saber si establecimos el valor `AZURE_AI_AGENT_MODEL_NAME`

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Verás algo como esto - ¡no estaba configurado por defecto!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Establece una nueva variable de entorno para `azd`. Aquí, actualizamos el nombre del modelo del agente. _Nota: cualquier cambio realizado se reflejará inmediatamente en el archivo `.azure/<env-name>/.env`.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ahora, deberíamos encontrar que el valor está establecido:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Ten en cuenta que algunos recursos son persistentes (por ejemplo, despliegues de modelos) y requerirán más que un `azd up` para forzar el redepliegue. Intentemos derribar el despliegue original y volver a desplegar con variables de entorno cambiadas.

1. **Actualizar** Si previamente desplegaste infraestructura usando una plantilla azd - puedes _actualizar_ el estado de tus variables de entorno locales basándote en el estado actual de tu despliegue en Azure usando este comando:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Esta es una forma poderosa de _sync_ las variables de entorno entre dos o más entornos de desarrollo locales (p. ej., un equipo con varios desarrolladores) - permitiendo que la infraestructura desplegada sirva como la fuente de la verdad para el estado de las variables de entorno. Los miembros del equipo simplemente _refresh_ las variables para volver a sincronizarse.

---

## 9. ¡Felicidades 🏆

Acabas de completar un flujo de trabajo de extremo a extremo en el que:

- [X] Seleccionaste la AZD Template que quieres usar
- [X] Lanzaste la plantilla con GitHub Codespaces 
- [X] Desplegaste la plantilla y validaste que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido usando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de ningún malentendido o interpretación errónea que pueda surgir del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->