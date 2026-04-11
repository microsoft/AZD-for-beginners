# 2. Validar una Plantilla

> Validado contra `azd 1.23.12` en marzo de 2026.

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Analizar la arquitectura de la solución de IA
    - [ ] Comprender el flujo de despliegue de AZD
    - [ ] Usar GitHub Copilot para obtener ayuda sobre el uso de AZD
    - [ ] **Lab 2:** Implementar y validar la plantilla de Agentes de IA

---


## 1. Introducción

El [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) o `azd` es una herramienta de línea de comandos de código abierto que simplifica el flujo de trabajo del desarrollador al crear y desplegar aplicaciones en Azure. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) son repositorios estandarizados que incluyen código de muestra de la aplicación, activos de _infraestructura como código_, y archivos de configuración de `azd` para una arquitectura de solución coherente. Provisionar la infraestructura se vuelve tan simple como un comando `azd provision` - mientras que usar `azd up` te permite aprovisionar la infraestructura **y** desplegar tu aplicación de una sola vez.

Como resultado, iniciar el proceso de desarrollo de tu aplicación puede ser tan simple como encontrar la _AZD Starter template_ adecuada que se acerque más a tus necesidades de aplicación e infraestructura - y luego personalizar el repositorio para adaptar el escenario a tus requisitos.

Antes de comenzar, asegúrate de tener instalado el Azure Developer CLI.

1. Open a VS Code terminal and type this command:

      ```bash title="" linenums="0"
      azd version
      ```

1. You should see something like this!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Ahora estás listo para seleccionar e implementar una plantilla con azd**

---

## 2. Selección de plantilla

La plataforma Microsoft Foundry incluye un [conjunto de plantillas AZD recomendadas](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) que cubren escenarios de solución populares como _automatización de flujos de trabajo multiagente_ y _procesamiento de contenido multimodal_. También puedes descubrir estas plantillas visitando el portal de Microsoft Foundry.

1. Visit [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Log into the Microsoft Foundry portal when prompted - you will see something like this.

![Seleccionar](../../../../../translated_images/es/01-pick-template.60d2d5fff5ebc374.webp)


The **Basic** options are your starter templates:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) que despliega una aplicación de chat básica _con tus datos_ en Azure Container Apps. Úsala para explorar un escenario básico de chatbot de IA.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) que también despliega un Agente de IA estándar (con los Foundry Agents). Úsalo para familiarizarte con soluciones con agentes de IA que implican herramientas y modelos.

Visit the second link in a new browser tab (or click `Open in GitHub` for the related card). You should see the repository for this AZD Template. Take a minute to explore the README. The application architecture looks like this:

![Arquitectura](../../../../../translated_images/es/architecture.8cec470ec15c65c7.webp)

---

## 3. Activación de la plantilla

Intentemos desplegar esta plantilla y asegurarnos de que es válida. Seguiremos las indicaciones en la sección [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Choose a working environment for the template repository:

      - **GitHub Codespaces**: Click [this link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) and confirm `Create codespace`
      - **Local clone or dev container**: Clone `Azure-Samples/get-started-with-ai-agents` and open it in VS Code

1. Wait until the VS Code terminal is ready, then type the following command:

   ```bash title="" linenums="0"
   azd up
   ```

Complete the workflow steps that this will trigger:

1. You will be prompted to log into Azure - follow instructions to authenticate
1. Enter a unique environment name for you - e.g., I used `nitya-mshack-azd`
1. This  will create a `.azure/` folder - you will see a subfolder with the env name
1. You will be prompted to select a subscription name - select the default
1. You will be prompted for a location - use `East US 2`

Now, you wait for the provisioning to complete. **This takes 10-15 minutes**

1. When done, your console will show a SUCCESS message like this:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Your Azure Portal will now have a provisioned resource group with that env name:

      ![Infraestructura](../../../../../translated_images/es/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Ahora estás listo para validar la infraestructura y la aplicación desplegadas**.

---

## 4. Validación de la plantilla

1. Visit Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) page - log in when prompted
1. Click on RG for your environment name - you see the page above

      - click on the Azure Container Apps resource
      - click on the Application Url in the _Essentials_ section (top right)

1. You should see a hosted application front-end UI like this:

   ![Aplicación](../../../../../translated_images/es/03-test-application.471910da12c3038e.webp)

1. Try asking a couple of [sample questions](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md)

      1. Pregunta: ```What is the capital of France?``` 
      1. Pregunta: ```What's the best tent under $200 for two people, and what features does it include?```

1. You should get answers similar to what is shown below. _But how does this work?_ 

      ![Aplicación](../../../../../translated_images/es/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Validación del Agente

La Azure Container App despliega un endpoint que se conecta con el Agente de IA aprovisionado en el proyecto Microsoft Foundry para esta plantilla. Veamos qué significa eso.

1. Return to the Azure Portal _Overview_ page for your resource group

1. Click on the `Microsoft Foundry` resource in that list

1. You should see this. Click the `Go to Microsoft Foundry Portal` button. 
   ![Foundry](../../../../../translated_images/es/04-view-foundry-project.fb94ca41803f28f3.webp)

1. You should see the Foundry Project page for your AI application
   ![Proyecto](../../../../../translated_images/es/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Click on `Agents` - you see the default Agent provisioned in your project
   ![Agentes](../../../../../translated_images/es/06-visit-agents.bccb263f77b00a09.webp)

1. Select it - and you see the Agent details. Note the following:

      - The agent uses File Search by default (always)
      - The agent `Knowledge` indicates it has 32 files uploaded (for file search)
      ![Agentes](../../../../../translated_images/es/07-view-agent-details.0e049f37f61eae62.webp)

1. Look for the `Data+indexes` option in the left menu and click for details. 

      - You should see the 32 data files uploaded for knowledge.
      - These will correspond to the 12 customer files and 20 product files under `src/files` 
      ![Datos](../../../../../translated_images/es/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**¡Has validado el funcionamiento del Agente!** 

1. Las respuestas del agente están fundamentadas en el conocimiento de esos archivos. 
1. Ahora puedes hacer preguntas relacionadas con esos datos y obtener respuestas fundamentadas.
1. Ejemplo: `customer_info_10.json` describe las 3 compras realizadas por "Amanda Perez"

Revisit the browser tab with the Container App endpoint and ask: `What products does Amanda Perez own?`. You should see something like this:

![Datos](../../../../../translated_images/es/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Playground del Agente

Desarrollemos un poco más de intuición sobre las capacidades de Microsoft Foundry, probando el Agente en el Playground de Agentes. 

1. Return to the `Agents` page in Microsoft Foundry - select the default agent
1. Click the `Try in Playground` option - you should get a Playground UI like this
1. Ask the same question: `What products does Amanda Perez own?`

    ![Datos](../../../../../translated_images/es/09-ask-in-playground.a1b93794f78fa676.webp)

Obtienes la misma (o similar) respuesta - pero también obtienes información adicional que puedes usar para entender la calidad, el coste y el rendimiento de tu aplicación agentiva. Por ejemplo:

1. Observa que la respuesta cita archivos de datos usados para "fundamentar" la respuesta
1. Pasa el cursor por cualquiera de estas etiquetas de archivo - ¿coinciden los datos con tu consulta y la respuesta mostrada?

También verás una fila de _stats_ debajo de la respuesta. 

1. Pasa el cursor por cualquier métrica - por ejemplo, Safety. Verás algo como esto
1. ¿La valoración evaluada coincide con tu intuición sobre el nivel de seguridad de la respuesta?

      ![Datos](../../../../../translated_images/es/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Observabilidad integrada

La observabilidad trata de instrumentar tu aplicación para generar datos que puedan usarse para comprender, depurar y optimizar sus operaciones. Para hacerte una idea de esto:

1. Click the `View Run Info` button - you should see this view. This is an example of [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in action. _You can also get this view by clicking Thread Logs in the top-level menu_.

   - Hazte una idea de los pasos de ejecución y las herramientas empleadas por el agente
   - Entiende el conteo total de Tokens (vs. uso de tokens de salida) para la respuesta
   - Comprende la latencia y dónde se está pasando el tiempo en la ejecución

      ![Agente](../../../../../translated_images/es/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Click the `Metadata` tab to see additional attributes for the run, that may provide useful context for debugging issues later.   

      ![Agente](../../../../../translated_images/es/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Click the `Evaluations` tab to see auto-assessments made on the agent response. These include safety evaluations (e.g., Self-harm) and agent-specifc evaluations (e.g., Intent resolution, Task adherence).

      ![Agente](../../../../../translated_images/es/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Last but not least, click the `Monitoring` tab in the sidebar menu.

      - Select `Resource usage` tab in the displayed page - and view the metrics.
      - Track application usage in terms of costs (tokens) and load (requests).
      - Track applicaton latency to first byte (input processing) and last byte (output).

      ![Agente](../../../../../translated_images/es/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Variables de entorno

Hasta ahora, hemos recorrido el despliegue en el navegador y validado que nuestra infraestructura está aprovisionada y la aplicación está operativa. Pero para trabajar con la aplicación _desde el código_, necesitamos configurar nuestro entorno de desarrollo local con las variables relevantes necesarias para trabajar con estos recursos. Usar `azd` lo facilita.

1. The Azure Developer CLI [uses environment variables](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) to store and manage configuration settings for  the application deployments.

1. Environment variables are stored in `.azure/<env-name>/.env` - this scopes them to the `env-name` environment used during deployment and helps you isolate environments between different deployment targets in the same repo.

1. Environment variables are automatically loaded by the `azd` command whenever it executes a specific command (e.g., `azd up`). Note that `azd` does not automatically read _OS-level_ environment variables (e.g., set in the shell) - instead use `azd set env` and `azd get env` to transfer information within scripts.


Let's try out a few commands:

1. Get all the environment variables set for `azd` in this environment:

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

1. Get a specific value - e.g., I want to know if we set the `AZURE_AI_AGENT_MODEL_NAME` value

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Verás algo como esto - ¡no estaba establecido por defecto!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Set a new environment variable for `azd`. Here, we update the agent model name. _Nota: cualquier cambio realizado se reflejará de inmediato en el archivo `.azure/<env-name>/.env`._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Ahora, deberíamos encontrar que el valor está establecido:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Note that some resources are persistent (e.g., model deployments) and will require more than just an `azd up` to force the redeployment. Let's try tearing down the original deployment and redeploying with changed env vars.

1. **Refresh** If you had previously deployed infrastructure using an azd template - you can _refresh_ the state of your local environment variables based on the current state of your Azure deployment using this command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Esta es una forma poderosa de _sincronizar_ las variables de entorno entre dos o más entornos de desarrollo locales (p. ej., un equipo con varios desarrolladores) - permitiendo que la infraestructura implementada sirva como la fuente de verdad para el estado de las variables de entorno. Los miembros del equipo simplemente _actualizan_ las variables para volver a sincronizarse.

---

## 9. Felicitaciones 🏆

Acabas de completar un flujo de trabajo de extremo a extremo en el que:

- [X] Seleccionaste la plantilla AZD que deseas usar
- [X] Abriste la plantilla en un entorno de desarrollo compatible
- [X] Desplegaste la plantilla y validaste que funciona

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Este documento ha sido traducido usando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la exactitud, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos responsabilizamos por malentendidos o interpretaciones erróneas que surjan del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->