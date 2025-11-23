<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "fc2d5d2f2f572c99876be92d82680e22",
  "translation_date": "2025-11-23T19:49:49+00:00",
  "source_file": "examples/azure-openai-chat/README.md",
  "language_code": "ro"
}
-->
# Aplicație de Chat Azure OpenAI

**Nivel de învățare:** Intermediar ⭐⭐ | **Timp:** 35-45 minute | **Cost:** $50-200/lună

O aplicație completă de chat Azure OpenAI implementată folosind Azure Developer CLI (azd). Acest exemplu demonstrează implementarea GPT-4, accesul securizat la API și o interfață simplă de chat.

## 🎯 Ce Vei Învăța

- Implementarea serviciului Azure OpenAI cu modelul GPT-4
- Securizarea cheilor API OpenAI cu Key Vault
- Construirea unei interfețe simple de chat cu Python
- Monitorizarea utilizării token-urilor și a costurilor
- Implementarea limitării ratei și gestionarea erorilor

## 📦 Ce Este Inclus

✅ **Serviciul Azure OpenAI** - Implementarea modelului GPT-4  
✅ **Aplicație de Chat în Python** - Interfață simplă de chat în linie de comandă  
✅ **Integrare cu Key Vault** - Stocare securizată a cheilor API  
✅ **Șabloane ARM** - Infrastructură completă ca cod  
✅ **Monitorizarea Costurilor** - Urmărirea utilizării token-urilor  
✅ **Limitarea Ratei** - Prevenirea epuizării cotelor  

## Arhitectură

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

## Cerințe Prealabile

### Necesare

- **Azure Developer CLI (azd)** - [Ghid de instalare](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Abonament Azure** cu acces OpenAI - [Solicită acces](https://aka.ms/oai/access)
- **Python 3.9+** - [Instalează Python](https://www.python.org/downloads/)

### Verificarea Cerințelor Prealabile

```bash
# Verificați versiunea azd (necesar 1.5.0 sau mai mare)
azd version

# Verificați autentificarea Azure
azd auth login

# Verificați versiunea Python
python --version  # sau python3 --version

# Verificați accesul OpenAI (verificați în Portalul Azure)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Important:** Azure OpenAI necesită aprobare pentru aplicație. Dacă nu ai aplicat, vizitează [aka.ms/oai/access](https://aka.ms/oai/access). Aprobarea durează de obicei 1-2 zile lucrătoare.

## ⏱️ Cronologia Implementării

| Fază | Durată | Ce Se Întâmplă |
|------|--------|----------------|
| Verificarea cerințelor prealabile | 2-3 minute | Verificarea disponibilității cotelor OpenAI |
| Implementarea infrastructurii | 8-12 minute | Crearea OpenAI, Key Vault, implementarea modelului |
| Configurarea aplicației | 2-3 minute | Configurarea mediului și a dependențelor |
| **Total** | **12-18 minute** | Gata pentru a discuta cu GPT-4 |

**Notă:** Prima implementare OpenAI poate dura mai mult din cauza aprovizionării modelului.

## Ghid Rapid

```bash
# Navigați la exemplu
cd examples/azure-openai-chat

# Inițializați mediul
azd env new myopenai

# Implementați totul (infrastructură + configurație)
azd up
# Vi se va solicita să:
# 1. Selectați abonamentul Azure
# 2. Alegeți locația cu disponibilitate OpenAI (de exemplu, eastus, eastus2, westus)
# 3. Așteptați 12-18 minute pentru implementare

# Instalați dependențele Python
pip install -r requirements.txt

# Începeți conversația!
python chat.py
```

**Rezultat Așteptat:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verificarea Implementării

### Pasul 1: Verifică Resursele Azure

```bash
# Vizualizați resursele implementate
azd show

# Rezultatul așteptat arată:
# - Serviciul OpenAI: (numele resursei)
# - Key Vault: (numele resursei)
# - Implementare: gpt-4
# - Locație: eastus (sau regiunea selectată de dvs.)
```

### Pasul 2: Testează API-ul OpenAI

```bash
# Obține punctul final OpenAI și cheia
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testează apelul API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Răspuns Așteptat:**
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

### Pasul 3: Verifică Accesul la Key Vault

```bash
# Listează secretele în Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Secrete Așteptate:**
- `openai-api-key`
- `openai-endpoint`

**Criterii de Succes:**
- ✅ Serviciul OpenAI implementat cu GPT-4
- ✅ Apelul API returnează un răspuns valid
- ✅ Secretele stocate în Key Vault
- ✅ Urmărirea utilizării token-urilor funcționează

## Structura Proiectului

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

## Funcționalitățile Aplicației

### Interfața de Chat (`chat.py`)

Aplicația de chat include:

- **Istoricul Conversației** - Menține contextul între mesaje
- **Numărarea Token-urilor** - Urmărește utilizarea și estimează costurile
- **Gestionarea Erorilor** - Gestionare grațioasă a limitelor de rată și a erorilor API
- **Estimarea Costurilor** - Calcul în timp real al costului per mesaj
- **Suport pentru Streaming** - Răspunsuri opționale în flux

### Comenzi

În timpul conversației, poți folosi:
- `quit` sau `exit` - Încheie sesiunea
- `clear` - Șterge istoricul conversației
- `tokens` - Afișează utilizarea totală a token-urilor
- `cost` - Afișează costul total estimat

### Configurare (`config.py`)

Încarcă configurația din variabilele de mediu:
```python
AZURE_OPENAI_ENDPOINT  # Din Key Vault
AZURE_OPENAI_API_KEY   # Din Key Vault
AZURE_OPENAI_MODEL     # Implicit: gpt-4
AZURE_OPENAI_MAX_TOKENS # Implicit: 800
```

## Exemple de Utilizare

### Chat de Bază

```bash
python chat.py
```

### Chat cu Model Personalizat

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat cu Streaming

```bash
python chat.py --stream
```

### Exemplu de Conversație

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

## Gestionarea Costurilor

### Prețuri Token-uri (GPT-4)

| Model | Input (per 1K token-uri) | Output (per 1K token-uri) |
|-------|--------------------------|---------------------------|
| GPT-4 | $0.03 | $0.06 |
| GPT-3.5-Turbo | $0.0015 | $0.002 |

### Costuri Estimative Lunare

Pe baza tiparelor de utilizare:

| Nivel de Utilizare | Mesaje/zi | Token-uri/zi | Cost Lunar |
|--------------------|-----------|--------------|------------|
| **Ușor** | 20 mesaje | 3,000 token-uri | $3-5 |
| **Moderat** | 100 mesaje | 15,000 token-uri | $15-25 |
| **Intensiv** | 500 mesaje | 75,000 token-uri | $75-125 |

**Cost de Bază al Infrastructurii:** $1-2/lună (Key Vault + resurse minime de calcul)

### Sfaturi pentru Optimizarea Costurilor

```bash
# 1. Utilizați GPT-3.5-Turbo pentru sarcini mai simple (de 20x mai ieftin)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduceți numărul maxim de tokeni pentru răspunsuri mai scurte
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitorizați utilizarea tokenilor
python chat.py --show-tokens

# 4. Configurați alerte de buget
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorizare

### Vizualizare Utilizare Token-uri

```bash
# În Portalul Azure:
# Resursa OpenAI → Metrici → Selectați "Token Transaction"

# Sau prin Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Vizualizare Jurnale API

```bash
# Transmite jurnalele de diagnosticare
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Interoghează jurnalele
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Depanare

### Problemă: Eroare "Access Denied"

**Simptome:** 403 Forbidden la apelarea API-ului

**Soluții:**
```bash
# 1. Verificați dacă accesul OpenAI este aprobat
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verificați dacă cheia API este corectă
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verificați formatul URL al punctului final
azd env get-value AZURE_OPENAI_ENDPOINT
# Ar trebui să fie: https://[name].openai.azure.com/
```

### Problemă: "Rate Limit Exceeded"

**Simptome:** 429 Prea Multe Cereri

**Soluții:**
```bash
# 1. Verificați cota curentă
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Solicitați creșterea cotei (dacă este necesar)
# Accesați Azure Portal → Resursa OpenAI → Cote → Solicitați Creștere

# 3. Implementați logica de reîncercare (deja în chat.py)
# Aplicația reîncearcă automat cu backoff exponențial
```

### Problemă: "Model Not Found"

**Simptome:** Eroare 404 pentru implementare

**Soluții:**
```bash
# 1. Listează implementările disponibile
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifică numele modelului în mediu
echo $AZURE_OPENAI_MODEL

# 3. Actualizează la numele corect al implementării
export AZURE_OPENAI_MODEL=gpt-4  # sau gpt-35-turbo
```

### Problemă: Latență Mare

**Simptome:** Timp de răspuns lent (>5 secunde)

**Soluții:**
```bash
# 1. Verificați latența regională
# Implementați în regiunea cea mai apropiată de utilizatori

# 2. Reduceți max_tokens pentru răspunsuri mai rapide
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Utilizați streaming pentru o experiență mai bună de utilizare
python chat.py --stream
```

## Cele Mai Bune Practici de Securitate

### 1. Protejează Cheile API

```bash
# Nu comiteți chei în controlul sursei
# Utilizați Key Vault (deja configurat)

# Rotiți cheile regulat
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementează Filtrarea Conținutului

```python
# Azure OpenAI include filtrare de conținut integrată
# Configurați în Portalul Azure:
# Resursa OpenAI → Filtre de Conținut → Creați Filtru Personalizat

# Categorii: Ură, Sexual, Violență, Auto-vătămare
# Niveluri: Filtrare Scăzută, Medie, Ridicată
```

### 3. Utilizează Identitate Gestionată (Producție)

```bash
# Pentru implementările de producție, utilizați identitatea gestionată
# în loc de chei API (necesită găzduirea aplicației pe Azure)

# Actualizați infra/openai.bicep pentru a include:
# identity: { type: 'SystemAssigned' }
```

## Dezvoltare

### Rulare Locală

```bash
# Instalați dependențele
pip install -r src/requirements.txt

# Setați variabilele de mediu
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Rulați aplicația
python src/chat.py
```

### Rulare Teste

```bash
# Instalați dependențele de testare
pip install pytest pytest-cov

# Rulați testele
pytest tests/ -v

# Cu acoperire
pytest tests/ --cov=src --cov-report=html
```

### Actualizare Implementare Model

```bash
# Implementați versiuni diferite ale modelului
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

## Curățare

```bash
# Șterge toate resursele Azure
azd down --force --purge

# Acest lucru elimină:
# - Serviciul OpenAI
# - Key Vault (cu ștergere soft de 90 de zile)
# - Grupul de resurse
# - Toate implementările și configurațiile
```

## Pași Următori

### Extinde Acest Exemplu

1. **Adaugă Interfață Web** - Construiește un frontend cu React/Vue
   ```bash
   # Adăugați serviciul frontend în azure.yaml
   # Implementați în Azure Static Web Apps
   ```

2. **Implementează RAG** - Adaugă căutare de documente cu Azure AI Search
   ```python
   # Integrați Azure Cognitive Search
   # Încărcați documente și creați un index vectorial
   ```

3. **Adaugă Funcționalitate de Apelare** - Activează utilizarea uneltelor
   ```python
   # Definește funcții în chat.py
   # Permite GPT-4 să apeleze API-uri externe
   ```

4. **Suport Multi-Model** - Implementează mai multe modele
   ```bash
   # Adăugați gpt-35-turbo, modele de încorporare
   # Implementați logica de rutare a modelului
   ```

### Exemple Asemănătoare

- **[Retail Multi-Agent](../retail-scenario.md)** - Arhitectură avansată multi-agent
- **[Aplicație cu Bază de Date](../../../../examples/database-app)** - Adaugă stocare persistentă
- **[Aplicații Containerizate](../../../../examples/container-app)** - Implementează ca serviciu containerizat

### Resurse de Învățare

- 📚 [Curs AZD pentru Începători](../../README.md) - Pagina principală a cursului
- 📚 [Documentația Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/) - Documentație oficială
- 📚 [Referință API OpenAI](https://platform.openai.com/docs/api-reference) - Detalii API
- 📚 [AI Responsabil](https://www.microsoft.com/ai/responsible-ai) - Cele mai bune practici

## Resurse Suplimentare

### Documentație
- **[Serviciul Azure OpenAI](https://learn.microsoft.com/azure/ai-services/openai/)** - Ghid complet
- **[Modele GPT-4](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacitățile modelului
- **[Filtrarea Conținutului](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Funcții de siguranță
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referință azd

### Tutoriale
- **[Ghid Rapid OpenAI](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prima implementare
- **[Completări Chat](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Construirea aplicațiilor de chat
- **[Apelarea Funcțiilor](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Funcționalități avansate

### Unelte
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Playground bazat pe web
- **[Ghid de Inginerie a Prompturilor](https://platform.openai.com/docs/guides/prompt-engineering)** - Scrierea de prompturi mai bune
- **[Calculator Token-uri](https://platform.openai.com/tokenizer)** - Estimarea utilizării token-urilor

### Comunitate
- **[Discord Azure AI](https://discord.gg/azure)** - Obține ajutor de la comunitate
- **[Discuții GitHub](https://github.com/Azure-Samples/openai/discussions)** - Forum de întrebări și răspunsuri
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Cele mai recente actualizări

---

**🎉 Succes!** Ai implementat Azure OpenAI și ai construit o aplicație de chat funcțională. Începe să explorezi capacitățile GPT-4 și experimentează cu diferite prompturi și cazuri de utilizare.

**Întrebări?** [Deschide o problemă](https://github.com/microsoft/AZD-for-beginners/issues) sau verifică [FAQ](../../resources/faq.md)

**Atenție la Costuri:** Amintește-ți să rulezi `azd down` când ai terminat testarea pentru a evita costuri continue (~$50-100/lună pentru utilizare activă).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->