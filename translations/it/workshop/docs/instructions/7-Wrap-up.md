# 7. Riepilogo e prossimi passi

!!! tip "THE MAIN TAKEAWAY MESSAGES ARE"

    - [ ] I template AZD accelerano lo sviluppo di applicazioni AI da giorni a ore
    - [ ] La metodologia Discovery → Deployment → Customization fornisce un percorso di apprendimento strutturato
    - [ ] GitHub Copilot con server MCP consente l'esplorazione in linguaggio naturale di codebase complessi
    - [ ] Microsoft Foundry offre osservabilità, valutazione e test di sicurezza integrati

---

## 1. Cosa hai realizzato

Congratulazioni! In questo workshop, hai completato con successo:

| Module | Accomplishment |
|:---|:---|
| **Module 1** | Hai scoperto l'Azure Developer CLI e selezionato un template per AI |
| **Module 2** | Hai distribuito e convalidato una soluzione completa di agenti AI |
| **Module 3** | Hai analizzato il template per comprenderne l'architettura |
| **Module 4** | Hai esplorato la configurazione di `azure.yaml` e gli hook del ciclo di vita |
| **Module 5** | Hai personalizzato il template per il tuo scenario |
| **Module 6** | Hai smantellato in sicurezza l'infrastruttura e gestito le risorse |

---

## 2. Concetti chiave padroneggiati

### Azure Developer CLI (azd)
- `azd init` - Inizializza progetti da template
- `azd up` - Prepara le risorse e distribuisce con un unico comando
- `azd env` - Gestisce le variabili d'ambiente
- `azd down` - Rimuove in modo sicuro le risorse

### AZD Template Structure
- `azure.yaml` - Configurazione e hook di distribuzione
- `infra/` - Infrastructure-as-code in Bicep
- `src/` - Codice sorgente dell'applicazione
- `scripts/` - Script di automazione e setup

### Microsoft Foundry Capabilities
- AI Agent Service per assistenti intelligenti
- File Search e Azure AI Search per il recupero della conoscenza
- Tracing, monitoraggio e valutazione integrati
- Red teaming per la validazione della sicurezza dell'AI

---

## 3. Continua il tuo percorso di apprendimento

### Prossimi passi consigliati

| Path | Resource | Time |
|:---|:---|:---|
| **Corso completo** | [AZD per principianti - Curriculum](../../README.md) | 8-12 ore |
| **Prova un altro template** | [Template Microsoft Foundry](https://ai.azure.com/templates) | 1-2 ore |
| **Approfondimento** | [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Continuo |
| **Comunità** | [Discord di Azure](https://aka.ms/foundry/discord) | Unisciti oggi! |

### Template suggeriti da provare

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Chat di base con i tuoi dati
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Pattern RAG avanzati
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Scenari retail enterprise

---

## 4. Sfida del workshop

Pronto a mettere alla prova le tue competenze? Prova queste sfide:

| Challenge | Description | Difficulty |
|:---|:---|:---|
| **1. Scenario multi-agente** | Distribuisci e personalizza per un settore diverso (es. sanità, finanza) | ⭐⭐ |
| **2. Base di conoscenza personalizzata** | Aggiungi i tuoi file di dati e crea un indice di ricerca personalizzato | ⭐⭐⭐ |
| **3. Distribuzione in produzione** | Configura CI/CD con GitHub Actions usando `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Condividi il tuo feedback

Il tuo feedback ci aiuta a migliorare questo workshop!

- **GitHub Issues**: [Invia feedback](https://github.com/microsoft/azd-for-beginners/issues) - etichetta con `Workshop`
- **Discord**: Unisciti a [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - pubblica in `#get-help`
- **Contributi**: Aiuta a migliorare il workshop inviando pull request!

---

## Grazie! 🎉

Grazie per aver completato l'AZD for AI Developers Workshop. Speriamo che questa esperienza ti abbia fornito le competenze e la fiducia per costruire e distribuire applicazioni AI su Azure.

**Continua a costruire, continua ad imparare e benvenuto nella community degli sviluppatori Azure AI!**

---

| | |
|:---|:---|
| **📚 Homepage del corso** | [AZD per principianti - Curriculum](../../README.md) |
| **📖 Documentazione** | [Documentazione Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Template AI** | [Template Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Comunità** | [Discord di Azure](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Avvertenza:
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica basato su IA Co-op Translator (https://github.com/Azure/co-op-translator). Pur impegnandoci per l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o inesattezze. Il documento originale nella sua lingua deve essere considerato la fonte autorevole. Per informazioni critiche, è consigliata una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali malintesi o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->