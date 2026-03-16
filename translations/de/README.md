# AZD Für Anfänger: Eine strukturierte Lernreise

![AZD für Anfänger](../../translated_images/de/azdbeginners.5527441dd9f74068.webp) 

[![GitHub-Beobachter](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-Sterne](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatisierte Übersetzungen (immer aktuell)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengalisch](../bn/README.md) | [Bulgarisch](../bg/README.md) | [Birmanisch (Myanmar)](../my/README.md) | [Chinesisch (Vereinfacht)](../zh-CN/README.md) | [Chinesisch (Traditionell, Hongkong)](../zh-HK/README.md) | [Chinesisch (Traditionell, Macau)](../zh-MO/README.md) | [Chinesisch (Traditionell, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tschechisch](../cs/README.md) | [Dänisch](../da/README.md) | [Niederländisch](../nl/README.md) | [Estnisch](../et/README.md) | [Finnisch](../fi/README.md) | [Französisch](../fr/README.md) | [Deutsch](./README.md) | [Griechisch](../el/README.md) | [Hebräisch](../he/README.md) | [Hindi](../hi/README.md) | [Ungarisch](../hu/README.md) | [Indonesisch](../id/README.md) | [Italienisch](../it/README.md) | [Japanisch](../ja/README.md) | [Kannada](../kn/README.md) | [Koreanisch](../ko/README.md) | [Litauisch](../lt/README.md) | [Malaiisch](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisch](../ne/README.md) | [Nigerianisches Pidgin](../pcm/README.md) | [Norwegisch](../no/README.md) | [Persisch (Farsi)](../fa/README.md) | [Polnisch](../pl/README.md) | [Portugiesisch (Brasilien)](../pt-BR/README.md) | [Portugiesisch (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänisch](../ro/README.md) | [Russisch](../ru/README.md) | [Serbisch (Kyrillisch)](../sr/README.md) | [Slowakisch](../sk/README.md) | [Slowenisch](../sl/README.md) | [Spanisch](../es/README.md) | [Suaheli](../sw/README.md) | [Schwedisch](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändisch](../th/README.md) | [Türkisch](../tr/README.md) | [Ukrainisch](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisch](../vi/README.md)

> **Möchtest du lieber lokal klonen?**
>
> Dieses Repository enthält 50+ Sprachübersetzungen, wodurch die Download-Größe deutlich größer wird. Um ohne Übersetzungen zu klonen, verwende Sparse Checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Das gibt dir alles, was du brauchst, um den Kurs zu absolvieren – mit deutlich schnellerem Download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Was ist heute neu in azd

Azure Developer CLI hat sich über traditionelle Web-Apps und APIs hinaus entwickelt. Heute ist azd das einzige Tool zum Bereitstellen jeder Anwendung in Azure – einschließlich KI-gestützter Anwendungen und intelligenter Agenten.

Das bedeutet für dich:

- **KI-Agenten sind jetzt erstklassige azd-Workloads.** Du kannst KI-Agentenprojekte initialisieren, bereitstellen und verwalten, mit demselben `azd init` → `azd up`-Workflow, den du bereits kennst.
- **Integration von Microsoft Foundry** bringt Modellbereitstellung, Agenten-Hosting und KI-Servicekonfiguration direkt in das azd-Template-Ökosystem.
- **Der Kern-Workflow hat sich nicht geändert.** Ob du eine ToDo-App, einen Microservice oder eine Multi-Agent-KI-Lösung bereitstellst – die Befehle sind dieselben.

Wenn du azd bereits verwendet hast, ist die KI-Unterstützung eine natürliche Erweiterung – kein separates Tool oder ein fortgeschrittener Pfad. Wenn du neu anfängst, lernst du einen Workflow, der für alles funktioniert.

---

## 🚀 Was ist Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ist ein entwicklerfreundliches Kommandozeilen-Tool, das das Bereitstellen von Anwendungen in Azure vereinfacht. Anstatt Dutzende von Azure-Ressourcen manuell zu erstellen und zu verbinden, kannst du komplette Anwendungen mit einem einzigen Befehl bereitstellen.

### Die Magie von `azd up`

```bash
# Dieser einzelne Befehl macht alles:
# ✅ Erstellt alle Azure-Ressourcen
# ✅ Konfiguriert Netzwerk und Sicherheit
# ✅ Baut Ihren Anwendungscode
# ✅ Stellt in Azure bereit
# ✅ Gibt Ihnen eine funktionierende URL
azd up
```

**Das war's!** Kein Klicken im Azure-Portal, keine komplizierten ARM-Templates, die du zuerst lernen musst, keine manuelle Konfiguration – einfach funktionierende Anwendungen in Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Was ist der Unterschied?

Das ist die häufigste Frage, die Anfänger stellen. Hier ist die einfache Antwort:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Zweck** | Einzelne Azure-Ressourcen verwalten | Komplette Anwendungen bereitstellen |
| **Denkweise** | Infrastruktur-orientiert | Anwendung-orientiert |
| **Beispiel** | `az webapp create --name myapp...` | `azd up` |
| **Lernkurve** | Man muss Azure-Services kennen | Du musst nur deine App kennen |
| **Am besten für** | DevOps, Infrastruktur | Entwickler, Prototyping |

### Einfache Analogie

- **Azure CLI** ist wie alle Werkzeuge zu haben, um ein Haus zu bauen – Hammer, Sägen, Nägel. Du kannst alles bauen, aber du musst Bauwissen haben.
- **Azure Developer CLI** ist wie einen Generalunternehmer zu engagieren – du beschreibst, was du willst, und er übernimmt den Bau.

### Wann welches Tool verwenden

| Szenario | Verwende dies |
|----------|---------------|
| "Ich möchte meine Web-App schnell bereitstellen" | `azd up` |
| "Ich muss nur ein Storage-Konto erstellen" | `az storage account create` |
| "Ich baue eine komplette KI-Anwendung" | `azd init --template azure-search-openai-demo` |
| "Ich muss eine spezifische Azure-Ressource debuggen" | `az resource show` |
| "Ich möchte produktionsbereite Bereitstellung in Minuten" | `azd up --environment production` |

### Sie funktionieren zusammen!

AZD nutzt Azure CLI unter der Haube. Du kannst beide verwenden:
```bash
# Stellen Sie Ihre App mit AZD bereit
azd up

# Passen Sie dann bestimmte Ressourcen mit der Azure CLI an
az webapp config set --name myapp --always-on true
```

---

## 🌟 Finde Templates in Awesome AZD

Fange nicht bei Null an! **Awesome AZD** ist die Community-Sammlung von einsatzbereiten Templates:

| Ressource | Beschreibung |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Durchsuche 200+ Vorlagen mit Ein-Klick-Bereitstellung |
| 🔗 [**Ein Template einreichen**](https://github.com/Azure/awesome-azd/issues) | Trage dein eigenes Template zur Community bei |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Starre und erkunde die Quelle |

### Beliebte KI-Vorlagen von Awesome AZD

```bash
# RAG-Chat mit Microsoft Foundry-Modellen + KI-Suche
azd init --template azure-search-openai-demo

# Schnelle KI-Chat-Anwendung
azd init --template openai-chat-app-quickstart

# KI-Agenten mit Foundry-Agenten
azd init --template get-started-with-ai-agents
```

---

## 🎯 Erste Schritte in 3 Schritten

### Schritt 1: AZD installieren (2 Minuten)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Schritt 2: Bei Azure anmelden

```bash
azd auth login
```

### Schritt 3: Deine erste App bereitstellen

```bash
# Von einer Vorlage initialisieren
azd init --template todo-nodejs-mongo

# Bereitstellen auf Azure (erstellt alles!)
azd up
```

**🎉 Fertig!** Deine App ist jetzt auf Azure live.

### Aufräumen (Nicht vergessen!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 So verwendest du diesen Kurs

Dieser Kurs ist für **progressives Lernen** konzipiert – beginne dort, wo du dich wohlfühlst, und arbeite dich nach oben:

| Deine Erfahrung | Starte hier |
|-----------------|------------|
| **Neu bei Azure** | [Kapitel 1: Grundlagen](../..) |
| **Kenntnisse in Azure, neu bei AZD** | [Kapitel 1: Grundlagen](../..) |
| **Möchtest KI-Apps bereitstellen** | [Kapitel 2: KI-First Entwicklung](../..) |
| **Möchtest praktische Übungen** | [🎓 Interaktiver Workshop](workshop/README.md) - 3–4 Stunden geführtes Lab |
| **Benötigst Produktionsmuster** | [Kapitel 8: Produktion & Enterprise](../..) |

### Schnelle Einrichtung

1. **Dieses Repository forken**: [![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonen**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hilfe erhalten**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Möchtest du lieber lokal klonen?**
>
> Dieses Repository enthält 50+ Sprachübersetzungen, wodurch die Download-Größe deutlich größer wird. Um ohne Übersetzungen zu klonen, verwende Sparse Checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Das gibt dir alles, was du brauchst, um den Kurs zu absolvieren – mit deutlich schnellerem Download.


## Kursübersicht

Beherrsche Azure Developer CLI (azd) durch strukturierte Kapitel, die für progressives Lernen gestaltet sind. **Besonderer Fokus auf die Bereitstellung von KI-Anwendungen mit Microsoft Foundry-Integration.**

### Warum dieser Kurs für moderne Entwickler wichtig ist

Basierend auf Erkenntnissen aus der Microsoft Foundry Discord Community möchten **45% der Entwickler AZD für KI-Workloads nutzen**, stoßen jedoch auf Herausforderungen mit:
- Komplexen Multi-Service-KI-Architekturen
- Best Practices für die Bereitstellung von KI in Produktion  
- Integration und Konfiguration von Azure-KI-Services
- Kostenoptimierung für KI-Workloads
- Fehlerbehebung bei KI-spezifischen Bereitstellungsproblemen

### Lernziele

Durch das Absolvieren dieses strukturierten Kurses wirst du:
- **AZD-Grundlagen meistern**: Kernkonzepte, Installation und Konfiguration
- **KI-Anwendungen bereitstellen**: Verwende AZD mit Microsoft Foundry-Services
- **Infrastructure as Code implementieren**: Verwalte Azure-Ressourcen mit Bicep-Templates
- **Bereitstellungen debuggen**: Häufige Probleme lösen und Fehler beheben
- **Für Produktion optimieren**: Sicherheit, Skalierung, Monitoring und Kostenmanagement
- **Multi-Agent-Lösungen bauen**: Komplexe KI-Architekturen bereitstellen

## 🗺️ Kursplan: Schnelle Navigation nach Kapitel

Jedes Kapitel hat ein eigenes README mit Lernzielen, Quickstarts und Übungen:

| Kapitel | Thema | Lektionen | Dauer | Komplexität |
|---------|-------|---------|----------|------------|
| **[Kapitel 1: Grundlagen](docs/chapter-01-foundation/README.md)** | Erste Schritte | [AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Erstes Projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Kap. 2: KI-Entwicklung](docs/chapter-02-ai-development/README.md)** | KI-zentrierte Apps | [Microsoft Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [KI-Agenten](docs/chapter-02-ai-development/agents.md) &#124; [Modellbereitstellung](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 Std. | ⭐⭐ |
| **[Kap. 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Authentifizierung & Sicherheit | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Authentifizierung & Sicherheit](docs/chapter-03-configuration/authsecurity.md) | 45-60 Min. | ⭐⭐ |
| **[Kap. 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Bereitstellung | [Bereitstellungsanleitung](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionierung](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 Std. | ⭐⭐⭐ |
| **[Kap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | KI-Agenten-Lösungen | [Einzelhandelsszenario](examples/retail-scenario.md) &#124; [Koordinationsmuster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[Kap. 6: Vor der Bereitstellung](docs/chapter-06-pre-deployment/README.md)** | Planung & Validierung | [Preflight-Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapazitätsplanung](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-Auswahl](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 Std. | ⭐⭐ |
| **[Kap. 7: Fehlerbehebung](docs/chapter-07-troubleshooting/README.md)** | Debuggen & Beheben | [Häufige Probleme](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [KI-Probleme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 Std. | ⭐⭐ |
| **[Kap. 8: Produktion](docs/chapter-08-production/README.md)** | Unternehmensmuster | [Produktionspraktiken](docs/chapter-08-production/production-ai-practices.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On-Lab | [Einführung](workshop/docs/instructions/0-Introduction.md) &#124; [Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruktion](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Abbau](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Abschluss](workshop/docs/instructions/7-Wrap-up.md) | 3-4 Std. | ⭐⭐ |

**Gesamtkursdauer:** ~10-14 Stunden | **Kompetenzentwicklung:** Anfänger → Produktionsbereit

---

## 📚 Lernkapitel

*Wählen Sie Ihren Lernpfad basierend auf Erfahrungsniveau und Zielen*

### 🚀 Kapitel 1: Grundlagen & Schnellstart
**Voraussetzungen**: Azure-Abonnement, grundlegende Kenntnisse der Kommandozeile  
**Dauer**: 30-45 Minuten  
**Komplexität**: ⭐

#### Was Sie lernen werden
- Grundlagen der Azure Developer CLI verstehen
- AZD auf Ihrer Plattform installieren
- Ihre erste erfolgreiche Bereitstellung

#### Lernressourcen
- **🎯 Starten Sie hier**: [Was ist die Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Kernkonzepte und Terminologie
- **⚙️ Einrichtung**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - plattformabhängige Anleitungen
- **🛠️ Praxis**: [Ihr erstes Projekt](docs/chapter-01-foundation/first-project.md) - Schritt-für-Schritt-Anleitung
- **📋 Schnellreferenz**: [Befehls-Spickzettel](resources/cheat-sheet.md)

#### Praktische Übungen
```bash
# Schnelle Überprüfung der Installation
azd version

# Stellen Sie Ihre erste Anwendung bereit
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ergebnis des Kapitels**: Erfolgreiche Bereitstellung einer einfachen Webanwendung in Azure mit AZD

**✅ Erfolgskontrolle:**
```bash
# Nach Abschluss von Kapitel 1 sollten Sie in der Lage sein:
azd version              # Zeigt die installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                  # Stellt in Azure bereit
azd show                # Zeigt die URL der laufenden App an
# Die Anwendung öffnet sich im Browser und funktioniert
azd down --force --purge  # Bereinigt Ressourcen
```

**📊 Zeitaufwand:** 30-45 Minuten  
**📈 Fähigkeitsniveau nachher:** Kann grundlegende Anwendungen eigenständig bereitstellen
**📈 Fähigkeitsniveau nachher:** Kann grundlegende Anwendungen eigenständig bereitstellen

---

### 🤖 Kapitel 2: KI-zentrierte Entwicklung (Empfohlen für KI-Entwickler)
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 1-2 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Integration von Microsoft Foundry mit AZD
- Bereitstellung KI-gestützter Anwendungen
- Verstehen von KI-Dienstkonfigurationen

#### Lernressourcen
- **🎯 Starten Sie hier**: [Microsoft Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 KI-Agenten**: [KI-Agenten-Anleitung](docs/chapter-02-ai-development/agents.md) - Intelligente Agenten mit AZD bereitstellen
- **📖 Muster**: [Bereitstellung von KI-Modellen](docs/chapter-02-ai-development/ai-model-deployment.md) - KI-Modelle bereitstellen und verwalten
- **🛠️ Workshop**: [KI-Workshop-Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-bereit
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) - Browserbasiertes Lernen mit MkDocs * DevContainer-Umgebung
- **📋 Vorlagen**: [Microsoft Foundry-Vorlagen](../..)
- **📝 Beispiele**: [AZD-Bereitstellungsbeispiele](examples/README.md)

#### Praktische Übungen
```bash
# Stellen Sie Ihre erste KI-Anwendung bereit
azd init --template azure-search-openai-demo
azd up

# Probieren Sie zusätzliche KI-Vorlagen aus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Ergebnis des Kapitels**: Bereitstellen und Konfigurieren einer KI-gestützten Chat-Anwendung mit RAG-Funktionen

**✅ Erfolgskontrolle:**
```bash
# Nach Kapitel 2 sollten Sie in der Lage sein:
azd init --template azure-search-openai-demo
azd up
# Die KI-Chat-Oberfläche testen
# Fragen stellen und KI-gestützte Antworten mit Quellen erhalten
# Überprüfen, dass die Suchintegration funktioniert
azd monitor  # Prüfen, ob Application Insights Telemetrie anzeigt
azd down --force --purge
```

**📊 Zeitaufwand:** 1-2 Stunden  
**📈 Fähigkeitsniveau nachher:** Kann produktionsfähige KI-Anwendungen bereitstellen und konfigurieren  
**💰 Kostenbewusstsein:** Verstehen Sie Entwicklungs-Kosten von $80-150/Monat, Produktionskosten von $300-3500/Monat

#### 💰 Kostenüberlegungen für KI-Bereitstellungen

**Entwicklungsumgebung (geschätzt $80-150/Monat):**
- Microsoft Foundry-Modelle (Pay-as-you-go): $0-50/Monat (abhängig vom Tokenverbrauch)
- AI Search (Basic-Tarif): $75/Monat
- Container Apps (Consumption): $0-20/Monat
- Speicher (Standard): $1-5/Monat

**Produktionsumgebung (geschätzt $300-3,500+/Monat):**
- Microsoft Foundry-Modelle (PTU für konstante Leistung): $3,000+/Monat ODER Pay-as-you-go bei hohem Volumen
- AI Search (Standard-Tarif): $250/Monat
- Container Apps (Dedicated): $50-100/Monat
- Application Insights: $5-50/Monat
- Speicher (Premium): $10-50/Monat

**💡 Tipps zur Kostenoptimierung:**
- Verwenden Sie **Free Tier** Microsoft Foundry-Modelle zum Lernen (Azure OpenAI 50.000 Tokens/Monat inklusive)
- Führen Sie `azd down` aus, um Ressourcen freizugeben, wenn Sie nicht aktiv entwickeln
- Beginnen Sie mit verbrauchsabhängiger Abrechnung, wechseln Sie zu PTU nur für die Produktion
- Verwenden Sie `azd provision --preview`, um Kosten vor der Bereitstellung zu schätzen
- Aktivieren Sie Auto-Scaling: bezahlen Sie nur für die tatsächliche Nutzung

**Kostenüberwachung:**
```bash
# Überprüfen Sie die geschätzten monatlichen Kosten
azd provision --preview

# Überwachen Sie die tatsächlichen Kosten im Azure-Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Authentifizierung
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 45-60 Minuten  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Konfiguration und Verwaltung von Umgebungen
- Best Practices für Authentifizierung und Sicherheit
- Ressourcenbenennung und -organisation

#### Lernressourcen
- **📖 Konfiguration**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Umgebungseinrichtung
- **🔐 Sicherheit**: [Authentifizierungsmuster und Managed Identity](docs/chapter-03-configuration/authsecurity.md) - Authentifizierungsmuster
- **📝 Beispiele**: [Datenbank-App-Beispiel](examples/database-app/README.md) - AZD Datenbankbeispiele

#### Praktische Übungen
- Mehrere Umgebungen konfigurieren (dev, staging, prod)
- Managed Identity-Authentifizierung einrichten
- Umgebungsspezifische Konfigurationen implementieren

**💡 Ergebnis des Kapitels**: Verwalten mehrerer Umgebungen mit geeigneter Authentifizierung und Sicherheit

---

### 🏗️ Kapitel 4: Infrastruktur als Code & Bereitstellung
**Voraussetzungen**: Kapitel 1-3 abgeschlossen  
**Dauer**: 1-1.5 Stunden  
**Komplexität**: ⭐⭐⭐

#### Was Sie lernen werden
- Erweiterte Bereitstellungsmuster
- Infrastruktur als Code mit Bicep
- Strategien zur Ressourcenbereitstellung

#### Lernressourcen
- **📖 Bereitstellung**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Komplette Workflows
- **🏗️ Provisionierung**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure-Ressourcenverwaltung
- **📝 Beispiele**: [Container App Example](../../examples/container-app) - Containerisierte Bereitstellungen

#### Praktische Übungen
- Eigene Bicep-Vorlagen erstellen
- Mehrere Dienste bereitstellen
- Blue-Green-Bereitstellungsstrategien implementieren

**💡 Ergebnis des Kapitels**: Komplexe Multi-Service-Anwendungen mit benutzerdefinierten Infrastrukturvorlagen bereitstellen

---

### 🎯 Kapitel 5: Multi-Agent KI-Lösungen (Fortgeschritten)
**Voraussetzungen**: Kapitel 1-2 abgeschlossen  
**Dauer**: 2-3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Multi-Agenten-Architekturmuster
- Agentenorchestrierung und -koordination
- Produktionsreife KI-Bereitstellungen

#### Lernressourcen
- **🤖 Vorgestelltes Projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Komplette Implementierung
- **🛠️ ARM-Vorlagen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Ein-Klick-Bereitstellung
- **📖 Architektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Muster

#### Praktische Übungen
```bash
# Die vollständige Multiagenten-Lösung für den Einzelhandel bereitstellen
cd examples/retail-multiagent-arm-template
./deploy.sh

# Agentenkonfigurationen erkunden
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ergebnis des Kapitels**: Bereitstellen und Verwalten einer produktionsreifen Multi-Agent-KI-Lösung mit Kunden- und Inventaragenten

---

### 🔍 Kapitel 6: Validierung & Planung vor der Bereitstellung
**Voraussetzungen**: Kapitel 4 abgeschlossen  
**Dauer**: 1 Stunde  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Kapazitätsplanung und Ressourcenvalidierung
- Strategien zur SKU-Auswahl
- Pre-Flight-Checks und Automatisierung

#### Lernressourcen
- **📊 Planung**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcenvalidierung
- **💰 Auswahl**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kostenoptimierte Entscheidungen
- **✅ Validierung**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatisierte Skripte

#### Praktische Übungen
- Kapazitätsvalidierungsskripte ausführen
- SKU-Auswahl für Kosten optimieren
- Automatisierte Vorbereitungsprüfungen implementieren

**💡 Ergebnis des Kapitels**: Bereitstellungen vor der Ausführung validieren und optimieren

---

### 🚨 Kapitel 7: Fehlerbehebung & Debugging
**Voraussetzungen**: Beliebiges Bereitstellungskapitel abgeschlossen  
**Dauer**: 1-1.5 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Systematische Debugging-Ansätze
- Häufige Probleme und Lösungen
- KI-spezifische Fehlerbehebung

#### Lernressourcen
- **🔧 Häufige Probleme**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ und Lösungen
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Schritt-für-Schritt-Strategien
- **🤖 KI-Probleme**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - KI-Dienstprobleme

#### Praktische Übungen
- Bereitstellungsfehler diagnostizieren
- Authentifizierungsprobleme lösen
- KI-Dienstverbindung debuggen

**💡 Ergebnis des Kapitels**: Häufige Bereitstellungsprobleme selbständig diagnostizieren und lösen

---

### 🏢 Kapitel 8: Produktion & Unternehmensmuster
**Voraussetzungen**: Kapitel 1-4 abgeschlossen  
**Dauer**: 2-3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Strategien für Produktionsbereitstellungen
- Sicherheitsmuster für Unternehmen
- Überwachung und Kostenoptimierung

#### Lernressourcen
- **🏭 Produktion**: [Produktions-AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Unternehmensmuster
- **📝 Beispiele**: [Microservices-Beispiel](../../examples/microservices) - Komplexe Architekturen
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Überwachung

#### Praktische Übungen
- Unternehmenssicherheitsmuster implementieren
- Umfassende Überwachung einrichten
- Mit geeigneter Governance in Produktion bereitstellen

**💡 Kapitelziel**: Unternehmensbereite Anwendungen mit vollständigen Produktionsfunktionen bereitstellen

---

## 🎓 Workshop-Übersicht: Praxisorientierte Lernerfahrung

> **⚠️ WORKSHOP STATUS: In aktiver Entwicklung**  
> Die Workshop-Materialien werden derzeit entwickelt und überarbeitet. Kernmodule sind funktionsfähig, aber einige fortgeschrittene Abschnitte sind unvollständig. Wir arbeiten aktiv daran, alle Inhalte fertigzustellen. [Fortschritt verfolgen →](workshop/README.md)

### Interaktive Workshop-Materialien
**Umfassendes praxisorientiertes Lernen mit browserbasierten Tools und geführten Übungen**

Unsere Workshop-Materialien bieten eine strukturierte, interaktive Lernerfahrung, die den obenstehenden kapitelbasierten Lehrplan ergänzt. Der Workshop ist sowohl für selbstgesteuertes Lernen als auch für geleitete Sitzungen durch Dozenten ausgelegt.

#### 🛠️ Workshop-Funktionen
- **Browserbasierte Oberfläche**: Vollständiger MkDocs-betriebener Workshop mit Such-, Kopier- und Theme-Funktionen
- **GitHub Codespaces-Integration**: Ein-Klick-Einrichtung der Entwicklungsumgebung
- **Strukturierter Lernpfad**: 8 Module geführte Übungen (insgesamt 3–4 Stunden)
- **Progressive Methodologie**: Einführung → Auswahl → Validierung → Zerlegung → Konfiguration → Anpassung → Abbau → Abschluss
- **Interaktive DevContainer-Umgebung**: Vorkonfigurierte Tools und Abhängigkeiten

#### 📚 Aufbau der Workshop-Module
Der Workshop folgt einer **8-moduligen progressiven Methodik**, die Sie zur Beherrschung der Bereitstellung führt:

| Modul | Thema | Was Sie tun werden | Dauer |
|--------|-------|----------------|----------|
| **0. Einführung** | Workshop-Übersicht | Lernziele, Voraussetzungen und den Aufbau des Workshops verstehen | 15 min |
| **1. Auswahl** | Vorlagenerkennung | AZD-Vorlagen erkunden und die passende AI-Vorlage für Ihr Szenario auswählen | 20 min |
| **2. Validierung** | Bereitstellen & Überprüfen | Die Vorlage mit `azd up` bereitstellen und prüfen, ob die Infrastruktur funktioniert | 30 min |
| **3. Zerlegung** | Struktur verstehen | GitHub Copilot verwenden, um Vorlagenarchitektur, Bicep-Dateien und Codeorganisation zu erkunden | 30 min |
| **4. Konfiguration** | azure.yaml im Detail | `azure.yaml`-Konfiguration, Lifecycle-Hooks und Umgebungsvariablen meistern | 30 min |
| **5. Anpassung** | Anpassen | AI Search, Tracing, Evaluation aktivieren und für Ihr Szenario anpassen | 45 min |
| **6. Abbau** | Aufräumen | Ressourcen sicher mit `azd down --purge` entfernen | 15 min |
| **7. Abschluss** | Nächste Schritte | Erreichte Ziele, Kernkonzepte überprüfen und Lernreise fortsetzen | 15 min |

**Workshop Flow:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Einstieg in den Workshop
```bash
# Option 1: GitHub Codespaces (Empfohlen)
# Klicken Sie im Repository auf "Code" → "Codespace auf main erstellen"

# Option 2: Lokale Entwicklung
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Befolgen Sie die Einrichtungsanweisungen in workshop/README.md
```

#### 🎯 Lernziele des Workshops
Durch die Teilnahme am Workshop werden die Teilnehmenden:
- **Produktionsreife KI-Anwendungen bereitstellen**: AZD mit Microsoft Foundry-Diensten verwenden
- **Multi-Agenten-Architekturen meistern**: Koordinierte KI-Agentenlösungen implementieren
- **Sicherheits-Best-Practices implementieren**: Authentifizierung und Zugriffskontrolle konfigurieren
- **Für Skalierung optimieren**: Kostenoptimierte, leistungsfähige Bereitstellungen entwerfen
- **Bereitstellungen beheben**: Häufige Probleme eigenständig lösen

#### 📖 Workshop-Ressourcen
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) - Browserbasiertes Lernumfeld
- **📋 Modul-für-Modul-Anleitungen**:
  - [0. Einführung](workshop/docs/instructions/0-Introduction.md) - Workshop-Übersicht und Ziele
  - [1. Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) - AI-Vorlagen finden und auswählen
  - [2. Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) - Vorlagen bereitstellen und verifizieren
  - [3. Zerlegung](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Vorlagenarchitektur erkunden
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` meistern
  - [5. Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) - Für Ihr Szenario anpassen
  - [6. Abbau](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ressourcen aufräumen
  - [7. Abschluss](workshop/docs/instructions/7-Wrap-up.md) - Rückblick und nächste Schritte
- **🛠️ AI Workshop-Labor**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - KI-fokussierte Übungen
- **💡 Schnellstart**: [Workshop-Einrichtungsanleitung](workshop/README.md#quick-start) - Umgebungskonfiguration

**Perfekt für**: Unternehmensschulungen, Universitätskurse, selbstgesteuertes Lernen und Entwickler-Bootcamps.

---

## 📖 Deep Dive: AZD-Funktionen

Über die Grundlagen hinaus bietet AZD leistungsstarke Funktionen für Produktionsbereitstellungen:

- **Vorlagenbasierte Bereitstellungen** - Verwenden Sie vorkonfigurierte Vorlagen für gängige Anwendungsmuster
- **Infrastructure as Code** - Verwalten Sie Azure-Ressourcen mit Bicep oder Terraform  
- **Integrierte Workflows** - Anwendungen nahtlos provisionieren, bereitstellen und überwachen
- **Entwicklerfreundlich** - Optimiert für Entwicklerproduktivität und -erfahrung

### **AZD + Microsoft Foundry: Perfekt für KI-Bereitstellungen**

**Warum AZD für KI-Lösungen?** AZD geht die wichtigsten Herausforderungen an, denen KI-Entwickler gegenüberstehen:

- **KI-fähige Vorlagen** - Vorgefertigte Vorlagen für Microsoft Foundry Models, Cognitive Services und ML-Workloads
- **Sichere KI-Bereitstellungen** - Eingebaute Sicherheitsmuster für KI-Dienste, API-Schlüssel und Modellendpunkte  
- **Produktions-AI-Muster** - Best Practices für skalierbare, kosteneffiziente KI-Anwendungsbereitstellungen
- **End-to-End-KI-Workflows** - Von der Modellentwicklung bis zur Produktionsbereitstellung mit angemessener Überwachung
- **Kostenoptimierung** - Intelligente Ressourcenzuweisung und Skalierungsstrategien für KI-Workloads
- **Microsoft Foundry-Integration** - Nahtlose Verbindung zum Microsoft Foundry-Modellkatalog und zu Endpunkten

---

## 🎯 Vorlagen- & Beispielbibliothek

### Ausgewählt: Microsoft Foundry-Vorlagen
**Beginnen Sie hier, wenn Sie KI-Anwendungen bereitstellen!**

> **Hinweis:** Diese Vorlagen demonstrieren verschiedene KI-Muster. Einige sind externe Azure Samples, andere sind lokale Implementierungen.

| Vorlage | Kapitel | Komplexität | Dienste | Typ |
|----------|---------|------------|----------|------|
| [**Erste Schritte mit KI-Chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Erste Schritte mit KI-Agenten**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent-Lösung**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Ausgewählt: Vollständige Lern-Szenarien
**Produktionsbereite Anwendungsvorlagen, zugeordnet zu Lernkapiteln**

| Vorlage | Lernkapitel | Komplexität | Zentrales Lernziel |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlegende KI-Bereitstellungsmuster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-Implementierung mit Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration von Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agenten-Framework und Funktionsaufrufe |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Unternehmensweite KI-Orchestrierung |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-Agenten-Architektur mit Kunden- und Lagerbestands-Agenten |

### Lernen nach Beispieltyp

> **📌 Lokale vs. Externe Beispiele:**  
> **Lokale Beispiele** (in diesem Repo) = Sofort einsatzbereit  
> **Externe Beispiele** (Azure Samples) = Aus den verlinkten Repositories klonen

#### Lokale Beispiele (Einsatzbereit)
- [**Retail Multi-Agent-Lösung**](examples/retail-scenario.md) - Vollständige, produktionsbereite Implementierung mit ARM-Vorlagen
  - Multi-Agent-Architektur (Kunden- + Inventar-Agenten)
  - Umfassende Überwachung und Evaluierung
  - Ein-Klick-Bereitstellung über ARM-Vorlage

#### Lokale Beispiele - Container-Anwendungen (Kapitel 2–5)
**Umfassende Containerbereitstellungsbeispiele in diesem Repository:**
- [**Container-App-Beispiele**](examples/container-app/README.md) - Vollständige Anleitung zu containerisierten Bereitstellungen
  - [Einfache Flask-API](../../examples/container-app/simple-flask-api) - Einfache REST-API mit Scale-to-Zero
  - [Microservices-Architektur](../../examples/container-app/microservices) - Produktionsreife Multi-Service-Bereitstellung
  - Schnellstart, Produktion und erweiterte Bereitstellungsmuster
  - Anleitung zu Überwachung, Sicherheit und Kostenoptimierung

#### Externe Beispiele - Einfache Anwendungen (Kapitel 1-2)
**Klonen Sie diese Azure Samples Repositories, um loszulegen:**
- [Einfache Webanwendung - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlegende Bereitstellungsmuster
- [Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Bereitstellung statischer Inhalte
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API-Bereitstellung

#### Externe Beispiele - Datenbankintegration (Kapitel 3-4)  
- [Datenbankanwendung - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Datenbank-Konnektivitätsmuster
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless-Datenworkflow

#### Externe Beispiele - Erweiterte Muster (Kapitel 4-8)
- [Java-Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-Service-Architekturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Hintergrundverarbeitung  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsreife ML-Muster

### Externe Vorlagen-Sammlungen
- [**Offizielle AZD-Vorlagengalerie**](https://azure.github.io/awesome-azd/) - Kuratierte Sammlung offizieller und Community-Vorlagen
- [**Azure Developer CLI-Vorlagen**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn Vorlagendokumentation
- [**Beispielverzeichnis**](examples/README.md) - Lokale Lernbeispiele mit ausführlichen Erklärungen

---

## 📚 Lernressourcen & Referenzen

### Schnelle Referenzen
- [**Befehlsübersicht**](resources/cheat-sheet.md) - Wesentliche azd-Befehle nach Kapitel geordnet
- [**Glossar**](resources/glossary.md) - Azure- und azd-Terminologie  
- [**FAQ**](resources/faq.md) - Häufige Fragen nach Lernkapitel geordnet
- [**Studienleitfaden**](resources/study-guide.md) - Umfassende Übungsaufgaben

### Praxisworkshops
- [**AI Workshop-Labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-bereitstellbar (2–3 Stunden)
- [**Interaktiver Workshop**](workshop/README.md) - 8-modulige geführte Übungen mit MkDocs und GitHub Codespaces
  - Folgt: Einführung → Auswahl → Validierung → Zerlegung → Konfiguration → Anpassung → Abbau → Abschluss

### Externe Lernressourcen
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure-Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure-Preisrechner](https://azure.microsoft.com/pricing/calculator/)
- [Azure-Status](https://status.azure.com/)

### KI-Agenten-Fähigkeiten für Ihren Editor
- [**Microsoft Azure Skills auf skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 offene Agenten-Fähigkeiten für Azure KI, Foundry, Bereitstellung, Diagnose, Kostenoptimierung und mehr. Installieren Sie sie in GitHub Copilot, Cursor, Claude Code oder jedem unterstützten Agenten:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Schnelle Fehlerbehebung

**Häufige Probleme für Anfänger und sofortige Lösungen:**

<details>
<summary><strong>❌ "azd: Befehl nicht gefunden"</strong></summary>

```bash
# Installiere zuerst AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Installation überprüfen
azd version
```
</details>

<details>
<summary><strong>❌ "Kein Abonnement gefunden" or "Abonnement nicht gesetzt"</strong></summary>

```bash
# Verfügbare Abonnements auflisten
az account list --output table

# Standardabonnement festlegen
az account set --subscription "<subscription-id-or-name>"

# Für die AZD-Umgebung festlegen
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Überprüfen
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Kontingent überschritten"</strong></summary>

```bash
# Versuchen Sie eine andere Azure-Region
azd env set AZURE_LOCATION "westus2"
azd up

# Oder verwenden Sie in der Entwicklung kleinere SKUs
# Bearbeiten Sie infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" bricht zur Hälfte ab</strong></summary>

```bash
# Option 1: Bereinigen und erneut versuchen
azd down --force --purge
azd up

# Option 2: Einfach die Infrastruktur reparieren
azd provision

# Option 3: Detaillierten Status prüfen
azd show

# Option 4: Protokolle im Azure Monitor prüfen
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentifizierung fehlgeschlagen" or "Token abgelaufen"</strong></summary>

```bash
# Erneut authentifizieren
az logout
az login

azd auth logout
azd auth login

# Authentifizierung überprüfen
az account show
```
</details>

<details>
<summary><strong>❌ "Ressource existiert bereits" or Namenskonflikte</strong></summary>

```bash
# AZD erzeugt eindeutige Namen, aber wenn ein Konflikt auftritt:
azd down --force --purge

# Dann mit einer frischen Umgebung erneut versuchen
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Bereitstellung der Vorlage dauert zu lange</strong></summary>

**Normale Wartezeiten:**
- Einfache Webanwendung: 5-10 Minuten
- App mit Datenbank: 10-15 Minuten
- KI-Anwendungen: 15-25 Minuten (OpenAI-Bereitstellung ist langsam)

```bash
# Fortschritt prüfen
azd show

# Wenn Sie länger als 30 Minuten feststecken, das Azure-Portal prüfen:
azd monitor
# Nach fehlgeschlagenen Bereitstellungen suchen
```
</details>

<details>
<summary><strong>❌ "Zugriff verweigert" or "Forbidden"</strong></summary>

```bash
# Überprüfen Sie Ihre Azure-Rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sie benötigen mindestens die Rolle "Contributor"
# Bitten Sie Ihren Azure-Administrator, Folgendes zu gewähren:
# - Contributor (für Ressourcen)
# - Benutzerzugriffsadministrator (für Rollenzuweisungen)
```
</details>

<details>
<summary><strong>❌ Kann die URL der bereitgestellten Anwendung nicht finden</strong></summary>

```bash
# Alle Service-Endpunkte anzeigen
azd show

# Oder das Azure-Portal öffnen
azd monitor

# Bestimmten Dienst prüfen
azd env get-values
# Nach *_URL-Variablen suchen
```
</details>

### 📚 Vollständige Ressourcen zur Fehlerbehebung

- **Leitfaden zu häufigen Problemen:** [Detaillierte Lösungen](docs/chapter-07-troubleshooting/common-issues.md)
- **KI-spezifische Probleme:** [KI-Fehlerbehebung](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-Leitfaden:** [Schritt-für-Schritt-Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Hilfe erhalten:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursabschluss & Zertifizierung

### Fortschrittsverfolgung
Verfolgen Sie Ihren Lernfortschritt in jedem Kapitel:

- [ ] **Kapitel 1**: Grundlagen & Schnellstart ✅
- [ ] **Kapitel 2**: KI-zentrierte Entwicklung ✅  
- [ ] **Kapitel 3**: Konfiguration & Authentifizierung ✅
- [ ] **Kapitel 4**: Infrastruktur als Code & Bereitstellung ✅
- [ ] **Kapitel 5**: Mehragenten-KI-Lösungen ✅
- [ ] **Kapitel 6**: Validierung & Planung vor der Bereitstellung ✅
- [ ] **Kapitel 7**: Fehlerbehebung & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Unternehmensmuster ✅

### Lernüberprüfung
Nachdem Sie jedes Kapitel abgeschlossen haben, überprüfen Sie Ihr Wissen durch:
1. **Praktische Übung**: Führen Sie die praxisnahe Bereitstellung des Kapitels durch
2. **Wissensüberprüfung**: Lesen Sie den FAQ-Bereich für Ihr Kapitel
3. **Community-Diskussion**: Teilen Sie Ihre Erfahrungen im Azure Discord
4. **Nächstes Kapitel**: Wechseln Sie zur nächsten Komplexitätsstufe

### Vorteile des Kursabschlusses
Nach Abschluss aller Kapitel erhalten Sie:
- **Produktions­erfahrung**: Echte KI-Anwendungen in Azure bereitgestellt
- **Professionelle Fähigkeiten**: Unternehmensreife Bereitstellungsfähigkeiten  
- **Anerkennung in der Community**: Aktives Mitglied der Azure-Entwicklergemeinschaft
- **Karriereförderung**: Gefragte AZD- und KI-Bereitstellungskenntnisse

---

## 🤝 Community & Unterstützung

### Hilfe & Support erhalten
- **Technische Probleme**: [Fehler melden und Funktionen anfordern](https://github.com/microsoft/azd-for-beginners/issues)
- **Fragen zum Lernen**: [Microsoft Azure Discord-Community](https://discord.gg/microsoft-azure) und [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **KI-spezifische Hilfe**: Treten Sie dem [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) bei
- **Dokumentation**: [Offizielle Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-Einblicke aus dem Microsoft Foundry Discord

**Aktuelle Umfrageergebnisse aus dem #Azure-Kanal:**
- **45%** der Entwickler möchten AZD für KI-Workloads verwenden
- **Hauptprobleme**: Multi-Service-Bereitstellungen, Zugangsdatenverwaltung, Produktionsbereitschaft  
- **Am häufigsten angefragt**: KI-spezifische Vorlagen, Fehlerbehebungsanleitungen, Best Practices

**Treten Sie unserer Community bei, um:**
- Teilen Sie Ihre AZD + KI-Erfahrungen und erhalten Sie Hilfe
- Zugriff auf frühe Vorschauen neuer KI-Vorlagen
- Zu Best Practices für KI-Bereitstellungen beitragen
- Die Entwicklung zukünftiger KI- + AZD-Funktionen beeinflussen

### Beiträge zum Kurs
Beiträge sind willkommen! Bitte lesen Sie unseren [Beitragsleitfaden](CONTRIBUTING.md) für Details zu:
- **Inhaltsverbesserungen**: Bestehende Kapitel und Beispiele erweitern
- **Neue Beispiele**: Praxisnahe Szenarien und Vorlagen hinzufügen  
- **Übersetzung**: Unterstützen Sie die Pflege der Mehrsprachigkeit
- **Fehlerberichte**: Genauigkeit und Klarheit verbessern
- **Community-Standards**: Befolgen Sie unsere inklusiven Community-Richtlinien

---

## 📄 Kursinformationen

### Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert - siehe die [LICENSE](../../LICENSE) Datei für Details.

### Verwandte Microsoft-Lernressourcen

Unser Team erstellt weitere umfassende Lernkurse:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j für Einsteiger](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js für Einsteiger](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain für Einsteiger](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenten
[![AZD für Einsteiger](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge-KI für Einsteiger](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP für Einsteiger](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![KI-Agenten für Einsteiger](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative KI-Serie
[![Generative KI für Einsteiger](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative KI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative KI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative KI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kerninhalte
[![ML für Einsteiger](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science für Einsteiger](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![KI für Einsteiger](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersicherheit für Einsteiger](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-Entwicklung für Einsteiger](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT für Einsteiger](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-Entwicklung für Einsteiger](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-Serie
[![Copilot für KI-Paarprogrammierung](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot für C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-Abenteuer](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigation

**🚀 Bereit zu lernen?**

**Einsteiger**: Beginnen Sie mit [Kapitel 1: Grundlagen & Schnellstart](../..)  
**KI-Entwickler**: Springen Sie zu [Kapitel 2: KI-orientierte Entwicklung](../..)  
**Erfahrene Entwickler**: Beginnen Sie mit [Kapitel 3: Konfiguration & Authentifizierung](../..)

**Nächste Schritte**: [Kapitel 1 starten - AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI‑Übersetzungsdienst Co‑op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->