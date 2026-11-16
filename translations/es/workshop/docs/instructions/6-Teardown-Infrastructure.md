# 6. Desmontar la infraestructura

!!! tip "AL FINALIZAR ESTE MÓDULO PODRÁS"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Ejercicios adicionales

Antes de desmontar el proyecto, tómate unos minutos para hacer una exploración abierta.

!!! info "Prueba estas indicaciones de exploración"

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

1. Desmontar la infraestructura es tan fácil como:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confirma el entorno seleccionado y revisa los recursos que serán eliminados. Esto elimina recursos de Azure y puede destruir datos. Mantén la solicitud de confirmación para este flujo de aprendizaje. Una vez completado verás una salida similar a:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verifica la eliminación en el portal y chequea recursos fuera del alcance del despliegue. Los reportes de costo y las actualizaciones de cuota pueden retrasarse. La configuración local `.azure` permanece a menos que la elimines explícitamente.

1. `azd down --purge` también solicita la eliminación permanente de recursos borrados suavemente soportados. Úsalo solo cuando no se requiera recuperación y comprendas las políticas de retención/protección contra purga. No garantiza la liberación inmediata de cuotas.

1. No redepliques solo para verificar la limpieza. Un `azd up` intencional posterior puede recrear recursos usando las entradas locales restantes y genera cargos nuevamente. Las actualizaciones del modelo normalmente usan cambios de aprovisionamiento soportados, no desmontaje.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción automática [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automatizadas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional humana. No somos responsables de cualquier malentendido o interpretación errónea que surja del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->