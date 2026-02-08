# Azure OpenAI Chat-Anwendung

**Lernpfad:** Mittelstufe ⭐⭐ | **Zeit:** 35-45 Minuten | **Kosten:** $50-200/Monat

Eine vollständige Azure OpenAI Chat-Anwendung, bereitgestellt mit Azure Developer CLI (azd). Dieses Beispiel zeigt die Bereitstellung von GPT-4, sicheren API-Zugriff und eine einfache Chat-Oberfläche.

## 🎯 Was Sie lernen werden

- Azure OpenAI Service mit GPT-4-Modell bereitstellen
- OpenAI-API-Schlüssel mit Key Vault sichern
- Eine einfache Chat-Oberfläche mit Python erstellen
- Token-Nutzung und Kosten überwachen
- Ratenbegrenzung und Fehlerbehandlung implementieren

## 📦 Was enthalten ist

✅ **Azure OpenAI Service** - Bereitstellung des GPT-4-Modells  
✅ **Python Chat-App** - Einfache Kommandozeilen-Chat-Oberfläche  
✅ **Key Vault-Integration** - Sichere Speicherung von API-Schlüsseln  
✅ **ARM-Vorlagen** - Vollständige Infrastruktur als Code  
✅ **Kostenüberwachung** - Verfolgung der Token-Nutzung  
✅ **Ratenbegrenzung** - Vermeidung von Quotenerschöpfung  

## Architektur

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

## Voraussetzungen

### Erforderlich

- **Azure Developer CLI (azd)** - [Installationsanleitung](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)
- **Azure-Abonnement** mit OpenAI-Zugriff - [Zugriff beantragen](https://aka.ms/oai/access)
- **Python 3.9+** - [Python installieren](https://www.python.org/downloads/)

### Voraussetzungen überprüfen

```bash
# Überprüfen Sie die azd-Version (mindestens 1.5.0 erforderlich)
azd version

# Azure-Anmeldung überprüfen
azd auth login

# Python-Version überprüfen
python --version  # oder python3 --version

# OpenAI-Zugriff überprüfen (im Azure-Portal prüfen)
az cognitiveservices account list-skus \
  --kind OpenAI \
  --location eastus
```

> **⚠️ Wichtig:** Azure OpenAI erfordert eine Anwendungsfreigabe. Wenn Sie sich noch nicht beworben haben, besuchen Sie [aka.ms/oai/access](https://aka.ms/oai/access). Die Genehmigung dauert in der Regel 1-2 Werktage.

## ⏱️ Bereitstellungszeitplan

| Phase | Dauer | Was passiert |
|-------|-------|--------------|
| Überprüfung der Voraussetzungen | 2-3 Minuten | Verfügbarkeit der OpenAI-Quote überprüfen |
| Infrastruktur bereitstellen | 8-12 Minuten | OpenAI, Key Vault, Modellbereitstellung erstellen |
| Anwendung konfigurieren | 2-3 Minuten | Umgebung und Abhängigkeiten einrichten |
| **Gesamt** | **12-18 Minuten** | Bereit zum Chatten mit GPT-4 |

**Hinweis:** Die erstmalige Bereitstellung von OpenAI kann länger dauern, da das Modell bereitgestellt wird.

## Schnellstart

```bash
# Navigieren Sie zum Beispiel
cd examples/azure-openai-chat

# Umgebung initialisieren
azd env new myopenai

# Alles bereitstellen (Infrastruktur + Konfiguration)
azd up
# Sie werden aufgefordert:
# 1. Azure-Abonnement auswählen
# 2. Standort mit OpenAI-Verfügbarkeit wählen (z. B. eastus, eastus2, westus)
# 3. 12-18 Minuten auf die Bereitstellung warten

# Python-Abhängigkeiten installieren
pip install -r requirements.txt

# Beginnen Sie mit dem Chat!
python chat.py
```

**Erwartete Ausgabe:**
```
🤖 Azure OpenAI Chat Application
Connected to: GPT-4 (eastus)
Type your message (or 'quit' to exit)

You: Hello! Tell me about Azure OpenAI.
Assistant: Azure OpenAI Service provides REST API access to OpenAI's powerful language models including GPT-4, GPT-3.5-Turbo, and Embeddings...

[Tokens used: 145 | Estimated cost: $0.0044]
```

## ✅ Bereitstellung überprüfen

### Schritt 1: Azure-Ressourcen überprüfen

```bash
# Bereitgestellte Ressourcen anzeigen
azd show

# Erwartete Ausgabe zeigt:
# - OpenAI-Dienst: (Ressourcenname)
# - Schlüssel-Tresor: (Ressourcenname)
# - Bereitstellung: gpt-4
# - Standort: eastus (oder Ihre ausgewählte Region)
```

### Schritt 2: OpenAI-API testen

```bash
# Abrufen des OpenAI-Endpunkts und Schlüssels
OPENAI_ENDPOINT=$(azd env get-value AZURE_OPENAI_ENDPOINT)
OPENAI_KEY=$(azd env get-value AZURE_OPENAI_API_KEY)

# API-Aufruf testen
curl "$OPENAI_ENDPOINT/openai/deployments/gpt-4/chat/completions?api-version=2024-08-01-preview" \
  -H "Content-Type: application/json" \
  -H "api-key: $OPENAI_KEY" \
  -d '{
    "messages": [{"role": "user", "content": "Say hello!"}],
    "max_tokens": 50
  }'
```

**Erwartete Antwort:**
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

### Schritt 3: Key Vault-Zugriff überprüfen

```bash
# Geheimnisse im Key Vault auflisten
KV_NAME=$(azd env get-value AZURE_KEY_VAULT_NAME)

az keyvault secret list \
  --vault-name $KV_NAME \
  --query "[].name" \
  --output table
```

**Erwartete Geheimnisse:**
- `openai-api-key`
- `openai-endpoint`

**Erfolgskriterien:**
- ✅ OpenAI-Service mit GPT-4 bereitgestellt
- ✅ API-Aufruf liefert gültige Ergebnisse
- ✅ Geheimnisse im Key Vault gespeichert
- ✅ Token-Nutzungsverfolgung funktioniert

## Projektstruktur

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

## Anwendungsfunktionen

### Chat-Oberfläche (`chat.py`)

Die Chat-Anwendung umfasst:

- **Gesprächsverlauf** - Beibehaltung des Kontexts über Nachrichten hinweg
- **Token-Zählung** - Verfolgung der Nutzung und Kostenschätzung
- **Fehlerbehandlung** - Elegante Handhabung von Ratenbegrenzungen und API-Fehlern
- **Kostenabschätzung** - Echtzeit-Kostenberechnung pro Nachricht
- **Streaming-Unterstützung** - Optionale Streaming-Antworten

### Befehle

Während des Chats können Sie verwenden:
- `quit` oder `exit` - Sitzung beenden
- `clear` - Gesprächsverlauf löschen
- `tokens` - Gesamte Token-Nutzung anzeigen
- `cost` - Geschätzte Gesamtkosten anzeigen

### Konfiguration (`config.py`)

Lädt Konfiguration aus Umgebungsvariablen:
```python
AZURE_OPENAI_ENDPOINT  # Aus dem Key Vault
AZURE_OPENAI_API_KEY   # Aus dem Key Vault
AZURE_OPENAI_MODEL     # Standard: gpt-4
AZURE_OPENAI_MAX_TOKENS # Standard: 800
```

## Anwendungsbeispiele

### Einfacher Chat

```bash
python chat.py
```

### Chat mit benutzerdefiniertem Modell

```bash
export AZURE_OPENAI_MODEL=gpt-35-turbo
python chat.py
```

### Chat mit Streaming

```bash
python chat.py --stream
```

### Beispielgespräch

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

## Kostenmanagement

### Token-Preise (GPT-4)

| Modell | Eingabe (pro 1K Tokens) | Ausgabe (pro 1K Tokens) |
|--------|-------------------------|-------------------------|
| GPT-4  | $0.03                  | $0.06                  |
| GPT-3.5-Turbo | $0.0015         | $0.002                 |

### Geschätzte monatliche Kosten

Basierend auf Nutzungsmustern:

| Nutzungslevel | Nachrichten/Tag | Tokens/Tag | Monatliche Kosten |
|---------------|-----------------|------------|-------------------|
| **Leicht**    | 20 Nachrichten  | 3.000 Tokens | $3-5             |
| **Mittel**    | 100 Nachrichten | 15.000 Tokens | $15-25          |
| **Hoch**      | 500 Nachrichten | 75.000 Tokens | $75-125         |

**Basis-Infrastrukturkosten:** $1-2/Monat (Key Vault + minimale Rechenleistung)

### Tipps zur Kostenoptimierung

```bash
# 1. Verwenden Sie GPT-3.5-Turbo für einfachere Aufgaben (20x günstiger)
export AZURE_OPENAI_MODEL=gpt-35-turbo

# 2. Reduzieren Sie die maximale Anzahl von Tokens für kürzere Antworten
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Überwachen Sie die Token-Nutzung
python chat.py --show-tokens

# 4. Richten Sie Budgetwarnungen ein
az consumption budget create \
  --budget-name "openai-budget" \
  --amount 50 \
  --time-grain Monthly
```

## Überwachung

### Token-Nutzung anzeigen

```bash
# Im Azure-Portal:
# OpenAI-Ressource → Metriken → Wählen Sie "Token-Transaktion"

# Oder über Azure CLI:
az monitor metrics list \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --metric "TokenTransaction" \
  --start-time $(date -u -d '1 hour ago' '+%Y-%m-%dT%H:%M:%S') \
  --interval PT1M
```

### API-Protokolle anzeigen

```bash
# Diagnoseprotokolle streamen
az monitor diagnostic-settings create \
  --resource $(azd env get-value AZURE_OPENAI_RESOURCE_ID) \
  --name openai-logs \
  --logs '[{"category": "Audit", "enabled": true}]' \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID)

# Protokolle abfragen
az monitor log-analytics query \
  --workspace $(azd env get-value LOG_ANALYTICS_WORKSPACE_ID) \
  --analytics-query "AzureDiagnostics | where Category == 'Audit' | top 10 by TimeGenerated"
```

## Fehlerbehebung

### Problem: "Zugriff verweigert"-Fehler

**Symptome:** 403 Forbidden beim API-Aufruf

**Lösungen:**
```bash
# 1. Überprüfen Sie, ob der Zugriff auf OpenAI genehmigt ist
az cognitiveservices account show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Überprüfen Sie, ob der API-Schlüssel korrekt ist
azd env get-value AZURE_OPENAI_API_KEY

# 3. Überprüfen Sie das Format der Endpunkt-URL
azd env get-value AZURE_OPENAI_ENDPOINT
# Sollte sein: https://[name].openai.azure.com/
```

### Problem: "Ratenbegrenzung überschritten"

**Symptome:** 429 Too Many Requests

**Lösungen:**
```bash
# 1. Überprüfen Sie das aktuelle Kontingent
az cognitiveservices account deployment show \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --deployment-name gpt-4

# 2. Kontingenterhöhung anfordern (falls erforderlich)
# Gehen Sie zum Azure-Portal → OpenAI-Ressource → Kontingente → Erhöhung anfordern

# 3. Implementieren Sie die Wiederholungslogik (bereits in chat.py)
# Die Anwendung versucht automatisch erneut mit exponentiellem Backoff
```

### Problem: "Modell nicht gefunden"

**Symptome:** 404-Fehler bei der Bereitstellung

**Lösungen:**
```bash
# 1. Verfügbare Bereitstellungen auflisten
az cognitiveservices account deployment list \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP)

# 2. Modellname in der Umgebung überprüfen
echo $AZURE_OPENAI_MODEL

# 3. Auf den korrekten Bereitstellungsnamen aktualisieren
export AZURE_OPENAI_MODEL=gpt-4  # oder gpt-35-turbo
```

### Problem: Hohe Latenz

**Symptome:** Langsame Antwortzeiten (>5 Sekunden)

**Lösungen:**
```bash
# 1. Überprüfen Sie die regionale Latenz
# In der Region bereitstellen, die den Benutzern am nächsten liegt

# 2. Reduzieren Sie max_tokens für schnellere Antworten
export AZURE_OPENAI_MAX_TOKENS=400

# 3. Verwenden Sie Streaming für eine bessere Benutzererfahrung
python chat.py --stream
```

## Sicherheitsbest-Practices

### 1. API-Schlüssel schützen

```bash
# Niemals Schlüssel in die Versionskontrolle einfügen
# Verwenden Sie Key Vault (bereits konfiguriert)

# Schlüssel regelmäßig rotieren
az cognitiveservices account keys regenerate \
  --name $(azd env get-value AZURE_OPENAI_NAME) \
  --resource-group $(azd env get-value AZURE_RESOURCE_GROUP) \
  --key-name key1
```

### 2. Inhaltsfilterung implementieren

```python
# Azure OpenAI enthält integrierte Inhaltsfilterung
# Konfigurieren im Azure-Portal:
# OpenAI-Ressource → Inhaltsfilter → Benutzerdefinierten Filter erstellen

# Kategorien: Hass, Sexuell, Gewalt, Selbstverletzung
# Stufen: Niedrig, Mittel, Hohe Filterung
```

### 3. Verwenden Sie Managed Identity (Produktion)

```bash
# Für Produktionsbereitstellungen verwenden Sie eine verwaltete Identität
# anstelle von API-Schlüsseln (erfordert App-Hosting auf Azure)

# Aktualisieren Sie infra/openai.bicep, um Folgendes einzuschließen:
# identity: { type: 'SystemAssigned' }
```

## Entwicklung

### Lokal ausführen

```bash
# Abhängigkeiten installieren
pip install -r src/requirements.txt

# Umgebungsvariablen festlegen
export AZURE_OPENAI_ENDPOINT="https://[name].openai.azure.com/"
export AZURE_OPENAI_API_KEY="your-api-key"
export AZURE_OPENAI_MODEL="gpt-4"

# Anwendung ausführen
python src/chat.py
```

### Tests ausführen

```bash
# Installiere Testabhängigkeiten
pip install pytest pytest-cov

# Tests ausführen
pytest tests/ -v

# Mit Abdeckung
pytest tests/ --cov=src --cov-report=html
```

### Modellbereitstellung aktualisieren

```bash
# Verschiedene Modellversionen bereitstellen
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

## Bereinigung

```bash
# Löschen Sie alle Azure-Ressourcen
azd down --force --purge

# Dies entfernt:
# - OpenAI-Dienst
# - Key Vault (mit 90-tägiger Soft-Löschung)
# - Ressourcengruppe
# - Alle Bereitstellungen und Konfigurationen
```

## Nächste Schritte

### Dieses Beispiel erweitern

1. **Web-Oberfläche hinzufügen** - Frontend mit React/Vue erstellen
   ```bash
   # Fügen Sie den Frontend-Dienst zu azure.yaml hinzu
   # Bereitstellung in Azure Static Web Apps
   ```

2. **RAG implementieren** - Dokumentensuche mit Azure AI Search hinzufügen
   ```python
   # Azure Cognitive Search integrieren
   # Dokumente hochladen und Vektorindex erstellen
   ```

3. **Funktionsaufrufe hinzufügen** - Tool-Nutzung aktivieren
   ```python
   # Funktionen in chat.py definieren
   # GPT-4 externe APIs aufrufen lassen
   ```

4. **Multi-Modell-Unterstützung** - Mehrere Modelle bereitstellen
   ```bash
   # Füge gpt-35-turbo, Embedding-Modelle hinzu
   # Implementiere Modell-Routing-Logik
   ```

### Verwandte Beispiele

- **[Retail Multi-Agent](../retail-scenario.md)** - Fortgeschrittene Multi-Agent-Architektur
- **[Datenbank-App](../../../../examples/database-app)** - Persistente Speicherung hinzufügen
- **[Container-Apps](../../../../examples/container-app)** - Als containerisierten Dienst bereitstellen

### Lernressourcen

- 📚 [AZD For Beginners Kurs](../../README.md) - Hauptkursübersicht
- 📚 [Azure OpenAI Dokumentation](https://learn.microsoft.com/azure/ai-services/openai/) - Offizielle Dokumentation
- 📚 [OpenAI API-Referenz](https://platform.openai.com/docs/api-reference) - API-Details
- 📚 [Verantwortungsvolle KI](https://www.microsoft.com/ai/responsible-ai) - Best Practices

## Zusätzliche Ressourcen

### Dokumentation
- **[Azure OpenAI Service](https://learn.microsoft.com/azure/ai-services/openai/)** - Vollständige Anleitung
- **[GPT-4 Modelle](https://learn.microsoft.com/azure/ai-services/openai/concepts/models)** - Modellfähigkeiten
- **[Inhaltsfilterung](https://learn.microsoft.com/azure/ai-services/openai/concepts/content-filter)** - Sicherheitsfunktionen
- **[Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)** - azd-Referenz

### Tutorials
- **[OpenAI Schnellstart](https://learn.microsoft.com/azure/ai-services/openai/quickstart)** - Erste Bereitstellung
- **[Chat-Abschlüsse](https://learn.microsoft.com/azure/ai-services/openai/how-to/chatgpt)** - Chat-Anwendungen erstellen
- **[Funktionsaufrufe](https://learn.microsoft.com/azure/ai-services/openai/how-to/function-calling)** - Erweiterte Funktionen

### Tools
- **[Azure OpenAI Studio](https://oai.azure.com/)** - Webbasierter Playground
- **[Prompt Engineering Guide](https://platform.openai.com/docs/guides/prompt-engineering)** - Bessere Prompts schreiben
- **[Token-Rechner](https://platform.openai.com/tokenizer)** - Token-Nutzung schätzen

### Community
- **[Azure AI Discord](https://discord.gg/azure)** - Hilfe von der Community erhalten
- **[GitHub Diskussionen](https://github.com/Azure-Samples/openai/discussions)** - Q&A-Forum
- **[Azure Blog](https://azure.microsoft.com/blog/tag/azure-openai-service/)** - Neueste Updates

---

**🎉 Erfolg!** Sie haben Azure OpenAI bereitgestellt und eine funktionierende Chat-Anwendung erstellt. Erkunden Sie die Fähigkeiten von GPT-4 und experimentieren Sie mit verschiedenen Prompts und Anwendungsfällen.

**Fragen?** [Ein Problem öffnen](https://github.com/microsoft/AZD-for-beginners/issues) oder die [FAQ](../../resources/faq.md) überprüfen

**Kostenwarnung:** Denken Sie daran, `azd down` auszuführen, wenn Sie mit dem Testen fertig sind, um laufende Kosten (~$50-100/Monat bei aktiver Nutzung) zu vermeiden.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->