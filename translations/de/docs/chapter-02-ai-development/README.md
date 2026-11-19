# Kapitel 2: AI-First Entwicklung

**📚 Kurs**: [AZD Für Einsteiger](../../README.md) | **⏱️ Dauer**: 4-5 Stunden inklusive Workshop | **⭐ Komplexität**: Mittelstufe

---

## Übersicht

Dieses Kapitel konzentriert sich auf die Bereitstellung KI-gestützter Anwendungen mit Azure Developer CLI und Microsoft Foundry-Diensten. Von einfachen KI-Chat-Apps bis zu intelligenten Agenten mit Tools.

> **Foundry GA-Update (2026-11-09):** Das `microsoft.foundry` 1.0 Bundle ist [allgemein verfügbar](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Verwenden Sie `azd >= 1.37.0`; Evaluierungen bleiben eine separate Installation. Der [Hosted-Agent Walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) behandelt lokales Agent Inspector Testing und Remote-Code-Bereitstellung. Dies ist eine Dokumentationsprüfung, keine Live-Bereitstellungsvalidierung; optionale Vorschaufunktionen behalten ihren eigenen Status.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- KI-Anwendungen mit vorgefertigten AZD-Vorlagen bereitstellen
- Die Microsoft Foundry-Integration mit AZD verstehen
- Das GA-Bundle installieren und einen gehosteten Agenten lokal testen, bevor der Quellcode in Foundry bereitgestellt wird
- `azure.yaml`, Evaluierungsassets und Cleanup von neuen gegenüber wiederverwendeten Projekten überprüfen
- KI-Agenten mit Tools konfigurieren und anpassen
- RAG (Retrieval-Augmented Generation) Anwendungen bereitstellen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | GA-Bundle, gehosteter Agent lokal-zu-Cloud Workflow und Evaluierungen | 60 min |
| 2 | [Handbuch KI-Agenten](agents.md) | Intelligente Agenten mit Tools bereitstellen | 45 min |
| 3 | [KI Modellbereitstellung](ai-model-deployment.md) | KI-Modelle bereitstellen und konfigurieren | 30 min |
| 4 | [KI Workshop Labor](ai-workshop-lab.md) | Praktisch: Eine Vorlage erkunden und Ihre Umwandlung planen | 2-3 Stunden |

---

## 🚀 Schnellstart

Wählen Sie eine Option in einem neuen leeren Verzeichnis. Das angehängte `.` initialisiert das aktuelle Verzeichnis; ansonsten kann AZD ein Unterverzeichnis erstellen, ohne das Arbeitsverzeichnis Ihrer Shell zu ändern.

Für den **GA hosted-agent Code-Bereitstellungspfad** beginnen Sie mit dem [geführten Walkthrough](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Es erfordert AZD 1.37.0+, aktuelle uv, Python 3.13+, Foundry-Berechtigungen und Modellkontingent. Die unten aufgeführten vollständigen Anwendungsvorlagen sind Alternativen, keine Voraussetzungen für diesen Walkthrough.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Vorgestellte KI-Vorlagen

| Vorlage | Beschreibung | Dienste |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-Chat mit Zitaten | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | KI-Agent mit Tools | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Basis-KI-Chat | OpenAI + Container Apps |

---

## 💰 Kostenbewusstsein

Dies sind illustrative Bereiche, keine verbindlichen Angaben oder Obergrenzen; Modellverkehr, Search/Compute SKUs, Region und optionale Funktionen können diese überschreiten. Überprüfen Sie vor der Bereitstellung die aktuellen Preisinformationen Ihres gewählten Beispiels.

| Umgebung | Geschätzte Monatliche Kosten |
|-------------|---------------------------|
| Entwicklung | 80-150 $ |
| Staging | 150-300 $ |
| Produktion | 300-3.500+ $ |

**Bereinigung:** Überprüfen Sie `azd down` vor der Bestätigung: Für ein neu erstelltes Foundry-Projekt werden die Ressourcengruppe und alles darin gelöscht. Für ein wiederverwendetes Foundry-Projekt bleiben das Projekt und die Agent-Ressourcen erhalten; folgen Sie der [Anleitungsbereinigung](microsoft-foundry-integration.md#7-clean-up-deliberately), um unerwünschte Ressourcen separat zu entfernen.

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Zurück** | [Kapitel 1: Grundlagen](../chapter-01-foundation/README.md) |
| **Weiter** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Springe zu** | [Kapitel 8: Produktionsmuster](../chapter-08-production/README.md) |

---

## 📖 Verwandte Ressourcen

- [KI-Fehlerbehebung](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Praxis der KI-Produktion](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->