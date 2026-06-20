# 6. Smantellamento dell'infrastruttura

!!! tip "AL TERMINE DI QUESTO MODULO SARAI IN GRADO DI"

    - [ ] Comprendere l'importanza della pulizia delle risorse e della gestione dei costi
    - [ ] Usare `azd down` per deprovisionare l'infrastruttura in modo sicuro
    - [ ] Recuperare i servizi Azure AI eliminati temporaneamente, se necessario
    - [ ] **Lab 6:** Pulisci le risorse di Azure e verifica la rimozione

---

## Esercizi bonus

Prima di smantellare il progetto, dedica qualche minuto a un'esplorazione aperta.

!!! info "Prova questi prompt di esplorazione"

    **Sperimenta con GitHub Copilot:**
    
    1. Chiedi: `Quali altri template AZD potrei provare per scenari multi-agente?`
    2. Chiedi: `Come posso personalizzare le istruzioni dell'agente per un caso d'uso sanitario?`
    3. Chiedi: `Quali variabili di ambiente controllano l'ottimizzazione dei costi?`
    
    **Esplora il portale Azure:**
    
    1. Esamina le metriche di Application Insights per la tua distribuzione
    2. Controlla l'analisi dei costi per le risorse create
    3. Esplora di nuovo il playground degli agenti del portale Microsoft Foundry

---

## Rimozione dell'infrastruttura

1. Smantellare l'infrastruttura è semplice come:
      
      ```bash title="" linenums="0"
      azd down --purge
      ```
1. Il flag `--purge` assicura che vengano anche eliminati definitivamente i servizi Cognitive Service eliminati temporaneamente, liberando così la quota occupata da queste risorse. Una volta completato vedrai qualcosa di simile:
      
      ```bash title="" linenums="0"
      ? Total resources to delete: 11, are you sure you want to continue? Yes
      Deleting your resources can take some time.
      (✓) Done: Deleted resource group rg-nitya-mshack-azd
      (✓) Done: Purging Cognitive Account: aoai-3cz3zkynhvpbc

      SUCCESS: Your application was removed from Azure in 11 minutes 4 seconds.
      ```

1. (Opzionale) Se ora esegui di nuovo `azd up`, noterai che il modello gpt-4.1 viene distribuito poiché la variabile d'ambiente è stata modificata (e salvata) nella cartella locale `.azure`. 

      Ecco le distribuzioni del modello **prima**:

      ![Iniziale](../../../../../translated_images/it/14-deploy-initial.30e4cf1c29b587bc.webp)

      E qui è **dopo**:
      ![Nuovo](../../../../../translated_images/it/14-deploy-new.f7f3c355a3cf7299.webp)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire la precisione, si prega di notare che le traduzioni automatizzate possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa deve essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un essere umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall’uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->