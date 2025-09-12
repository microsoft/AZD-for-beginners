<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ac8b29b2e187a7204533f7136d9fa364",
  "translation_date": "2025-09-12T19:47:52+00:00",
  "source_file": "workshop/README.md",
  "language_code": "it"
}
-->
# Workshop AZD per Sviluppatori AI

**Precedente:** [Guida alla risoluzione dei problemi AI](../docs/troubleshooting/ai-troubleshooting.md) | **Successivo:** [Moduli del laboratorio del workshop](../../../workshop)

Benvenuto al workshop pratico per imparare Azure Developer CLI (AZD) con un focus sul deployment di applicazioni AI. Questo workshop è progettato per guidarti dai concetti base di AZD fino al deployment di soluzioni AI pronte per la produzione.

## Panoramica del Workshop

**Durata:** 2-3 ore  
**Livello:** Principiante a Intermedio  
**Prerequisiti:** Conoscenza di base di Azure, strumenti da riga di comando e concetti di AI

### Cosa Imparerai

- **Fondamenti di AZD**: Comprendere l'infrastruttura come codice con AZD
- 🤖 **Integrazione di Servizi AI**: Deployment di Azure OpenAI, AI Search e altri servizi AI
- **Deployment di Container**: Utilizzo di Azure Container Apps per applicazioni AI
- **Best Practice di Sicurezza**: Implementazione di Managed Identity e configurazioni sicure
- **Monitoraggio e Osservabilità**: Configurazione di Application Insights per carichi di lavoro AI
- **Pattern di Produzione**: Strategie di deployment pronte per l'azienda

## Struttura del Workshop

### Modulo 1: Fondamenti di AZD (30 minuti)
- Installazione e configurazione di AZD
- Comprendere la struttura del progetto AZD
- Il tuo primo deployment con AZD
- **Laboratorio**: Deploy di una semplice applicazione web

### Modulo 2: Integrazione con Azure OpenAI (45 minuti)
- Configurazione delle risorse Azure OpenAI
- Strategie di deployment dei modelli
- Configurazione dell'accesso API e autenticazione
- **Laboratorio**: Deploy di un'applicazione di chat con GPT-4

### Modulo 3: Applicazioni RAG (45 minuti)
- Integrazione con Azure AI Search
- Elaborazione di documenti con Azure Document Intelligence
- Embedding vettoriali e ricerca semantica
- **Laboratorio**: Creazione di un sistema di Q&A basato su documenti

### Modulo 4: Deployment in Produzione (30 minuti)
- Configurazione di Container Apps
- Ottimizzazione delle prestazioni e scalabilità
- Monitoraggio e logging
- **Laboratorio**: Deployment in produzione con osservabilità

### Modulo 5: Pattern Avanzati (15 minuti)
- Deployment multi-ambiente
- Integrazione CI/CD
- Strategie di ottimizzazione dei costi
- **Conclusione**: Checklist per la prontezza alla produzione

## Prerequisiti

### Strumenti Necessari

Installa questi strumenti prima del workshop:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Configurazione Account Azure

1. **Sottoscrizione Azure**: [Registrati gratuitamente](https://azure.microsoft.com/free/)  
2. **Accesso ad Azure OpenAI**: [Richiedi accesso](https://aka.ms/oai/access)  
3. **Permessi richiesti**:  
   - Ruolo di Contributor sulla sottoscrizione o sul gruppo di risorse  
   - User Access Administrator (per assegnazioni RBAC)  

### Verifica dei Prerequisiti

Esegui questo script per verificare la configurazione:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Materiali del Workshop

### Esercizi di Laboratorio

Ogni modulo include laboratori pratici con codice iniziale e istruzioni passo-passo:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Il tuo primo deployment con AZD  
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Applicazione di chat con Azure OpenAI  
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - Applicazione RAG con AI Search  
- **[lab-4-production/](../../../workshop/lab-4-production)** - Pattern di deployment in produzione  
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Scenari di deployment avanzati  

### Materiali di Riferimento

- **[Guida all'integrazione AI Foundry](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Pattern di integrazione completi  
- **[Guida al deployment di modelli AI](../docs/ai-foundry/ai-model-deployment.md)** - Best practice per il deployment di modelli  
- **[Pratiche AI in produzione](../docs/ai-foundry/production-ai-practices.md)** - Pattern di deployment aziendali  
- **[Guida alla risoluzione dei problemi AI](../docs/troubleshooting/ai-troubleshooting.md)** - Problemi comuni e soluzioni  

### Template di Esempio

Template di avvio rapido per scenari AI comuni:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Iniziare

### Opzione 1: GitHub Codespaces (Consigliata)

Il modo più veloce per iniziare il workshop:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Opzione 2: Sviluppo Locale

1. **Clona il repository del workshop:**  
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Accedi ad Azure:**  
```bash
az login
azd auth login
```

3. **Inizia con il Laboratorio 1:**  
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Opzione 3: Workshop con Istruttore

Se stai partecipando a una sessione con istruttore:

- 🎥 **Registrazione del Workshop**: [Disponibile su richiesta](https://aka.ms/azd-ai-workshop)  
- 💬 **Community su Discord**: [Unisciti per supporto live](https://aka.ms/foundry/discord)  
- **Feedback sul Workshop**: [Condividi la tua esperienza](https://aka.ms/azd-workshop-feedback)  

## Timeline del Workshop

### Apprendimento Autonomo (3 ore)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Sessione con Istruttore (2.5 ore)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Criteri di Successo

Alla fine di questo workshop, sarai in grado di:

✅ **Deploy di applicazioni AI** utilizzando template AZD  
✅ **Configurare Azure OpenAI** con sicurezza adeguata  
✅ **Creare applicazioni RAG** con integrazione AI Search  
✅ **Implementare pattern di produzione** per carichi di lavoro AI aziendali  
✅ **Monitorare e risolvere problemi** nei deployment di applicazioni AI  
✅ **Applicare strategie di ottimizzazione dei costi** per carichi di lavoro AI  

## Community e Supporto

### Durante il Workshop

- 🙋 **Domande**: Usa la chat del workshop o alza la mano  
- 🐛 **Problemi**: Consulta la [guida alla risoluzione dei problemi](../docs/troubleshooting/ai-troubleshooting.md)  
- **Consigli**: Condividi scoperte con gli altri partecipanti  

### Dopo il Workshop

- 💬 **Discord**: [Community Azure AI Foundry](https://aka.ms/foundry/discord)  
- **GitHub Issues**: [Segnala problemi con i template](https://github.com/YOUR_ORG/AZD-for-beginners/issues)  
- 📧 **Feedback**: [Modulo di valutazione del workshop](https://aka.ms/azd-workshop-feedback)  

## Prossimi Passi

### Continua a Imparare

1. **Scenari Avanzati**: Esplora [deployment multi-regione](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)  
2. **Integrazione CI/CD**: Configura [workflow GitHub Actions](../docs/deployment/github-actions.md)  
3. **Template Personalizzati**: Crea i tuoi [template AZD](../docs/getting-started/custom-templates.md)  

### Applica nei Tuoi Progetti

1. **Valutazione**: Usa la nostra [checklist di prontezza](./production-readiness-checklist.md)  
2. **Template**: Inizia con i nostri [template specifici per AI](../../../workshop/templates)  
3. **Supporto**: Unisciti al [Discord Azure AI Foundry](https://aka.ms/foundry/discord)  

### Condividi il Tuo Successo

- ⭐ **Dai una stella al repository** se questo workshop ti è stato utile  
- 🐦 **Condividi sui social media** con #AzureDeveloperCLI #AzureAI  
- 📝 **Scrivi un post sul blog** sulla tua esperienza di deployment AI  

---

## Feedback sul Workshop

Il tuo feedback ci aiuta a migliorare l'esperienza del workshop:

| Aspetto | Valutazione (1-5) | Commenti |
|--------|--------------|----------|
| Qualità dei Contenuti | ⭐⭐⭐⭐⭐ | |
| Laboratori Pratici | ⭐⭐⭐⭐⭐ | |
| Documentazione | ⭐⭐⭐⭐⭐ | |
| Livello di Difficoltà | ⭐⭐⭐⭐⭐ | |
| Esperienza Complessiva | ⭐⭐⭐⭐⭐ | |

**Invia feedback**: [Modulo di valutazione del workshop](https://aka.ms/azd-workshop-feedback)

---

**Precedente:** [Guida alla risoluzione dei problemi AI](../docs/troubleshooting/ai-troubleshooting.md) | **Successivo:** Inizia con [Laboratorio 1: Fondamenti di AZD](../../../workshop/lab-1-azd-basics)

**Pronto per iniziare a costruire applicazioni AI con AZD?**

[Inizia il Laboratorio 1: Fondamenti di AZD →](./lab-1-azd-basics/README.md)

---

**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione automatica [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche possono contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale effettuata da un traduttore umano. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.