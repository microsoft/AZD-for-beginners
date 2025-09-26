<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9cc966416ab431c38b2ab863884b196c",
  "translation_date": "2025-09-24T10:29:07+00:00",
  "source_file": "workshop/README.md",
  "language_code": "de"
}
-->
# AZD für KI-Entwickler Workshop

Willkommen zum praktischen Workshop, in dem Sie die Azure Developer CLI (AZD) mit Fokus auf die Bereitstellung von KI-Anwendungen kennenlernen. Dieser Workshop vermittelt Ihnen ein angewandtes Verständnis der AZD-Vorlagen in drei Schritten:

1. **Entdecken** - Finden Sie die Vorlage, die zu Ihnen passt.
1. **Bereitstellen** - Stellen Sie die Vorlage bereit und überprüfen Sie, ob sie funktioniert.
1. **Anpassen** - Modifizieren und iterieren Sie, um sie zu Ihrer eigenen zu machen!

Im Laufe des Workshops werden Sie auch mit grundlegenden Entwickler-Tools und Workflows vertraut gemacht, die Ihnen helfen, Ihre End-to-End-Entwicklungsreise zu optimieren.

<br/>

## Browserbasierter Leitfaden

Die Workshop-Lektionen sind in Markdown geschrieben. Sie können sie direkt auf GitHub durchsuchen oder eine browserbasierte Vorschau starten, wie im Screenshot unten gezeigt.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.de.png)

Um diese Option zu nutzen, forken Sie das Repository in Ihr Profil und starten Sie GitHub Codespaces. Sobald das VS Code-Terminal aktiv ist, geben Sie diesen Befehl ein:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Nach wenigen Sekunden erscheint ein Dialogfenster. Wählen Sie die Option `Im Browser öffnen`. Der webbasierte Leitfaden öffnet sich nun in einem neuen Browser-Tab. Einige Vorteile dieser Vorschau:

1. **Integrierte Suche** - Finden Sie schnell Schlüsselwörter oder Lektionen.
1. **Kopiersymbol** - Bewegen Sie den Mauszeiger über Codeblöcke, um diese Option zu sehen.
1. **Themenumschaltung** - Wechseln Sie zwischen dunklen und hellen Themen.
1. **Hilfe erhalten** - Klicken Sie auf das Discord-Symbol im Footer, um beizutreten!

<br/>

## Workshop-Übersicht

**Dauer:** 3-4 Stunden  
**Level:** Anfänger bis Fortgeschrittene  
**Voraussetzungen:** Grundkenntnisse in Azure, KI-Konzepten, VS Code und Kommandozeilen-Tools.

Dies ist ein praktischer Workshop, bei dem Sie durch Ausprobieren lernen. Nachdem Sie die Übungen abgeschlossen haben, empfehlen wir, den AZD für Anfänger-Lehrplan zu überprüfen, um Ihre Lernreise in Sicherheits- und Produktivitätsbest Practices fortzusetzen.

| Zeit | Modul  | Ziel |
|:---|:---|:---|
| 15 Minuten | [Einführung](docs/instructions/0-Introduction.md) | Ziele verstehen und den Rahmen setzen |
| 30 Minuten | [KI-Vorlage auswählen](docs/instructions/1-Select-AI-Template.md) | Optionen erkunden und Starter auswählen | 
| 30 Minuten | [KI-Vorlage validieren](docs/instructions/2-Validate-AI-Template.md) | Standardlösung in Azure bereitstellen |
| 30 Minuten | [KI-Vorlage analysieren](docs/instructions/3-Deconstruct-AI-Template.md) | Struktur und Konfiguration erkunden |
| 30 Minuten | [KI-Vorlage konfigurieren](docs/instructions/4-Configure-AI-Template.md) | Funktionen aktivieren und ausprobieren |
| 30 Minuten | [KI-Vorlage anpassen](docs/instructions/5-Customize-AI-Template.md) | Vorlage an Ihre Bedürfnisse anpassen |
| 30 Minuten | [Infrastruktur abbauen](docs/instructions/6-Teardown-Infrastructure.md) | Ressourcen bereinigen und freigeben |
| 15 Minuten | [Abschluss & nächste Schritte](docs/instructions/7-Wrap-up.md) | Lernressourcen, Workshop-Herausforderung |

<br/>

## Was Sie lernen werden

Betrachten Sie die AZD-Vorlage als eine Lernumgebung, um verschiedene Fähigkeiten und Tools für die End-to-End-Entwicklung auf Azure AI Foundry zu erkunden. Am Ende des Workshops sollten Sie ein intuitives Verständnis für verschiedene Tools und Konzepte in diesem Kontext haben.

| Konzept  | Ziel |
|:---|:---|
| **Azure Developer CLI** | Befehle und Workflows des Tools verstehen |
| **AZD-Vorlagen**| Projektstruktur und Konfiguration verstehen |
| **Azure AI Agent**| Azure AI Foundry-Projekt bereitstellen |
| **Azure AI Search**| Kontext-Engineering mit Agenten aktivieren |
| **Observability**| Tracing, Monitoring und Evaluierungen erkunden |
| **Red Teaming**| Adversarial Testing und Gegenmaßnahmen erkunden |

<br/>

## Workshop-Struktur

Der Workshop ist so strukturiert, dass er Sie auf eine Reise von der Vorlagenentdeckung über Bereitstellung, Analyse und Anpassung führt - basierend auf der offiziellen [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) Startervorlage.

### [Modul 1: KI-Vorlage auswählen](docs/instructions/1-Select-AI-Template.md) (30 Minuten)

- Was sind KI-Vorlagen?
- Wo finde ich KI-Vorlagen?
- Wie kann ich mit dem Bau von KI-Agenten beginnen?
- **Lab**: Schnellstart mit GitHub Codespaces

### [Modul 2: KI-Vorlage validieren](docs/instructions/2-Validate-AI-Template.md) (30 Minuten)

- Was ist die Architektur der KI-Vorlage?
- Was ist der AZD-Entwicklungsworkflow?
- Wie kann ich Hilfe bei der AZD-Entwicklung erhalten?
- **Lab**: KI-Agenten-Vorlage bereitstellen und validieren

### [Modul 3: KI-Vorlage analysieren](docs/instructions/3-Deconstruct-AI-Template.md) (30 Minuten)

- Erkunden Sie Ihre Umgebung in `.azure/` 
- Erkunden Sie Ihre Ressourcenkonfiguration in `infra/` 
- Erkunden Sie Ihre AZD-Konfiguration in `azure.yaml`s
- **Lab**: Umgebungsvariablen ändern und erneut bereitstellen

### [Modul 4: KI-Vorlage konfigurieren](docs/instructions/4-Configure-AI-Template.md) (30 Minuten)
- Erkunden: Retrieval Augmented Generation
- Erkunden: Agentenbewertung & Red Teaming
- Erkunden: Tracing & Monitoring
- **Lab**: KI-Agent + Observability erkunden 

### [Modul 5: KI-Vorlage anpassen](docs/instructions/5-Customize-AI-Template.md) (30 Minuten)
- Definieren: PRD mit Szenarioanforderungen
- Konfigurieren: Umgebungsvariablen für AZD
- Implementieren: Lifecycle Hooks für zusätzliche Aufgaben
- **Lab**: Vorlage für mein Szenario anpassen

### [Modul 6: Infrastruktur abbauen](docs/instructions/6-Teardown-Infrastructure.md) (30 Minuten)
- Rückblick: Was sind AZD-Vorlagen?
- Rückblick: Warum die Azure Developer CLI verwenden?
- Nächste Schritte: Probieren Sie eine andere Vorlage aus!
- **Lab**: Infrastruktur abbauen und bereinigen

<br/>

## Workshop-Herausforderung

Möchten Sie sich selbst herausfordern, mehr zu tun? Hier sind einige Projektvorschläge - oder teilen Sie uns Ihre Ideen mit!!

| Projekt | Beschreibung |
|:---|:---|
|1. **Eine komplexe KI-Vorlage analysieren** | Verwenden Sie den Workflow und die Tools, die wir beschrieben haben, und prüfen Sie, ob Sie eine andere KI-Lösungsvorlage bereitstellen, validieren und anpassen können. _Was haben Sie gelernt?_|
|2. **Anpassen mit Ihrem Szenario**  | Versuchen Sie, ein PRD (Product Requirements Document) für ein anderes Szenario zu schreiben. Verwenden Sie dann GitHub Copilot in Ihrem Vorlagen-Repository im Agenten-Modell und bitten Sie es, einen Anpassungsworkflow für Sie zu erstellen. _Was haben Sie gelernt? Wie könnten Sie diese Vorschläge verbessern?_|
| | |

## Feedback geben?

1. Erstellen Sie ein Issue in diesem Repository - taggen Sie es mit `Workshop` für eine einfache Zuordnung.
1. Treten Sie dem Azure AI Foundry Discord bei - verbinden Sie sich mit Gleichgesinnten!


| | | 
|:---|:---|
| **📚 Kursübersicht**| [AZD für Anfänger](../README.md)|
| **📖 Dokumentation** | [Erste Schritte mit KI-Vorlagen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️KI-Vorlagen** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Nächste Schritte** | [Die Herausforderung annehmen](../../../workshop) |
| | |

<br/>

---

**Vorher:** [KI-Fehlerbehebungsleitfaden](../docs/troubleshooting/ai-troubleshooting.md) | **Nächste:** Beginnen Sie mit [Lab 1: AZD Grundlagen](../../../workshop/lab-1-azd-basics)

**Bereit, KI-Anwendungen mit AZD zu entwickeln?**

[Beginnen Sie mit Lab 1: AZD Grundlagen →](./lab-1-azd-basics/README.md)

---

