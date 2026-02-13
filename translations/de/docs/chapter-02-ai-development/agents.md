# KI-Agenten mit Azure Developer CLI

**Kapitel-Navigation:**
- **📚 Kursstart**: [AZD für Einsteiger](../../README.md)
- **📖 Aktuelles Kapitel**: Kapitel 2 - KI-zentrierte Entwicklung
- **⬅️ Vorheriges**: [AI Model Deployment](ai-model-deployment.md)
- **➡️ Nächstes**: [Production AI Practices](production-ai-practices.md)
- **🚀 Erweitert**: [Multi-Agenten-Lösungen](../../examples/retail-scenario.md)

---

## Einführung

KI-Agenten sind autonome Programme, die ihre Umgebung wahrnehmen, Entscheidungen treffen und Aktionen ausführen können, um bestimmte Ziele zu erreichen. Im Gegensatz zu einfachen Chatbots, die auf Eingaben reagieren, können Agenten:

- **Werkzeuge verwenden** - APIs aufrufen, Datenbanken durchsuchen, Code ausführen
- **Planen und schlussfolgern** - Komplexe Aufgaben in Schritte aufteilen
- **Aus dem Kontext lernen** - Erinnerung behalten und Verhalten anpassen
- **Zusammenarbeiten** - Mit anderen Agenten arbeiten (Multi-Agenten-Systeme)

Diese Anleitung zeigt, wie Sie KI-Agenten mit Azure Developer CLI (azd) in Azure bereitstellen.

## Lernziele

Durch Abschluss dieser Anleitung werden Sie:
- Verstehen, was KI-Agenten sind und wie sie sich von Chatbots unterscheiden
- Vorgefertigte KI-Agenten-Vorlagen mit AZD bereitstellen
- Foundry Agents für benutzerdefinierte Agenten konfigurieren
- Grundlegende Agentenmuster implementieren (Tool-Verwendung, RAG, Multi-Agenten)
- Bereitgestellte Agenten überwachen und debuggen

## Lernergebnisse

Nach Abschluss sind Sie in der Lage:
- KI-Agenten-Anwendungen mit einem einzigen Befehl in Azure bereitzustellen
- Agentenwerkzeuge und -fähigkeiten zu konfigurieren
- Retrieval-Augmented Generation (RAG) mit Agenten zu implementieren
- Multi-Agenten-Architekturen für komplexe Workflows zu entwerfen
- Häufige Bereitstellungsprobleme von Agenten zu beheben

---

## 🤖 Wodurch unterscheidet sich ein Agent von einem Chatbot?

| Merkmal | Chatbot | KI-Agent |
|---------|---------|----------|
| **Verhalten** | Reagiert auf Eingaben | Führt autonome Aktionen aus |
| **Werkzeuge** | Keine | Kann APIs aufrufen, suchen, Code ausführen |
| **Speicher** | Nur sitzungsbasiert | Persistenter Speicher über Sitzungen hinweg |
| **Planung** | Einzelne Antwort | Mehrschrittiges Schlussfolgern |
| **Zusammenarbeit** | Einzelne Einheit | Kann mit anderen Agenten zusammenarbeiten |

### Einfache Analogie

- **Chatbot** = Eine hilfreiche Person, die an einem Informationsschalter Fragen beantwortet
- **KI-Agent** = Ein persönlicher Assistent, der Anrufe tätigen, Termine buchen und Aufgaben für Sie erledigen kann

---

## 🚀 Schnellstart: Ihren ersten Agenten bereitstellen

### Option 1: Foundry Agents Template (Empfohlen)

```bash
# Vorlage für KI-Agenten initialisieren
azd init --template get-started-with-ai-agents

# Auf Azure bereitstellen
azd up
```

**Wird bereitgestellt:**
- ✅ Foundry Agents
- ✅ Azure OpenAI (GPT-4o)
- ✅ Azure AI Search (für RAG)
- ✅ Azure Container Apps (Weboberfläche)
- ✅ Application Insights (Überwachung)

**Zeit:** ~15-20 Minuten
**Kosten:** ~$100-150/Monat (Entwicklung)

### Option 2: OpenAI Agent mit Prompty

```bash
# Initialisiere die auf Prompty basierende Agentenvorlage
azd init --template agent-openai-python-prompty

# Auf Azure bereitstellen
azd up
```

**Wird bereitgestellt:**
- ✅ Azure Functions (serverlose Agentenausführung)
- ✅ Azure OpenAI
- ✅ Prompty-Konfigurationsdateien
- ✅ Beispielimplementierung eines Agenten

**Zeit:** ~10-15 Minuten
**Kosten:** ~$50-100/Monat (Entwicklung)

### Option 3: RAG Chat Agent

```bash
# RAG-Chat-Vorlage initialisieren
azd init --template azure-search-openai-demo

# Auf Azure bereitstellen
azd up
```

**Wird bereitgestellt:**
- ✅ Azure OpenAI
- ✅ Azure AI Search mit Beispieldaten
- ✅ Dokumentverarbeitungspipeline
- ✅ Chat-Oberfläche mit Zitaten

**Zeit:** ~15-25 Minuten
**Kosten:** ~$80-150/Monat (Entwicklung)

---

## 🏗️ Architektur-Muster für Agenten

### Muster 1: Einzelner Agent mit Werkzeugen

Das einfachste Agentenmuster - ein Agent, der mehrere Werkzeuge verwenden kann.

```
┌─────────────────────────────────────┐
│           User Interface            │
└─────────────────┬───────────────────┘
                  │
          ┌───────▼───────┐
          │  AI Agent     │
          │  (GPT-4o)     │
          └───────┬───────┘
                  │
    ┌─────────────┼─────────────┐
    │             │             │
┌───▼───┐   ┌────▼────┐   ┌───▼───┐
│Search │   │Database │   │ API   │
│ Tool  │   │  Tool   │   │ Tool  │
└───────┘   └─────────┘   └───────┘
```

**Am besten für:**
- Kundensupport-Bots
- Rechercheassistenten
- Datenanalyse-Agenten

**AZD-Vorlage:** `azure-search-openai-demo`

### Muster 2: RAG-Agent (Retrieval-Augmented Generation)

Ein Agent, der relevante Dokumente abruft, bevor er Antworten generiert.

```
┌──────────────────────────────────────────────┐
│                User Query                     │
└─────────────────────┬────────────────────────┘
                      │
              ┌───────▼───────┐
              │  RAG Agent    │
              └───────┬───────┘
                      │
         ┌────────────┴────────────┐
         │                         │
    ┌────▼────┐              ┌────▼────┐
    │ Vector  │              │  LLM    │
    │ Search  │──Documents──►│ (GPT-4) │
    └─────────┘              └────┬────┘
                                  │
                          ┌───────▼───────┐
                          │ Response with │
                          │  Citations    │
                          └───────────────┘
```

**Am besten für:**
- Unternehmens-Wissensdatenbanken
- Dokumenten-Q&A-Systeme
- Compliance- und Rechtsrecherche

**AZD-Vorlage:** `azure-search-openai-demo`

### Muster 3: Multi-Agenten-System

Mehrere spezialisierte Agenten, die gemeinsam an komplexen Aufgaben arbeiten.

```
                ┌─────────────────┐
                │  Orchestrator   │
                │    Agent        │
                └────────┬────────┘
                         │
        ┌────────────────┼────────────────┐
        │                │                │
┌───────▼───────┐ ┌─────▼──────┐ ┌───────▼───────┐
│   Research    │ │   Writer   │ │   Reviewer    │
│    Agent      │ │   Agent    │ │    Agent      │
│  (GPT-4o)     │ │(GPT-4o-mini│ │   (GPT-4o)    │
└───────────────┘ └────────────┘ └───────────────┘
```

**Am besten für:**
- Komplexe Inhaltserstellung
- Mehrschrittige Workflows
- Aufgaben, die unterschiedliche Fachkenntnisse erfordern

**Mehr erfahren:** [Multi-Agenten-Koordinationsmuster](../chapter-06-pre-deployment/coordination-patterns.md)

---

## ⚙️ Agenten-Werkzeuge konfigurieren

Agenten werden mächtig, wenn sie Werkzeuge verwenden können. So konfigurieren Sie gängige Werkzeuge:

### Tool-Konfiguration in Foundry Agents

```python
# agent_config.py
from azure.ai.projects import AIProjectClient
from azure.ai.projects.models import FunctionTool, CodeInterpreterTool

# Benutzerdefinierte Tools definieren
search_tool = FunctionTool(
    name="search_knowledge_base",
    description="Search the company knowledge base for relevant documents",
    parameters={
        "type": "object",
        "properties": {
            "query": {
                "type": "string",
                "description": "The search query"
            }
        },
        "required": ["query"]
    }
)

# Agent mit Tools erstellen
agent = project_client.agents.create_agent(
    model="gpt-4o",
    name="Support Agent",
    instructions="You are a helpful support agent. Use the search tool to find relevant information.",
    tools=[search_tool, CodeInterpreterTool()]
)
```

### Umgebungskonfiguration

```bash
# Agentenspezifische Umgebungsvariablen einrichten
azd env set AZURE_OPENAI_MODEL "gpt-4o"
azd env set AGENT_INSTRUCTIONS "You are a helpful assistant..."
azd env set ENABLE_CODE_INTERPRETER "true"
azd env set ENABLE_FILE_SEARCH "true"

# Mit aktualisierter Konfiguration bereitstellen
azd deploy
```

---

## 📊 Agenten überwachen

### Application Insights-Integration

Alle AZD-Agenten-Vorlagen beinhalten Application Insights zur Überwachung:

```bash
# Überwachungs-Dashboard öffnen
azd monitor --overview

# Live-Protokolle anzeigen
azd monitor --logs

# Live-Metriken anzeigen
azd monitor --live
```

### Wichtige Metriken zur Überwachung

| Metrik | Beschreibung | Ziel |
|--------|-------------|------|
| Antwortlatenz | Zeit zur Generierung der Antwort | < 5 Sekunden |
| Token-Verbrauch | Tokens pro Anfrage | Auf Kosten überwachen |
| Erfolgsquote von Tool-Aufrufen | % erfolgreicher Tool-Ausführungen | > 95% |
| Fehlerrate | Fehlgeschlagene Agentenanfragen | < 1% |
| Benutzerzufriedenheit | Feedback-Bewertungen | > 4.0/5.0 |

### Benutzerdefinierte Protokollierung für Agenten

```python
import logging
from opencensus.ext.azure.log_exporter import AzureLogHandler

logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(
    connection_string=os.environ["APPLICATIONINSIGHTS_CONNECTION_STRING"]
))

def log_agent_interaction(user_query, agent_response, tools_used, latency_ms):
    logger.info("agent_interaction", extra={
        "custom_dimensions": {
            "user_query": user_query,
            "response_length": len(agent_response),
            "tools_used": tools_used,
            "latency_ms": latency_ms
        }
    })
```

---

## 💰 Kostenüberlegungen

### Geschätzte monatliche Kosten nach Muster

| Muster | Entwicklungsumgebung | Produktion |
|---------|-----------------|------------|
| Einzelner Agent | $50-100 | $200-500 |
| RAG-Agent | $80-150 | $300-800 |
| Multi-Agent (2-3 Agenten) | $150-300 | $500-1,500 |
| Enterprise Multi-Agent | $300-500 | $1,500-5,000+ |

### Tipps zur Kostenoptimierung

1. **Verwenden Sie GPT-4o-mini für einfache Aufgaben**
   ```bash
   azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
   ```

2. **Implementieren Sie Caching für wiederholte Abfragen**
   ```python
   from functools import lru_cache
   
   @lru_cache(maxsize=1000)
   def get_cached_response(query_hash):
       return agent.run(query_hash)
   ```

3. **Setzen Sie Token-Limits**
   ```python
   agent = project_client.agents.create_agent(
       model="gpt-4o",
       max_tokens=1000  # Antwortlänge begrenzen
   )
   ```

4. **Auf Null skalieren, wenn nicht in Gebrauch**
   ```bash
   # Container-Apps skalieren automatisch auf Null
   azd env set MIN_REPLICAS "0"
   ```

---

## 🔧 Fehlerbehebung bei Agenten

### Häufige Probleme und Lösungen

<details>
<summary><strong>❌ Agent reagiert nicht auf Tool-Aufrufe</strong></summary>

```bash
# Überprüfe, ob die Werkzeuge ordnungsgemäß registriert sind
azd show

# Überprüfe die OpenAI-Bereitstellung
az cognitiveservices account deployment list \
  --name $AZURE_OPENAI_NAME \
  --resource-group $RG_NAME

# Überprüfe die Agentenprotokolle
azd monitor --logs
```

**Häufige Ursachen:**
- Signatur der Tool-Funktion stimmt nicht überein
- Fehlende erforderliche Berechtigungen
- API-Endpunkt nicht erreichbar
</details>

<details>
<summary><strong>❌ Hohe Latenz bei Agentenantworten</strong></summary>

```bash
# Überprüfen Sie Application Insights auf Engpässe
azd monitor --live

# Erwägen Sie die Verwendung eines schnelleren Modells
azd env set AZURE_OPENAI_MODEL "gpt-4o-mini"
azd deploy
```

**Optimierungstipps:**
- Verwenden Sie Streaming-Antworten
- Implementieren Sie Antwort-Caching
- Reduzieren Sie die Kontextfenstergröße
</details>

<details>
<summary><strong>❌ Agent liefert falsche oder halluzinierte Informationen</strong></summary>

```python
# Mit besseren System-Prompts verbessern
instructions = """
You are a helpful assistant. IMPORTANT:
- Only answer based on provided context
- If you don't know, say "I don't know"
- Always cite your sources
- Never make up information
"""

# Abruf zur Verankerung hinzufügen
agent = project_client.agents.create_agent(
    model="gpt-4o",
    instructions=instructions,
    tools=[FileSearchTool()]  # Antworten in Dokumenten verankern
)
```
</details>

<details>
<summary><strong>❌ Fehler: Token-Limit überschritten</strong></summary>

```python
# Kontextfensterverwaltung implementieren
def truncate_context(messages, max_tokens=8000):
    """Keep only recent messages within token limit."""
    total_tokens = 0
    truncated = []
    
    for msg in reversed(messages):
        msg_tokens = len(msg.content) // 4  # Grobe Schätzung
        if total_tokens + msg_tokens > max_tokens:
            break
        truncated.insert(0, msg)
        total_tokens += msg_tokens
    
    return truncated
```
</details>

---

## 🎓 Praktische Übungen

### Übung 1: Einen einfachen Agenten bereitstellen (20 Minuten)

**Ziel:** Ihren ersten KI-Agenten mit AZD bereitstellen

```bash
# Schritt 1: Vorlage initialisieren
azd init --template get-started-with-ai-agents

# Schritt 2: Bei Azure anmelden
azd auth login

# Schritt 3: Bereitstellen
azd up

# Schritt 4: Den Agenten testen
# Öffnen Sie die in der Ausgabe angezeigte URL

# Schritt 5: Aufräumen
azd down --force --purge
```

**Erfolgskriterien:**
- [ ] Agent beantwortet Fragen
- [ ] Zugriff auf das Überwachungs-Dashboard möglich
- [ ] Ressourcen wurden erfolgreich bereinigt

### Übung 2: Ein benutzerdefiniertes Tool hinzufügen (30 Minuten)

**Ziel:** Einen Agenten mit einem benutzerdefinierten Tool erweitern

1. Stellen Sie die Agenten-Vorlage bereit
2. Erstellen Sie eine neue Tool-Funktion:
   ```python
   def get_weather(location: str) -> str:
       """Get current weather for a location."""
       # API-Aufruf an den Wetterdienst
       return f"Weather in {location}: Sunny, 72°F"
   ```
3. Registrieren Sie das Tool beim Agenten
4. Testen Sie, dass der Agent das neue Tool verwendet

**Erfolgskriterien:**
- [ ] Agent erkennt wetterbezogene Anfragen
- [ ] Tool wird korrekt aufgerufen
- [ ] Antwort enthält Wetterinformationen

### Übung 3: Einen RAG-Agenten bauen (45 Minuten)

**Ziel:** Erstellen Sie einen Agenten, der Fragen aus Ihren Dokumenten beantwortet

```bash
# RAG-Vorlage bereitstellen
azd init --template azure-search-openai-demo
azd up

# Laden Sie Ihre Dokumente hoch
# (Befolgen Sie die Anleitung der Vorlage zur Datenaufnahme)

# Testen Sie mit domänenspezifischen Fragen
```

**Erfolgskriterien:**
- [ ] Agent antwortet aus hochgeladenen Dokumenten
- [ ] Antworten enthalten Zitate
- [ ] Keine Halluzinationen bei Fragen außerhalb des Umfangs

---

## 📚 Nächste Schritte

Jetzt, da Sie KI-Agenten verstehen, erkunden Sie diese fortgeschrittenen Themen:

| Thema | Beschreibung | Link |
|-------|-------------|------|
| **Multi-Agenten-Systeme** | Systeme mit mehreren zusammenarbeitenden Agenten bauen | [Retail Multi-Agent Example](../../examples/retail-scenario.md) |
| **Koordinationsmuster** | Erlernen von Orchestrierungs- und Kommunikationsmustern | [Coordination Patterns](../chapter-06-pre-deployment/coordination-patterns.md) |
| **Produktionsbereitstellung** | Enterprise-fähige Agenten-Bereitstellung | [Production AI Practices](production-ai-practices.md) |
| **Agentenbewertung** | Testen und Evaluieren der Agentenleistung | [AI Troubleshooting](../chapter-07-troubleshooting/ai-troubleshooting.md) |

---

## 📖 Zusätzliche Ressourcen

### Offizielle Dokumentation
- [Foundry Agents](https://learn.microsoft.com/azure/ai-services/agents/)
- [Azure OpenAI Assistants API](https://learn.microsoft.com/azure/ai-services/openai/how-to/assistant)
- [Semantic Kernel (Agent Framework)](https://learn.microsoft.com/semantic-kernel/)

### AZD-Vorlagen für Agenten
- [Erste Schritte mit KI-Agenten](https://github.com/Azure-Samples/get-started-with-ai-agents)
- [Agent OpenAI Python Prompty](https://github.com/Azure-Samples/agent-openai-python-prompty)
- [Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)

### Community-Ressourcen
- [Awesome AZD - Agent Templates](https://azure.github.io/awesome-azd/?tags=ai-agents)
- [Azure AI Discord](https://discord.gg/microsoft-azure)
- [Microsoft Foundry Discord](https://discord.gg/nTYy5BXMWG)

---

**Navigation**
- **Vorherige Lektion**: [AI Model Deployment](ai-model-deployment.md)
- **Nächste Lektion**: [Production AI Practices](production-ai-practices.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatische Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->