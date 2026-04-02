# AZD für Anfänger: Eine strukturierte Lernreise

![AZD-für-Anfänger](../../translated_images/de/azdbeginners.5527441dd9f74068.webp) 

[![GitHub-Beobachter](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-Sterne](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure-Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry-Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatische Übersetzungen (immer aktuell)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengalisch](../bn/README.md) | [Bulgarisch](../bg/README.md) | [Burmesisch (Myanmar)](../my/README.md) | [Chinesisch (vereinfacht)](../zh-CN/README.md) | [Chinesisch (Traditionell, Hongkong)](../zh-HK/README.md) | [Chinesisch (Traditionell, Macau)](../zh-MO/README.md) | [Chinesisch (Traditionell, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tschechisch](../cs/README.md) | [Dänisch](../da/README.md) | [Niederländisch](../nl/README.md) | [Estnisch](../et/README.md) | [Finnisch](../fi/README.md) | [Französisch](../fr/README.md) | [Deutsch](./README.md) | [Griechisch](../el/README.md) | [Hebräisch](../he/README.md) | [Hindi](../hi/README.md) | [Ungarisch](../hu/README.md) | [Indonesisch](../id/README.md) | [Italienisch](../it/README.md) | [Japanisch](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreanisch](../ko/README.md) | [Litauisch](../lt/README.md) | [Malaiisch](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisch](../ne/README.md) | [Nigerianisches Pidgin](../pcm/README.md) | [Norwegisch](../no/README.md) | [Persisch (Farsi)](../fa/README.md) | [Polnisch](../pl/README.md) | [Portugiesisch (Brasilien)](../pt-BR/README.md) | [Portugiesisch (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänisch](../ro/README.md) | [Russisch](../ru/README.md) | [Serbisch (Kyrillisch)](../sr/README.md) | [Slowakisch](../sk/README.md) | [Slowenisch](../sl/README.md) | [Spanisch](../es/README.md) | [Suaheli](../sw/README.md) | [Schwedisch](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändisch](../th/README.md) | [Türkisch](../tr/README.md) | [Ukrainisch](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisch](../vi/README.md)

> **Bevorzugen Sie das lokale Klonen?**
>
> Dieses Repository enthält über 50 Sprachübersetzungen, was die Downloadgröße erheblich erhöht. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
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
> Das gibt Ihnen alles, was Sie benötigen, um den Kurs abzuschließen, mit einem viel schnelleren Download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Was ist heute neu in azd

Azure Developer CLI hat sich über traditionelle Web-Apps und APIs hinaus entwickelt. Heute ist azd das einzige Tool zum Bereitstellen von beliebigen Anwendungen in Azure – einschließlich KI-gestützter Anwendungen und intelligenter Agents.

Das bedeutet für Sie:

- **KI-Agents sind jetzt erstklassige azd-Workloads.** Sie können KI-Agent-Projekte mit demselben `azd init` → `azd up`-Workflow initialisieren, bereitstellen und verwalten, den Sie bereits kennen.
- **Die Microsoft Foundry-Integration** bringt Modellbereitstellung, Agent-Hosting und KI-Dienstkonfiguration direkt in das azd-Vorlagen-Ökosystem.
- **Der Kernworkflow hat sich nicht geändert.** Egal, ob Sie eine Todo-App, einen Microservice oder eine Multi-Agent-KI-Lösung bereitstellen – die Befehle sind dieselben.

Wenn Sie azd bereits verwendet haben, ist die KI-Unterstützung eine natürliche Erweiterung – kein separates Tool oder ein fortgeschrittener Kurs. Wenn Sie neu anfangen, lernen Sie einen Workflow, der für alles funktioniert.

---

## 🚀 Was ist die Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ist ein entwicklerfreundliches Kommandozeilentool, das das Bereitstellen von Anwendungen in Azure vereinfacht. Anstatt Dutzende von Azure-Ressourcen manuell zu erstellen und zu verbinden, können Sie komplette Anwendungen mit einem einzigen Befehl bereitstellen.

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

**Das war's!** Kein Klicken im Azure-Portal, keine komplexen ARM-Vorlagen, die Sie zuerst lernen müssen, keine manuelle Konfiguration – einfach funktionierende Anwendungen auf Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Was ist der Unterschied?

Das ist die häufigste Frage von Anfängern. Hier ist die einfache Antwort:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Zweck** | Verwalten einzelner Azure-Ressourcen | Bereitstellen kompletter Anwendungen |
| **Denkweise** | Infrastruktur-orientiert | Anwendungsorientiert |
| **Beispiel** | `az webapp create --name myapp...` | `azd up` |
| **Lernkurve** | Kenntnisse über Azure-Dienste erforderlich | Sie müssen nur Ihre App kennen |
| **Am besten geeignet für** | DevOps, Infrastruktur | Entwickler, Prototyping |

### Einfache Analogie

- **Azure CLI** ist wie alle Werkzeuge zu haben, um ein Haus zu bauen – Hammer, Sägen, Nägel. Sie können alles bauen, aber Sie müssen sich mit dem Handwerk auskennen.
- **Azure Developer CLI** ist wie einen Bauunternehmer zu beauftragen – Sie beschreiben, was Sie möchten, und er kümmert sich um den Bau.

### Wann welches verwenden

| Scenario | Use This |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Sie arbeiten zusammen!

AZD verwendet Azure CLI unter der Haube. Sie können beide verwenden:
```bash
# Setzen Sie Ihre App mit AZD ein
azd up

# Feinabstimmung bestimmter Ressourcen mit der Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vorlagen in Awesome AZD finden

Fangen Sie nicht bei Null an! **Awesome AZD** ist die Community-Sammlung von einsatzbereiten Vorlagen:

| Ressource | Beschreibung |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Durchstöbern Sie 200+ Vorlagen mit One-Click-Bereitstellung |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Reichen Sie Ihre eigene Vorlage für die Community ein |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Sternchen vergeben und den Quellcode erkunden |

### Beliebte KI-Vorlagen aus Awesome AZD

```bash
# RAG Chat mit Microsoft Foundry-Modellen + KI-Suche
azd init --template azure-search-openai-demo

# Schnelle KI-Chat-Anwendung
azd init --template openai-chat-app-quickstart

# KI-Agenten mit Foundry-Agenten
azd init --template get-started-with-ai-agents
```

---

## 🎯 Erste Schritte in 3 Schritten

Bevor Sie beginnen, stellen Sie sicher, dass Ihr Rechner für die Vorlage, die Sie bereitstellen möchten, bereit ist:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Wenn eine erforderliche Überprüfung fehlschlägt, beheben Sie das zuerst und fahren Sie dann mit dem Schnellstart fort.

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

### Schritt 2: Für AZD authentifizieren

```bash
# Optional, wenn Sie vorhaben, Azure CLI-Befehle direkt in diesem Kurs zu verwenden
az login

# Erforderlich für AZD-Workflows
azd auth login
```

Wenn Sie sich nicht sicher sind, welches Sie benötigen, folgen Sie dem vollständigen Einrichtungsablauf in [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Schritt 3: Ihre erste App bereitstellen

```bash
# Von einer Vorlage initialisieren
azd init --template todo-nodejs-mongo

# Bereitstellen auf Azure (erstellt alles!)
azd up
```

**🎉 Das war's!** Ihre App ist jetzt live auf Azure.

### Aufräumen (Nicht vergessen!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Wie Sie diesen Kurs nutzen

Dieser Kurs ist auf **fortschreitendes Lernen** ausgelegt - beginnen Sie dort, wo Sie sich wohl fühlen, und arbeiten Sie sich nach oben:

| Ihre Erfahrung | Starten Sie hier |
|-----------------|------------|
| **Neu bei Azure** | [Kapitel 1: Grundlagen](#-chapter-1-foundation--quick-start) |
| **Kennt Azure, neu bei AZD** | [Kapitel 1: Grundlagen](#-chapter-1-foundation--quick-start) |
| **Möchten KI-Apps bereitstellen** | [Kapitel 2: KI-orientierte Entwicklung](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Wollen praktische Übungen** | [🎓 Interaktiver Workshop](workshop/README.md) - 3-4-stündiges geführtes Labor |
| **Benötigen Produktionsmuster** | [Kapitel 8: Produktion & Unternehmensmuster](#-chapter-8-production--enterprise-patterns) |

### Schnelle Einrichtung

1. **Forken Sie dieses Repository**: [![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonen Sie es**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hilfe erhalten**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Bevorzugen Sie das lokale Klonen?**

> Dieses Repository enthält über 50 Sprachübersetzungen, was die Downloadgröße erheblich erhöht. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Das gibt Ihnen alles, was Sie benötigen, um den Kurs abzuschließen, mit einem viel schnelleren Download.


## Kursübersicht

Meistern Sie die Azure Developer CLI (azd) durch strukturierte Kapitel für fortschreitendes Lernen. **Besonderer Fokus auf die Bereitstellung von KI-Anwendungen mit Microsoft Foundry-Integration.**

### Warum dieser Kurs für moderne Entwickler unverzichtbar ist

Basierend auf Erkenntnissen aus der Microsoft Foundry Discord-Community möchten **45 % der Entwickler AZD für KI-Workloads verwenden**, stoßen jedoch auf Herausforderungen bei:
- Komplexen Multi-Service-KI-Architekturen
- Best Practices für die KI-Bereitstellung in Produktion  
- Integration und Konfiguration von Azure-KI-Diensten
- Kostenoptimierung für KI-Workloads
- Fehlersuche bei KI-spezifischen Bereitstellungsproblemen

### Lernziele

Durch Abschluss dieses strukturierten Kurses werden Sie:
- **AZD-Grundlagen meistern**: Kernkonzepte, Installation und Konfiguration
- **KI-Anwendungen bereitstellen**: Verwenden von AZD mit Microsoft Foundry-Diensten
- **Infrastructure as Code implementieren**: Verwalten von Azure-Ressourcen mit Bicep-Vorlagen
- **Bereitstellungen beheben**: Häufige Probleme lösen und debuggen
- **Für die Produktion optimieren**: Sicherheit, Skalierung, Überwachung und Kostenmanagement
- **Multi-Agent-Lösungen erstellen**: Komplexe KI-Architekturen bereitstellen

## Bevor Sie beginnen: Konten, Zugriff und Annahmen

Bevor Sie Kapitel 1 beginnen, stellen Sie sicher, dass Sie Folgendes bereit haben. Die Installationsschritte später in dieser Anleitung setzen voraus, dass diese Grundlagen bereits geklärt sind.
- **Ein Azure-Abonnement**: Sie können ein bestehendes Abonnement von der Arbeit oder Ihrem eigenen Konto verwenden oder eine [kostenlose Testversion](https://aka.ms/azurefreetrial) erstellen, um zu beginnen.
- **Berechtigung zum Erstellen von Azure-Ressourcen**: Für die meisten Übungen sollten Sie mindestens **Contributor**-Zugriff auf das Zielabonnement oder die Zielressourcengruppe haben. Einige Kapitel setzen außerdem voraus, dass Sie Ressourcengruppen, verwaltete Identitäten und RBAC-Zuweisungen erstellen können.
- [**Ein GitHub-Konto**](https://github.com): Dies ist nützlich, um das Repository zu forken, Ihre eigenen Änderungen zu verfolgen und GitHub Codespaces für den Workshop zu verwenden.
- **Voraussetzungen für die Template-Laufzeit**: Einige Vorlagen benötigen lokale Tools wie Node.js, Python, Java oder Docker. Führen Sie den Setup-Validator aus, bevor Sie beginnen, damit Sie fehlende Tools frühzeitig erkennen.
- **Grundlegende Terminalkenntnisse**: Sie müssen kein Experte sein, sollten aber mit dem Ausführen von Befehlen wie `git clone`, `azd auth login` und `azd up` vertraut sein.

> **Arbeiten Sie in einem Unternehmensabonnement?**
> Wenn Ihre Azure-Umgebung von einem Administrator verwaltet wird, bestätigen Sie im Vorfeld, dass Sie Ressourcen in dem Abonnement oder der Ressourcengruppe bereitstellen können, die Sie verwenden möchten. Falls nicht, bitten Sie vor Beginn um ein Sandbox-Abonnement oder um Contributor-Zugriff.

> **Neu bei Azure?**
> Beginnen Sie mit Ihrer eigenen Azure-Testversion oder einem Pay-as-you-go-Abonnement unter https://aka.ms/azurefreetrial, damit Sie die Übungen vollständig durchführen können, ohne auf Genehmigungen auf Mandantenebene warten zu müssen.

## 🗺️ Kursübersicht: Schnelle Navigation nach Kapitel

Jedes Kapitel hat ein eigenes README mit Lernzielen, Schnellstarts und Übungen:

| Kapitel | Thema | Lektionen | Dauer | Komplexität |
|---------|-------|----------|----------|------------|
| **[Ch 1: Foundation](docs/chapter-01-foundation/README.md)** | Erste Schritte | [AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Erstes Projekt](docs/chapter-01-foundation/first-project.md) | 30-45 Min. | ⭐ |
| **[Ch 2: AI Development](docs/chapter-02-ai-development/README.md)** | KI-zentrierte Apps | [Microsoft Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [KI-Agenten](docs/chapter-02-ai-development/agents.md) &#124; [Modellbereitstellung](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 Std. | ⭐⭐ |
| **[Ch 3: Configuration](docs/chapter-03-configuration/README.md)** | Auth & Sicherheit | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Auth & Sicherheit](docs/chapter-03-configuration/authsecurity.md) | 45-60 Min. | ⭐⭐ |
| **[Ch 4: Infrastructure](docs/chapter-04-infrastructure/README.md)** | IaC & Bereitstellung | [Bereitstellungsleitfaden](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 Std. | ⭐⭐⭐ |
| **[Ch 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | KI-Agenten-Lösungen | [Einzelhandelsszenario](examples/retail-scenario.md) &#124; [Koordinationsmuster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[Ch 6: Pre-Deployment](docs/chapter-06-pre-deployment/README.md)** | Planung & Validierung | [Preflight-Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapazitätsplanung](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-Auswahl](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 Std. | ⭐⭐ |
| **[Ch 7: Troubleshooting](docs/chapter-07-troubleshooting/README.md)** | Debug & Fix | [Häufige Probleme](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [KI-Probleme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 Std. | ⭐⭐ |
| **[Ch 8: Production](docs/chapter-08-production/README.md)** | Unternehmensmuster | [Produktionspraktiken](docs/chapter-08-production/production-ai-practices.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Hands-On-Labor | [Einführung](workshop/docs/instructions/0-Introduction.md) &#124; [Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Abbau](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Abschluss](workshop/docs/instructions/7-Wrap-up.md) | 3-4 Std. | ⭐⭐ |

**Gesamtdauer des Kurses:** ~10-14 Stunden | **Kompetenzentwicklung:** Anfänger → Produktionsreif

---

## 📚 Lernkapitel

*Wählen Sie Ihren Lernpfad basierend auf Erfahrungsniveau und Zielen*

### 🚀 Kapitel 1: Grundlagen & Schnellstart
**Voraussetzungen**: Azure-Abonnement, grundlegende Kenntnisse der Befehlszeile  
**Dauer**: 30-45 Min.  
**Komplexität**: ⭐

#### Was Sie lernen werden
- Verständnis der Grundlagen der Azure Developer CLI
- Installation von AZD auf Ihrer Plattform
- Ihre erste erfolgreiche Bereitstellung

#### Lernressourcen
- **🎯 Starten Sie hier**: [Was ist die Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) - Kernkonzepte und Terminologie
- **⚙️ Einrichtung**: [Installation & Einrichtung](docs/chapter-01-foundation/installation.md) - Plattform-spezifische Anleitungen
- **🛠️ Praxis**: [Ihr erstes Projekt](docs/chapter-01-foundation/first-project.md) - Schritt-für-Schritt-Anleitung
- **📋 Schnellreferenz**: [Kommando-Cheat-Sheet](resources/cheat-sheet.md)

#### Praktische Übungen
```bash
# Schnelle Überprüfung der Installation
azd version

# Stellen Sie Ihre erste Anwendung bereit
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ergebnis des Kapitels**: Eine einfache Webanwendung erfolgreich mit AZD in Azure bereitstellen

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

**📊 Zeitaufwand:** 30-45 Min.  
**📈 Fertigkeitsniveau danach:** Kann einfache Anwendungen eigenständig bereitstellen
**📈 Fertigkeitsniveau danach:** Kann einfache Anwendungen eigenständig bereitstellen

---

### 🤖 Kapitel 2: KI-zentrierte Entwicklung (Empfohlen für KI-Entwickler)
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 1-2 Std.  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Microsoft Foundry-Integration mit AZD
- Bereitstellung KI-gestützter Anwendungen
- Verständnis von KI-Dienstkonfigurationen

#### Lernressourcen
- **🎯 Starten Sie hier**: [Microsoft Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 KI-Agenten**: [KI-Agenten-Leitfaden](docs/chapter-02-ai-development/agents.md) - Intelligente Agenten mit AZD bereitstellen
- **📖 Muster**: [Modellbereitstellung](docs/chapter-02-ai-development/ai-model-deployment.md) - KI-Modelle bereitstellen und verwalten
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-fähig
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) - Browserbasiertes Lernen mit MkDocs * DevContainer-Umgebung
- **📋 Vorlagen**: [Microsoft Foundry-Vorlagen](#workshop-ressourcen)
- **📝 Beispiele**: [AZD-Bereitstellungsbeispiele](examples/README.md)

#### Praktische Übungen
```bash
# Stellen Sie Ihre erste KI-Anwendung bereit
azd init --template azure-search-openai-demo
azd up

# Probieren Sie weitere KI-Vorlagen aus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Ergebnis des Kapitels**: Eine KI-gestützte Chat-Anwendung mit RAG-Funktionalität bereitstellen und konfigurieren

**✅ Erfolgskontrolle:**
```bash
# Nach Kapitel 2 sollten Sie in der Lage sein:
azd init --template azure-search-openai-demo
azd up
# Die KI-Chat-Oberfläche testen
# Fragen stellen und KI-gestützte Antworten mit Quellen erhalten
# Überprüfen, ob die Suchintegration funktioniert
azd monitor  # Prüfen, ob Application Insights Telemetriedaten anzeigt
azd down --force --purge
```

**📊 Zeitaufwand:** 1-2 Std.  
**📈 Fertigkeitsniveau danach:** Kann produktionsreife KI-Anwendungen bereitstellen und konfigurieren  
**💰 Kostenbewusstsein:** Verstehen Sie Entwicklerkosten von $80-150/Monat und Produktionskosten von $300-3500/Monat

#### 💰 Kostenüberlegungen für KI-Bereitstellungen

**Entwicklungsumgebung (geschätzt $80-150/Monat):**
- Microsoft Foundry-Modelle (Pay-as-you-go): $0-50/Monat (abhängig vom Tokenverbrauch)
- AI Search (Basisstufe): $75/Monat
- Container Apps (Verbrauch): $0-20/Monat
- Speicher (Standard): $1-5/Monat

**Produktionsumgebung (geschätzt $300-3,500+/Monat):**
- Microsoft Foundry-Modelle (PTU für konstante Leistung): $3,000+/Monat ODER Pay-as-you-go bei hohem Volumen
- AI Search (Standardstufe): $250/Monat
- Container Apps (Dediziert): $50-100/Monat
- Application Insights: $5-50/Monat
- Speicher (Premium): $10-50/Monat

**💡 Tipps zur Kostenoptimierung:**
- Verwenden Sie **Free Tier** Microsoft Foundry-Modelle zum Lernen (Azure OpenAI 50.000 Tokens/Monat enthalten)
- Führen Sie `azd down` aus, um Ressourcen freizugeben, wenn Sie nicht aktiv entwickeln
- Beginnen Sie mit verbrauchsbasierter Abrechnung, wechseln Sie zu PTU nur für die Produktion
- Verwenden Sie `azd provision --preview`, um Kosten vor der Bereitstellung zu schätzen
- Aktivieren Sie Auto-Scaling: Bezahlen Sie nur für tatsächliche Nutzung

**Kostenüberwachung:**
```bash
# Geschätzte monatliche Kosten prüfen
azd provision --preview

# Tatsächliche Kosten im Azure-Portal überwachen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Authentifizierung
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 45-60 Min.  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Konfiguration und Verwaltung von Umgebungen
- Authentifizierungs- und Sicherheits-Best-Practices
- Benennung und Organisation von Ressourcen

#### Lernressourcen
- **📖 Konfiguration**: [Konfigurationsleitfaden](docs/chapter-03-configuration/configuration.md) - Umgebungssetup
- **🔐 Sicherheit**: [Authentifizierungsmuster und verwaltete Identität](docs/chapter-03-configuration/authsecurity.md) - Authentifizierungsmuster
- **📝 Beispiele**: [Beispiel einer Datenbankanwendung](examples/database-app/README.md) - AZD-Datenbankbeispiele

#### Praktische Übungen
- Konfigurieren Sie mehrere Umgebungen (dev, staging, prod)
- Richten Sie Authentifizierung mit verwalteter Identität ein
- Implementieren Sie umgebungsspezifische Konfigurationen

**💡 Ergebnis des Kapitels**: Mehrere Umgebungen mit angemessener Authentifizierung und Sicherheit verwalten

---

### 🏗️ Kapitel 4: Infrastructure as Code & Bereitstellung
**Voraussetzungen**: Kapitel 1–3 abgeschlossen  
**Dauer**: 1-1.5 Std.  
**Komplexität**: ⭐⭐⭐

#### Was Sie lernen werden
- Erweiterte Bereitstellungsmuster
- Infrastructure as Code mit Bicep
- Strategien zur Ressourcenbereitstellung

#### Lernressourcen
- **📖 Bereitstellung**: [Bereitstellungsleitfaden](docs/chapter-04-infrastructure/deployment-guide.md) - Vollständige Workflows
- **🏗️ Provisioning**: [Ressourcenprovisionierung](docs/chapter-04-infrastructure/provisioning.md) - Azure-Ressourcenverwaltung
- **📝 Beispiele**: [Container-App-Beispiel](../../examples/container-app) - Containerisierte Bereitstellungen

#### Praktische Übungen
- Erstellen Sie benutzerdefinierte Bicep-Vorlagen
- Bereitstellen von Multi-Service-Anwendungen
- Implementieren Sie Blue-Green-Bereitstellungsstrategien

**💡 Ergebnis des Kapitels**: Bereitstellung komplexer Multi-Service-Anwendungen mithilfe benutzerdefinierter Infrastrukturvorlagen

---

### 🎯 Kapitel 5: Multi-Agent KI-Lösungen (Fortgeschritten)
**Voraussetzungen**: Kapitel 1–2 abgeschlossen  
**Dauer**: 2-3 Std.  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Multi-Agenten-Architekturmuster
- Orchestrierung und Koordination von Agenten
- Produktionsreife KI-Bereitstellungen

#### Lernressourcen
- **🤖 Vorgestelltes Projekt**: [Einzelhandel Multi-Agenten-Lösung](examples/retail-scenario.md) - Vollständige Implementierung
- **🛠️ ARM-Vorlagen**: [ARM-Vorlagenpaket](../../examples/retail-multiagent-arm-template) - One-Click-Bereitstellung
- **📖 Architektur**: [Multi-Agenten-Koordinationsmuster](docs/chapter-06-pre-deployment/coordination-patterns.md) - Muster

#### Praktische Übungen
```bash
# Die vollständige Multi-Agenten-Lösung für den Einzelhandel bereitstellen
cd examples/retail-multiagent-arm-template
./deploy.sh

# Agentenkonfigurationen erkunden
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ergebnis des Kapitels**: Eine produktionsreife Multi-Agent-KI-Lösung mit Kunden- und Bestandsagenten bereitstellen und verwalten

---

### 🔍 Kapitel 6: Validierung & Planung vor der Bereitstellung
**Voraussetzungen**: Kapitel 4 abgeschlossen  
**Dauer**: 1 Std.  
**Komplexität**: ⭐⭐
#### Was Sie lernen werden
- Kapazitätsplanung und Validierung von Ressourcen
- Strategien zur SKU-Auswahl
- Pre-Flight-Checks und Automatisierung

#### Lernressourcen
- **📊 Planung**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Validierung von Ressourcen
- **💰 Auswahl**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffiziente Entscheidungen
- **✅ Validierung**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatisierte Skripte

#### Praktische Übungen
- Führen Sie Skripte zur Kapazitätsvalidierung aus
- Optimieren Sie SKU-Auswahlen zur Kostenreduzierung
- Implementieren Sie automatisierte Pre-Deployment-Prüfungen

**💡 Kapitelziel**: Validieren und optimieren Sie Bereitstellungen vor der Ausführung

---

### 🚨 Kapitel 7: Fehlerbehebung & Fehlersuche
**Voraussetzungen**: Mindestens ein Bereitstellungskapitel abgeschlossen  
**Dauer**: 1–1,5 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Systematische Ansätze zur Fehlersuche
- Häufige Probleme und Lösungen
- KI-spezifische Fehlersuche

#### Lernressourcen
- **🔧 Häufige Probleme**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ und Lösungen
- **🕵️ Fehlersuche**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Schritt-für-Schritt-Strategien
- **🤖 KI-Probleme**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme mit KI-Diensten

#### Praktische Übungen
- Diagnostizieren von Bereitstellungsfehlern
- Beheben von Authentifizierungsproblemen
- Fehlersuche bei der Konnektivität von KI-Diensten

**💡 Kapitelziel**: Häufige Bereitstellungsprobleme eigenständig diagnostizieren und beheben

---

### 🏢 Kapitel 8: Produktions- & Unternehmensmuster
**Voraussetzungen**: Kapitel 1–4 abgeschlossen  
**Dauer**: 2–3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Strategien für Produktionsbereitstellungen
- Sicherheitsmuster für Unternehmen
- Monitoring und Kostenoptimierung

#### Lernressourcen
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Unternehmensmuster
- **📝 Beispiele**: [Microservices Example](../../examples/microservices) - Komplexe Architekturen
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Überwachung

#### Praktische Übungen
- Implementieren Sie Unternehmenssicherheitsmuster
- Richten Sie umfassendes Monitoring ein
- Bereitstellung in Produktion mit angemessener Governance

**💡 Kapitelziel**: Unternehmensbereite Anwendungen mit vollständigen Produktionsfunktionen bereitstellen

---

## 🎓 Workshop-Übersicht: Praxisorientiertes Lernerlebnis

> **⚠️ WORKSHOP-STATUS: In aktiver Entwicklung**  
> Die Workshop-Materialien werden derzeit entwickelt und überarbeitet. Kernmodule sind funktionsfähig, aber einige fortgeschrittene Abschnitte sind unvollständig. Wir arbeiten aktiv daran, alle Inhalte fertigzustellen. [Fortschritt verfolgen →](workshop/README.md)

### Interaktive Workshop-Materialien
**Umfassendes praxisorientiertes Lernen mit browserbasierten Tools und geführten Übungen**

Unsere Workshop-Materialien bieten ein strukturiertes, interaktives Lernerlebnis, das das oben stehende kapitelbasierte Curriculum ergänzt. Der Workshop ist sowohl für selbstgesteuertes Lernen als auch für von Dozenten geleitete Sitzungen konzipiert.

#### 🛠️ Workshop-Funktionen
- **Browserbasierte Oberfläche**: Vollständiger MkDocs-basierter Workshop mit Suche, Kopier- und Theme-Funktionen
- **GitHub Codespaces-Integration**: Ein-Klick-Einrichtung der Entwicklungsumgebung
- **Strukturierter Lernpfad**: 8-modulige geführte Übungen (insgesamt 3–4 Stunden)
- **Progressive Methodik**: Einführung → Auswahl → Validierung → Dekonstruktion → Konfiguration → Anpassung → Abbau → Abschluss
- **Interaktive DevContainer-Umgebung**: Vorgefertigte Tools und Abhängigkeiten

#### 📚 Aufbau der Workshop-Module
Der Workshop folgt einer **8-moduligen progressiven Methodik**, die Sie von der Entdeckung bis zur Bereitstellungsbeherrschung führt:

| Modul | Thema | Was Sie tun werden | Dauer |
|--------|-------|----------------|----------|
| **0. Einführung** | Workshop-Übersicht | Lernziele, Voraussetzungen und Workshop-Struktur verstehen | 15 min |
| **1. Auswahl** | Vorlagenerkennung | Erkunden Sie AZD-Vorlagen und wählen Sie die richtige KI-Vorlage für Ihr Szenario aus | 20 min |
| **2. Validierung** | Bereitstellen & Überprüfen | Stellen Sie die Vorlage mit `azd up` bereit und überprüfen Sie, dass die Infrastruktur funktioniert | 30 min |
| **3. Dekonstruktion** | Struktur verstehen | Verwenden Sie GitHub Copilot, um Template-Architektur, Bicep-Dateien und Code-Organisation zu erkunden | 30 min |
| **4. Konfiguration** | azure.yaml Deep Dive | Beherrschen Sie die `azure.yaml`-Konfiguration, Lifecycle-Hooks und Umgebungsvariablen | 30 min |
| **5. Anpassung** | Machen Sie es zu Ihrem eigenen | Aktivieren Sie KI-Suche, Tracing, Evaluierung und passen Sie es an Ihr Szenario an | 45 min |
| **6. Abbau** | Aufräumen | Ressourcen sicher mit `azd down --purge` entfernen | 15 min |
| **7. Abschluss** | Nächste Schritte | Leistungen überprüfen, Schlüsselkonzepte und Fortsetzung Ihrer Lernreise | 15 min |

**Workshop-Ablauf:**
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
# Klicken Sie im Repository auf "Code" → "Create codespace on main"

# Option 2: Lokale Entwicklung
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Befolgen Sie die Einrichtungsanweisungen in workshop/README.md
```

#### 🎯 Lernziele des Workshops
Durch die Teilnahme am Workshop werden die Teilnehmer:
- **Produktions-KI-Anwendungen bereitstellen**: Verwenden Sie AZD mit Microsoft Foundry-Diensten
- **Multi-Agenten-Architekturen beherrschen**: Implementieren Sie koordinierte KI-Agenten-Lösungen
- **Sicherheits-Best-Practices umsetzen**: Konfigurieren Sie Authentifizierung und Zugriffskontrolle
- **Für Skalierung optimieren**: Entwerfen Sie kosteneffiziente, leistungsfähige Bereitstellungen
- **Bereitstellungen debuggen**: Beheben Sie häufige Probleme eigenständig

#### 📖 Workshop-Ressourcen
- **🎥 Interaktiver Leitfaden**: [Workshop Materials](workshop/README.md) - Browserbasierte Lernumgebung
- **📋 Modul-für-Modul-Anleitungen**:
  - [0. Einführung](workshop/docs/instructions/0-Introduction.md) - Workshop-Übersicht und Ziele
  - [1. Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) - KI-Vorlagen finden und auswählen
  - [2. Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) - Vorlagen bereitstellen und überprüfen
  - [3. Dekonstruktion](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Template-Architektur erkunden
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - Beherrschen Sie `azure.yaml`
  - [5. Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) - Für Ihr Szenario anpassen
  - [6. Abbau](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ressourcen bereinigen
  - [7. Abschluss](workshop/docs/instructions/7-Wrap-up.md) - Rückblick und nächste Schritte
- **🛠️ KI-Workshop-Labor**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - KI-orientierte Übungen
- **💡 Schnellstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Umgebungskonfiguration

**Perfekt für**: Unternehmensschulungen, Universitätskurse, Selbststudium und Entwickler-Bootcamps.

---

## 📖 Deep Dive: AZD-Funktionen

Über die Grundlagen hinaus bietet AZD leistungsstarke Funktionen für Produktionsbereitstellungen:

- **Vorlagenbasierte Bereitstellungen** - Verwenden Sie vorgefertigte Vorlagen für gängige Anwendungsarchitekturen
- **Infrastruktur als Code** - Verwalten Sie Azure-Ressourcen mit Bicep oder Terraform  
- **Integrierte Workflows** - Provisionieren, bereitstellen und überwachen Sie Anwendungen nahtlos
- **Entwicklerfreundlich** - Optimiert für Entwicklerproduktivität und -erfahrung

### **AZD + Microsoft Foundry: Perfekt für KI-Bereitstellungen**

**Warum AZD für KI-Lösungen?** AZD adressiert die wichtigsten Herausforderungen, vor denen KI-Entwickler stehen:

- **KI-fertige Vorlagen** - Vorgefertigte Vorlagen für Microsoft Foundry-Modelle, Cognitive Services und ML-Workloads
- **Sichere KI-Bereitstellungen** - Eingebaute Sicherheitsmuster für KI-Dienste, API-Schlüssel und Modellendpunkte  
- **Produktions-KI-Muster** - Best Practices für skalierbare, kosteneffiziente KI-Anwendungsbereitstellungen
- **End-to-End-KI-Workflows** - Von der Modellentwicklung bis zur Produktionsbereitstellung mit geeigneter Überwachung
- **Kostenoptimierung** - Intelligente Ressourcenzuweisung und Skalierungsstrategien für KI-Workloads
- **Microsoft Foundry-Integration** - Nahtlose Verbindung zum Microsoft Foundry Modellkatalog und zu Endpunkten

---

## 🎯 Vorlagen & Beispielbibliothek

### Vorgestellt: Microsoft Foundry-Vorlagen
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
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Vorgestellt: Komplette Lernszenarien
**Produktionsbereite Anwendungsvorlagen, zugeordnet zu Lernkapiteln**

| Vorlage | Lernkapitel | Komplexität | Zentrales Lernziel |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlegende KI-Bereitstellungsmuster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-Implementierung mit Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration von Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agentenframework und Function Calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise-KI-Orchestrierung |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-Agenten-Architektur mit Kunden- und Inventaragenten |

### Lernen nach Beispieltyp

> **📌 Lokale vs. Externe Beispiele:**  
> **Lokale Beispiele** (in diesem Repo) = Sofort einsatzbereit  
> **Externe Beispiele** (Azure Samples) = Von den verlinkten Repositories klonen

#### Lokale Beispiele (Sofort einsatzbereit)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Vollständige produktionsbereite Implementierung mit ARM-Vorlagen
  - Multi-Agenten-Architektur (Kunden- + Inventaragenten)
  - Umfassendes Monitoring und Evaluierung
  - One-Click-Bereitstellung via ARM-Vorlage

#### Lokale Beispiele - Container-Anwendungen (Kapitel 2-5)
**Umfassende Container-Bereitstellungsbeispiele in diesem Repository:**
- [**Container App Examples**](examples/container-app/README.md) - Vollständige Anleitung zu containerisierten Bereitstellungen
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Einfache REST-API mit Scale-to-Zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produktionsreife Multi-Service-Bereitstellung
  - Quick Start, Production, and Advanced deployment patterns
  - Monitoring, Sicherheit und Kostenoptimierungsleitfaden

#### Externe Beispiele - Einfache Anwendungen (Kapitel 1-2)
**Klonen Sie diese Azure Samples Repositories, um loszulegen:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlegende Bereitstellungsmuster
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Statische Inhaltsbereitstellung
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API-Bereitstellung

#### Externe Beispiele - Datenbankintegration (Kapitel 3-4)
- [Datenbank-App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Muster für Datenbankverbindungen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverloser Daten-Workflow

#### Externe Beispiele - Fortgeschrittene Muster (Kapitel 4-8)
- [Java-Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Architekturen mit mehreren Diensten
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Hintergrundverarbeitung  
- [Enterprise-ML-Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsreife ML-Muster

### Externe Vorlagensammlungen
- [**Offizielle AZD-Vorlagengalerie**](https://azure.github.io/awesome-azd/) - Kuratierte Sammlung offizieller und Community-Vorlagen
- [**Azure Developer CLI-Vorlagen**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn Vorlagendokumentation
- [**Beispiele-Verzeichnis**](examples/README.md) - Lokale Lernbeispiele mit ausführlichen Erklärungen

---

## 📚 Lernressourcen & Referenzen

### Schnelle Referenzen
- [**Befehls-Spickzettel**](resources/cheat-sheet.md) - Wesentliche azd-Befehle, nach Kapitel geordnet
- [**Glossar**](resources/glossary.md) - Azure- und azd-Terminologie  
- [**FAQ**](resources/faq.md) - Häufige Fragen, nach Lernkapitel geordnet
- [**Studienleitfaden**](resources/study-guide.md) - Umfassende Übungsaufgaben

### Praxis-Workshops
- [**KI-Workshop-Labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-bereitstellbar (2-3 Stunden)
- [**Interaktiver Workshop**](workshop/README.md) - 8-modulige geführte Übungen mit MkDocs und GitHub Codespaces
  - Folgt: Einführung → Auswahl → Validierung → Zerlegung → Konfiguration → Anpassung → Abbau → Abschluss

### Externe Lernressourcen
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure-Preiskalkulator](https://azure.microsoft.com/pricing/calculator/)
- [Azure-Status](https://status.azure.com/)

### KI-Agenten-Fähigkeiten für Ihren Editor
- [**Microsoft Azure Skills auf skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 offene Agenten-Fähigkeiten für Azure KI, Foundry, Bereitstellung, Diagnosen, Kostenoptimierung und mehr. Installieren Sie sie in GitHub Copilot, Cursor, Claude Code oder einem unterstützten Agenten:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Kurzanleitung zur Fehlerbehebung

**Häufige Probleme, mit denen Anfänger konfrontiert sind, und sofortige Lösungen:**

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
<summary><strong>❌ "Kein Abonnement gefunden" oder "Abonnement nicht gesetzt"</strong></summary>

```bash
# Verfügbare Abonnements auflisten
az account list --output table

# Standardabonnement festlegen
az account set --subscription "<subscription-id-or-name>"

# Für AZD-Umgebung festlegen
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Überprüfen
az account show
```
</details>

<details>
<summary><strong>❌ "InsufficientQuota" or "Kontingent überschritten"</strong></summary>

```bash
# Andere Azure-Region ausprobieren
azd env set AZURE_LOCATION "westus2"
azd up

# Oder in der Entwicklung kleinere SKUs verwenden
# infra/main.parameters.json bearbeiten:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" bricht mitten durch ab</strong></summary>

```bash
# Option 1: Bereinigen und erneut versuchen
azd down --force --purge
azd up

# Option 2: Nur die Infrastruktur reparieren
azd provision

# Option 3: Detaillierten Status prüfen
azd show

# Option 4: Protokolle im Azure Monitor prüfen
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentifizierung fehlgeschlagen" oder "Token abgelaufen"</strong></summary>

```bash
# Für AZD erneut authentifizieren
azd auth logout
azd auth login

# Optional: aktualisiere auch die Azure CLI, wenn du az-Befehle ausführst
az logout
az login

# Authentifizierung überprüfen
az account show
```
</details>

<details>
<summary><strong>❌ "Ressource existiert bereits" oder Namenskonflikte</strong></summary>

```bash
# AZD erzeugt eindeutige Namen, aber falls ein Konflikt auftritt:
azd down --force --purge

# Dann mit neuer Umgebung erneut versuchen
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Vorlagebereitstellung dauert zu lange</strong></summary>

**Normale Wartezeiten:**
- Einfache Web-App: 5-10 Minuten
- App mit Datenbank: 10-15 Minuten
- KI-Anwendungen: 15-25 Minuten (OpenAI-Bereitstellung ist langsam)

```bash
# Fortschritt prüfen
azd show

# Wenn Sie länger als 30 Minuten feststecken, prüfen Sie das Azure-Portal:
azd monitor --overview
# Nach fehlgeschlagenen Bereitstellungen suchen
```
</details>

<details>
<summary><strong>❌ "Zugriff verweigert" oder "Verboten"</strong></summary>

```bash
# Überprüfen Sie Ihre Azure-Rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sie benötigen mindestens die Rolle "Contributor"
# Bitten Sie Ihren Azure-Administrator, Folgendes zu gewähren:
# - Contributor (für Ressourcen)
# - User Access Administrator (für Rollenzuweisungen)
```
</details>

<details>
<summary><strong>❌ Kann die URL der bereitgestellten Anwendung nicht finden</strong></summary>

```bash
# Alle Service-Endpunkte anzeigen
azd show

# Oder Azure-Portal öffnen
azd monitor

# Bestimmten Dienst überprüfen
azd env get-values
# Nach *_URL-Variablen suchen
```
</details>

### 📚 Vollständige Ressourcen zur Fehlerbehebung

- **Leitfaden zu häufigen Problemen:** [Detaillierte Lösungen](docs/chapter-07-troubleshooting/common-issues.md)
- **KI-spezifische Probleme:** [KI-Fehlerbehebung](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-Leitfaden:** [Schritt-für-Schritt-Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Hilfe bekommen:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursabschluss & Zertifizierung

### Fortschrittsverfolgung
Verfolgen Sie Ihren Lernfortschritt in jedem Kapitel:

- [ ] **Kapitel 1**: Grundlagen & Schnellstart ✅
- [ ] **Kapitel 2**: KI-fokussierte Entwicklung ✅  
- [ ] **Kapitel 3**: Konfiguration & Authentifizierung ✅
- [ ] **Kapitel 4**: Infrastruktur als Code & Bereitstellung ✅
- [ ] **Kapitel 5**: Multi-Agenten-KI-Lösungen ✅
- [ ] **Kapitel 6**: Validierung & Planung vor der Bereitstellung ✅
- [ ] **Kapitel 7**: Fehlerbehebung & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Unternehmensmuster ✅

### Lernüberprüfung
Überprüfen Sie nach Abschluss jedes Kapitels Ihr Wissen durch:
1. **Praktische Übung**: Führen Sie die praktische Bereitstellung des Kapitels durch
2. **Wissensüberprüfung**: Überprüfen Sie den FAQ-Bereich für Ihr Kapitel
3. **Community-Diskussion**: Teilen Sie Ihre Erfahrungen im Azure Discord
4. **Nächstes Kapitel**: Wechseln Sie zur nächsten Komplexitätsstufe

### Vorteile beim Kursabschluss
Nach Abschluss aller Kapitel werden Sie über Folgendes verfügen:
- **Praxis-Erfahrung**: Echte KI-Anwendungen in Azure bereitgestellt
- **Berufliche Fähigkeiten**: Fähigkeiten für unternehmensgerechte Bereitstellungen  
- **Anerkennung in der Community**: Aktives Mitglied der Azure-Entwickler-Community
- **Karriereförderung**: Gefragte AZD- und KI-Bereitstellungsfähigkeit

---

## 🤝 Community & Unterstützung

### Hilfe & Unterstützung erhalten
- **Technische Probleme**: [Fehler melden und Funktionen anfragen](https://github.com/microsoft/azd-for-beginners/issues)
- **Lernfragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) und [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **KI-spezifische Hilfe**: Treten Sie dem [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) bei
- **Dokumentation**: [Offizielle Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-Einblicke vom Microsoft Foundry Discord

**Aktuelle Umfrageergebnisse aus dem #Azure-Kanal:**
- **45%** der Entwickler möchten AZD für KI-Workloads verwenden
- **Hauptprobleme**: Mehrservice-Bereitstellungen, Verwaltung von Zugangsdaten, Produktionsreife  
- **Am häufigsten angefordert**: KI-spezifische Vorlagen, Fehlerbehebungsleitfäden, Best Practices

**Treten Sie unserer Community bei, um:**
- Ihre AZD + KI-Erfahrungen zu teilen und Hilfe zu erhalten
- Frühe Previews neuer KI-Vorlagen zu erhalten
- Zu Best Practices für KI-Bereitstellungen beizutragen
- zukünftige KI + AZD-Funktionsentwicklungen zu beeinflussen

### Beitrag zum Kurs
Beiträge sind willkommen! Bitte lesen Sie unseren [Contributing Guide](CONTRIBUTING.md) für Details zu:
- **Inhaltsverbesserungen**: Bestehende Kapitel und Beispiele verbessern
- **Neue Beispiele**: Realwelt-Szenarien und Vorlagen hinzufügen  
- **Übersetzung**: Mehrsprachige Unterstützung pflegen
- **Fehlerberichte**: Genauigkeit und Klarheit verbessern
- **Community-Standards**: Folgen Sie unseren inklusiven Community-Richtlinien

---

## 📄 Kursinformationen

### Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert - siehe die [LICENSE](../../LICENSE) Datei für Details.

### Verwandte Microsoft-Lernressourcen

Unser Team bietet weitere umfassende Lernkurse an:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j für Einsteiger](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js für Einsteiger](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain für Einsteiger](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenten
[![AZD für Einsteiger](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI für Einsteiger](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP für Einsteiger](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![KI-Agenten für Einsteiger](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI-Serie
[![Generative KI für Einsteiger](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative KI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative KI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative KI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernlernangebote
[![ML für Einsteiger](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science für Einsteiger](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![KI für Einsteiger](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersicherheit für Einsteiger](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Webentwicklung für Einsteiger](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
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

**🚀 Bereit loszulegen?**

**Einsteiger**: Beginnen Sie mit [Kapitel 1: Grundlagen & Schnellstart](#-chapter-1-foundation--quick-start)  
**KI-Entwickler**: Springen Sie zu [Kapitel 2: KI-orientierte Entwicklung](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfahrene Entwickler**: Beginnen Sie mit [Kapitel 3: Konfiguration & Authentifizierung](#️-chapter-3-configuration--authentication)

**Nächste Schritte**: [Beginnen Sie Kapitel 1 - AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder falsche Auslegungen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->