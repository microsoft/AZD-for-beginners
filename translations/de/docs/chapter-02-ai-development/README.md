# Kapitel 2: KI-Erste Entwicklung

**📚 Kurs**: [AZD Für Einsteiger](../../README.md) | **⏱️ Dauer**: 4-5 Stunden inklusive Workshop | **⭐ Komplexität**: Mittelstufe

---

## Überblick

Dieses Kapitel konzentriert sich auf das Bereitstellen KI-gestützter Anwendungen mit Azure Developer CLI und den Microsoft Foundry-Diensten. Von einfachen KI-Chat-Apps bis zu intelligenten Agenten mit Tools.

> **Release-Review (2026-11-04):** Die KI-CLI-Anleitung wurde mit der veröffentlichten `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23` und `azure.ai.evaluations` `1.0.0-beta.2` Dokumentation/Quelle abgeglichen. Verwenden Sie `azd >= 1.37.0` für den kombinierten Workflow. Bewertungen verwenden jetzt den separaten `azd ai eval` Namespace; siehe [Release-Änderungen und Migrationshinweise](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Dies ist keine Validierung der Live-Bereitstellung.

## Lernziele

Am Ende dieses Kapitels werden Sie:
- KI-Anwendungen mit vorgefertigten AZD-Vorlagen bereitstellen
- Die Integration von Microsoft Foundry mit AZD verstehen
- KI-Agenten mit Tools konfigurieren und anpassen
- RAG (Retrieval-Augmented Generation)-Anwendungen bereitstellen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | AZD mit Foundry-Diensten verbinden | 30 min |
| 2 | [KI-Agenten-Anleitung](agents.md) | Intelligente Agenten mit Tools bereitstellen | 45 min |
| 3 | [KI-Modell-Bereitstellung](ai-model-deployment.md) | KI-Modelle bereitstellen und konfigurieren | 30 min |
| 4 | [KI Workshop Labor](ai-workshop-lab.md) | Praxis: Eine Vorlage erkunden und Ihre Umwandlung planen | 2-3 Stunden |

---

## 🚀 Schnellstart

Wählen Sie eine Option in einem neuen leeren Verzeichnis. Das abschließende `.` initialisiert das aktuelle Verzeichnis; andernfalls kann AZD ein Unterverzeichnis erstellen, ohne das Arbeitsverzeichnis Ihrer Shell zu ändern.

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
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-Chat mit Quellenangaben | OpenAI + KI-Suche |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | KI-Agent mit Tools | KI-Agent-Dienst |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundlegender KI-Chat | OpenAI + Container-Apps |

---

## 💰 Kostenbewusstsein

Dies sind illustrative Bereiche, keine Angebote oder Obergrenzen; Modellverkehr, Search/Compute-SKUs, Region und optionale Features können darüber hinausgehen. Prüfen Sie die aktuelle Preisgestaltung Ihrer gewählten Beispielvorlage vor der Bereitstellung.

| Umgebung | Geschätzte Monatliche Kosten |
|-------------|----------------------------|
| Entwicklung | 80-150 $ |
| Staging | 150-300 $ |
| Produktion | 300-3.500+ $ |

**Tipp:** Führen Sie `azd down` nach dem Testen aus, um Gebühren zu vermeiden.

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 1: Grundlagen](../chapter-01-foundation/README.md) |
| **Nächstes** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Überspringen zu** | [Kapitel 8: Produktionsmuster](../chapter-08-production/README.md) |

---

## 📖 Verwandte Ressourcen

- [KI-Fehlerbehebung](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktions-KI-Praktiken](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->