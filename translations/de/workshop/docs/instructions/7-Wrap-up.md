# 7. Abschluss & nächste Schritte

!!! tip "DIE WICHTIGSTEN ERKENNTNISSE SIND"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Was Sie erreicht haben

Herzlichen Glückwunsch! In diesem Workshop haben Sie erfolgreich:

| Modul | Erreichtes |
|:---|:---|
| **Modul 1** | Azure Developer CLI entdeckt und eine KI-Vorlage ausgewählt |
| **Modul 2** | Eine vollständige KI-Agenten-Lösung bereitgestellt und validiert |
| **Modul 3** | Die Vorlage zerlegt, um ihre Architektur zu verstehen |
| **Modul 4** | `azure.yaml` Konfiguration und Lifecycle-Hooks erkundet |
| **Modul 5** | Die Vorlage für Ihr eigenes Szenario angepasst |
| **Modul 6** | Infrastruktur sicher abgebaut und Ressourcen verwaltet |

---

## 2. Beherrschte Schlüsselkonzepte

### Azure Developer CLI (azd)
- `azd init` - Projekte aus Vorlagen initialisieren
- `azd up` - Provisionierung und Bereitstellung mit einem Befehl
- `azd env` - Umgebungsvariablen verwalten
- `azd down` - Ressourcen sicher bereinigen

### AZD Vorlagenstruktur
- `azure.yaml` - Konfigurations- und Bereitstellungshooks
- `infra/` - Bicep Infrastructure-as-Code
- `src/` - Quellcode der Anwendung
- `scripts/` - Automatisierungs- und Installationsskripte

### Microsoft Foundry Möglichkeiten
- KI-Agenten-Service für intelligente Assistenten
- Dateisuche und Azure KI-Suche für Wissens-abfrage
- Eingebautes Tracing, Monitoring und Evaluierung
- Red Teaming zur Überprüfung der KI-Sicherheit

---

## 3. Setzen Sie Ihre Lernreise fort

### Empfohlene nächste Schritte

| Pfad | Ressource | Zeit |
|:---|:---|:---|
| **Kompletter Kurs** | [AZD für Anfänger Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Selbstgesteuert |
| **Weitere Vorlage ausprobieren** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 Stunden |
| **Vertiefung** | [Azure Developer CLI Dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Laufend |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | Heute beitreten! |

### Vorgeschlagene Vorlagen zum Ausprobieren

1. **[Beginnen Sie mit AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Grundlegender Chat mit Ihren Daten
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Fortgeschrittene RAG-Muster
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Unternehmensszenarien für den Einzelhandel

---

## 4. Workshop-Herausforderung

Bereit, Ihre Fähigkeiten zu testen? Versuchen Sie diese Herausforderungen:

| Herausforderung | Beschreibung | Schwierigkeit |
|:---|:---|:---|
| **1. Multi-Agenten-Szenario** | Bereitstellen und anpassen für eine andere Branche (z. B. Gesundheit, Finanzen) | ⭐⭐ |
| **2. Eigene Wissensbasis** | Fügen Sie eigene Datendateien hinzu und erstellen Sie einen eigenen Suchindex | ⭐⭐⭐ |
| **3. Produktionsbereitstellung** | Richten Sie CI/CD mit GitHub Actions unter Verwendung von `azd pipeline config` ein | ⭐⭐⭐⭐ |

---

## 5. Teilen Sie Ihr Feedback

Ihr Feedback hilft uns, diesen Workshop zu verbessern!

- **GitHub Issues**: [Feedback posten](https://github.com/microsoft/azd-for-beginners/issues) - markieren mit `Workshop`
- **Discord**: Treten Sie dem [Microsoft Foundry Discord](https://aka.ms/foundry/discord) bei - posten in `#get-help`
- **Beiträge**: Helfen Sie, den Workshop durch Pull Requests zu verbessern!

---

## Vielen Dank! 🎉

Vielen Dank, dass Sie den AZD for AI Developers Workshop abgeschlossen haben. Wir hoffen, dass Ihnen diese Erfahrung die Fähigkeiten und das Vertrauen vermittelt hat, KI-Anwendungen auf Azure zu entwickeln und bereitzustellen.

**Bauen Sie weiter, lernen Sie weiter und willkommen in der Azure KI-Entwicklergemeinschaft!**

---

| | |
|:---|:---|
| **📚 Kursstartseite** | [AZD für Anfänger](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ KI-Vorlagen** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Community** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->