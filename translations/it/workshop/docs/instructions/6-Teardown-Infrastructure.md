# 6. Smantellare l'Infrastruttura

!!! tip "ALLA FINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Understand the importance of resource cleanup and cost management
    - [ ] Use `azd down` to deprovision infrastructure safely
    - [ ] Recover soft-deleted Azure AI Services if needed
    - [ ] **Lab 6:** Clean up Azure resources and verify removal

---

## Esercizi Bonus

Prima di smantellare il progetto, prenditi qualche minuto per fare un'esplorazione aperta.

!!! info "Prova questi spunti di esplorazione"

    **Experiment with GitHub Copilot:**
    
    1. Ask: `What other AZD templates could I try for multi-agent scenarios?`
    2. Ask: `How can I customize the agent instructions for a healthcare use case?`
    3. Ask: `What environment variables control cost optimization?`
    
    **Explore the Azure Portal:**
    
    1. Review Application Insights metrics for your deployment
    2. Check the cost analysis for resources provisioned
    3. Explore the Microsoft Foundry portal agent playground one more time

---

## Deprovisionamento Infra

1. Smantellare l'infrastruttura è semplice come:
      
      ```bash title="" linenums="0"
      azd env list
      azd show
      azd down
      ```
1. Confermare l'ambiente selezionato e rivedere le risorse da eliminare. Questo rimuove risorse Azure e può distruggere i dati. Mantieni il prompt di conferma per questo flusso di apprendimento. Una volta completato vedrai un output simile a:
      
      ```text title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. Verificare l'eliminazione nel portale e controllare le risorse al di fuori dell'ambito della distribuzione. I report sui costi e gli aggiornamenti delle quote possono subire ritardi. La configurazione locale `.azure` rimane a meno che non venga rimossa esplicitamente.

1. `azd down --purge` richiede inoltre l'eliminazione permanente delle risorse soft-deleted supportate. Usalo solo quando il recupero non è necessario e comprendi le politiche di conservazione/protezione dall'eliminazione. Non garantisce il rilascio immediato della quota.

1. Non ridistribuire solo per verificare la pulizia. Un successivo `azd up` intenzionale può ricreare le risorse utilizzando gli input locali rimanenti e comporta nuovamente addebiti. Gli aggiornamenti del modello normalmente utilizzano modifiche di provisioning supportate, non lo smantellamento.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->