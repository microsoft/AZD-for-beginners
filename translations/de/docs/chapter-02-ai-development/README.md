# Kapitel 2: KI-zentrierte Entwicklung

**📚 Kurs**: [AZD For Beginners](../../README.md) | **⏱️ Dauer**: 1-2 hours | **⭐ Komplexität**: Intermediate

---

## Übersicht

Dieses Kapitel konzentriert sich auf das Bereitstellen KI-gestützter Anwendungen mit der Azure Developer CLI und Microsoft Foundry-Diensten. Von einfachen KI-Chat-Apps bis hin zu intelligenten Agenten mit Werkzeugen.

## Lernziele

Nach Abschluss dieses Kapitels werden Sie:
- KI-Anwendungen mit vorgefertigten AZD-Vorlagen bereitstellen
- Die Integration von Microsoft Foundry mit AZD verstehen
- KI-Agenten mit Werkzeugen konfigurieren und anpassen
- RAG (Retrieval-Augmented Generation)-Anwendungen bereitstellen

---

## 📚 Lektionen

| # | Lektion | Beschreibung | Zeit |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry-Integration](microsoft-foundry-integration.md) | AZD mit Foundry-Diensten verbinden | 30 min |
| 2 | [KI-Agenten-Leitfaden](agents.md) | Intelligente Agenten mit Werkzeugen bereitstellen | 45 min |
| 3 | [Bereitstellung von KI-Modellen](ai-model-deployment.md) | KI-Modelle bereitstellen und konfigurieren | 30 min |
| 4 | [KI-Workshop-Labor](ai-workshop-lab.md) | Praktisch: Machen Sie Ihre KI-Lösung AZD-bereit | 60 min |

---

## 🚀 Schnellstart

```bash
# Option 1: RAG-Chat-Anwendung
azd init --template azure-search-openai-demo
azd up

# Option 2: KI-Agenten
azd init --template get-started-with-ai-agents
azd up

# Option 3: Schnelle Chat-App
azd init --template openai-chat-app-quickstart
azd up
```

---

## 🤖 Vorgestellte KI-Vorlagen

| Vorlage | Beschreibung | Dienste |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-Chat mit Quellenangaben | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | KI-Agent mit Werkzeugen | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundlegender KI-Chat | OpenAI + Container Apps |

---

## 💰 Kostenbewusstsein

| Umgebung | Geschätzte monatliche Kosten |
|-------------|----------------------|
| Entwicklung | $80-150 |
| Staging | $150-300 |
| Produktion | $300-3,500+ |

**Tipp:** Führen Sie nach dem Testen `azd down` aus, um Gebühren zu vermeiden.

---

## 🔗 Navigation

| Richtung | Kapitel |
|-----------|---------|
| **Vorheriges** | [Kapitel 1: Grundlagen](../chapter-01-foundation/README.md) |
| **Nächstes** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Springe zu** | [Kapitel 8: Produktionsmuster](../chapter-08-production/README.md) |

---

## 📖 Verwandte Ressourcen

- [KI-Fehlerbehebung](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktions-KI-Praktiken](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->