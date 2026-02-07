# 6. Teardown Infrastructure

!!! tip "AL FINAL DE ESTE MÓDULO PODRÁS"

    - [ ] Comprender la importancia de la limpieza de recursos y la gestión de costos
    - [ ] Usar `azd down` para desaprovisionar la infraestructura de forma segura
    - [ ] Recuperar servicios cognitivos eliminados de forma suave si es necesario
    - [ ] **Lab 6:** Limpia los recursos de Azure y verifica su eliminación

---

## Ejercicios adicionales

Antes de desmantelar el proyecto, tómate unos minutos para hacer una exploración abierta.

!!! info "Prueba estos ejercicios de exploración"

    **Experimenta con GitHub Copilot:**
    
    1. Pregunta: `What other AZD templates could I try for multi-agent scenarios?`
    2. Pregunta: `How can I customize the agent instructions for a healthcare use case?`
    3. Pregunta: `What environment variables control cost optimization?`
    
    **Explora el Portal de Azure:**
    
    1. Revisa las métricas de Application Insights para tu despliegue
    2. Consulta el análisis de costos para los recursos aprovisionados
    3. Explora una vez más el espacio de pruebas de agentes en el portal Microsoft Foundry

---

## Desaprovisionar infraestructura

1. Desmantelar la infraestructura es tan sencillo como:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. The `--purge` flag ensures that it also purges soft-deleted Cognitive Service resources, thereby releasing quota held by these resources. Once complete you will see something like this:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opcional) Si ahora ejecutas `azd up` de nuevo, notarás que el modelo gpt-4.1 se despliega ya que la variable de entorno fue cambiada (y guardada) en la carpeta local `.azure`. 

      Here is the model deployments **before**:

      ![Inicial](../../../../../translated_images/es/14-deploy-initial.30e4cf1c29b587bc.webp)

      And here it is **after**:
      ![Nuevo](../../../../../translated_images/es/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Descargo de responsabilidad**:
Este documento ha sido traducido utilizando el servicio de traducción por IA [Co-op Translator](https://github.com/Azure/co-op-translator). Aunque nos esforzamos por la precisión, tenga en cuenta que las traducciones automáticas pueden contener errores o inexactitudes. El documento original en su idioma nativo debe considerarse la fuente autorizada. Para información crítica, se recomienda una traducción profesional realizada por un traductor humano. No nos hacemos responsables de cualquier malentendido o interpretación errónea derivada del uso de esta traducción.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->