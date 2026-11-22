# 6. Desmontaje de la Infraestructura

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Ejercicios Extra

Antes de desmontar el proyecto, tómate unos minutos para realizar una exploración libre.

!!! info "Prueba estas sugerencias de exploración"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Desaprovisionar Infraestructura

!!! warning "Si también completaste el ejercicio del agente hospedado GA"

    Check that exercise's environment separately. For a new Foundry project created by its AZD environment, `azd down` deletes the resource group and everything in it. For a reused Foundry project, it leaves the project, hosted agent, and other resources in place; remove only unwanted resources you own separately. Do not delete a shared project or resource group to clean up one agent. See the [hosted-agent cleanup guidance](https://learn.microsoft.com/azure/foundry/agents/quickstarts/quickstart-hosted-agent?pivots=azd#clean-up-resources).

1. Desmontar la infraestructura es tan fácil como:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirma el entorno seleccionado y revisa los recursos que serán eliminados. Esto elimina recursos de Azure y puede destruir datos. Mantén el mensaje de confirmación para este flujo de trabajo de aprendizaje. Una vez completado verás una salida similar a:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifica la eliminación en el portal y revisa si hay recursos fuera del alcance del despliegue. Los reportes de costos y actualizaciones de cuotas pueden tener retrasos. La configuración local `.azure` permanece a menos que la elimines explícitamente.

1. `azd down --purge` además solicita la eliminación permanente de recursos con eliminación suave soportada. Úsalo solo cuando no se requiera recuperación y comprendas las políticas de retención/protección contra purga. No garantiza la liberación inmediata de cuota.

1. No vuelvas a desplegar solo para verificar la limpieza. Un `azd up` intencional posterior puede recrear recursos usando las entradas locales restantes, y generará cargos nuevamente. Las actualizaciones del modelo normalmente usan cambios de aprovisionamiento soportados, no desmontaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->