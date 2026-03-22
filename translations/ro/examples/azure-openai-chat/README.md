# Microsoft Foundry Models Chat Application

**Traseu de învățare:** Intermediar ⭐⭐ | **Timp:** 35-45 minute | **Cost:** 50-200 $/lună

O aplicație completă de chat Microsoft Foundry Models implementată folosind Azure Developer CLI (azd). Acest exemplu demonstrează implementarea gpt-4.1, acces API securizat și o interfață simplă de chat.

## 🎯 Ce vei învăța

- Implementarea serviciului Microsoft Foundry Models cu modelul gpt-4.1
- Protejarea cheilor API OpenAI cu Key Vault
- Construirea unei interfețe simple de chat cu Python
- Monitorizarea utilizării token-ilor și a costurilor
- Implementarea limitării ratei și gestionarea erorilor

## 📦 Ce este inclus

✅ **Serviciu Microsoft Foundry Models** - implementare model gpt-4.1  
✅ **Aplicație Chat Python** - Interfață simplă de chat în linia de comandă  
✅ **Integrare Key Vault** - Stocare securizată a cheilor API  
✅ **Template ARM** - Infrastructură completă ca cod  
✅ **Monitorizare Costuri** - Urmărirea utilizării token-ilor  
✅ **Limitare Rată** - Prevenirea epuizării cotelor  

## Arhitectură

```mermaid
graph TD
    App[Aplicație chat Python<br/>Local/Nor<br/>Interfață linie de comandă<br/>Istoric conversație<br/>Urmărire utilizare tokeni] -- "HTTPS (Cheie API)" --> Foundry[Serviciu modele Microsoft Foundry<br/>Model gpt-4.1<br/>Capacitate 20K tokeni/min<br/>Failover multi-regiune]
    Foundry --> KV[Azure Key Vault<br/>Cheie API OpenAI<br/>URL punct final]
    Foundry -. Identitate gestionată .-> KV
```
## Cerințe preliminare

### Necesare

- **Azure Developer CLI (azd)** - [Ghid instalare](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Abonament Azure** cu acces OpenAI - [Solicită acces](https://aka.ms/oai/access)
- **Python 3.9+** - [Instalează Python](https://www.python.org/downloads/)

### Verificare cerințe preliminare

```bash
# Verificați versiunea azd (este necesar 1.5.0 sau mai mare)
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

> **⚠️ Important:** Microsoft Foundry Models necesită aprobarea aplicației. Dacă nu ai aplicat, vizitează [aka.ms/oai/access](https://aka.ms/oai/access). Aprobarea durează de obicei 1-2 zile lucrătoare.

## ⏱️ Cronologia implementării

| Fază | Durată | Ce se întâmplă |
|-------|----------|--------------|
| Verificare cerințe preliminare | 2-3 minute | Verificarea cotei disponibile OpenAI |
| Implementare infrastructură | 8-12 minute | Creare OpenAI, Key Vault, implementare model |
| Configurare aplicație | 2-3 minute | Configurare mediu și dependențe |
| **Total** | **12-18 minute** | Gata de chat cu gpt-4.1 |

**Notă:** Prima implementare OpenAI poate dura mai mult din cauza aprovizionării modelului.

## Pornire rapidă

```bash
# Navighează la exemplu
cd examples/azure-openai-chat

# Inițializează mediul
azd env new myopenai

# Desfășoară totul (infrastructură + configurație)
azd up
# Vei fi solicitat să:
# 1. Selectezi abonamentul Azure
# 2. Alegi locația cu disponibilitate OpenAI (de ex., eastus, eastus2, westus)
# 3. Aștepți 12-18 minute pentru desfășurare

# Instalează dependențele Python
pip install -r requirements.txt

# Începe să conversezi!
python chat.py
```

**Rezultat așteptat:**
```
🤖 Microsoft Foundry Models Chat Application
Connected to: gpt-4.1 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Microsoft Foundry Models.
Assistant: Microsoft Foundry Models Service provides REST API access to OpenAI's powerful language models including gpt-4.1, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Verificare implementare

### Pasul 1: Verifică resursele Azure

```bash
# Vizualizați resursele implementate
azd show

# Ieșirea așteptată arată:
# - Serviciu OpenAI: (numele resursei)
# - Key Vault: (numele resursei)
# - Implementare: gpt-4.1
# - Locație: eastus (sau regiunea selectată)
```

### Pasul 2: Testează API-ul OpenAI

```bash
# Obține endpoint-ul și cheia OpenAI
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# Testează apelul API
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4.1/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Răspuns așteptat:**
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

### Pasul 3: Verifică accesul Key Vault

```bash
# Listează secretele din Key Vault
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Secrete așteptate:**
- `openai-api-key`
- `openai-endpoint`

**Criterii de succes:**
- ✅ Serviciul OpenAI implementat cu gpt-4.1
- ✅ Apelul API returnează o completare validă
- ✅ Secrete stocate în Key Vault
- ✅ Urmărirea utilizării token-ilor funcționează

## Structura proiectului

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

## Funcționalități aplicație

### Interfață Chat (`chat.py`)

Aplicația de chat include:

- **Istoric conversații** - Mentine contextul între mesaje
- **Numărare tokeni** - Urmărește utilizarea și estimează costurile
- **Gestionare erori** - Tratarea elegantă a limitelor de rată și erorilor API
- **Estimare costuri** - Calcul în timp real cost per mesaj
- **Suport streaming** - Răspunsuri în streaming opționale

### Comenzi

În timpul chatului, poți folosi:
- `quit` sau `exit` - Încheie sesiunea
- `clear` - Curăță istoricul conversațiilor
- `tokens` - Afișează total tokeni utilizați
- `cost` - Afișează costul total estimat

### Configurare (`config.py`)

Încarcă configurația din variabilele de mediu:
```python
AZURE_OPENAI_ENDPOINT  # Din Key Vault
AZURE_OPENAI_API_KEY   # Din Key Vault
AZURE_OPENAI_MODEL     # Implicit: gpt-4.1
AZURE_OPENAI_MAX_TOKENS # Implicit: 800
```

## Exemple de utilizare

### Chat de bază

```bash
python chat.py
```

### Chat cu model personalizat

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat cu streaming

```bash
python chat.py --stream
```

### Conversație exemplu

```
You: Explain Microsoft Foundry Models Service in 3 sentences.
Assistant: Microsoft Foundry Models Service is Microsoft Azure's cloud platform offering 
that provides access to OpenAI's powerful language models. It enables developers 
to integrate capabilities like gpt-4.1 into their applications with enterprise-grade 
security and compliance. The service includes features for content filtering, 
abuse monitoring, and responsible AI practices.

[Tokens used: 89 | Estimated cost: $0.0027]

You: What models are available?
Assistant: Microsoft Foundry Models Service offers several model families including gpt-4.1 
(most capable), GPT-3.5-Turbo (faster and cost-effective), and Embeddings models 
for vector search. Each model has different capabilities, pricing, and token limits.

[Tokens used: 67 | Estimated cost: $0.0020]

Total session: 156 tokens | $0.0047
```

## Gestionarea costurilor

### Prețuri tokeni (gpt-4.1)

| Model | Input (la 1K tokeni) | Output (la 1K tokeni) |
|-------|----------------------|------------------------|
| gpt-4.1 | 0,03 $ | 0,06 $ |
| GPT-3.5-Turbo | 0,0015 $ | 0,002 $ |

### Costuri lunare estimate

Bazat pe modele de utilizare:

| Nivel de utilizare | Mesaje/zi | Tokeni/zi | Cost lunar |
|-------------|--------------|------------|--------------|
| **Ușor** | 20 mesaje | 3.000 tokeni | 3-5 $ |
| **Moderată** | 100 mesaje | 15.000 tokeni | 15-25 $ |
| **Intensivă** | 500 mesaje | 75.000 tokeni | 75-125 $ |

**Cost infrastructură de bază:** 1-2 $/lună (Key Vault + resurse minime compute)

### Sfaturi pentru optimizarea costurilor

```bash
# 1. Folosește GPT-3.5-Turbo pentru sarcini mai simple (de 20 de ori mai ieftin)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Redu numărul maxim de tokeni pentru răspunsuri mai scurte
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Monitorizează consumul de tokeni
python chat.py --show-tokens

# 4. Configurează alerte pentru buget
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Monitorizare

### Vizualizează utilizarea tokenilor

```bash
# În Portalul Azure:
# Resursa OpenAI → Metrici → Selectați "Tranzacția token"

# Sau prin Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### Vizualizează jurnalele API

```bash
# Transmiteți jurnalele de diagnosticare
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Jurnalele interogărilor
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Depanare

### Problemă: Eroare "Access Denied"

**Simptome:** 403 Forbidden la apelul API

**Soluții:**
```bash
# 1. Verificați dacă accesul OpenAI este aprobat
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verificați dacă cheia API este corectă
azd env get-value AZURE_OPENAI_API_KEY

# 3. Verificați formatul URL-ului endpoint
azd env get-value AZURE_OPENAI_ENDPOINT
# Ar trebui să fie: https://[name].openai.azure.com/
```

### Problemă: "Rate Limit Exceeded"

**Simptome:** 429 Too Many Requests

**Soluții:**
```bash
# 1. Verifică cota curentă
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4.1

# 2. Solicită creșterea cotei (dacă este necesar)
# Accesați Azure Portal → Resursă OpenAI → Cote → Solicită creștere

# 3. Implementează logica de reîncercare (deja în chat.py)
# Aplicația încearcă automat din nou cu pauză exponențială
```

### Problemă: "Model Not Found"

**Simptome:** eroare 404 pentru implementare

**Soluții:**
```bash
# 1. Listează implementările disponibile
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Verifică numele modelului în mediu
echo $AZURE_OPENAI_MODEL

# 3. Actualizează cu numele corect al implementării
export AZURE_OPENAI_MODEL=gpt-4.1  # sau gpt-35-turbo
```

### Problemă: Latență ridicată

**Simptome:** Timp de răspuns lent (>5 secunde)

**Soluții:**
```bash
# 1. Verificați latența regională
# Implementați în regiunea cea mai apropiată de utilizatori

# 2. Reduceți max_tokens pentru răspunsuri mai rapide
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Folosiți streaming pentru o experiență mai bună a utilizatorului
python chat.py --stream
```

## Cele mai bune practici de securitate

### 1. Protejează cheile API

```bash
# Nu trimiteți niciodată cheile în controlul sursei
# Folosiți Key Vault (configurat deja)

# Rotiți cheile periodic
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Implementează filtrarea conținutului

```python
# Microsoft Foundry Models include filtrare încorporată a conținutului
# Configurați în Azure Portal:
# Resursa OpenAI → Filtre de conținut → Creați filtru personalizat

# Categorii: Ură, Sexual, Violență, Auto-vătămare
# Niveluri: Filtrare scăzută, medie, ridicată
```

### 3. Folosește identitate gestionată (Producție)

```bash
# Pentru implementările în producție, folosiți identitatea gestionată
# în loc de chei API (necesită găzduirea aplicației pe Azure)

# Actualizați infra/openai.bicep pentru a include:
# identity: { type: 'SystemAssigned' }
```

## Dezvoltare

### Rulează local

```bash
# Instalează dependențele
pip install -r src/requirements.txt

# Setează variabilele de mediu
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4.1"

# Rulează aplicația
python src/chat.py
```

### Rulează teste

```bash
# Instalează dependențele pentru testare
pip install pytest pytest-cov

# Rulează testele
pytest tests/ -v

# Cu acoperire
pytest tests/ --cov=src --cov-report=html
```

### Actualizează implementarea modelului

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

# Aceasta elimină:
# - Serviciul OpenAI
# - Key Vault (cu ștergere soft de 90 de zile)
# - Grupul de resurse
# - Toate implementările și configurațiile
```

## Pași următori

### Extinde acest exemplu

1. **Adaugă interfață web** - Creează frontend React/Vue
   ```bash
   # Adaugă serviciul frontend în azure.yaml
   # Deploy către Azure Static Web Apps
   ```

2. **Implementează RAG** - Adaugă căutare documente cu Azure AI Search
   ```python
   # Integrează Azure Cognitive Search
   # Încarcă documente și creează un index vectorial
   ```

3. **Adaugă apelare funcții** - Activează utilizarea instrumentelor
   ```python
   # Definește funcții în chat.py
   # Permite gpt-4.1 să apeleze API-uri externe
   ```

4. **Suport multi-model** - Implementează modele multiple
   ```bash
   # Adaugă modelele gpt-35-turbo, embeddings
   # Implementează logica de rutare a modelelor
   ```

### Exemple conexe

- **[Retail Multi-Agent](../retail-scenario.md)** - Arhitectură multi-agent avansată
- **[Database App](../../../../examples/database-app)** - Adaugă stocare persistentă
- **[Container Apps](../../../../examples/container-app)** - Implementare ca serviciu containerizat

### Resurse pentru învățare

- 📚 [Curs AZD pentru începători](../../README.md) - Pagina principală curs
- 📚 [Documentație Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/) - Documentație oficială
- 📚 [Referință API OpenAI](https://platform.openai.com/docs/api-reference) - Detalii API
- 📚 [AI Responsabil](https://www.microsoft.com/ai/responsible-ai) - Cele mai bune practici

## Resurse suplimentare

### Documentație
- **[Serviciul Microsoft Foundry Models](https://learn.microsoft.com/azure/ai-services/openai/)** - Ghid complet
- **[Modele gpt-4.1](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Capacități modele
- **[Filtrare conținut](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Funcții de siguranță
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - Referință azd

### Tutoriale
- **[OpenAI Quickstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Prima implementare
- **[Chat Completions](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Construirea aplicațiilor de chat
- **[Function Calling](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Funcții avansate

### Unelte
- **[Microsoft Foundry Models Studio](https://oai.azure.com/)** - Playground web
- **[Ghid Prompt Engineering](https://platform.openai.com/docs/guides/prompt-engineering)** - Scrierea prompturilor mai bune
- **[Calculator Tokeni](https://platform.openai.com/tokenizer)** - Estimare utilizare tokeni

### Comunitate
- **[Azure AI Discord](https://discord.gg/azure)** - Ajutor din comunitate
- **[GitHub Discussions](https://github.com/Azure-Samples/openai/discussions)** - Forum Q&A
- **[Blog Azure](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Ultimele noutăți

---

**🎉 Succes!** Ai implementat Microsoft Foundry Models și ai construit o aplicație funcțională de chat. Începe să explorezi capabilitățile gpt-4.1 și experimentează cu diverse prompturi și cazuri de utilizare.

**Întrebări?** [Deschide un issue](https://github.com/microsoft/AZD-for-beginners/issues) sau consultă [FAQ](../../resources/faq.md)

**Alertă costuri:** Nu uita să rulezi `azd down` când termini testarea pentru a evita costuri continue (~50-100 $/lună pentru utilizare activă).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventuale neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->