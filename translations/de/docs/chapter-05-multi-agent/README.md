# Kapitel 5: Multi-Agenten-KI-Lösungen

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Dauer**: 2-3 Stunden | **⭐ Komplexität**: Fortgeschritten

---

## Überblick

Dieses Kapitel behandelt fortgeschrittene Multi-Agenten-Architekturmuster, Agenten-Orchestrierung und produktionsreife KI-Bereitstellungen für komplexe Szenarien.

## Lernziele

Wenn Sie dieses Kapitel abschließen, werden Sie:
- Multi-Agenten-Architekturmuster verstehen
- Koordinierte KI-Agentensysteme bereitstellen
- Agenten-zu-Agenten-Kommunikation implementieren
- Produktionsreife Multi-Agenten-Lösungen erstellen

---

## 📚 Lektionen

| # | Lesson | Description | Time |
|---|--------|-------------|------|
| 1 | [Multi-Agenten-Lösung für den Einzelhandel](../../examples/retail-scenario.md) | Vollständige Implementierungsdurchführung | 90 Min |
| 2 | [Koordinationsmuster](../chapter-06-pre-deployment/coordination-patterns.md) | Agenten-Orchestrierungsstrategien | 30 Min |
| 3 | [ARM-Template-Bereitstellung](../../examples/retail-multiagent-arm-template/README.md) | Ein-Klick-Bereitstellung | 30 Min |

---

## 🚀 Schnellstart

```bash
# Bereitstellen der Multi-Agenten-Lösung für den Einzelhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Oder verwenden Sie die Vorlage direkt
azd init --template agent-openai-python-prompty
azd up
```

---

## 🤖 Multi-Agenten-Architektur

```
┌──────────────────────────────────────────────────────────────┐
│                    Orchestrator Agent                         │
│              (Routes requests, manages workflow)              │
└────────────────────┬─────────────────┬───────────────────────┘
                     │                 │
         ┌───────────▼───────┐ ┌───────▼───────────┐
         │  Customer Agent   │ │  Inventory Agent  │
         │  (User queries,   │ │  (Stock levels,   │
         │   preferences)    │ │   orders)         │
         └───────────────────┘ └───────────────────┘
```

---

## 🎯 Vorgestellte Lösung: Multi-Agenten-Lösung für den Einzelhandel

Die [Multi-Agenten-Lösung für den Einzelhandel](../../examples/retail-scenario.md) demonstriert:

- **Kunden-Agent**: Verarbeitet Benutzerinteraktionen und -präferenzen
- **Lager-Agent**: Verwaltet Bestände und Auftragsverarbeitung
- **Orchestrator**: Koordiniert die Zusammenarbeit zwischen den Agenten
- **Gemeinsamer Speicher**: Kontextverwaltung über Agenten hinweg

### Verwendete Dienste

| Service | Purpose |
|---------|---------|
| Azure OpenAI | Sprachverständnis |
| Azure AI Search | Produktkatalog |
| Cosmos DB | Agentenzustand und Speicher |
| Container Apps | Hosting der Agenten |
| Application Insights | Überwachung |

---

## 🔗 Navigation

| Direction | Chapter |
|-----------|---------|
| **Previous** | [Kapitel 4: Infrastruktur](../chapter-04-infrastructure/README.md) |
| **Next** | [Kapitel 6: Vorbereitungen vor der Bereitstellung](../chapter-06-pre-deployment/README.md) |

---

## 📖 Verwandte Ressourcen

- [Leitfaden zu KI-Agenten](../chapter-02-ai-development/agents.md)
- [Produktions-KI-Praktiken](../chapter-08-production/production-ai-practices.md)
- [KI-Fehlerbehebung](../chapter-07-troubleshooting/ai-troubleshooting.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->