<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-20T23:58:10+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "it"
}
-->
# Applicazione Chat Azure OpenAI

**Percorso di apprendimento:** Intermedio ⭐⭐ | **Tempo:** 35-45 minuti | **Costo:** $50-200/mese

Un'applicazione completa di chat Azure OpenAI distribuita utilizzando Azure Developer CLI (azd). Questo esempio dimostra la distribuzione di GPT-4, l'accesso sicuro alle API e un'interfaccia di chat semplice.

## 🎯 Cosa Imparerai

- Distribuire il servizio Azure OpenAI con il modello GPT-4
- Proteggere le chiavi API OpenAI con Key Vault
- Creare un'interfaccia di chat semplice con Python
- Monitorare l'uso dei token e i costi
- Implementare il rate limiting e la gestione degli errori

## 📦 Cosa è Incluso

✅ **Servizio Azure OpenAI** - Distribuzione del modello GPT-4  
✅ **App di Chat in Python** - Interfaccia di chat a riga di comando semplice  
✅ **Integrazione con Key Vault** - Archiviazione sicura delle chiavi API  
✅ **Template ARM** - Infrastruttura completa come codice  
✅ **Monitoraggio dei Costi** - Tracciamento dell'uso dei token  
✅ **Rate Limiting** - Prevenzione dell'esaurimento delle quote  

## Architettura

```
┌─────────────────────────────────────────────┐
│   Python Chat Application (Local/Cloud)    │
│   - Command-line interface                 │
│   - Conversation history                   │
│   - Token usage tracking                   │
└──────────────────┬──────────────────────────┘
                   │ HTTPS (API Key)
                   ▼
┌─────────────────────────────────────────────┐
│   Azure OpenAI Service                      │
│   ┌───────────────────────────────────────┐ │
│   │   GPT-4 Model                         │ │
│   │   - 20K tokens/min capacity           │ │
│   │   - Multi-region failover (optional)  │ │
│   └───────────────────────────────────────┘ │
│                                             │
│   Managed Identity ───────────────────────┐ │
└────────────────────────────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────────┐
│   Azure Key Vault                           │
│   - OpenAI API Key (secret)                 │
│   - Endpoint URL (secret)                   │
└─────────────────────────────────────────────┘
```

## Prerequisiti

### Necessari

- **Azure Developer CLI (azd)** - [Guida all'installazione](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Sottoscrizione Azure** con accesso a OpenAI - [Richiedi accesso](https://aka.ms/oai/access)
- **Python 3.9+** - [Scarica Python](https://www.python.org/downloads/)

### Verifica dei Prerequisiti

```bash
# Controlla la versione di azd (necessaria 1.5.0 o superiore)
azd version

# Verifica l'accesso ad Azure
azd auth login

# Controlla la versione di Python
python --version  # oppure python3 --version

# Verifica l'accesso a OpenAI (controlla nel Portale Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Importante:** Azure OpenAI richiede l'approvazione dell'applicazione. Se non hai ancora fatto richiesta, visita [aka.ms/oai/access](https://aka.ms/oai/access). L'approvazione richiede solitamente 1-2 giorni lavorativi.

## ⏱️ Cronologia della Distribuzione

| Fase | Durata | Cosa Succede |
|------|--------|--------------|
| Verifica dei prerequisiti | 2-3 minuti | Controllo della disponibilità della quota OpenAI |
| Distribuzione dell'infrastruttura | 8-12 minuti | Creazione di OpenAI, Key Vault, distribuzione del modello |
| Configurazione dell'applicazione | 2-3 minuti | Configurazione dell'ambiente e delle dipendenze |
| **Totale** | **12-18 minuti** | Pronto per chattare con GPT-4 |

**Nota:** La prima distribuzione di OpenAI potrebbe richiedere più tempo a causa del provisioning del modello.

## Avvio Rapido

```bash
# Naviga verso l'esempio
cd examples/azure-openai-chat

# Inizializza l'ambiente
azd env new myopenai

# Distribuisci tutto (infrastruttura + configurazione)
azd up
# Ti verrà chiesto di:
# 1. Selezionare l'abbonamento Azure
# 2. Scegliere una posizione con disponibilità OpenAI (es. eastus, eastus2, westus)
# 3. Aspettare 12-18 minuti per la distribuzione

# Installa le dipendenze Python
pip install -r requirements.txt

# Inizia a chattare!
python chat.py
```

**Output Atteso:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verifica della Distribuzione

### Passaggio 1: Controlla le Risorse Azure

```bash
# Visualizza le risorse distribuite
azd show

# L'output previsto mostra:
# - Servizio OpenAI: (nome risorsa)
# - Key Vault: (nome risorsa)
# - Distribuzione: gpt-4
# - Posizione: eastus (o la regione selezionata)
```

### Passaggio 2: Testa l'API OpenAI

```bash
# Ottieni endpoint e chiave di OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testa chiamata API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Risposta Attesa:**
```json
{
  "choices": [
    {
      "message": {
        "role": "assistant",
        "content": "Hello! How can I assist you today?"
      }
    }
  ],
  "usage": {
    "prompt_tokens": 8,
    "completion_tokens": 9,
    "total_tokens": 17
  }
}
```

### Passaggio 3: Verifica l'Accesso a Key Vault

```bash
# Elenca i segreti in Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Segreti Attesi:**
- `openai-api-key`
- `openai-endpoint`

**Criteri di Successo:**
- ✅ Servizio OpenAI distribuito con GPT-4
- ✅ Chiamata API restituisce una risposta valida
- ✅ Segreti archiviati in Key Vault
- ✅ Tracciamento dell'uso dei token funzionante

## Struttura del Progetto

```
azure-openai-chat/
├── README.md                   ✅ This guide
├── azure.yaml                  ✅ AZD configuration
├── infra/                      ✅ Infrastructure as Code
│   ├── main.bicep             ✅ Main Bicep template
│   ├── main.parameters.json   ✅ Parameters
│   └── openai.bicep           ✅ OpenAI resource definition
├── src/                        ✅ Application code
│   ├── chat.py                ✅ Chat interface
│   ├── config.py              ✅ Configuration loader
│   └── requirements.txt       ✅ Python dependencies
└── .gitignore                  ✅ Git ignore rules
```

## Funzionalità dell'Applicazione

### Interfaccia di Chat (`chat.py`)

L'applicazione di chat include:

- **Cronologia della Conversazione** - Mantiene il contesto tra i messaggi
- **Conteggio dei Token** - Traccia l'uso e stima i costi
- **Gestione degli Errori** - Gestione elegante dei limiti di velocità e degli errori API
- **Stima dei Costi** - Calcolo in tempo reale del costo per messaggio
- **Supporto Streaming** - Risposte in streaming opzionali

### Comandi

Durante la chat, puoi usare:
- `quit` o `exit` - Termina la sessione
- `clear` - Cancella la cronologia della conversazione
- `tokens` - Mostra l'uso totale dei token
- `cost` - Mostra il costo totale stimato

### Configurazione (`config.py`)

Carica la configurazione dalle variabili d'ambiente:
```python
AZURE_OPENAI_ENDPOINT  # Da Key Vault
AZURE_OPENAI_API_KEY   # Da Key Vault
AZURE_OPENAI_MODEL     # Predefinito: gpt-4
AZURE_OPENAI_MAX_TOKENS # Predefinito: 800
```

## Esempi di Utilizzo

### Chat di Base

```bash
python chat.py
```

### Chat con Modello Personalizzato

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat con Streaming

```bash
python chat.py --stream
```

### Esempio di Conversazione

```
You: Explain Azure OpenAI Service in 3 sentences.
Assistant: Azure OpenAI Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like GPT-4 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Azure OpenAI Service offers several model families including GPT-4 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Gestione dei Costi

### Prezzi dei Token (GPT-4)

| Modello | Input (per 1K token) | Output (per 1K token) |
|---------|----------------------|-----------------------|
| GPT-4   | $0.03               | $0.06                |
| GPT-3.5-Turbo | $0.0015       | $0.002              |

### Costi Mensili Stimati

Basato sui modelli di utilizzo:

| Livello di Utilizzo | Messaggi/Giorno | Token/Giorno | Costo Mensile |
|---------------------|-----------------|--------------|---------------|
| **Leggero**         | 20 messaggi     | 3.000 token  | $3-5          |
| **Moderato**        | 100 messaggi    | 15.000 token | $15-25        |
| **Intenso**         | 500 messaggi    | 75.000 token | $75-125       |

**Costo Base dell'Infrastruttura:** $1-2/mese (Key Vault + calcolo minimo)

### Consigli per l'Ottimizzazione dei Costi

```bash
# 1. Usa GPT-3.5-Turbo per compiti più semplici (20 volte più economico)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Riduci il numero massimo di token per risposte più brevi
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitora l'utilizzo dei token
python chat.py --show-tokens

# 4. Configura avvisi di budget
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitoraggio

### Visualizza l'Uso dei Token

```bash
# Nel portale Azure:
# Risorsa OpenAI → Metriche → Seleziona "Transazione Token"

# Oppure tramite Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Visualizza i Log delle API

```bash
# Trasmetti i log diagnostici
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Interroga i log
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Risoluzione dei Problemi

### Problema: Errore "Access Denied"

**Sintomi:** 403 Forbidden durante la chiamata all'API

**Soluzioni:**
```bash
# 1. Verifica che l'accesso a OpenAI sia approvato
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Controlla che la chiave API sia corretta
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verifica il formato dell'URL dell'endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Dovrebbe essere: https://[name].openai.azure.com/
```

### Problema: "Rate Limit Exceeded"

**Sintomi:** 429 Troppe Richieste

**Soluzioni:**
```bash
# 1. Controlla la quota attuale
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Richiedi un aumento della quota (se necessario)
# Vai al Portale Azure → Risorsa OpenAI → Quote → Richiedi aumento

# 3. Implementa la logica di ritentativo (già in chat.py)
# L'applicazione ritenta automaticamente con un backoff esponenziale
```

### Problema: "Model Not Found"

**Sintomi:** Errore 404 per la distribuzione

**Soluzioni:**
```bash
# 1. Elenca i deployment disponibili
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifica il nome del modello nell'ambiente
echo $AZURE_OPENAI_MODEL

# 3. Aggiorna al nome corretto del deployment
export AZURE_OPENAI_MODEL=gpt-4  # o gpt-35-turbo
```

### Problema: Alta Latenza

**Sintomi:** Tempi di risposta lenti (>5 secondi)

**Soluzioni:**
```bash
# 1. Controlla la latenza regionale
# Distribuisci nella regione più vicina agli utenti

# 2. Riduci max_tokens per risposte più rapide
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Usa lo streaming per una migliore esperienza utente
python chat.py --stream
```

## Migliori Pratiche di Sicurezza

### 1. Proteggi le Chiavi API

```bash
# Non impegnare mai le chiavi nel controllo del codice sorgente
# Usa Key Vault (già configurato)

# Ruota le chiavi regolarmente
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementa il Filtro dei Contenuti

```python
# Azure OpenAI include il filtraggio dei contenuti integrato
# Configurare nel portale di Azure:
# Risorsa OpenAI → Filtri dei contenuti → Crea filtro personalizzato

# Categorie: Odio, Sessuale, Violenza, Autolesionismo
# Livelli: Filtraggio basso, medio, alto
```

### 3. Usa l'Identità Gestita (Produzione)

```bash
# Per distribuzioni di produzione, utilizzare l'identità gestita
# invece delle chiavi API (richiede l'hosting dell'app su Azure)

# Aggiornare infra/openai.bicep per includere:
# identity: { type: 'SystemAssigned' }
```

## Sviluppo

### Esegui Localmente

```bash
# Installa le dipendenze
pip install -r src/requirements.txt

# Imposta le variabili d'ambiente
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Esegui l'applicazione
python src/chat.py
```

### Esegui i Test

```bash
# Installa le dipendenze di test
pip install pytest pytest-cov

# Esegui i test
pytest tests/ -v

# Con copertura
pytest tests/ --cov=src --cov-report=html
```

### Aggiorna la Distribuzione del Modello

```bash
# Distribuire diverse versioni del modello
az cognitiveservices account deployment create \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-35-turbo \
  --model-name gpt-35-turbo \
  --model-version "0613" \
  --model-format OpenAI \
  --sku-capacity 20 \
  --sku-name "Standard"
```

## Pulizia

```bash
# Elimina tutte le risorse di Azure
azd down --force --purge

# Questo rimuove:
# - Servizio OpenAI
# - Key Vault (con eliminazione soft di 90 giorni)
# - Gruppo di risorse
# - Tutte le distribuzioni e configurazioni
```

## Prossimi Passi

### Espandi Questo Esempio

1. **Aggiungi un'Interfaccia Web** - Crea un frontend React/Vue
   ```bash
   # Aggiungi il servizio frontend a azure.yaml
   # Distribuisci su Azure Static Web Apps
   ```

2. **Implementa RAG** - Aggiungi la ricerca di documenti con Azure AI Search
   ```python
   # Integra Azure Cognitive Search
   # Carica documenti e crea un indice vettoriale
   ```

3. **Aggiungi Funzioni di Chiamata** - Abilita l'uso di strumenti
   ```python
   # Definire funzioni in chat.py
   # Permettere a GPT-4 di chiamare API esterne
   ```

4. **Supporto Multi-Modello** - Distribuisci più modelli
   ```bash
   # Aggiungi gpt-35-turbo, modelli di embedding
   # Implementa la logica di instradamento del modello
   ```

### Esempi Correlati

- **[Retail Multi-Agent](../retail-scenario.md)** - Architettura avanzata multi-agente
- **[Database App](../../../../examples/database-app)** - Aggiungi archiviazione persistente
- **[Container Apps](../../../../examples/container-app)** - Distribuisci come servizio containerizzato

### Risorse di Apprendimento

- 📚 [Corso per Principianti su AZD](../../README.md) - Pagina principale del corso
- 📚 [Documentazione Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Documentazione ufficiale
- 📚 [Riferimento API OpenAI](https://platform.openai.com/docs/api-reference) - Dettagli API
- 📚 [AI Responsabile](https://www.microsoft.com/ai/responsible-ai) - Migliori pratiche

## Risorse Aggiuntive

### Documentazione
- **[Servizio Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - Guida completa
- **[Modelli GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacità dei modelli
- **[Filtro dei Contenuti](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Funzionalità di sicurezza
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Riferimento azd

### Tutorial
- **[Quickstart OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prima distribuzione
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Creazione di app di chat
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Funzionalità avanzate

### Strumenti
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Playground basato sul web
- **[Guida al Prompt Engineering](https://platform.openai.com/docs/guides/prompt-engineering)** - Scrivere prompt migliori
- **[Calcolatore di Token](https://platform.openai.com/tokenizer)** - Stima dell'uso dei token

### Community
- **[Discord Azure AI](https://discord.gg/azure)** - Ottieni aiuto dalla community
- **[Discussioni su GitHub](https://github.com/Azure-Samples/openai/discussions)** - Forum di domande e risposte
- **[Blog di Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Ultimi aggiornamenti

---

**🎉 Successo!** Hai distribuito Azure OpenAI e creato un'applicazione di chat funzionante. Inizia a esplorare le capacità di GPT-4 e sperimenta con diversi prompt e casi d'uso.

**Domande?** [Apri un problema](https://github.com/microsoft/AZD-for-beginners/issues) o consulta le [FAQ](../../resources/faq.md)

**Avviso sui Costi:** Ricorda di eseguire `azd down` al termine dei test per evitare costi continui (~$50-100/mese per utilizzo attivo).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Questo documento è stato tradotto utilizzando il servizio di traduzione AI [Co-op Translator](https://github.com/Azure/co-op-translator). Sebbene ci impegniamo per garantire l'accuratezza, si prega di notare che le traduzioni automatiche potrebbero contenere errori o imprecisioni. Il documento originale nella sua lingua nativa dovrebbe essere considerato la fonte autorevole. Per informazioni critiche, si raccomanda una traduzione professionale umana. Non siamo responsabili per eventuali incomprensioni o interpretazioni errate derivanti dall'uso di questa traduzione.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->