<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "be2a85ad63abe28f2eb71ba3f3800272",
  "translation_date": "2025-09-17T16:12:24+00:00",
  "source_file": "workshop/README.md",
  "language_code": "de"
}
-->
# AZD für KI-Entwickler Workshop

**Workshop Navigation**
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)
- **📖 Verwandte Kapitel**: Behandelt [Kapitel 1](../README.md#-chapter-1-foundation--quick-start), [Kapitel 2](../README.md#-chapter-2-ai-first-development-recommended-for-ai-developers) und [Kapitel 5](../README.md#-chapter-5-multi-agent-ai-solutions-advanced)
- **🛠️ Praktische Übung**: [KI Workshop Lab](../docs/ai-foundry/ai-workshop-lab.md)
- **🚀 Nächste Schritte**: [Workshop Lab Module](../../../workshop)

Willkommen zum praktischen Workshop, in dem Sie die Azure Developer CLI (AZD) mit Fokus auf die Bereitstellung von KI-Anwendungen kennenlernen. Dieser Workshop führt Sie von den Grundlagen von AZD bis hin zur Bereitstellung produktionsreifer KI-Lösungen.

## Workshop Überblick

**Dauer:** 2-3 Stunden  
**Level:** Anfänger bis Fortgeschritten  
**Voraussetzungen:** Grundkenntnisse in Azure, Kommandozeilen-Tools und KI-Konzepten

### Was Sie lernen werden

- **AZD Grundlagen**: Verständnis von Infrastructure as Code mit AZD
- 🤖 **Integration von KI-Diensten**: Bereitstellung von Azure OpenAI, AI Search und anderen KI-Diensten
- **Container-Bereitstellung**: Verwendung von Azure Container Apps für KI-Anwendungen
- **Sicherheitsbest Practices**: Implementierung von Managed Identity und sicheren Konfigurationen
- **Überwachung & Beobachtbarkeit**: Einrichtung von Application Insights für KI-Workloads
- **Produktionsmuster**: Strategien für unternehmensgerechte Bereitstellungen

## Workshop Struktur

### Modul 1: AZD Grundlagen (30 Minuten)
- Installation und Konfiguration von AZD
- Verständnis der AZD-Projektstruktur
- Ihre erste AZD-Bereitstellung
- **Übung**: Bereitstellung einer einfachen Webanwendung

### Modul 2: Azure OpenAI Integration (45 Minuten)
- Einrichtung von Azure OpenAI-Ressourcen
- Strategien für die Modellbereitstellung
- Konfiguration von API-Zugriff und Authentifizierung
- **Übung**: Bereitstellung einer Chat-Anwendung mit GPT-4

### Modul 3: RAG-Anwendungen (45 Minuten)
- Integration von Azure AI Search
- Dokumentenverarbeitung mit Azure Document Intelligence
- Vektor-Einbettungen und semantische Suche
- **Übung**: Aufbau eines Dokumenten-Q&A-Systems

### Modul 4: Produktionsbereitstellung (30 Minuten)
- Konfiguration von Container Apps
- Skalierung und Leistungsoptimierung
- Überwachung und Protokollierung
- **Übung**: Bereitstellung in der Produktion mit Beobachtbarkeit

### Modul 5: Fortgeschrittene Muster (15 Minuten)
- Bereitstellungen in mehreren Umgebungen
- CI/CD-Integration
- Strategien zur Kostenoptimierung
- **Abschluss**: Checkliste für Produktionsbereitschaft

## Voraussetzungen

### Erforderliche Tools

Bitte installieren Sie diese Tools vor dem Workshop:

```bash
# Azure Developer CLI
curl -fsSL https://aka.ms/install-azd.sh | bash

# Azure CLI
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Git
sudo apt-get install git

# Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Python 3.10+
sudo apt-get install python3.10 python3.10-venv python3-pip
```

### Azure Konto Einrichtung

1. **Azure Abonnement**: [Kostenlos registrieren](https://azure.microsoft.com/free/)
2. **Azure OpenAI Zugriff**: [Zugriff beantragen](https://aka.ms/oai/access)
3. **Erforderliche Berechtigungen**:
   - Rolle „Mitwirkender“ für Abonnement oder Ressourcengruppe
   - Benutzerzugriffsadministrator (für RBAC-Zuweisungen)

### Voraussetzungen überprüfen

Führen Sie dieses Skript aus, um Ihre Einrichtung zu überprüfen:

```bash
#!/bin/bash
echo "Verifying workshop prerequisites..."

# Check AZD installation
if command -v azd &> /dev/null; then
    echo "✅ Azure Developer CLI: $(azd --version)"
else
    echo "❌ Azure Developer CLI not found"
fi

# Check Azure CLI
if command -v az &> /dev/null; then
    echo "✅ Azure CLI: $(az --version | head -n1)"
else
    echo "❌ Azure CLI not found"
fi

# Check Docker
if command -v docker &> /dev/null; then
    echo "✅ Docker: $(docker --version)"
else
    echo "❌ Docker not found"
fi

# Check Python
if command -v python3 &> /dev/null; then
    echo "✅ Python: $(python3 --version)"
else
    echo "❌ Python 3 not found"
fi

# Check Azure login
if az account show &> /dev/null; then
    echo "✅ Azure: Logged in as $(az account show --query user.name -o tsv)"
else
    echo "❌ Azure: Not logged in (run 'az login')"
fi

echo "Setup verification complete!"
```

## Workshop Materialien

### Übungsaufgaben

Jedes Modul enthält praktische Übungen mit Starter-Code und Schritt-für-Schritt-Anleitungen:

- **[lab-1-azd-basics/](../../../workshop/lab-1-azd-basics)** - Ihre erste AZD-Bereitstellung
- **[lab-2-openai-chat/](../../../workshop/lab-2-openai-chat)** - Chat-Anwendung mit Azure OpenAI
- **[lab-3-rag-search/](../../../workshop/lab-3-rag-search)** - RAG-Anwendung mit AI Search
- **[lab-4-production/](../../../workshop/lab-4-production)** - Muster für Produktionsbereitstellungen
- **[lab-5-advanced/](../../../workshop/lab-5-advanced)** - Fortgeschrittene Bereitstellungsszenarien

### Referenzmaterialien

- **[AI Foundry Integrationsleitfaden](../docs/ai-foundry/azure-ai-foundry-integration.md)** - Umfassende Integrationsmuster
- **[Leitfaden zur Modellbereitstellung](../docs/ai-foundry/ai-model-deployment.md)** - Best Practices für Modellbereitstellungen
- **[Produktions-KI-Praktiken](../docs/ai-foundry/production-ai-practices.md)** - Muster für Unternehmensbereitstellungen
- **[Leitfaden zur Fehlerbehebung bei KI](../docs/troubleshooting/ai-troubleshooting.md)** - Häufige Probleme und Lösungen

### Beispielvorlagen

Schnellstartvorlagen für häufige KI-Szenarien:

```
workshop/templates/
├── minimal-chat/          # Basic OpenAI chat app
├── rag-application/       # RAG with AI Search
├── multi-model/          # Multiple AI services
└── production-ready/     # Enterprise template
```

## Erste Schritte

### Option 1: GitHub Codespaces (Empfohlen)

Der schnellste Weg, um mit dem Workshop zu beginnen:

[![Open in GitHub Codespaces](https://img.shields.io/badge/Open%20in-GitHub%20Codespaces-blue?style=for-the-badge&logo=github)](https://github.com/codespaces/new?hide_repo_select=true&ref=main&repo=YOUR_REPO_ID)

### Option 2: Lokale Entwicklung

1. **Klonen Sie das Workshop-Repository:**
```bash
git clone https://github.com/YOUR_ORG/AZD-for-beginners.git
cd AZD-for-beginners/workshop
```

2. **Melden Sie sich bei Azure an:**
```bash
az login
azd auth login
```

3. **Beginnen Sie mit Übung 1:**
```bash
cd lab-1-azd-basics
cat README.md  # Follow the instructions
```

### Option 3: Workshop mit Anleitung

Wenn Sie an einer geführten Sitzung teilnehmen:

- 🎥 **Workshop-Aufzeichnung**: [Auf Abruf verfügbar](https://aka.ms/azd-ai-workshop)
- 💬 **Discord Community**: [Treten Sie für Live-Support bei](https://aka.ms/foundry/discord)
- **Workshop Feedback**: [Teilen Sie Ihre Erfahrungen](https://aka.ms/azd-workshop-feedback)

## Workshop Zeitplan

### Selbstgesteuertes Lernen (3 Stunden)

```
⏰ 00:00 - 00:30  Module 1: AZD Foundations
⏰ 00:30 - 01:15  Module 2: Azure OpenAI Integration
⏰ 01:15 - 02:00  Module 3: RAG Applications
⏰ 02:00 - 02:30  Module 4: Production Deployment
⏰ 02:30 - 02:45  Module 5: Advanced Patterns
⏰ 02:45 - 03:00  Q&A and Next Steps
```

### Geführte Sitzung (2,5 Stunden)

```
⏰ 00:00 - 00:15  Welcome & Prerequisites Check
⏰ 00:15 - 00:40  Module 1: Live Demo + Lab
⏰ 00:40 - 01:20  Module 2: OpenAI Integration
⏰ 01:20 - 01:30  Break
⏰ 01:30 - 02:10  Module 3: RAG Applications
⏰ 02:10 - 02:30  Module 4: Production Patterns
⏰ 02:30 - 02:45  Module 5: Advanced Topics
⏰ 02:45 - 03:00  Q&A and Resources
```

## Erfolgskriterien

Am Ende dieses Workshops werden Sie in der Lage sein:

✅ **KI-Anwendungen bereitstellen** mit AZD-Vorlagen  
✅ **Azure OpenAI-Dienste konfigurieren** mit angemessener Sicherheit  
✅ **RAG-Anwendungen erstellen** mit Azure AI Search-Integration  
✅ **Produktionsmuster implementieren** für Unternehmens-KI-Workloads  
✅ **KI-Anwendungsbereitstellungen überwachen und Fehler beheben**  
✅ **Strategien zur Kostenoptimierung anwenden** für KI-Workloads  

## Community & Support

### Während des Workshops

- 🙋 **Fragen**: Nutzen Sie den Workshop-Chat oder melden Sie sich
- 🐛 **Probleme**: Sehen Sie sich den [Leitfaden zur Fehlerbehebung](../docs/troubleshooting/ai-troubleshooting.md) an
- **Tipps**: Teilen Sie Entdeckungen mit anderen Teilnehmern

### Nach dem Workshop

- 💬 **Discord**: [Azure AI Foundry Community](https://aka.ms/foundry/discord)
- **GitHub Issues**: [Vorlagenprobleme melden](https://github.com/YOUR_ORG/AZD-for-beginners/issues)
- 📧 **Feedback**: [Workshop-Bewertungsformular](https://aka.ms/azd-workshop-feedback)

## Nächste Schritte

### Weiterlernen

1. **Fortgeschrittene Szenarien**: Erkunden Sie [Bereitstellungen in mehreren Regionen](../docs/ai-foundry/production-ai-practices.md#multi-region-deployment)
2. **CI/CD-Integration**: Richten Sie [GitHub Actions Workflows](../docs/deployment/github-actions.md) ein
3. **Eigene Vorlagen**: Erstellen Sie Ihre eigenen [AZD-Vorlagen](../docs/getting-started/custom-templates.md)

### In Ihren Projekten anwenden

1. **Bewertung**: Nutzen Sie unsere [Checkliste für die Bereitschaft](./production-readiness-checklist.md)
2. **Vorlagen**: Beginnen Sie mit unseren [KI-spezifischen Vorlagen](../../../workshop/templates)
3. **Support**: Treten Sie dem [Azure AI Foundry Discord](https://aka.ms/foundry/discord) bei

### Teilen Sie Ihren Erfolg

- ⭐ **Markieren Sie das Repository**, wenn dieser Workshop Ihnen geholfen hat
- 🐦 **Teilen Sie auf Social Media** mit #AzureDeveloperCLI #AzureAI
- 📝 **Schreiben Sie einen Blogpost** über Ihre KI-Bereitstellungsreise

---

## Workshop Feedback

Ihr Feedback hilft uns, die Workshop-Erfahrung zu verbessern:

| Aspekt | Bewertung (1-5) | Kommentare |
|--------|------------------|-----------|
| Qualität der Inhalte | ⭐⭐⭐⭐⭐ | |
| Praktische Übungen | ⭐⭐⭐⭐⭐ | |
| Dokumentation | ⭐⭐⭐⭐⭐ | |
| Schwierigkeitsgrad | ⭐⭐⭐⭐⭐ | |
| Gesamterlebnis | ⭐⭐⭐⭐⭐ | |

**Feedback einreichen**: [Workshop-Bewertungsformular](https://aka.ms/azd-workshop-feedback)

---

**Vorher:** [Leitfaden zur Fehlerbehebung bei KI](../docs/troubleshooting/ai-troubleshooting.md) | **Weiter:** Beginnen Sie mit [Übung 1: AZD Grundlagen](../../../workshop/lab-1-azd-basics)

**Bereit, KI-Anwendungen mit AZD zu erstellen?**

[Beginnen Sie mit Übung 1: AZD Grundlagen →](./lab-1-azd-basics/README.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.