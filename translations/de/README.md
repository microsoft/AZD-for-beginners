# AZD für Einsteiger: Eine strukturierte Lernreise

![AZD-für-Einsteiger](../../translated_images/de/azdbeginners.5527441dd9f74068.webp) 

[![GitHub-Beobachter](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-Sterne](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure-Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry-Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatisierte Übersetzungen (immer aktuell)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengalisch](../bn/README.md) | [Bulgarisch](../bg/README.md) | [Burmesisch (Myanmar)](../my/README.md) | [Chinesisch (Vereinfacht)](../zh-CN/README.md) | [Chinesisch (Traditionell, Hongkong)](../zh-HK/README.md) | [Chinesisch (Traditionell, Macau)](../zh-MO/README.md) | [Chinesisch (Traditionell, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tschechisch](../cs/README.md) | [Dänisch](../da/README.md) | [Niederländisch](../nl/README.md) | [Estnisch](../et/README.md) | [Finnisch](../fi/README.md) | [Französisch](../fr/README.md) | [Deutsch](./README.md) | [Griechisch](../el/README.md) | [Hebräisch](../he/README.md) | [Hindi](../hi/README.md) | [Ungarisch](../hu/README.md) | [Indonesisch](../id/README.md) | [Italienisch](../it/README.md) | [Japanisch](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Koreanisch](../ko/README.md) | [Litauisch](../lt/README.md) | [Malaiisch](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisch](../ne/README.md) | [Nigerianisches Pidgin](../pcm/README.md) | [Norwegisch](../no/README.md) | [Persisch (Farsi)](../fa/README.md) | [Polnisch](../pl/README.md) | [Portugiesisch (Brasilien)](../pt-BR/README.md) | [Portugiesisch (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänisch](../ro/README.md) | [Russisch](../ru/README.md) | [Serbisch (kyrillisch)](../sr/README.md) | [Slowakisch](../sk/README.md) | [Slowenisch](../sl/README.md) | [Spanisch](../es/README.md) | [Swahili](../sw/README.md) | [Schwedisch](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändisch](../th/README.md) | [Türkisch](../tr/README.md) | [Ukrainisch](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisch](../vi/README.md)

> **Möchten Sie lokal klonen?**
>
> Dieses Repository enthält 50+ Sprachübersetzungen, was die Download-Größe erheblich erhöht. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
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
> Das gibt Ihnen alles, was Sie benötigen, um den Kurs zu absolvieren, mit einem viel schnelleren Download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Was ist heute neu in azd

> 📌 Dieser Kurs wurde gegen **`azd 1.25.6`** (Juni 2026) validiert. Führen Sie `azd version` aus, um Ihre Build-Version zu prüfen, und `azd upgrade`, um die neueste Version zu erhalten.

Azure Developer CLI hat sich über traditionelle Web-Apps und APIs hinaus weiterentwickelt. Heute ist azd das einzige Tool, um **jede** Anwendung in Azure bereitzustellen — einschließlich KI-gestützter Anwendungen und intelligenter Agenten.

Das bedeutet für Sie:

- **KI-Agenten sind jetzt erstklassige azd-Workloads.** Sie können KI-Agentenprojekte mit dem bekannten `azd init` → `azd up`-Workflow initialisieren, bereitstellen und verwalten.
- **Ein vollständiger Agenten-Lebenszyklus über die CLI.** Die Erweiterung `azure.ai.agents` deckt jetzt die gesamte Reise ab — `azd ai agent init` zum Gerüstskelett, `azd ai agent invoke` zum Testen (mit Ausgabe der Antwortzeiten), `azd ai agent eval generate` und `azd ai agent optimize` zur Messung und Verbesserung der Qualität sowie `azd ai agent delete` zum Aufräumen.
- **Mehr KI-Bausteine.** Neue Preview-Erweiterungen — `azure.ai.skills` und `azure.ai.connections` — ermöglichen es Ihnen, wiederverwendbare Agenten-Skills und Foundry-Verbindungen direkt mit azd zu verwalten.
- **Microsoft Foundry-Integration** bringt Modell-Bereitstellung, Agenten-Hosting und KI-Dienstkonfiguration direkt in das azd-Vorlagen-Ökosystem.
- **Glattere tägliche Grundlagen.** Jüngste Releases machten `azd init` idempotent (sicher erneut ausführbar), ließen `azd auth login` veraltete Tokens automatisch löschen und fügten eine freundliche Erstlauf-Einrichtungsabfrage für `azd tool` hinzu.
- **Der Kern-Workflow hat sich nicht geändert.** Egal, ob Sie eine To-Do-App, einen Microservice oder eine Multi-Agenten-KI-Lösung bereitstellen — die Befehle sind dieselben.

> **Hinweis für Aspire-Benutzer:** Microsoft bezeichnet das Produkt jetzt einfach als **Aspire** (früher „.NET Aspire“). Die Aspire-Unterstützung in azd ist unverändert — nur der Name wurde aktualisiert.

Wenn Sie azd bereits verwendet haben, ist die KI-Unterstützung eine natürliche Erweiterung — kein separates Tool oder ein fortgeschrittener Pfad. Wenn Sie frisch anfangen, lernen Sie einen Workflow, der für alles funktioniert.

---

## 🚀 Was ist die Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ist ein entwicklerfreundliches Kommandozeilen-Tool, das das Bereitstellen von Anwendungen in Azure vereinfacht. Anstatt dutzende Azure-Ressourcen manuell zu erstellen und zu verbinden, können Sie komplette Anwendungen mit einem einzigen Befehl bereitstellen.

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

**Das war's!** Kein Klicken im Azure-Portal, keine komplexen ARM-Vorlagen, die man zuerst lernen muss, keine manuelle Konfiguration - nur funktionierende Anwendungen auf Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Was ist der Unterschied?

Das ist die häufigste Frage, die Anfänger stellen. Hier ist die einfache Antwort:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Zweck** | Einzelne Azure-Ressourcen verwalten | Komplette Anwendungen bereitstellen |
| **Ansatz** | Infrastruktur-orientiert | Anwendungs-orientiert |
| **Beispiel** | `az webapp create --name myapp...` | `azd up` |
| **Lernkurve** | Man muss Azure-Dienste kennen | Man muss nur seine App kennen |
| **Am besten für** | DevOps, Infrastruktur | Entwickler, Prototyping |

### Ein einfacher Vergleich

- **Azure CLI** ist wie alle Werkzeuge zu haben, um ein Haus zu bauen - Hämmer, Sägen, Nägel. Sie können alles bauen, aber Sie müssen sich mit dem Bau auskennen.
- **Azure Developer CLI** ist wie einen Bauunternehmer zu beauftragen - Sie beschreiben, was Sie wollen, und er kümmert sich um den Bau.

### Wann welches verwenden

| Szenario | Verwenden Sie dies |
|----------|--------------------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Sie arbeiten zusammen!

AZD verwendet die Azure CLI im Hintergrund. Sie können beide verwenden:
```bash
# Setzen Sie Ihre App mit AZD ein
azd up

# Feinabstimmung spezieller Ressourcen mit Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vorlagen in Awesome AZD finden

Fangen Sie nicht bei Null an! **Awesome AZD** ist die Community-Sammlung von sofort einsetzbaren Vorlagen:

| Ressource | Beschreibung |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Durchsuchen Sie 200+ Vorlagen mit Ein-Klick-Bereitstellung |
| 🔗 [**Submit a Template**](https://github.com/Azure/awesome-azd/issues) | Tragen Sie Ihre eigene Vorlage zur Community bei |
| 🔗 [**GitHub Repository**](https://github.com/Azure/awesome-azd) | Mit einem Stern versehen und den Quellcode erkunden |

### Beliebte KI-Vorlagen aus Awesome AZD

```bash
# RAG-Chat mit Microsoft Foundry-Modellen + AI-Suche
azd init --template azure-search-openai-demo

# Schnelle KI-Chat-Anwendung
azd init --template openai-chat-app-quickstart

# KI-Agenten mit Foundry-Agenten
azd init --template get-started-with-ai-agents
```

---

## 🎯 Erste Schritte in 3 Schritten

Bevor Sie beginnen, stellen Sie sicher, dass Ihre Maschine für die Vorlage, die Sie bereitstellen möchten, bereit ist:

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

Wenn Sie nicht sicher sind, welches Sie benötigen, folgen Sie dem kompletten Einrichtungsablauf in [Installation & Setup](docs/chapter-01-foundation/installation.md#authentication-setup).

### Schritt 3: Ihre erste App bereitstellen

```bash
# Von einer Vorlage initialisieren
azd init --template todo-nodejs-mongo

# In Azure bereitstellen (erstellt alles!)
azd up
```

**🎉 Das war's!** Ihre App ist jetzt auf Azure live.

### Aufräumen (Nicht vergessen!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Wie Sie diesen Kurs nutzen

Dieser Kurs ist für **fortschreitendes Lernen** konzipiert – beginnen Sie dort, wo Sie sich wohlfühlen, und arbeiten Sie sich nach oben:

| Ihre Erfahrung | Hier starten |
|-----------------|------------|
| **Neu bei Azure** | [Kapitel 1: Grundlagen](#-chapter-1-foundation--quick-start) |
| **Azure-Kenntnisse, neu bei AZD** | [Kapitel 1: Grundlagen](#-chapter-1-foundation--quick-start) |
| **Möchten KI-Anwendungen bereitstellen** | [Kapitel 2: KI-orientierte Entwicklung](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Wollen praktische Übungen** | [🎓 Interaktiver Workshop](workshop/README.md) - geführtes Labor (3–4 Stunden) |
| **Brauchen Produktionsmuster** | [Kapitel 8: Produktion & Unternehmensmuster](#-chapter-8-production--enterprise-patterns) |

### Schnelleinrichtung

1. **Forken Sie dieses Repository**: [![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonen Sie es**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hilfe erhalten**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Möchten Sie lokal klonen?**
>
> Dieses Repository enthält 50+ Sprachübersetzungen, was die Download-Größe erheblich erhöht. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Das gibt Ihnen alles, was Sie benötigen, um den Kurs zu absolvieren, mit einem viel schnelleren Download.


## Kursübersicht

Meistern Sie die Azure Developer CLI (azd) durch strukturierte Kapitel, die für fortschreitendes Lernen entworfen wurden. **Besonderer Fokus auf die Bereitstellung von KI-Anwendungen mit Microsoft Foundry-Integration.**
### Warum dieser Kurs für moderne Entwickler unerlässlich ist

Basierend auf Erkenntnissen der Microsoft Foundry Discord-Community möchten **45% der Entwickler AZD für KI-Workloads verwenden**, stoßen jedoch auf Herausforderungen bei:
- Komplexen Multi-Service-KI-Architekturen
- Best Practices für die Bereitstellung von KI in Produktionsumgebungen  
- Integration und Konfiguration von Azure AI-Diensten
- Kostenoptimierung für KI-Workloads
- Fehlerbehebung bei KI-spezifischen Bereitstellungsproblemen

### Lernziele

Durch den Abschluss dieses strukturierten Kurses werden Sie:
- **AZD-Grundlagen meistern**: Kernkonzepte, Installation und Konfiguration
- **KI-Anwendungen bereitstellen**: AZD mit Microsoft Foundry-Diensten verwenden
- **Infrastructure as Code implementieren**: Azure-Ressourcen mit Bicep-Vorlagen verwalten
- **Bereitstellungen beheben**: Häufige Probleme lösen und debuggen
- **Für die Produktion optimieren**: Sicherheit, Skalierung, Monitoring und Kostenmanagement
- **Multi-Agent-Lösungen erstellen**: Komplexe KI-Architekturen bereitstellen

## Bevor Sie beginnen: Konten, Zugriff und Annahmen

Bevor Sie mit Kapitel 1 beginnen, stellen Sie sicher, dass Sie Folgendes eingerichtet haben. Die Installationsschritte später in diesem Leitfaden setzen voraus, dass diese Grundlagen bereits geklärt sind.

- **Ein Azure-Abonnement**: Sie können ein vorhandenes Abonnement von der Arbeit oder Ihrem eigenen Konto verwenden oder eine [kostenlose Testversion](https://aka.ms/azurefreetrial) erstellen, um loszulegen.
- **Berechtigung zur Erstellung von Azure-Ressourcen**: Für die meisten Übungen sollten Sie mindestens **Contributor**-Zugriff auf das Zielabonnement oder die Ressourcengruppe haben. Einige Kapitel setzen außerdem voraus, dass Sie Ressourcengruppen, verwaltete Identitäten und RBAC-Zuweisungen erstellen können.
- [**Ein GitHub-Konto**](https://github.com): Dies ist nützlich zum Forken des Repositorys, Verfolgen Ihrer Änderungen und zur Verwendung von GitHub Codespaces für den Workshop.
- **Laufzeit-Voraussetzungen für Vorlagen**: Einige Vorlagen benötigen lokale Tools wie Node.js, Python, Java oder Docker. Führen Sie den Setup-Validator vor Beginn aus, damit Sie fehlende Tools frühzeitig erkennen.
- **Grundlegende Terminal-Kenntnisse**: Sie müssen kein Experte sein, sollten aber damit vertraut sein, Befehle wie `git clone`, `azd auth login` und `azd up` auszuführen.

> **Arbeiten Sie in einem Unternehmensabonnement?**
> Wenn Ihre Azure-Umgebung von einem Administrator verwaltet wird, klären Sie im Voraus, ob Sie Ressourcen in dem Abonnement oder der Ressourcengruppe bereitstellen können, die Sie verwenden möchten. Falls nicht, bitten Sie vor Beginn um ein Sandbox-Abonnement oder Contributor-Zugriff.

> **Neu bei Azure?**
> Beginnen Sie mit Ihrer eigenen Azure-Testversion oder einem Pay-as-you-go-Abonnement unter https://aka.ms/azurefreetrial, damit Sie die Übungen vollständig ohne Warten auf Zustimmungen auf Mandantenebene abschließen können.

## 🗺️ Kursübersicht: Schnelle Navigation nach Kapitel

Each chapter has a dedicated README with learning objectives, quick starts, and exercises:

| Chapter | Topic | Lessons | Duration | Complexity |
|---------|-------|---------|----------|------------|
| **[Kap. 1: Grundlagen](docs/chapter-01-foundation/README.md)** | Erste Schritte | [AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Erstes Projekt](docs/chapter-01-foundation/first-project.md) | 30-45 Min. | ⭐ |
| **[Kap. 2: KI-Entwicklung](docs/chapter-02-ai-development/README.md)** | KI-zentrierte Apps | [Microsoft Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [KI-Agenten](docs/chapter-02-ai-development/agents.md) &#124; [Bereitstellung von Modellen](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 Std. | ⭐⭐ |
| **[Kap. 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Auth & Sicherheit | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Authentifizierung & Sicherheit](docs/chapter-03-configuration/authsecurity.md) | 45-60 Min. | ⭐⭐ |
| **[Kap. 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Bereitstellung | [Bereitstellungsleitfaden](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 Std. | ⭐⭐⭐ |
| **[Kap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | KI-Agenten-Lösungen | [Einzelhandels-Szenario](examples/retail-scenario.md) &#124; [Koordinationsmuster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[Kap. 6: Vorbereitungen](docs/chapter-06-pre-deployment/README.md)** | Planung & Validierung | [Vorabprüfungen](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapazitätsplanung](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-Auswahl](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 Std. | ⭐⭐ |
| **[Kap. 7: Fehlerbehebung](docs/chapter-07-troubleshooting/README.md)** | Debug & Fehlerbehebung | [Häufige Probleme](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [KI-Probleme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 Std. | ⭐⭐ |
| **[Kap. 8: Produktion](docs/chapter-08-production/README.md)** | Unternehmensmuster | [Produktionspraktiken](docs/chapter-08-production/production-ai-practices.md) | 2-3 Std. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisches Labor | [Einführung](workshop/docs/instructions/0-Introduction.md) &#124; [Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruktion](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Infrastruktur abbauen](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Abschluss](workshop/docs/instructions/7-Wrap-up.md) | 3-4 Std. | ⭐⭐ |

**Gesamte Kursdauer:** ~10-14 Stunden | **Kompetenzentwicklung:** Anfänger → Produktionsbereit

---

## 📚 Lernkapitel

*Wählen Sie Ihren Lernpfad basierend auf Erfahrungsstand und Zielen*

### 🚀 Kapitel 1: Grundlagen & Schnellstart
**Voraussetzungen**: Azure-Abonnement, grundlegende Kenntnisse der Kommandozeile  
**Dauer**: 30-45 Minuten  
**Komplexität**: ⭐

#### Was Sie lernen werden
- Verständnis der Grundlagen der Azure Developer CLI
- Installation von AZD auf Ihrer Plattform
- Ihre erste erfolgreiche Bereitstellung

#### Lernressourcen
- **🎯 Starten Sie hier**: [Was ist die Azure Developer CLI?](#what-is-azure-developer-cli)
- **📖 Theorie**: [AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) - Kernkonzepte und Terminologie
- **⚙️ Einrichtung**: [Installation & Einrichtung](docs/chapter-01-foundation/installation.md) - Plattform-spezifische Anleitungen
- **🛠️ Praxis**: [Ihr erstes Projekt](docs/chapter-01-foundation/first-project.md) - Schritt-für-Schritt-Tutorial
- **📋 Schnellreferenz**: [Befehls-Übersicht](resources/cheat-sheet.md)

#### Praktische Übungen
```bash
# Schnelle Überprüfung der Installation
azd version

# Ihre erste Anwendung bereitstellen
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ergebnis des Kapitels**: Eine einfache Webanwendung erfolgreich mit AZD in Azure bereitstellen

**✅ Erfolgskriterien:**
```bash
# Nach Abschluss von Kapitel 1 sollten Sie in der Lage sein:
azd version              # Zeigt die installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                  # Stellt in Azure bereit
azd show                # Zeigt die URL der laufenden App an
# Anwendung öffnet sich im Browser und funktioniert
azd down --force --purge  # Bereinigt Ressourcen
```

**📊 Zeitaufwand:** 30-45 Minuten  
**📈 Fähigkeitsniveau danach:** Kann grundlegende Anwendungen eigenständig bereitstellen
**📈 Fähigkeitsniveau danach:** Kann grundlegende Anwendungen eigenständig bereitstellen

---

### 🤖 Kapitel 2: KI-zentrierte Entwicklung (Empfohlen für KI-Entwickler)
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 1-2 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Microsoft Foundry-Integration mit AZD
- Bereitstellung KI-gestützter Anwendungen
- Verständnis von KI-Dienstkonfigurationen

#### Lernressourcen
- **🎯 Starten Sie hier**: [Microsoft Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 KI-Agenten**: [KI-Agenten Guide](docs/chapter-02-ai-development/agents.md) - Intelligente Agenten mit AZD bereitstellen
- **📖 Muster**: [Bereitstellung von Modellen](docs/chapter-02-ai-development/ai-model-deployment.md) - KI-Modelle bereitstellen und verwalten
- **🛠️ Workshop**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-fähig
- **🎥 Interaktiver Leitfaden**: [Workshop Materials](workshop/README.md) - Browserbasiertes Lernen mit MkDocs * DevContainer-Umgebung
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

**💡 Ergebnis des Kapitels**: Eine KI-gestützte Chat-Anwendung mit RAG-Fähigkeiten bereitstellen und konfigurieren

**✅ Erfolgskriterien:**
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

**📊 Zeitaufwand:** 1-2 Stunden  
**📈 Fähigkeitsniveau danach:** Kann produktionsbereite KI-Anwendungen bereitstellen und konfigurieren  
**💰 Kostenbewusstsein:** Verständnis der Entwicklungskosten von $80-150/Monat, Produktionskosten $300-3500/Monat

#### 💰 Kostenüberlegungen für KI-Bereitstellungen

**Entwicklungsumgebung (geschätzt $80-150/Monat):**
- Microsoft Foundry-Modelle (Pay-as-you-go): $0-50/Monat (abhängig von Token-Nutzung)
- AI Search (Basisstufe): $75/Monat
- Container Apps (Consumption): $0-20/Monat
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
- Beginnen Sie mit verbrauchsabhängiger Abrechnung, upgraden Sie auf PTU nur für die Produktion
- Verwenden Sie `azd provision --preview`, um Kosten vor der Bereitstellung abzuschätzen
- Aktivieren Sie Auto-Scaling: zahlen Sie nur für die tatsächliche Nutzung

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
**Dauer**: 45-60 Minuten  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Konfigurations- und Environment-Management
- Authentifizierungs- und Sicherheitsbest Practices
- Namensgebung und Organisation von Ressourcen

#### Lernressourcen
- **📖 Konfiguration**: [Konfigurationsleitfaden](docs/chapter-03-configuration/configuration.md) - Environment-Setup
- **🔐 Sicherheit**: [Authentifizierungsmuster und verwaltete Identität](docs/chapter-03-configuration/authsecurity.md) - Authentifizierungsmuster
- **📝 Beispiele**: [Datenbank-App-Beispiel](examples/database-app/README.md) - AZD Datenbank-Beispiele

#### Praktische Übungen
- Konfigurieren mehrerer Umgebungen (dev, staging, prod)
- Einrichtung der Authentifizierung mit verwalteten Identitäten
- Implementierung umgebungsspezifischer Konfigurationen

**💡 Kapitel-Ergebnis**: Mehrere Umgebungen mit ordnungsgemäßer Authentifizierung und Sicherheit verwalten

---

### 🏗️ Kapitel 4: Infrastructure as Code & Bereitstellung
**Voraussetzungen**: Kapitel 1-3 abgeschlossen  
**Dauer**: 1-1.5 Stunden  
**Komplexität**: ⭐⭐⭐

#### Was Sie lernen werden
- Erweiterte Bereitstellungsmuster
- Infrastructure as Code mit Bicep
- Strategien zur Ressourcenbereitstellung

#### Lernressourcen
- **📖 Bereitstellung**: [Bereitstellungsleitfaden](docs/chapter-04-infrastructure/deployment-guide.md) - Vollständige Workflows
- **🏗️ Provisioning**: [Ressourcen provisionieren](docs/chapter-04-infrastructure/provisioning.md) - Azure-Ressourcenverwaltung
- **📝 Beispiele**: [Container-App-Beispiel](../../examples/container-app) - Containerisierte Bereitstellungen

#### Praktische Übungen
- Eigene Bicep-Vorlagen erstellen
- Multi-Service-Anwendungen bereitstellen
- Blue-Green-Deployment-Strategien implementieren

**💡 Kapitel-Ergebnis**: Komplexe Multi-Service-Anwendungen mithilfe benutzerdefinierter Infrastrukturvorlagen bereitstellen

---
### 🎯 Kapitel 5: Multi-Agent AI-Lösungen (Fortgeschritten)
**Voraussetzungen**: Kapitel 1-2 abgeschlossen  
**Dauer**: 2-3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Multi-Agenten-Architektur-Muster
- Agenten-Orchestrierung und -Koordination
- Produktionsreife AI-Bereitstellungen

#### Lernressourcen
- **🤖 Vorgestelltes Projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Vollständige Implementierung
- **🛠️ ARM Templates**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Ein-Klick-Bereitstellung
- **📖 Architektur**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Muster

#### Praktische Übungen
```bash
# Bereitstellen der vollständigen Multi-Agenten-Lösung für den Einzelhandel
cd examples/retail-multiagent-arm-template
./deploy.sh

# Agentenkonfigurationen erkunden
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ergebnis des Kapitels**: Bereitstellen und Verwalten einer produktionsreifen Multi-Agent AI-Lösung mit Kunden- und Bestandsagenten

---

### 🔍 Kapitel 6: Validierung & Planung vor der Bereitstellung
**Voraussetzungen**: Kapitel 4 abgeschlossen  
**Dauer**: 1 Stunde  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Kapazitätsplanung und Ressourcenkontrolle
- Strategien zur SKU-Auswahl
- Vorabprüfungen und Automatisierung

#### Lernressourcen
- **📊 Planung**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcenvalidierung
- **💰 Auswahl**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kostenoptimierte Entscheidungen
- **✅ Validierung**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatisierte Skripte

#### Praktische Übungen
- Kapazitätsvalidierungsskripte ausführen
- SKU-Auswahl für Kosten optimieren
- Automatisierte Vorbereitungsprüfungen implementieren

**💡 Ergebnis des Kapitels**: Deployments vor der Ausführung validieren und optimieren

---

### 🚨 Kapitel 7: Fehlerbehebung & Debugging
**Voraussetzungen**: Jedes Bereitstellungskapitel abgeschlossen  
**Dauer**: 1-1.5 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Systematische Debugging-Ansätze
- Häufige Probleme und Lösungen
- AI-spezifische Fehlerbehebung

#### Lernressourcen
- **🔧 Häufige Probleme**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - FAQ und Lösungen
- **🕵️ Debugging**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Schritt-für-Schritt-Strategien
- **🤖 AI-Probleme**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme mit AI-Diensten

#### Praktische Übungen
- Diagnose von Bereitstellungsfehlern
- Authentifizierungsprobleme lösen
- Konnektivität von AI-Diensten debuggen

**💡 Ergebnis des Kapitels**: Häufige Bereitstellungsprobleme eigenständig diagnostizieren und beheben

---

### 🏢 Kapitel 8: Produktions- & Unternehmensmuster
**Voraussetzungen**: Kapitel 1-4 abgeschlossen  
**Dauer**: 2-3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Strategien für Produktionsbereitstellungen
- Unternehmenssicherheitsmuster
- Monitoring und Kostenoptimierung

#### Lernressourcen
- **🏭 Produktion**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Unternehmensmuster
- **📝 Beispiele**: [Microservices Example](../../examples/microservices) - Komplexe Architekturen
- **📊 Monitoring**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Monitoring

#### Praktische Übungen
- Unternehmenssicherheitsmuster implementieren
- Umfassendes Monitoring einrichten
- In Produktion mit entsprechender Governance bereitstellen

**💡 Ergebnis des Kapitels**: Unternehmensbereite Anwendungen mit vollständigen Produktionsfunktionen bereitstellen

---

## 🎓 Workshop-Überblick: Praxisorientiertes Lernerlebnis

> **⚠️ WORKSHOP-STATUS: In aktiver Entwicklung**  
> Die Workshop-Materialien werden derzeit entwickelt und verfeinert. Kernmodule sind funktionsfähig, aber einige fortgeschrittene Abschnitte sind unvollständig. Wir arbeiten aktiv daran, alle Inhalte abzuschließen. [Track progress →](workshop/README.md)

### Interaktive Workshop-Materialien
**Umfassendes, praxisorientiertes Lernen mit browserbasierten Tools und geführten Übungen**

Unsere Workshop-Materialien bieten ein strukturiertes, interaktives Lernerlebnis, das das oben stehende kapitelbasierte Curriculum ergänzt. Der Workshop ist für selbstgesteuertes Lernen und lehrerbasierte Sitzungen konzipiert.

#### 🛠️ Workshop-Funktionen
- **Browserbasierte Oberfläche**: Vollständiger MkDocs-basierter Workshop mit Suche, Kopierfunktion und Theme-Optionen
- **GitHub Codespaces Integration**: Ein-Klick-Entwicklungsumgebung-Setup
- **Strukturierter Lernpfad**: 8-modulige geführte Übungen (insgesamt 3-4 Stunden)
- **Progressive Methodik**: Einführung → Auswahl → Validierung → Zerlegung → Konfiguration → Anpassung → Abbau → Abschluss
- **Interaktive DevContainer-Umgebung**: Vorgefertigte Werkzeuge und Abhängigkeiten

#### 📚 Aufbau der Workshop-Module
Der Workshop folgt einer **8-moduligen progressiven Methodik**, die Sie von der Entdeckung bis zur Bereitstellungs-Beherrschung führt:

| Module | Thema | Was Sie tun werden | Dauer |
|--------|-------|--------------------|----------|
| **0. Introduction** | Workshop Overview | Verstehen der Lernziele, Voraussetzungen und Workshop-Struktur | 15 min |
| **1. Selection** | Template Discovery | AZD-Vorlagen erkunden und die richtige AI-Vorlage für Ihr Szenario auswählen | 20 min |
| **2. Validation** | Deploy & Verify | Die Vorlage mit `azd up` bereitstellen und validieren, dass die Infrastruktur funktioniert | 30 min |
| **3. Deconstruction** | Understand Structure | GitHub Copilot verwenden, um Template-Architektur, Bicep-Dateien und Codeorganisation zu erkunden | 30 min |
| **4. Configuration** | azure.yaml Deep Dive | `azure.yaml`-Konfiguration, Lifecycle-Hooks und Umgebungsvariablen meistern | 30 min |
| **5. Customization** | Make It Yours | AI Search, Tracing, Evaluation aktivieren und für Ihr Szenario anpassen | 45 min |
| **6. Teardown** | Clean Up | Ressourcen sicher mit `azd down --purge` abbauен | 15 min |
| **7. Wrap-up** | Next Steps | Erreichte Ergebnisse, Schlüsselkonzepte überprüfen und Lernreise fortsetzen | 15 min |

**Workshop-Ablauf:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Erste Schritte mit dem Workshop
```bash
# Option 1: GitHub Codespaces (Empfohlen)
# Klicke im Repository auf "Code" → "Create codespace on main"

# Option 2: Lokale Entwicklung
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Befolge die Einrichtungsanweisungen in workshop/README.md
```

#### 🎯 Lernziele des Workshops
Durch den Abschluss des Workshops werden die Teilnehmenden:
- **Produktionsfähige AI-Anwendungen bereitstellen**: AZD mit Microsoft Foundry-Diensten verwenden
- **Multi-Agenten-Architekturen meistern**: Koordinierte AI-Agenten-Lösungen implementieren
- **Sicherheits-Best-Practices umsetzen**: Authentifizierung und Zugriffssteuerung konfigurieren
- **Für Skalierung optimieren**: Kostenoptimierte, leistungsfähige Deployments entwerfen
- **Deployments debuggen**: Häufige Probleme eigenständig lösen

#### 📖 Workshop-Ressourcen
- **🎥 Interaktiver Leitfaden**: [Workshop Materials](workshop/README.md) - Browserbasiertes Lernumfeld
- **📋 Modul-für-Modul-Anleitungen**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop-Überblick und Ziele
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI-Vorlagen finden und auswählen
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Vorlagen bereitstellen und verifizieren
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Template-Architektur erkunden
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - `azure.yaml` meistern
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Für Ihr Szenario anpassen
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ressourcen bereinigen
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Rückblick und nächste Schritte
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokussierte Übungen
- **💡 Schnellstart**: [Workshop Setup Guide](workshop/README.md#quick-start) - Umgebungskonfiguration

**Perfekt für**: Unternehmensschulungen, Universitätskurse, selbstgesteuertes Lernen und Entwickler-Bootcamps.

---

## 📖 Tiefer Einblick: AZD-Fähigkeiten

Über die Grundlagen hinaus bietet AZD leistungsstarke Funktionen für Produktionsbereitstellungen:

- **Vorlagenbasierte Bereitstellungen** - Verwenden Sie vorgefertigte Vorlagen für gängige Anwendungsarchitekturen
- **Infrastructure as Code** - Verwalten Sie Azure-Ressourcen mit Bicep oder Terraform  
- **Integrierte Workflows** - Anwendungen nahtlos bereitstellen, deployen und überwachen
- **Entwicklerfreundlich** - Optimiert für Entwicklerproduktivität und -erlebnis

### **AZD + Microsoft Foundry: Perfekt für AI-Bereitstellungen**

**Warum AZD für AI-Lösungen?** AZD adressiert die größten Herausforderungen, denen AI-Entwickler gegenüberstehen:

- **AI-fertige Vorlagen** - Vorgefertigte Vorlagen für Microsoft Foundry Models, Azure AI Services und ML-Workloads
- **Sichere AI-Bereitstellungen** - Eingebaute Sicherheitsmuster für AI-Dienste, API-Schlüssel und Modellendpunkte  
- **Produktionsfähige AI-Muster** - Best Practices für skalierbare, kosteneffiziente AI-Anwendungsbereitstellungen
- **End-to-End AI-Workflows** - Von der Modellentwicklung bis zur Produktionsbereitstellung mit geeignetem Monitoring
- **Kostenoptimierung** - Intelligente Ressourcenallokation und Skalierungsstrategien für AI-Workloads
- **Microsoft Foundry-Integration** - Nahtlose Verbindung zum Microsoft Foundry Modellkatalog und Endpunkten

---

## 🎯 Vorlagen- & Beispielbibliothek

### Vorgestellt: Microsoft Foundry Vorlagen
**Hier beginnen, wenn Sie AI-Anwendungen bereitstellen!**

> **Hinweis:** Diese Vorlagen zeigen verschiedene AI-Muster. Einige sind externe Azure-Samples, andere sind lokale Implementierungen.

| Vorlage | Kapitel | Komplexität | Dienste | Typ |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Vorgestellt: Vollständige Lernszenarien
**Produktionsreife Anwendungsvorlagen, zugeordnet zu Lernkapiteln**

| Vorlage | Lernkapitel | Komplexität | Wichtiger Lerninhalt |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlegende AI-Bereitstellungsmuster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-Implementierung mit Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration von Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agenten-Framework und Function Calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Unternehmensweite AI-Orchestrierung |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-Agenten-Architektur mit Kunden- und Bestandsagenten |

### Lernen anhand von Beispielen

> **📌 Lokale vs. Externe Beispiele:**  
> **Lokale Beispiele** (in diesem Repo) = Sofort einsatzbereit  
> **Externe Beispiele** (Azure Samples) = Aus den verlinkten Repositories klonen

#### Lokale Beispiele (Sofort einsatzbereit)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Vollständige, produktionsbereite Implementierung mit ARM-Vorlagen
  - Multi-Agenten-Architektur (Kunden- + Bestandsagenten)
  - Umfassendes Monitoring und Evaluation
  - Ein-Klick-Bereitstellung über ARM-Template

#### Lokale Beispiele - Container-Anwendungen (Kapitel 2-5)
**Umfassende Container-Bereitstellungsbeispiele in diesem Repository:**
- [**Container-App-Beispiele**](examples/container-app/README.md) - Vollständige Anleitung für containerisierte Bereitstellungen
  - [Einfache Flask-API](../../examples/container-app/simple-flask-api) - Einfache REST-API mit Scale-to-Zero
  - [Microservices-Architektur](../../examples/container-app/microservices) - Produktionsbereite Multi-Service-Bereitstellung
  - Schnellstart-, Produktions- und erweiterte Bereitstellungsmuster
  - Anleitungen zu Überwachung, Sicherheit und Kostenoptimierung

#### Externe Beispiele - Einfache Anwendungen (Kapitel 1-2)
**Klonen Sie diese Azure-Samples-Repositories, um zu beginnen:**
- [Einfache Web-App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlegende Bereitstellungsmuster
- [Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Bereitstellung statischer Inhalte
- [Container-App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Bereitstellung einer REST-API

#### Externe Beispiele - Datenbankintegration (Kapitel 3-4)  
- [Datenbankanwendung - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Muster für Datenbankverbindungen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverloser Daten-Workflow

#### Externe Beispiele - Fortgeschrittene Muster (Kapitel 4-8)
- [Java-Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-Service-Architekturen
- [Container-Apps-Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Hintergrundverarbeitung  
- [Enterprise-ML-Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsreife ML-Muster

### Externe Vorlagensammlungen
- [**Offizielle AZD-Vorlagengalerie**](https://azure.github.io/awesome-azd/) - Kuratierte Sammlung offizieller und Community-Vorlagen
- [**Azure Developer CLI-Vorlagen**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft-Learn-Vorlagendokumentation
- [**Beispielverzeichnis**](examples/README.md) - Lokale Lernbeispiele mit ausführlichen Erklärungen

---

## 📚 Lernressourcen & Referenzen

### Schnellreferenzen
- [**Befehlsübersicht**](resources/cheat-sheet.md) - Wesentliche azd-Befehle nach Kapitel geordnet
- [**Glossar**](resources/glossary.md) - Azure- und azd-Terminologie  
- [**FAQ**](resources/faq.md) - Häufige Fragen, nach Lernkapitel geordnet
- [**Studienleitfaden**](resources/study-guide.md) - Umfassende Übungsaufgaben

### Praktische Workshops
- [**KI-Workshop-Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-bereit (2-3 Stunden)
- [**Interaktiver Workshop**](workshop/README.md) - 8-modulige geführte Übungen mit MkDocs und GitHub Codespaces
  - Folgt: Einführung → Auswahl → Validierung → Zerlegung → Konfiguration → Anpassung → Abbau → Abschluss

### Externe Lernressourcen
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

### KI-Agenten-Fähigkeiten für Ihren Editor
- [**Microsoft Azure Skills on skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 offene Agentenfähigkeiten für Azure KI, Foundry, Bereitstellung, Diagnostik, Kostenoptimierung und mehr. Installieren Sie sie in GitHub Copilot, Cursor, Claude Code oder jedem unterstützten Agenten:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Kurzanleitung zur Fehlerbehebung

**Häufige Probleme, auf die Anfänger stoßen, und sofortige Lösungen:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "No subscription found" oder "Subscription not set"</strong></summary>

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
<summary><strong>❌ "InsufficientQuota" oder "Quota exceeded"</strong></summary>

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
<summary><strong>❌ "azd up" bricht mitten in der Ausführung ab</strong></summary>

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
<summary><strong>❌ "Authentication failed" oder "Token expired"</strong></summary>

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
<summary><strong>❌ "Resource already exists" oder Namenskonflikte</strong></summary>

```bash
# AZD erzeugt eindeutige Namen, aber bei Konflikten:
azd down --force --purge

# Dann mit einer frischen Umgebung erneut versuchen.
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Template-Bereitstellung dauert zu lange</strong></summary>

**Normale Wartezeiten:**
- Simple web app: 5-10 minutes
- App with database: 10-15 minutes
- AI applications: 15-25 minutes (OpenAI provisioning is slow)

```bash
# Fortschritt prüfen
azd show

# Wenn Sie länger als 30 Minuten feststecken, prüfen Sie das Azure-Portal:
azd monitor --overview
# Nach fehlgeschlagenen Bereitstellungen suchen
```
</details>

<details>
<summary><strong>❌ "Permission denied" oder "Forbidden"</strong></summary>

```bash
# Überprüfen Sie Ihre Azure-Rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sie benötigen mindestens die Rolle „Contributor“
# Bitten Sie Ihren Azure-Administrator, Folgendes zu gewähren:
# - Contributor (für Ressourcen)
# - User Access Administrator (für Rollenzuweisungen)
```
</details>

<details>
<summary><strong>❌ Can't find deployed application URL</strong></summary>

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
- **Hilfe:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursabschluss & Zertifizierung

### Fortschrittsverfolgung
Verfolgen Sie Ihren Lernfortschritt in jedem Kapitel:

- [ ] **Kapitel 1**: Grundlagen & Schnellstart ✅
- [ ] **Kapitel 2**: KI-orientierte Entwicklung ✅  
- [ ] **Kapitel 3**: Konfiguration & Authentifizierung ✅
- [ ] **Kapitel 4**: Infrastruktur als Code & Bereitstellung ✅
- [ ] **Kapitel 5**: Mehragenten-KI-Lösungen ✅
- [ ] **Kapitel 6**: Validierung & Planung vor der Bereitstellung ✅
- [ ] **Kapitel 7**: Fehlerbehebung & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Unternehmensmuster ✅

### Lernüberprüfung
Überprüfen Sie nach Abschluss jedes Kapitels Ihr Wissen durch:
1. **Praktische Übung**: Führen Sie die praktische Bereitstellung des Kapitels durch
2. **Wissenstest**: Überprüfen Sie den FAQ-Abschnitt für Ihr Kapitel
3. **Community-Diskussion**: Teilen Sie Ihre Erfahrungen im Azure Discord
4. **Nächstes Kapitel**: Gehen Sie zum nächsten Komplexitätsniveau

### Vorteile bei Kursabschluss
Nach Abschluss aller Kapitel werden Sie haben:
- **Produktions­erfahrung**: Echte KI-Anwendungen in Azure bereitgestellt
- **Professionelle Fähigkeiten**: Unternehmensreife Bereitstellungsfähigkeiten  
- **Community-Anerkennung**: Aktives Mitglied der Azure-Entwicklergemeinschaft
- **Karriereförderung**: Gefragte AZD- und KI-Bereitstellungsexpertise

---

## 🤝 Gemeinschaft & Support

### Hilfe & Support erhalten
- **Technische Probleme:** [Fehler melden und Funktionen anfordern](https://github.com/microsoft/azd-for-beginners/issues)
- **Lernfragen:** [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) und [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **KI-spezifische Hilfe:** Treten Sie dem [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) bei
- **Dokumentation:** [Offizielle Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-Einblicke aus dem Microsoft Foundry Discord

**Aktuelle Umfrageergebnisse aus dem #Azure-Kanal:**
- **45%** der Entwickler möchten AZD für KI‑Workloads nutzen
- **Hauptprobleme**: Multi-Service-Bereitstellungen, Verwaltung von Zugangsdaten, Produktionsbereitschaft  
- **Am häufigsten angefordert**: KI-spezifische Vorlagen, Fehlerbehebungsanleitungen, Best Practices

Treten Sie unserer Community bei, um:
- Teilen Sie Ihre AZD + KI‑Erfahrungen und erhalten Sie Hilfe
- Zugriff auf Early Previews neuer KI‑Vorlagen
- Beitragen zu Best Practices für KI‑Bereitstellungen
- Die Entwicklung zukünftiger KI + AZD‑Funktionen beeinflussen

### Beitrag zum Kurs
Beiträge sind willkommen! Bitte lesen Sie unseren [Contributing Guide](CONTRIBUTING.md) für Details zu:
- **Inhaltsverbesserungen:** Bestehende Kapitel und Beispiele verbessern
- **Neue Beispiele:** Fügen Sie reale Szenarien und Vorlagen hinzu  
- **Übersetzung:** Helfen Sie, die Mehrsprachigkeitsunterstützung zu pflegen
- **Fehlermeldungen:** Verbessern Sie Genauigkeit und Klarheit
- **Community‑Standards:** Befolgen Sie unsere inklusiven Community‑Richtlinien

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

### Azure / Edge / MCP / Agents
[![AZD für Einsteiger](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI für Einsteiger](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
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
 
### Copilot-Reihe
[![Copilot für KI-Paarprogrammierung](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot für C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-Abenteuer](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigation

**🚀 Bereit, mit dem Lernen zu beginnen?**

**Einsteiger**: Beginnen Sie mit [Kapitel 1: Grundlagen & Schnellstart](#-chapter-1-foundation--quick-start)  
**KI-Entwickler**: Springen Sie zu [Kapitel 2: KI-zentrierte Entwicklung](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Erfahrene Entwickler**: Beginnen Sie mit [Kapitel 3: Konfiguration & Authentifizierung](#️-chapter-3-configuration--authentication)

**Nächste Schritte**: [Kapitel 1 beginnen - AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->