# AZD für Anfänger: Eine strukturierte Lernreise

![AZD-for-beginners](../../translated_images/de/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatisierte Übersetzungen (Immer aktuell)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengalisch](../bn/README.md) | [Bulgarisch](../bg/README.md) | [Birmanisch (Myanmar)](../my/README.md) | [Chinesisch (vereinfacht)](../zh-CN/README.md) | [Chinesisch (traditionell, Hongkong)](../zh-HK/README.md) | [Chinesisch (traditionell, Macau)](../zh-MO/README.md) | [Chinesisch (traditionell, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tschechisch](../cs/README.md) | [Dänisch](../da/README.md) | [Niederländisch](../nl/README.md) | [Estnisch](../et/README.md) | [Finnisch](../fi/README.md) | [Französisch](../fr/README.md) | [Deutsch](./README.md) | [Griechisch](../el/README.md) | [Hebräisch](../he/README.md) | [Hindi](../hi/README.md) | [Ungarisch](../hu/README.md) | [Indonesisch](../id/README.md) | [Italienisch](../it/README.md) | [Japanisch](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreanisch](../ko/README.md) | [Litauisch](../lt/README.md) | [Malaiisch](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisch](../ne/README.md) | [Nigerianisches Pidgin](../pcm/README.md) | [Norwegisch](../no/README.md) | [Persisch (Farsi)](../fa/README.md) | [Polnisch](../pl/README.md) | [Portugiesisch (Brasilien)](../pt-BR/README.md) | [Portugiesisch (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänisch](../ro/README.md) | [Russisch](../ru/README.md) | [Serbisch (Kyrillisch)](../sr/README.md) | [Slowakisch](../sk/README.md) | [Slowenisch](../sl/README.md) | [Spanisch](../es/README.md) | [Swahili](../sw/README.md) | [Schwedisch](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändisch](../th/README.md) | [Türkisch](../tr/README.md) | [Ukrainisch](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisch](../vi/README.md)

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
> Das gibt Ihnen alles, was Sie brauchen, um den Kurs mit einem viel schnelleren Download abzuschließen.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Was ist heute neu in azd

> 📌 Dieser Kurs wurde mit **`azd 1.27.1`** (Juli 2026) validiert. Führen Sie `azd version` aus, um Ihre Version zu prüfen, und `azd upgrade`, um die neueste Version zu erhalten.

Azure Developer CLI hat sich über traditionelle Web-Apps und APIs hinaus erweitert. Heute ist azd das einzige Tool, mit dem Sie **jede** Anwendung auf Azure bereitstellen können – einschließlich KI-gestützter Anwendungen und intelligenter Agenten.

Das bedeutet für Sie:

- **KI-Agenten sind jetzt erstklassige azd-Arbeitslasten.** Sie können KI-Agent-Projekte mit dem bekannten Workflow `azd init` → `azd up` initialisieren, bereitstellen und verwalten.
- **Ein kompletter Agentenlebenszyklus von der CLI.** Die Erweiterung `azure.ai.agents` deckt jetzt den gesamten Weg ab — `azd ai agent init` zum Gerüst erstellen, `azd ai agent invoke` zum Testen (mit Antwortzeit-Ausgabe), `azd ai agent eval generate` und `azd ai agent optimize` zum Messen und Verbessern der Qualität sowie `azd ai agent delete` zum Aufräumen.
- **Mehr KI-Bausteine.** Neue Preview-Erweiterungen – `azure.ai.skills` und `azure.ai.connections` – ermöglichen es, wiederverwendbare Agentenfähigkeiten und Foundry-Verbindungen direkt mit azd zu verwalten.
- **Microsoft Foundry Integration** bringt Modellbereitstellung, Agenten-Hosting und KI-Dienstkonfiguration direkt in das azd-Template-Ökosystem.
- **Reibungslosere tägliche Basics.** Aktuelle Versionen machen `azd init` idempotent (sicher zum erneuten Ausführen), sorgen dafür, dass `azd auth login` veraltete Tokens automatisch löscht, und fügen eine freundliche `azd tool`-Ersteinrichtungsaufforderung hinzu.
- **Der grundlegende Workflow hat sich nicht geändert.** Egal, ob Sie eine ToDo-App, einen Microservice oder eine Multi-Agent-KI-Lösung bereitstellen, die Befehle sind dieselben.

> **Hinweis für Aspire-Nutzer:** Microsoft bezeichnet das Produkt jetzt einfach als **Aspire** (früher ".NET Aspire"). Die Aspire-Unterstützung von azd bleibt unverändert – nur der Name wurde aktualisiert.

Wenn Sie azd zuvor verwendet haben, ist die KI-Unterstützung eine natürliche Erweiterung – kein separates Tool oder ein fortgeschrittener Pfad. Wenn Sie neu anfangen, lernen Sie einen Workflow, der für alles funktioniert.

---

## 🚀 Was ist Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ist ein entwicklerfreundliches Kommandozeilen-Tool, das die Bereitstellung von Anwendungen auf Azure einfach macht. Anstatt manuell Dutzende Azure-Ressourcen zu erstellen und zu verbinden, können Sie ganze Anwendungen mit einem einzigen Befehl bereitstellen.

### Die Magie von `azd up`

```bash
# Dieser einzelne Befehl erledigt alles:
# ✅ Erstellt alle Azure-Ressourcen
# ✅ Konfiguriert Netzwerk und Sicherheit
# ✅ Baut Ihren Anwendungscode
# ✅ Stellt in Azure bereit
# ✅ Gibt Ihnen eine funktionierende URL
azd up
```

**Das war's!** Kein Klicken im Azure-Portal, keine komplexen ARM-Templates, die man zuerst lernen muss, keine manuelle Konfiguration – einfach funktionierende Anwendungen auf Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Was ist der Unterschied?

Das ist die am häufigsten gestellte Frage von Anfängern. Hier die einfache Antwort:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Zweck** | Verwaltung einzelner Azure-Ressourcen | Bereitstellung kompletter Anwendungen |
| **Denkweise** | Infrastruktur-fokussiert | Applikations-fokussiert |
| **Beispiel** | `az webapp create --name myapp...` | `azd up` |
| **Lernkurve** | Kenne Azure-Dienste | Kenne deine App |
| **Am besten für** | DevOps, Infrastruktur | Entwickler, Prototypen |

### Einfache Analogie

- **Azure CLI** ist wie alle Werkzeuge zum Hausbauen zu haben – Hammer, Sägen, Nägel. Man kann alles bauen, muss aber den Bau verstehen.
- **Azure Developer CLI** ist wie einen Bauunternehmer zu engagieren – man beschreibt, was man will, und dieser kümmert sich ums Bauen.

### Wann welches Tool verwenden

| Szenario | Verwenden Sie dieses Tool |
|----------|----------|
| "Ich will schnell meine Web-App bereitstellen" | `azd up` |
| "Ich muss nur ein Speicherkonto erstellen" | `az storage account create` |
| "Ich baue eine komplette KI-Anwendung" | `azd init --template azure-search-openai-demo` |
| "Ich muss eine spezifische Azure-Ressource debuggen" | `az resource show` |
| "Ich will in wenigen Minuten eine produktionsreife Bereitstellung" | `azd up --environment production` |

### Sie arbeiten zusammen!

AZD verwendet Azure CLI unter der Haube. Sie können beide nutzen:
```bash
# Stellen Sie Ihre App mit AZD bereit
azd up

# Feinabstimmung bestimmter Ressourcen mit Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Finde Templates in Awesome AZD

Starte nicht bei Null! **Awesome AZD** ist die Community-Sammlung einsatzbereiter Templates:

| Ressource | Beschreibung |
|----------|-------------|
| 🔗 [**Awesome AZD Galerie**](https://azure.github.io/awesome-azd/) | Durchsuche über 200 Templates mit Ein-Klick-Bereitstellung |
| 🔗 [**Template einreichen**](https://github.com/Azure/awesome-azd/issues) | Trage dein eigenes Template in die Community ein |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Starte und erkunde den Quellcode |

### Beliebte KI-Templates von Awesome AZD

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

Bevor Sie starten, stellen Sie sicher, dass Ihr Rechner bereit ist für das Template, das Sie bereitstellen möchten:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Wenn eine erforderliche Prüfung fehlschlägt, beheben Sie das zuerst und fahren dann mit dem Schnellstart fort.

### Schritt 1: Installieren Sie AZD (2 Minuten)

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

### Schritt 2: Authentifizieren für AZD

```bash
# Optional, wenn Sie planen, Azure CLI-Befehle direkt in diesem Kurs zu verwenden
az login

# Erforderlich für AZD-Workflows
azd auth login
```

Wenn Sie nicht sicher sind, welches Sie benötigen, folgen Sie dem vollständigen Setup-Fluss in [Installation & Einrichtung](docs/chapter-01-foundation/installation.md#authentication-setup).

### Schritt 3: Ihre erste App bereitstellen

```bash
# Von einer Vorlage initialisieren
azd init --template todo-nodejs-mongo

# In Azure bereitstellen (erstellt alles!)
azd up
```

**🎉 Das war's!** Ihre App ist jetzt live auf Azure.

### Aufräumen (Nicht vergessen!)

```bash
# Entfernen Sie alle Ressourcen, wenn Sie mit dem Experimentieren fertig sind
azd down --force --purge
```

---

## 📚 Wie man diesen Kurs nutzt

Dieser Kurs ist für **fortschreitendes Lernen** konzipiert - starten Sie, wo Sie sich wohlfühlen, und arbeiten Sie sich nach oben:

| Ihre Erfahrung | Hier starten |
|-----------------|------------|
| **Neu bei Azure** | [Kapitel 1: Grundlagen](#-chapter-1-foundation--quick-start) |
| **Azure kennen, neu bei AZD** | [Kapitel 1: Grundlagen](#-chapter-1-foundation--quick-start) |
| **KI-Anwendungen bereitstellen wollen** | [Kapitel 2: KI-zentrierte Entwicklung](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Praxisübungen machen wollen** | [🎓 Interaktiver Workshop](workshop/README.md) - 3-4 Stunden geführtes Labor |
| **Produktionsmuster benötigen** | [Kapitel 8: Produktion & Unternehmensmuster](#-chapter-8-production--enterprise-patterns) |

### Schnellstart

1. **Fork dieses Repository**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonen Sie es**: `git clone https://github.com/IHR-BENUTZERNAME/azd-for-beginners.git`
3. **Hilfe bekommen**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Bevorzugen Sie das lokale Klonen?**

> Dieses Repository enthält über 50 Sprachübersetzungen, was die Downloadgröße erheblich erhöht. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Das gibt Ihnen alles, was Sie brauchen, um den Kurs mit einem viel schnelleren Download abzuschließen.


## Kursübersicht

Meistern Sie Azure Developer CLI (azd) durch strukturierte Kapitel, die für fortschreitendes Lernen konzipiert sind. **Besonderer Fokus auf die Bereitstellung von KI-Anwendungen mit Microsoft Foundry Integration.**


### Warum dieser Kurs für moderne Entwickler unerlässlich ist

Basierend auf Erkenntnissen der Microsoft Foundry Discord-Community wollen **45 % der Entwickler AZD für KI-Workloads nutzen**, stoßen jedoch auf Herausforderungen bei:
- Komplexen Multi-Service-KI-Architekturen
- Best Practices für den produktiven KI-Einsatz  
- Integration und Konfiguration von Azure KI-Diensten
- Kostenoptimierung für KI-Workloads
- Fehlerbehebung bei KI-spezifischen Bereitstellungsproblemen

### Lernziele

Durch den Abschluss dieses strukturierten Kurses werden Sie:
- **AZD-Grundlagen beherrschen**: Kernkonzepte, Installation und Konfiguration
- **KI-Anwendungen bereitstellen**: AZD zusammen mit Microsoft Foundry-Diensten nutzen
- **Infrastructure as Code umsetzen**: Azure-Ressourcen mit Bicep-Vorlagen verwalten
- **Bereitstellungen debuggen**: Häufige Probleme lösen und Fehler beheben
- **Für Produktion optimieren**: Sicherheit, Skalierung, Monitoring und Kostenmanagement
- **Multi-Agent-Lösungen erstellen**: Komplexe KI-Architekturen bereitstellen

## Bevor Sie beginnen: Konten, Zugänge und Voraussetzungen

Bevor Sie mit Kapitel 1 starten, stellen Sie sicher, dass Sie Folgendes vorbereitet haben. Die Installationsschritte in diesem Leitfaden setzen voraus, dass diese Grundlagen bereits erledigt sind.

- **Ein Azure-Abonnement**: Sie können ein bestehendes Abonnement von der Arbeit oder Ihrem eigenen Konto verwenden oder eine [kostenlose Testversion](https://aka.ms/azurefreetrial) erstellen, um loszulegen.
- **Berechtigung zur Erstellung von Azure-Ressourcen**: Für die meisten Übungen sollten Sie mindestens **Mitwirkenden**-Zugriff auf das Ziel-Abonnement oder die Ressourcengruppe haben. Einige Kapitel setzen voraus, dass Sie Ressourcengruppen, verwaltete Identitäten und RBAC-Zuweisungen erstellen können.
- [**Ein GitHub-Konto**](https://github.com): Nützlich zum Forken des Repositories, zum Verfolgen eigener Änderungen und zur Nutzung von GitHub Codespaces für den Workshop.
- **Voraussetzungen für die Template-Laufzeit**: Einige Vorlagen benötigen lokale Tools wie Node.js, Python, Java oder Docker. Führen Sie vor Beginn den Setup-Validator aus, um fehlende Tools frühzeitig zu erkennen.
- **Grundlegende Terminalkenntnisse**: Sie müssen kein Experte sein, sollten aber mit Befehlen wie `git clone`, `azd auth login` und `azd up` vertraut sein.

> **Arbeiten Sie in einem Unternehmensabonnement?**
> Wenn Ihre Azure-Umgebung von einem Administrator verwaltet wird, bestätigen Sie im Voraus, dass Sie Ressourcen im Abonnement oder in der Ressourcengruppe bereitstellen können, die Sie verwenden möchten. Falls nicht, fragen Sie vor Beginn nach einer Sandbox-Subscription oder Mitwirkenden-Zugriff.

> **Neu bei Azure?**
> Starten Sie mit Ihrer eigenen Azure-Testversion oder einem Pay-as-you-go-Abonnement unter https://aka.ms/azurefreetrial, damit Sie die Übungen vollständig durchführen können, ohne auf Mandantenebene eine Freigabe abwarten zu müssen.

## 🗺️ Kursübersicht: Schnelle Navigation nach Kapiteln

Jedes Kapitel hat eine eigene README mit Lernzielen, Schnellstarts und Übungen:

| Kapitel | Thema | Lektionen | Dauer | Komplexität |
|---------|-------|---------|----------|------------|
| **[Kapitel 1: Grundlagen](docs/chapter-01-foundation/README.md)** | Einstieg | [AZD Basics](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Erstes Projekt](docs/chapter-01-foundation/first-project.md) | 30-45 Min. | ⭐ |
| **[Kapitel 2: KI-Entwicklung](docs/chapter-02-ai-development/README.md)** | KI-zentrierte Apps | [Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [KI-Agenten](docs/chapter-02-ai-development/agents.md) &#124; [Modellbereitstellung](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 Std. | ⭐⭐ |
| **[Kapitel 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Authentifizierung & Sicherheit | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Authentifizierung & Sicherheit](docs/chapter-03-configuration/authsecurity.md) | 45-60 Min. | ⭐⭐ |
| **[Kapitel 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Bereitstellung | [Bereitstellungsanleitung](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionierung](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 Std. | ⭐⭐⭐ |
| **[Kapitel 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | KI-Agenten-Lösungen | [Einzelhandelsszenario](examples/retail-scenario.md) &#124; [Koordinationsmuster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[Kapitel 6: Vorbereitungen](docs/chapter-06-pre-deployment/README.md)** | Planung & Validierung | [Preflight-Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapazitätsplanung](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-Auswahl](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 Std. | ⭐⭐ |
| **[Kapitel 7: Fehlerbehebung](docs/chapter-07-troubleshooting/README.md)** | Debugging & Behebung | [Häufige Probleme](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [KI-Probleme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 Std. | ⭐⭐ |
| **[Kapitel 8: Produktion](docs/chapter-08-production/README.md)** | Enterprise-Muster | [Produktionspraktiken](docs/chapter-08-production/production-ai-practices.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praxislabor | [Einführung](workshop/docs/instructions/0-Introduction.md) &#124; [Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Zerlegung](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Abbau](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Abschluss](workshop/docs/instructions/7-Wrap-up.md) | 3-4 Std. | ⭐⭐ |

**Gesamtdauer des Kurses:** ~10-14 Stunden | **Kompetenzentwicklung:** Anfänger → Produktionsbereit

---

## 📚 Lernkapitel

*Wählen Sie Ihren Lernweg basierend auf Erfahrung und Zielen*

### 🚀 Kapitel 1: Grundlagen & Schnellstart
**Voraussetzungen**: Azure-Abonnement, grundlegende Befehlszeilenkenntnisse  
**Dauer**: 30-45 Minuten  
**Komplexität**: ⭐

#### Was Sie lernen werden
- Die Grundlagen der Azure Developer CLI verstehen
- AZD auf Ihrer Plattform installieren
- Ihre erste erfolgreiche Bereitstellung

#### Lernressourcen
- **🎯 Starten Sie hier**: [Was ist Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD-Basics](docs/chapter-01-foundation/azd-basics.md) – Kernkonzepte und Terminologie
- **⚙️ Einrichtung**: [Installation & Setup](docs/chapter-01-foundation/installation.md) – Plattform-spezifische Anleitungen
- **🛠️ Praxis**: [Ihr erstes Projekt](docs/chapter-01-foundation/first-project.md) – Schritt-für-Schritt-Tutorial
- **📋 Schnellreferenz**: [Befehl-Übersicht](resources/cheat-sheet.md)

#### Praktische Übungen
```bash
# Schneller Installationscheck
azd version

# Stellen Sie Ihre erste Anwendung bereit
azd init --template todo-nodejs-mongo
azd up
```

**💡 Kapitel-Ergebnis**: Erfolgreiche Bereitstellung einer einfachen Webanwendung in Azure mit AZD

**✅ Erfolgskontrolle:**
```bash
# Nach Abschluss von Kapitel 1 sollten Sie in der Lage sein:
azd version              # Zeigt installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert Projekt
azd up                  # Stellt auf Azure bereit
azd show                # Zeigt laufende App-URL an
# Anwendung öffnet sich im Browser und funktioniert
azd down --force --purge  # Bereinigt Ressourcen
```

**📊 Zeitaufwand:** 30-45 Minuten  
**📈 Kompetenzniveau danach:** Kann grundlegende Anwendungen eigenständig bereitstellen
**📈 Kompetenzniveau danach:** Kann grundlegende Anwendungen eigenständig bereitstellen

---

### 🤖 Kapitel 2: KI-zentrierte Entwicklung (Empfohlen für KI-Entwickler)
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 1-2 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Integration von Microsoft Foundry mit AZD
- Bereitstellung KI-gestützter Anwendungen
- Verständnis der KI-Dienstkonfigurationen

#### Lernressourcen
- **🎯 Starten Sie hier**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 KI-Agenten**: [Leitfaden zu KI-Agenten](docs/chapter-02-ai-development/agents.md) – Intelligente Agenten mit AZD bereitstellen
- **📖 Muster**: [KI-Modell-Bereitstellung](docs/chapter-02-ai-development/ai-model-deployment.md) – KI-Modelle bereitstellen und verwalten
- **🛠️ Workshop**: [KI-Workshop-Labor](docs/chapter-02-ai-development/ai-workshop-lab.md) – Ihre KI-Lösungen AZD-bereit machen
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) – Browserbasiertes Lernen mit MkDocs * DevContainer-Umgebung
- **📋 Vorlagen**: [Microsoft Foundry Templates](#workshop-ressourcen)
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

**💡 Kapitel-Ergebnis**: Bereitstellung und Konfiguration einer KI-gestützten Chat-Anwendung mit RAG-Funktionalität

**✅ Erfolgskontrolle:**
```bash
# Nach Kapitel 2 sollten Sie in der Lage sein:
azd init --template azure-search-openai-demo
azd up
# Die KI-Chat-Schnittstelle zu testen
# Fragen zu stellen und KI-gestützte Antworten mit Quellen zu erhalten
# Die Suchintegration zu überprüfen
azd monitor  # Zu überprüfen, ob Application Insights Telemetriedaten anzeigt
azd down --force --purge
```

**📊 Zeitaufwand:** 1-2 Stunden  
**📈 Kompetenzniveau danach:** Kann produktionsreife KI-Anwendungen bereitstellen und konfigurieren  
**💰 Kostenbewusstsein:** Verstehen von Entwicklerkosten von $80-150/Monat, Produktionskosten von $300-3500/Monat

#### 💰 Kostenüberlegungen für KI-Bereitstellungen

**Entwicklungsumgebung (geschätzt $80-150/Monat):**
- Microsoft Foundry Modelle (Pay-as-you-go): $0-50/Monat (abhängig von der Token-Nutzung)
- KI-Suche (Basic-Tarif): $75/Monat
- Container Apps (Consumption): $0-20/Monat
- Speicher (Standard): $1-5/Monat

**Produktionsumgebung (geschätzt $300-3.500+/Monat):**
- Microsoft Foundry Modelle (PTU für konsistente Leistung): $3.000+/Monat ODER Pay-as-you-go bei hohem Volumen
- KI-Suche (Standard-Tarif): $250/Monat
- Container Apps (Dediziert): $50-100/Monat
- Application Insights: $5-50/Monat
- Speicher (Premium): $10-50/Monat

**💡 Tipps zur Kostenoptimierung:**
- Verwenden Sie **Free Tier** Microsoft Foundry Modelle zum Lernen (Azure OpenAI 50.000 Tokens/Monat inklusive)
- Führen Sie `azd down` aus, um Ressourcen zu deallozieren, wenn Sie nicht aktiv entwickeln
- Beginnen Sie mit verbrauchsbasierter Abrechnung, upgraden Sie nur in der Produktion auf PTU
- Verwenden Sie `azd provision --preview`, um Kosten vor der Bereitstellung zu schätzen
- Aktivieren Sie Auto-Scaling: zahlen Sie nur für tatsächliche Nutzung

**Kostenüberwachung:**
```bash
# Geschätzte monatliche Kosten überprüfen
azd provision --preview

# Tatsächliche Kosten im Azure-Portal überwachen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Authentifizierung
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 45-60 Minuten  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Umgebungs-Konfiguration und Verwaltung
- Best Practices für Authentifizierung und Sicherheit
- Benennung und Organisation von Ressourcen

#### Lernressourcen
- **📖 Konfiguration**: [Konfigurationsanleitung](docs/chapter-03-configuration/configuration.md) – Umgebungseinrichtung
- **🔐 Sicherheit**: [Authentifizierungsmuster und Managed Identity](docs/chapter-03-configuration/authsecurity.md) – Authentifizierungsmuster
- **📝 Beispiele**: [Datenbank-App-Beispiel](examples/database-app/README.md) – AZD-Datenbank-Beispiele

#### Praktische Übungen
- Mehrere Umgebungen (Dev, Staging, Prod) konfigurieren
- Managed Identity Authentifizierung einrichten
- Umgebungsspezifische Konfigurationen implementieren

**💡 Kapitel-Ergebnis**: Mehrere Umgebungen mit korrekter Authentifizierung und Sicherheit verwalten

---

### 🏗️ Kapitel 4: Infrastructure as Code & Bereitstellung
**Voraussetzungen**: Kapitel 1-3 abgeschlossen  
**Dauer**: 1-1,5 Stunden  
**Komplexität**: ⭐⭐⭐

#### Was Sie lernen werden
- Fortgeschrittene Bereitstellungsmuster
- Infrastructure as Code mit Bicep
- Strategien zur Ressourcenbereitstellung

#### Lernressourcen
- **📖 Bereitstellung**: [Bereitstellungsanleitung](docs/chapter-04-infrastructure/deployment-guide.md) – Komplette Workflows
- **🏗️ Provisionierung**: [Provisioning von Ressourcen](docs/chapter-04-infrastructure/provisioning.md) – Azure-Ressourcenverwaltung
- **📝 Beispiele**: [Container-App-Beispiel](../../examples/container-app) – Containerisierte Bereitstellungen

#### Praktische Übungen
- Eigene Bicep-Vorlagen erstellen
- Multi-Service-Anwendungen bereitstellen
- Blue-Green-Bereitstellungsstrategien umsetzen

**💡 Kapitel-Ergebnis**: Komplexe Multi-Service-Anwendungen mit benutzerdefinierten Infrastrukturvorlagen bereitstellen

---


### 🎯 Kapitel 5: Multi-Agent KI-Lösungen (Fortgeschritten)
**Voraussetzungen**: Kapitel 1-2 abgeschlossen  
**Dauer**: 2-3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Multi-Agent Architektur Muster
- Agenten-Orchestrierung und -Koordination
- Produktionsreife KI-Bereitstellungen

#### Lernressourcen
- **🤖 Vorgestelltes Projekt**: [Retail Multi-Agent Lösung](examples/retail-scenario.md) - Vollständige Umsetzung
- **🛠️ ARM Vorlagen**: [ARM Template Paket](../../examples/retail-multiagent-arm-template) - Bereitstellung mit einem Klick
- **📖 Architektur**: [Multi-Agent Koordinationsmuster](docs/chapter-06-pre-deployment/coordination-patterns.md) - Muster

#### Praktische Übungen
```bash
# Setzen Sie die vollständige Einzelhandels-Multi-Agenten-Lösung ein
cd examples/retail-multiagent-arm-template
./deploy.sh

# Erkunden Sie Agentenkonfigurationen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Kapitel-Ergebnis**: Eine produktionsreife Multi-Agent-KI-Lösung mit Kunden- und Lageragenten bereitstellen und verwalten

---

### 🔍 Kapitel 6: Validierung & Planung vor der Bereitstellung
**Voraussetzungen**: Kapitel 4 abgeschlossen  
**Dauer**: 1 Stunde  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Kapazitätsplanung und Ressourcenvalidierung
- Strategien zur Auswahl von SKUs
- Pre-Flight-Checks und Automatisierung

#### Lernressourcen
- **📊 Planung**: [Kapazitätsplanung](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcenvalidierung
- **💰 Auswahl**: [SKU-Auswahl](docs/chapter-06-pre-deployment/sku-selection.md) - Kosteneffiziente Entscheidungen
- **✅ Validierung**: [Pre-Flight-Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatisierte Skripte

#### Praktische Übungen
- Kapazitätsvalidierungsskripte ausführen
- SKU-Auswahl für Kosten optimieren
- Automatisierte Pre-Deployment Checks implementieren

**💡 Kapitel-Ergebnis**: Bereitstellungen vor der Ausführung validieren und optimieren

---

### 🚨 Kapitel 7: Fehlerbehebung & Debugging
**Voraussetzungen**: Jedes Bereitstellungskapitel abgeschlossen  
**Dauer**: 1-1,5 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Systematische Debugging-Methoden
- Häufige Probleme und Lösungen
- KI-spezifische Fehlerbehebung

#### Lernressourcen
- **🔧 Häufige Probleme**: [Häufige Probleme](docs/chapter-07-troubleshooting/common-issues.md) - FAQ und Lösungen
- **🕵️ Debugging**: [Debugging-Anleitung](docs/chapter-07-troubleshooting/debugging.md) - Schritt-für-Schritt-Strategien
- **🤖 KI-Probleme**: [KI-spezifische Fehlerbehebung](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - KI-Service-Probleme

#### Praktische Übungen
- Diagnose von Bereitstellungsfehlern
- Behebung von Authentifizierungsproblemen
- Debugging der KI-Service-Konnektivität

**💡 Kapitel-Ergebnis**: Häufige Bereitstellungsprobleme selbstständig diagnostizieren und beheben

---

### 🏢 Kapitel 8: Produktions- & Enterprise-Muster
**Voraussetzungen**: Kapitel 1-4 abgeschlossen  
**Dauer**: 2-3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Strategien für Produktionsbereitstellungen
- Sicherheitspattern für Unternehmen
- Monitoring und Kostenoptimierung

#### Lernressourcen
- **🏭 Produktion**: [Produktion KI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Enterprise-Muster
- **📝 Beispiele**: [Microservices-Beispiel](../../examples/microservices) - Komplexe Architekturen
- **📊 Monitoring**: [Application Insights Integration](docs/chapter-06-pre-deployment/application-insights.md) - Überwachung

#### Praktische Übungen
- Enterprise-Sicherheitsmuster implementieren
- Umfassendes Monitoring einrichten
- Mit angemessener Governance in Produktion bereitstellen

**💡 Kapitel-Ergebnis**: Unternehmensreife Anwendungen mit vollständigen Produktionsfunktionen bereitstellen

---

## 🎓 Workshop-Übersicht: Praktische Lernerfahrung

> **⚠️ WORKSHOP-STATUS: Aktive Entwicklung**  
> Die Workshop-Materialien werden derzeit entwickelt und verfeinert. Die Kernmodule sind funktional, aber einige fortgeschrittene Abschnitte sind unvollständig. Wir arbeiten aktiv daran, alle Inhalte abzuschließen. [Fortschritt verfolgen →](workshop/README.md)

### Interaktive Workshop-Materialien
**Umfassendes praktisches Lernen mit browserbasierten Tools und geführten Übungen**

Unsere Workshop-Materialien bieten ein strukturiertes, interaktives Lernerlebnis, das das oben stehende kapitelbasierte Curriculum ergänzt. Der Workshop ist sowohl für selbstgesteuertes Lernen als auch für instruktorgeleitete Sitzungen konzipiert.

#### 🛠️ Workshop-Funktionen
- **Browserbasierte Oberfläche**: Vollständiger MkDocs-basierter Workshop mit Such-, Kopier- und Designoptionen
- **GitHub Codespaces Integration**: Umgebung zur Entwicklung mit einem Klick einrichten
- **Strukturierter Lernpfad**: 8-modulige geführte Übungen (insgesamt 3-4 Stunden)
- **Progressive Methodik**: Einführung → Auswahl → Validierung → Analyse → Konfiguration → Anpassung → Abbau → Abschluss
- **Interaktive DevContainer-Umgebung**: Vorgefertigte Tools und Abhängigkeiten

#### 📚 Workshop-Modulstruktur
Der Workshop folgt einer **8-moduligen progressiven Methodik**, die Sie vom Kennenlernen bis zur Meisterung der Bereitstellung führt:

| Modul | Thema | Was Sie tun werden | Dauer |
|--------|-------|------------------|--------|
| **0. Einführung** | Workshop-Übersicht | Lernziele, Voraussetzungen und Workshop-Struktur verstehen | 15 Min |
| **1. Auswahl** | Template-Erkundung | AZD-Vorlagen erkunden und das passende KI-Template für Ihr Szenario auswählen | 20 Min |
| **2. Validierung** | Bereitstellen & Überprüfen | Template mit `azd up` bereitstellen und Infrastruktur validieren | 30 Min |
| **3. Analyse** | Struktur verstehen | GitHub Copilot verwenden, um Template-Architektur, Bicep-Dateien und Code-Organisation zu erkunden | 30 Min |
| **4. Konfiguration** | Deep Dive azure.yaml | `azure.yaml` Konfiguration, Lifecycle-Hooks und Umgebungsvariablen meistern | 30 Min |
| **5. Anpassung** | Eigenständig anpassen | KI-Suche, Tracing, Evaluierung aktivieren und an Ihr Szenario anpassen | 45 Min |
| **6. Abbau** | Aufräumen | Ressourcen sicher mit `azd down --purge` entfernen | 15 Min |
| **7. Abschluss** | Nächste Schritte | Leistungen, Schlüsselerkenntnisse überprüfen und Lernreise fortsetzen | 15 Min |

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
# Klicken Sie im Repository auf "Code" → "Codespace auf main erstellen"

# Option 2: Lokale Entwicklung
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Folgen Sie den Einrichtungshinweisen in workshop/README.md
```

#### 🎯 Workshop-Lernergebnisse
Durch die Teilnahme am Workshop werden die Teilnehmer:
- **Produktionsreife KI-Anwendungen bereitstellen**: AZD mit Microsoft Foundry-Services nutzen
- **Multi-Agent-Architekturen meistern**: Koordinierte KI-Agentenlösungen implementieren
- **Best Practices für Sicherheit umsetzen**: Authentifizierung und Zugriffskontrolle konfigurieren
- **Für Skalierung optimieren**: Kostenwirksame, leistungsfähige Bereitstellungen entwerfen
- **Bereitstellungen troubleshootieren**: Häufige Probleme eigenständig beheben

#### 📖 Workshop-Ressourcen
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) - Browserbasiertes Lernumfeld
- **📋 Modul-für-Modul Anweisungen**:
  - [0. Einführung](workshop/docs/instructions/0-Introduction.md) - Workshop-Übersicht und Ziele
  - [1. Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) - KI-Templates finden und auswählen
  - [2. Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) - Templates bereitstellen und validieren
  - [3. Analyse](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Template-Architektur erkunden
  - [4. Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml meistern
  - [5. Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) - Für Ihr Szenario anpassen
  - [6. Abbau](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ressourcen aufräumen
  - [7. Abschluss](workshop/docs/instructions/7-Wrap-up.md) - Überprüfung und nächste Schritte
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - KI-fokussierte Übungen
- **💡 Schnellstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Umgebungskonfiguration

**Ideal für**: Firmenschulungen, Universitätskurse, selbstgesteuertes Lernen und Entwickler-Bootcamps.

---

## 📖 Deep Dive: AZD-Fähigkeiten

Über die Grundlagen hinaus bietet AZD leistungsstarke Funktionen für Produktionsbereitstellungen:

- **Vorlagenbasierte Bereitstellungen** - Vorgefertigte Vorlagen für gängige Anwendungsanwendungen verwenden
- **Infrastructure as Code** - Azure-Ressourcen mit Bicep oder Terraform verwalten  
- **Integrierte Workflows** - Anwendungen nahtlos bereitstellen, betreiben und überwachen
- **Entwicklerfreundlich** - Optimiert für Entwicklerproduktivität und -erfahrung

### **AZD + Microsoft Foundry: Perfekt für KI-Bereitstellungen**

**Warum AZD für KI-Lösungen?** AZD adressiert die größten Herausforderungen von KI-Entwicklern:

- **KI-fertige Vorlagen** - Vorgefertigte Templates für Microsoft Foundry Modelle, Azure KI-Services und ML-Workloads
- **Sichere KI-Bereitstellungen** - Eingebaute Sicherheitsmuster für KI-Services, API-Schlüssel und Modellendpunkte  
- **Produktionsreife KI-Muster** - Best Practices für skalierbare, kosteneffiziente KI-Anwendungsbereitstellungen
- **End-to-End KI-Workflows** - Von der Modellentwicklung bis zur Produktionsbereitstellung mit geeignetem Monitoring
- **Kostenoptimierung** - Smarte Ressourcenallokation und Skalierungsstrategien für KI-Workloads
- **Microsoft Foundry Integration** - Nahtlose Verbindung zum Microsoft Foundry Modellkatalog und Endpunkten

---

## 🎯 Vorlagen- & Beispielbibliothek

### Vorgestellt: Microsoft Foundry Vorlagen
**Starten Sie hier, wenn Sie KI-Anwendungen bereitstellen!**

> **Hinweis:** Diese Vorlagen zeigen verschiedene KI-Muster. Einige sind externe Azure-Beispiele, andere lokale Implementierungen.

| Vorlage | Kapitel | Komplexität | Dienste | Typ |
|----------|---------|------------|----------|------|
| [**Mit KI-Chat starten**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure KI Modell-Inferenz-API + Azure KI Suche + Azure Container Apps + Application Insights | Extern |
| [**Mit KI-Agenten starten**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure KI Suche + Azure Container Apps + Application Insights| Extern |
| [**Azure Suche + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure KI Suche + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + KI Suche + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Lösung**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + KI Suche + Storage + Container Apps + Cosmos DB | **Lokal** |

### Vorgestellt: Vollständige Lernszenarien
**Produktionsreife Anwendungsvorlagen zugeordnet zu Lernkapiteln**

| Vorlage | Lernkapitel | Komplexität | Hauptlernziel |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlegende KI-Bereitstellungsmuster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-Implementierung mit Azure KI Suche |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration von Dokumentenintelligenz |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agenten-Framework und Funktionsaufrufe |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise KI-Orchestrierung |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-Agenten-Architektur mit Kunden- und Lageragenten |

### Lernen nach Beispieltyp

> **📌 Lokale vs. externe Beispiele:**  
> **Lokale Beispiele** (in diesem Repo) = Sofort einsatzbereit  
> **Externe Beispiele** (Azure Samples) = Aus verlinkten Repositorien klonen

#### Lokale Beispiele (Sofort einsatzbereit)
- [**Retail Multi-Agent Lösung**](examples/retail-scenario.md) - Vollständige produktionsreife Implementierung mit ARM-Vorlagen
  - Multi-Agent Architektur (Kunden- und Lageragenten)
  - Umfassendes Monitoring und Evaluierung
  - Ein-Klick-Bereitstellung über ARM-Vorlage

#### Lokale Beispiele - Container-Anwendungen (Kapitel 2-5)
**Umfassende Container-Bereitstellungsbeispiele in diesem Repository:**

- [**Container-App-Beispiele**](examples/container-app/README.md) - Komplettanleitung für containerisierte Bereitstellungen
  - [Einfache Flask-API](../../examples/container-app/simple-flask-api) - Grundlegende REST-API mit Scale-to-Zero
  - [Microservices-Architektur](../../examples/container-app/microservices) - Produktionsreife Multi-Service-Bereitstellung
  - Schnellstart-, Produktions- und erweiterte Bereitstellungsmuster
  - Anleitung zu Überwachung, Sicherheit und Kostenoptimierung

#### Externe Beispiele - Einfache Anwendungen (Kapitel 1-2)
**Klonen Sie diese Azure Samples-Repositories, um zu beginnen:**
- [Einfache Webanwendung - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlegende Bereitstellungsmuster
- [Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Bereitstellung statischer Inhalte
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API-Bereitstellung

#### Externe Beispiele - Datenbankintegration (Kapitel 3-4)  
- [Datenbankanwendung - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Datenbank-Konnektivitätsmuster
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverloser Daten-Workflow

#### Externe Beispiele - Erweiterte Muster (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-Service-Architekturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Hintergrundverarbeitung  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsreife ML-Muster

### Externe Template-Sammlungen
- [**Offizielle AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratierte Sammlung offizieller und Community-Templates
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn Template-Dokumentation
- [**Beispielverzeichnis**](examples/README.md) - Lokale Lernbeispiele mit detaillierten Erläuterungen

---

## 📚 Lernressourcen & Referenzen

### Kurzübersichten
- [**Befehlsübersicht**](resources/cheat-sheet.md) - Wesentliche azd-Befehle, nach Kapitel geordnet
- [**Glossar**](resources/glossary.md) - Azure- und azd-Terminologie  
- [**FAQ**](resources/faq.md) - Häufige Fragen, nach Lernkapitel geordnet
- [**Übungsleitfaden**](resources/study-guide.md) - Umfassende praktische Übungen

### Praktische Workshops
- [**KI-Workshop-Labor**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-bereitstellbar (2-3 Stunden)
- [**Interaktiver Workshop**](workshop/README.md) - 8 Module mit geführten Übungen mit MkDocs und GitHub Codespaces
  - Abfolge: Einführung → Auswahl → Validierung → Dekomposition → Konfiguration → Anpassung → Abbau → Abschluss

### Externe Lernressourcen
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Preisrechner](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### KI-Agentenfähigkeiten für Ihren Editor
- [**Microsoft Azure Skills auf skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 offene Agentenfähigkeiten für Azure AI, Foundry, Deployment, Diagnostik, Kostenoptimierung und mehr. Installieren Sie sie in GitHub Copilot, Cursor, Claude Code oder jedem unterstützten Agenten:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Schnelle Fehlerbehebung

**Häufige Probleme für Anfänger und schnelle Lösungen:**

<details>
<summary><strong>❌ "azd: Befehl nicht gefunden"</strong></summary>

```bash
# Installieren Sie zuerst AZD
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
<summary><strong>❌ "InsufficientQuota" oder "Kontingent überschritten"</strong></summary>

```bash
# Versuchen Sie eine andere Azure-Region
azd env set AZURE_LOCATION "westus2"
azd up

# Oder verwenden Sie kleinere SKUs in der Entwicklung
# Bearbeiten Sie infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" schlägt mitten im Vorgang fehl</strong></summary>

```bash
# Option 1: Bereinigen und erneut versuchen
azd down --force --purge
azd up

# Option 2: Nur Infrastruktur reparieren
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

# Optional: Aktualisieren Sie auch die Azure CLI, wenn Sie az-Befehle ausführen
az logout
az login

# Authentifizierung überprüfen
az account show
```
</details>

<details>
<summary><strong>❌ "Ressource existiert bereits" oder Namenskonflikte</strong></summary>

```bash
# AZD generiert eindeutige Namen, aber falls es zu Konflikten kommt:
azd down --force --purge

# Dann erneut versuchen mit neuer Umgebung
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Vorlagenbereitstellung dauert zu lange</strong></summary>

**Normale Wartezeiten:**
- Einfache Webanwendung: 5-10 Minuten
- Anwendung mit Datenbank: 10-15 Minuten
- KI-Anwendungen: 15-25 Minuten (OpenAI-Bereitstellung ist langsam)

```bash
# Fortschritt prüfen
azd show

# Wenn Sie länger als 30 Minuten feststecken, überprüfen Sie das Azure Portal:
azd monitor --overview
# Nach fehlgeschlagenen Bereitstellungen suchen
```
</details>

<details>
<summary><strong>❌ "Zugriff verweigert" oder "Verboten"</strong></summary>

```bash
# Überprüfen Sie Ihre Azure-Rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sie benötigen mindestens die Rolle "Mitwirkender"
# Bitten Sie Ihren Azure-Administrator um Berechtigung:
# - Mitwirkender (für Ressourcen)
# - Benutzerzugriffsadministrator (für Rollenzuweisungen)
```
</details>

<details>
<summary><strong>❌ Kann die URL der bereitgestellten Anwendung nicht finden</strong></summary>

```bash
# Alle Dienstendpunkte anzeigen
azd show

# Oder Azure-Portal öffnen
azd monitor

# Spezifischen Dienst überprüfen
azd env get-values
# Nach *_URL-Variablen suchen
```
</details>

### 📚 Umfassende Fehlerbehebungsressourcen

- **Leitfaden für häufige Probleme:** [Detaillierte Lösungen](docs/chapter-07-troubleshooting/common-issues.md)
- **KI-spezifische Probleme:** [KI-Fehlerbehebung](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-Leitfaden:** [Schritt-für-Schritt-Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Hilfe erhalten:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursabschluss & Zertifizierung

### Fortschrittsverfolgung
Verfolgen Sie Ihren Lernfortschritt durch jedes Kapitel:

- [ ] **Kapitel 1**: Grundlagen & Schnellstart ✅
- [ ] **Kapitel 2**: KI-first Entwicklung ✅  
- [ ] **Kapitel 3**: Konfiguration & Authentifizierung ✅
- [ ] **Kapitel 4**: Infrastruktur als Code & Bereitstellung ✅
- [ ] **Kapitel 5**: Multi-Agent-KI-Lösungen ✅
- [ ] **Kapitel 6**: Validierung & Planung vor Bereitstellung ✅
- [ ] **Kapitel 7**: Fehlerbehebung & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Unternehmensmuster ✅

### Lernüberprüfung
Nach Abschluss jedes Kapitels überprüfen Sie Ihr Wissen durch:
1. **Praktische Übung**: Führen Sie die praktische Bereitstellung des Kapitels durch
2. **Wissenskontrolle**: Überprüfen Sie den FAQ-Bereich Ihres Kapitels
3. **Community-Diskussion**: Teilen Sie Ihre Erfahrungen im Azure Discord
4. **Nächstes Kapitel**: Wechseln Sie zum nächsten Schwierigkeitsgrad

### Vorteile des Kursabschlusses
Nach Abschluss aller Kapitel verfügen Sie über:
- **Produktionserfahrung**: Bereitgestellte reale KI-Anwendungen in Azure
- **Professionelle Fähigkeiten**: Betriebsbereite Enterprise-Bereitstellungsfähigkeiten  
- **Community-Anerkennung**: Aktives Mitglied der Azure-Entwickler-Community
- **Karriereförderung**: Gefragte AZD- und KI-Bereitstellungskompetenz

---

## 🤝 Community & Support

### Hilfe & Support erhalten
- **Technische Probleme**: [Fehler melden und Funktionen anfragen](https://github.com/microsoft/azd-for-beginners/issues)
- **Lernfragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) und [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **KI-spezifische Hilfe**: Treten Sie dem [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) bei
- **Dokumentation**: [Offizielle Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-Einblicke vom Microsoft Foundry Discord

**Aktuelle Umfrageergebnisse vom #Azure-Kanal:**
- **45 %** der Entwickler wollen AZD für KI-Workloads nutzen
- **Herausforderungen:** Multi-Service-Bereitstellungen, Anmeldeinformationen-Management, Produktionsreife  
- **Meistgefragt:** KI-spezifische Templates, Fehlerbehebungshilfen, Best Practices

**Treten Sie unserer Community bei, um:**
- Ihre AZD + KI-Erfahrungen zu teilen und Hilfe zu erhalten
- Frühe Vorschauen neuer KI-Templates zu bekommen
- An Best Practices für KI-Bereitstellungen mitzuwirken
- Zukünftige Funktionen für KI + AZD mitzugestalten

### Beitrag zum Kurs
Beiträge sind willkommen! Bitte lesen Sie unseren [Leitfaden für Beiträge](CONTRIBUTING.md) für Details zu:
- **Inhaltsverbesserungen**: Bestehende Kapitel und Beispiele verbessern
- **Neue Beispiele**: Reale Szenarien und Templates ergänzen  
- **Übersetzungen**: Mehrsprachige Unterstützung pflegen
- **Fehlerberichte**: Genauigkeit und Klarheit verbessern
- **Gemeinschaftsstandards**: Unsere inklusiven Community-Richtlinien einhalten

---

## 📄 Kursinformationen

### Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert - siehe die [LICENSE](../../LICENSE)-Datei für Details.

### Verwandte Microsoft-Lernressourcen

Unser Team bietet weitere umfassende Lernkurse an:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j für Anfänger](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js für Anfänger](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain für Anfänger](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agents
[![AZD für Anfänger](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge KI für Anfänger](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP für Anfänger](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![KI-Agenten für Anfänger](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative KI-Serie
[![Generative KI für Anfänger](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative KI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative KI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)

[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernlernen
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-Reihe
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigation

**🚀 Bereit zum Lernen?**

**Anfänger**: Beginnen Sie mit [Kapitel 1: Grundlagen & Schnellstart](#-chapter-1-foundation--quick-start)  
**KI-Entwickler**: Springen Sie zu [Kapitel 2: KI-First-Entwicklung](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfahrene Entwickler**: Beginnen Sie mit [Kapitel 3: Konfiguration & Authentifizierung](#️-chapter-3-configuration--authentication)

**Nächste Schritte**: [Beginnen Sie Kapitel 1 - AZD Grundlagen](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->