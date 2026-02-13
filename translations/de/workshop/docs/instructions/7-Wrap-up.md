# 7. Abschluss & Nächste Schritte

!!! tip "THE MAIN TAKEAWAY MESSAGES ARE"

    - [ ] AZD-Vorlagen beschleunigen die Entwicklung von KI-Anwendungen von Tagen auf Stunden
    - [ ] Die Methodik Discovery → Deployment → Customization bietet einen strukturierten Lernpfad
    - [ ] GitHub Copilot mit MCP-Servern ermöglicht die Erforschung komplexer Codebasen in natürlicher Sprache
    - [ ] Microsoft Foundry bietet integrierte Beobachtbarkeit, Evaluierung und Sicherheitstests

---

## 1. Was Sie erreicht haben

Herzlichen Glückwunsch! In diesem Workshop haben Sie erfolgreich:

| Modul | Erreichtes |
|:---|:---|
| **Modul 1** | Azure Developer CLI kennengelernt und eine KI-Vorlage ausgewählt |
| **Modul 2** | Eine vollständige KI-Agenten-Lösung bereitgestellt und validiert |
| **Modul 3** | Die Vorlage zerlegt, um ihre Architektur zu verstehen |
| **Modul 4** | Die `azure.yaml`-Konfiguration und Lifecycle-Hooks untersucht |
| **Modul 5** | Die Vorlage an Ihr eigenes Szenario angepasst |
| **Modul 6** | Infrastruktur sicher abgebaut und Ressourcen verwaltet |

---

## 2. Wichtige Konzepte

### Azure Developer CLI (azd)
- `azd init` - Projekte aus Vorlagen initialisieren
- `azd up` - Bereitstellung und Deployment in einem Befehl
- `azd env` - Umgebungsvariablen verwalten
- `azd down` - Ressourcen sicher bereinigen

### Aufbau der AZD-Vorlage
- `azure.yaml` - Konfiguration und Bereitstellungs-Hooks
- `infra/` - Bicep Infrastruktur-als-Code
- `src/` - Anwendungsquellcode
- `scripts/` - Automatisierungs- und Setup-Skripte

### Microsoft Foundry-Funktionen
- AI Agent Service für intelligente Assistenten
- File Search und Azure AI Search für Wissensabruf
- Eingebaute Nachverfolgung, Überwachung und Evaluierung
- Red Teaming zur Validierung der KI-Sicherheit

---

## 3. Fahren Sie mit Ihrer Lernreise fort

### Empfohlene nächste Schritte

| Pfad | Ressource | Zeit |
|:---|:---|:---|
| **Kurs abschließen** | [AZD for Beginners Curriculum](../../README.md) | 8-12 Stunden |
| **Andere Vorlage ausprobieren** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 Stunden |
| **Vertiefung** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Fortlaufend |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | Treten Sie noch heute bei! |

### Vorgeschlagene Vorlagen
1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Einfacher Chat mit Ihren Daten
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Fortgeschrittene RAG-Muster
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Einzelhandelsszenarien für Unternehmen

---

## 4. Workshop-Herausforderung

Bereit, Ihre Fähigkeiten zu testen? Probieren Sie diese Herausforderungen:

| Herausforderung | Beschreibung | Schwierigkeitsgrad |
|:---|:---|:---|
| **1. Multi-Agenten-Szenario** | Für eine andere Branche bereitstellen und anpassen (z. B. Gesundheitswesen, Finanzen) | ⭐⭐ |
| **2. Benutzerdefinierte Wissensbasis** | Eigene Datendateien hinzufügen und einen eigenen Suchindex erstellen | ⭐⭐⭐ |
| **3. Produktionsbereitstellung** | CI/CD mit GitHub Actions einrichten, mit `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Teilen Sie Ihr Feedback

Ihr Feedback hilft uns, diesen Workshop zu verbessern!

- **GitHub Issues**: [Feedback posten](https://github.com/microsoft/azd-for-beginners/issues) - mit dem Tag `Workshop` versehen
- **Discord**: Treten Sie dem [Microsoft Foundry Discord](https://aka.ms/foundry/discord) bei - posten Sie in `#get-help`
- **Beiträge**: Helfen Sie, den Workshop zu verbessern, indem Sie Pull Requests einreichen!

---

## Vielen Dank! 🎉

Vielen Dank, dass Sie den AZD for AI Developers Workshop abgeschlossen haben. Wir hoffen, dass Sie durch diese Erfahrung die Fähigkeiten und das Selbstvertrauen gewonnen haben, KI-Anwendungen auf Azure zu entwickeln und bereitzustellen.

**Bleiben Sie am Ball, lernen Sie weiter und willkommen in der Azure AI-Entwicklergemeinschaft!**

---

| | |
|:---|:---|
| **📚 Kursstartseite** | [AZD For Beginners](../../README.md) |
| **📖 Dokumentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI-Vorlagen** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Community** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->