# AZD für Anfänger: Eine strukturierte Lernreise

![AZD-für-Anfänger](../../translated_images/de/azdbeginners.5527441dd9f74068.webp) 

[![GitHub-Beobachter](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub-Sterne](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure-Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry-Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatisierte Übersetzungen (immer aktuell)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengalisch](../bn/README.md) | [Bulgarisch](../bg/README.md) | [Birmanisch (Myanmar)](../my/README.md) | [Chinesisch (vereinfacht)](../zh-CN/README.md) | [Chinesisch (traditionell, Hongkong)](../zh-HK/README.md) | [Chinesisch (traditionell, Macau)](../zh-MO/README.md) | [Chinesisch (traditionell, Taiwan)](../zh-TW/README.md) | [Kroatisch](../hr/README.md) | [Tschechisch](../cs/README.md) | [Dänisch](../da/README.md) | [Niederländisch](../nl/README.md) | [Estnisch](../et/README.md) | [Finnisch](../fi/README.md) | [Französisch](../fr/README.md) | [Deutsch](./README.md) | [Griechisch](../el/README.md) | [Hebräisch](../he/README.md) | [Hindi](../hi/README.md) | [Ungarisch](../hu/README.md) | [Indonesisch](../id/README.md) | [Italienisch](../it/README.md) | [Japanisch](../ja/README.md) | [Kannada](../kn/README.md) | [Koreanisch](../ko/README.md) | [Litauisch](../lt/README.md) | [Malaiisch](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisch](../ne/README.md) | [Nigerianisches Pidgin](../pcm/README.md) | [Norwegisch](../no/README.md) | [Persisch (Farsi)](../fa/README.md) | [Polnisch](../pl/README.md) | [Portugiesisch (Brasilien)](../pt-BR/README.md) | [Portugiesisch (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänisch](../ro/README.md) | [Russisch](../ru/README.md) | [Serbisch (kyrillisch)](../sr/README.md) | [Slowakisch](../sk/README.md) | [Slowenisch](../sl/README.md) | [Spanisch](../es/README.md) | [Suaheli](../sw/README.md) | [Schwedisch](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändisch](../th/README.md) | [Türkisch](../tr/README.md) | [Ukrainisch](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisch](../vi/README.md)

> **Bevorzugen Sie lokales Klonen?**
>
> Dieses Repository enthält 50+ Sprachübersetzungen, wodurch die Download-Größe erheblich zunimmt. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
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
> Dies gibt Ihnen alles, was Sie benötigen, um den Kurs mit einem viel schnelleren Download abzuschließen.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Was ist Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** ist ein entwicklerfreundliches Befehlszeilentool, das das Bereitstellen von Anwendungen in Azure vereinfacht. Anstatt Dutzende von Azure-Ressourcen manuell zu erstellen und zu verbinden, können Sie vollständige Anwendungen mit einem einzigen Befehl bereitstellen.

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

**Das war's!** Kein Klicken im Azure-Portal, keine komplexen ARM-Templates, die man zuerst lernen muss, keine manuelle Konfiguration - einfach funktionierende Anwendungen in Azure.

---

## ❓ Azure Developer CLI vs Azure CLI: Was ist der Unterschied?

Das ist die häufigste Frage, die Einsteiger stellen. Hier ist die einfache Antwort:

| Funktion | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Zweck** | Einzelne Azure-Ressourcen verwalten | Komplette Anwendungen bereitstellen |
| **Denkweise** | Infrastruktur-orientiert | Anwendungs-orientiert |
| **Beispiel** | `az webapp create --name myapp...` | `azd up` |
| **Lernkurve** | Kenntnisse der Azure-Dienste erforderlich | Nur Ihre App kennen |
| **Am besten für** | DevOps, Infrastruktur | Entwickler, Prototyping |

### Einfache Analogie

- **Azure CLI** ist wie alle Werkzeuge zu haben, um ein Haus zu bauen - Hämmer, Sägen, Nägel. Sie können alles bauen, aber Sie müssen sich mit dem Bau auskennen.
- **Azure Developer CLI** ist wie einen Bauunternehmer zu engagieren - Sie beschreiben, was Sie wollen, und er kümmert sich um den Bau.

### Wann welches verwenden

| Szenario | Verwenden Sie dies |
|----------|----------|
| "I want to deploy my web app quickly" | `azd up` |
| "I need to create just a storage account" | `az storage account create` |
| "I'm building a full AI application" | `azd init --template azure-search-openai-demo` |
| "I need to debug a specific Azure resource" | `az resource show` |
| "I want production-ready deployment in minutes" | `azd up --environment production` |

### Sie arbeiten zusammen!

AZD verwendet intern die Azure CLI. Sie können beide verwenden:
```bash
# Stellen Sie Ihre App mit AZD bereit
azd up

# Feinabstimmung bestimmter Ressourcen mit Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Vorlagen in Awesome AZD finden

Fangen Sie nicht bei Null an! **Awesome AZD** ist die Community-Sammlung von einsatzbereiten Vorlagen:

| Ressource | Beschreibung |
|----------|-------------|
| 🔗 [**Awesome AZD-Galerie**](https://azure.github.io/awesome-azd/) | Durchsuchen Sie 200+ Vorlagen mit Ein-Klick-Bereitstellung |
| 🔗 [**Eine Vorlage einreichen**](https://github.com/Azure/awesome-azd/issues) | Tragen Sie Ihre eigene Vorlage zur Community bei |
| 🔗 [**GitHub-Repository**](https://github.com/Azure/awesome-azd) | Mit einem Stern versehen und das Repository erkunden |

### Beliebte KI-Vorlagen aus Awesome AZD

```bash
# RAG Chat mit Azure OpenAI + AI Suche
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

### Schritt 3: Ihre erste App bereitstellen

```bash
# Vom Template initialisieren
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

## 📚 Wie man diesen Kurs verwendet

Dieser Kurs ist für aufbauendes Lernen konzipiert - starten Sie dort, wo Sie sich wohlfühlen, und arbeiten Sie sich nach oben:

| Ihre Erfahrung | Hier beginnen |
|-----------------|------------|
| **Neu bei Azure** | [Kapitel 1: Grundlagen](../..) |
| **Kennt Azure, neu bei AZD** | [Kapitel 1: Grundlagen](../..) |
| **Möchten KI-Anwendungen bereitstellen** | [Kapitel 2: KI-zentrierte Entwicklung](../..) |
| **Möchten praktische Übungen** | [🎓 Interaktiver Workshop](workshop/README.md) - 3–4-stündiges geführtes Labor |
| **Benötigen Produktionsmuster** | [Kapitel 8: Produktion & Unternehmensmuster](../..) |

### Schnelle Einrichtung

1. **Dieses Repository forken**: [![GitHub-Forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonen:** `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hilfe bekommen:** [Azure Discord-Community](https://discord.com/invite/ByRwuEEgH4)

> **Bevorzugen Sie lokales Klonen?**

> Dieses Repository enthält 50+ Sprachübersetzungen, wodurch die Download-Größe erheblich zunimmt. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Dies gibt Ihnen alles, was Sie benötigen, um den Kurs mit einem viel schnelleren Download abzuschließen.


## Kursübersicht

Meistern Sie Azure Developer CLI (azd) durch strukturierte Kapitel, die für aufbauendes Lernen konzipiert sind. **Besonderer Fokus auf die Bereitstellung von KI-Anwendungen mit Integration von Microsoft Foundry.**

### Warum dieser Kurs für moderne Entwickler unerlässlich ist

Basierend auf Erkenntnissen aus der Microsoft Foundry Discord-Community möchten **45 % der Entwickler AZD für KI-Workloads verwenden**, stoßen jedoch auf Herausforderungen bei:
- Komplexen Multi-Service-KI-Architekturen
- Best Practices für die Produktion von KI-Bereitstellungen  
- Integration und Konfiguration von Azure AI-Diensten
- Kostenoptimierung für KI-Workloads
- Fehlerbehebung bei KI-spezifischen Bereitstellungsproblemen

### Lernziele

Durch den Abschluss dieses strukturierten Kurses werden Sie:
- **AZD-Grundlagen beherrschen**: Kernkonzepte, Installation und Konfiguration
- **KI-Anwendungen bereitstellen**: Verwenden Sie AZD mit Microsoft Foundry-Diensten
- **Infrastructure as Code implementieren**: Azure-Ressourcen mit Bicep-Vorlagen verwalten
- **Bereitstellungen debuggen**: Häufige Probleme lösen und Fehler beheben
- **Für die Produktion optimieren**: Sicherheit, Skalierung, Überwachung und Kostenmanagement
- **Multi-Agenten-Lösungen erstellen**: Komplexe KI-Architekturen bereitstellen

## 🗺️ Kurskarte: Schnelle Navigation nach Kapitel

Jedes Kapitel hat ein eigenes README mit Lernzielen, Schnellstarts und Übungen:

| Kapitel | Thema | Lektionen | Dauer | Komplexität |
|---------|-------|---------|----------|------------|
| **[Kapitel 1: Grundlagen](docs/chapter-01-foundation/README.md)** | Erste Schritte | [AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) &#124; [Installation](docs/chapter-01-foundation/installation.md) &#124; [Erstes Projekt](docs/chapter-01-foundation/first-project.md) | 30–45 Min. | ⭐ |
| **[Kapitel 2: KI-Entwicklung](docs/chapter-02-ai-development/README.md)** | KI-zentrierte Apps | [Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [KI-Agenten](docs/chapter-02-ai-development/agents.md) &#124; [Modellbereitstellung](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Workshop](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1–2 Std. | ⭐⭐ |
| **[Kapitel 3: Konfiguration](docs/chapter-03-configuration/README.md)** | Auth & Sicherheit | [Konfiguration](docs/chapter-03-configuration/configuration.md) &#124; [Authentifizierung & Sicherheit](docs/chapter-03-configuration/authsecurity.md) | 45–60 Min. | ⭐⭐ |
| **[Kap. 4: Infrastruktur](docs/chapter-04-infrastructure/README.md)** | IaC & Bereitstellung | [Bereitstellungsanleitung](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Bereitstellung](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 Std. | ⭐⭐⭐ |
| **[Kap. 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | KI-Agentenlösungen | [Einzelhandelsszenario](examples/retail-scenario.md) &#124; [Koordinationsmuster](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2–3 Std. | ⭐⭐⭐⭐ |
| **[Kap. 6: Vorbereitungsphase](docs/chapter-06-pre-deployment/README.md)** | Planung & Validierung | [Preflight-Checks](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapazitätsplanung](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-Auswahl](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 Std. | ⭐⭐ |
| **[Kap. 7: Fehlerbehebung](docs/chapter-07-troubleshooting/README.md)** | Debuggen & Beheben | [Häufige Probleme](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Fehlersuche](docs/chapter-07-troubleshooting/debugging.md) &#124; [KI-Probleme](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 Std. | ⭐⭐ |
| **[Kap. 8: Produktion](docs/chapter-08-production/README.md)** | Unternehmensmuster | [Produktionspraktiken](docs/chapter-08-production/production-ai-practices.md) | 2–3 Std. | ⭐⭐⭐⭐ |
| **[🎓 Workshop](workshop/README.md)** | Praktisches Labor | [Einführung](workshop/docs/instructions/0-Introduction.md) &#124; [Auswahl](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validierung](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstruktion](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguration](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Anpassung](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Abbau der Infrastruktur](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Abschluss](workshop/docs/instructions/7-Wrap-up.md) | 3–4 Std. | ⭐⭐ |

**Gesamte Kursdauer:** ~10–14 Stunden | **Fähigkeitsfortschritt:** Anfänger → Produktionsbereit

---

## 📚 Lernkapitel

*Wählen Sie Ihren Lernpfad basierend auf Erfahrung und Zielen*

### 🚀 Kapitel 1: Grundlagen & Schnellstart
**Voraussetzungen**: Azure-Abonnement, grundlegende Kenntnisse der Befehlszeile  
**Dauer**: 30–45 Minuten  
**Komplexität**: ⭐

#### Was Sie lernen werden
- Grundlagen der Azure Developer CLI verstehen
- AZD auf Ihrer Plattform installieren
- Ihre erste erfolgreiche Bereitstellung

#### Lernressourcen
- **🎯 Hier beginnen**: [Was ist die Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) - Kernkonzepte und Terminologie
- **⚙️ Einrichtung**: [Installation & Einrichtung](docs/chapter-01-foundation/installation.md) - Plattform-spezifische Anleitungen
- **🛠️ Praxis**: [Ihr erstes Projekt](docs/chapter-01-foundation/first-project.md) - Schritt-für-Schritt-Anleitung
- **📋 Schnellreferenz**: [Befehls-Cheat-Sheet](resources/cheat-sheet.md)

#### Praktische Übungen
```bash
# Kurzer Installationscheck
azd version

# Stellen Sie Ihre erste Anwendung bereit
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ziel des Kapitels**: Eine einfache Webanwendung erfolgreich mit AZD in Azure bereitstellen

**✅ Erfolgsvalidierung:**
```bash
# Nach Abschluss von Kapitel 1 sollten Sie in der Lage sein:
azd version              # Zeigt die installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                  # Stellt in Azure bereit
azd show                # Zeigt die URL der laufenden Anwendung an
# Die Anwendung öffnet sich im Browser und funktioniert
azd down --force --purge  # Bereinigt Ressourcen
```

**📊 Zeitaufwand:** 30–45 Minuten  
**📈 Fähigkeitsniveau danach:** Kann grundlegende Anwendungen eigenständig bereitstellen

**✅ Erfolgsvalidierung:**
```bash
# Nachdem Sie Kapitel 1 abgeschlossen haben, sollten Sie Folgendes können:
azd version              # Zeigt die installierte Version
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                  # Stellt in Azure bereit
azd show                # Zeigt die URL der laufenden App an
# Die Anwendung öffnet sich im Browser und funktioniert
azd down --force --purge  # Bereinigt Ressourcen
```

**📊 Zeitaufwand:** 30–45 Minuten  
**📈 Fähigkeitsniveau danach:** Kann grundlegende Anwendungen eigenständig bereitstellen

---

### 🤖 Kapitel 2: KI-zentrierte Entwicklung (Empfohlen für KI-Entwickler)
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 1–2 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Microsoft Foundry-Integration mit AZD
- Bereitstellung KI-gestützter Anwendungen
- Verständnis von Konfigurationen für KI-Dienste

#### Lernressourcen
- **🎯 Hier beginnen**: [Microsoft Foundry-Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 KI-Agenten**: [KI-Agenten Anleitung](docs/chapter-02-ai-development/agents.md) - Intelligente Agenten mit AZD bereitstellen
- **📖 Muster**: [Bereitstellung von KI-Modellen](docs/chapter-02-ai-development/ai-model-deployment.md) - KI-Modelle bereitstellen und verwalten
- **🛠️ Workshop**: [KI-Workshop-Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-fähig
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) - Browserbasiertes Lernen mit MkDocs * DevContainer-Umgebung
- **📋 Vorlagen**: [Microsoft Foundry-Vorlagen](../..)
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

**💡 Ziel des Kapitels**: Eine KI-gestützte Chat-Anwendung mit RAG-Funktionen bereitstellen und konfigurieren

**✅ Erfolgsvalidierung:**
```bash
# Nach Kapitel 2 sollten Sie Folgendes können:
azd init --template azure-search-openai-demo
azd up
# Die KI-Chatoberfläche testen
# Fragen stellen und KI-gestützte Antworten mit Quellen erhalten
# Überprüfen, ob die Suchintegration funktioniert
azd monitor  # Überprüfen, dass Application Insights Telemetrie anzeigt
azd down --force --purge
```

**📊 Zeitaufwand:** 1–2 Stunden  
**📈 Fähigkeitsniveau danach:** Kann produktionsreife KI-Anwendungen bereitstellen und konfigurieren  
**💰 Kostenbewusstsein:** Verstehen von $80–150/Monat Entwicklungskosten, $300–3500/Monat Produktionskosten

#### 💰 Kostenüberlegungen für KI-Bereitstellungen

**Entwicklungsumgebung (geschätzt $80–150/Monat):**
- Azure OpenAI (Pay-as-you-go): $0–50/Monat (abhängig von der Token-Nutzung)
- AI Search (Basic-Tarif): $75/Monat
- Container Apps (Consumption): $0–20/Monat
- Storage (Standard): $1–5/Monat

**Produktionsumgebung (geschätzt $300–3.500+/Monat):**
- Azure OpenAI (PTU für konsistente Leistung): $3.000+/Monat ODER Pay-as-you-go bei hohem Volumen
- AI Search (Standard-Tarif): $250/Monat
- Container Apps (Dedicated): $50–100/Monat
- Application Insights: $5–50/Monat
- Storage (Premium): $10–50/Monat

**💡 Tipps zur Kostenoptimierung:**
- Nutzen Sie das **Free Tier** von Azure OpenAI zum Lernen (50.000 Tokens/Monat inklusive)
- Führen Sie `azd down` aus, um Ressourcen freizugeben, wenn Sie nicht aktiv entwickeln
- Beginnen Sie mit verbrauchsabhängiger Abrechnung, upgraden Sie auf PTU nur für die Produktion
- Verwenden Sie `azd provision --preview`, um Kosten vor der Bereitstellung abzuschätzen
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
**Dauer**: 45–60 Minuten  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Umgebungs-Konfiguration und -Verwaltung
- Best Practices für Authentifizierung und Sicherheit
- Benennung und Organisation von Ressourcen

#### Lernressourcen
- **📖 Konfiguration**: [Konfigurationsleitfaden](docs/chapter-03-configuration/configuration.md) - Umgebungseinrichtung
- **🔐 Sicherheit**: [Authentifizierungsmuster und Managed Identity](docs/chapter-03-configuration/authsecurity.md) - Authentifizierungsmuster
- **📝 Beispiele**: [Datenbank-App Beispiel](examples/database-app/README.md) - AZD-Datenbankbeispiele

#### Praktische Übungen
- Mehrere Umgebungen konfigurieren (dev, staging, prod)
- Managed Identity-Authentifizierung einrichten
- Umgebungsspezifische Konfigurationen implementieren

**💡 Ziel des Kapitels**: Mehrere Umgebungen mit ordnungsgemäßer Authentifizierung und Sicherheit verwalten

---

### 🏗️ Kapitel 4: Infrastructure as Code & Bereitstellung
**Voraussetzungen**: Kapitel 1–3 abgeschlossen  
**Dauer**: 1–1,5 Stunden  
**Komplexität**: ⭐⭐⭐

#### Was Sie lernen werden
- Erweiterte Bereitstellungsmuster
- Infrastructure as Code mit Bicep
- Strategien zur Ressourcenbereitstellung

#### Lernressourcen
- **📖 Bereitstellung**: [Bereitstellungsanleitung](docs/chapter-04-infrastructure/deployment-guide.md) - Komplett-Workflows
- **🏗️ Provisioning**: [Ressourcen bereitstellen](docs/chapter-04-infrastructure/provisioning.md) - Azure-Ressourcenverwaltung
- **📝 Beispiele**: [Container App Beispiel](../../examples/container-app) - Containerisierte Bereitstellungen

#### Praktische Übungen
- Eigene Bicep-Vorlagen erstellen
- Multi-Service-Anwendungen bereitstellen
- Blue-Green-Bereitstellungsstrategien implementieren

**💡 Ziel des Kapitels**: Komplexe Multi-Service-Anwendungen mit benutzerdefinierten Infrastrukturvorlagen bereitstellen

---

### 🎯 Kapitel 5: Multi-Agent KI-Lösungen (Fortgeschritten)
**Voraussetzungen**: Kapitel 1–2 abgeschlossen  
**Dauer**: 2–3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Architektur-Muster für Multi-Agenten
- Orchestrierung und Koordination von Agenten
- Produktionsreife KI-Bereitstellungen

#### Lernressourcen
- **🤖 Featured Project**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Vollständige Implementierung
- **🛠️ ARM-Vorlagen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - One-Click-Bereitstellung
- **📖 Architektur**: [Koordinationsmuster für Multi-Agenten](docs/chapter-06-pre-deployment/coordination-patterns.md) - Muster

#### Praktische Übungen
```bash
# Stellen Sie die vollständige Multiagenten-Lösung für den Einzelhandel bereit
cd examples/retail-multiagent-arm-template
./deploy.sh

# Erkunden Sie Agentenkonfigurationen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ziel des Kapitels**: Eine produktionsreife Multi-Agent-KI-Lösung mit Kunden- und Inventaragenten bereitstellen und verwalten

---

### 🔍 Kapitel 6: Vorab-Validierung & Planung
**Voraussetzungen**: Kapitel 4 abgeschlossen  
**Dauer**: 1 Stunde  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Kapazitätsplanung und Ressourcenvalidierung
- Strategien zur SKU-Auswahl
- Preflight-Checks und Automatisierung

#### Lernressourcen
- **📊 Planung**: [Kapazitätsplanung](docs/chapter-06-pre-deployment/capacity-planning.md) - Ressourcenvalidierung
- **💰 Auswahl**: [SKU-Auswahl](docs/chapter-06-pre-deployment/sku-selection.md) - Kostenbewusste Entscheidungen
- **✅ Validierung**: [Preflight-Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatisierte Skripte

#### Praktische Übungen
- Validierungsskripte für Kapazitäten ausführen
- SKU-Auswahl zur Kostenoptimierung optimieren
- Automatisierte Pre-Deployment-Checks implementieren

**💡 Ziel des Kapitels**: Bereitstellungen vor der Ausführung validieren und optimieren

---

### 🚨 Kapitel 7: Fehlerbehebung & Debugging
**Voraussetzungen**: Mindestens ein Bereitstellungskapitel abgeschlossen  
**Dauer**: 1–1,5 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Systematische Debugging-Ansätze
- Häufige Probleme und Lösungen
- KI-spezifische Fehlersuche

#### Lernressourcen
- **🔧 Häufige Probleme**: [Häufige Probleme](docs/chapter-07-troubleshooting/common-issues.md) - FAQ und Lösungen
- **🕵️ Fehlersuche**: [Debugging-Leitfaden](docs/chapter-07-troubleshooting/debugging.md) - Schritt-für-Schritt-Strategien
- **🤖 KI-Probleme**: [KI-spezifische Fehlerbehebung](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Probleme mit KI-Diensten

#### Praktische Übungen
- Bereitstellungsfehler diagnostizieren
- Authentifizierungsprobleme lösen
- Konnektivität von KI-Diensten debuggen

**💡 Ziel des Kapitels**: Häufige Bereitstellungsprobleme selbstständig diagnostizieren und beheben

---

### 🏢 Kapitel 8: Produktion & Unternehmensmuster
**Voraussetzungen**: Kapitel 1–4 abgeschlossen  
**Dauer**: 2–3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Produktionsbereitstellungsstrategien
- Unternehmenssicherheitsmuster
- Überwachung und Kostenoptimierung

#### Lernressourcen
- **🏭 Produktion**: [Beste Praktiken für Produktions-KI](docs/chapter-08-production/production-ai-practices.md) - Unternehmensmuster
- **📝 Beispiele**: [Microservices-Beispiel](../../examples/microservices) - Komplexe Architekturen
- **📊 Überwachung**: [Application Insights-Integration](docs/chapter-06-pre-deployment/application-insights.md) - Überwachung

#### Praktische Übungen
- Unternehmenssicherheitsmuster implementieren
- Umfassende Überwachung einrichten
- Mit richtiger Governance in Produktion bereitstellen

**💡 Ziel des Kapitels**: Produktionsreife Anwendungen mit vollständigen Produktionsfähigkeiten bereitstellen

---

## 🎓 Workshop-Übersicht: Praktische Lernerfahrung

> **⚠️ WORKSHOP-STATUS: In aktiver Entwicklung**
> Die Workshop-Materialien werden derzeit entwickelt und verfeinert. Kernmodule sind funktionsfähig, aber einige fortgeschrittene Abschnitte sind unvollständig. Wir arbeiten aktiv daran, alle Inhalte fertigzustellen. [Fortschritt verfolgen →](workshop/README.md)

### Interaktive Workshop-Materialien
**Umfassendes praktisches Lernen mit browserbasierten Tools und geführten Übungen**

Unsere Workshop-Materialien bieten ein strukturiertes, interaktives Lernerlebnis, das das obenstehende kapitelbasierte Curriculum ergänzt. Der Workshop ist sowohl für selbstgesteuertes Lernen als auch für dozentengeleitete Sitzungen konzipiert.

#### 🛠️ Workshop-Funktionen
- **Browserbasiertes Interface**: Vollständiger MkDocs-basierter Workshop mit Such-, Kopier- und Theme-Funktionen
- **GitHub Codespaces-Integration**: Ein-Klick-Einrichtung der Entwicklungsumgebung
- **Strukturierter Lernpfad**: 8-module geführte Übungen (insgesamt 3-4 Stunden)
- **Progressive Methodik**: Einführung → Auswahl → Validierung → Dekonstruktion → Konfiguration → Anpassung → Abbau → Abschluss
- **Interaktive DevContainer-Umgebung**: Vorgefertigte Tools und Abhängigkeiten

#### 📚 Aufbau der Workshop-Module
Der Workshop folgt einer **8-moduligen progressiven Methodik**, die Sie von der Entdeckung bis zur Meisterschaft in der Bereitstellung führt:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Introduction** | Workshop-Übersicht | Verstehen Sie die Lernziele, Voraussetzungen und die Workshop-Struktur | 15 min |
| **1. Selection** | Vorlagenfindung | Erforschen Sie AZD-Vorlagen und wählen Sie die passende AI-Vorlage für Ihr Szenario aus | 20 min |
| **2. Validation** | Bereitstellen & Überprüfen | Stellen Sie die Vorlage mit `azd up` bereit und überprüfen Sie, dass die Infrastruktur funktioniert | 30 min |
| **3. Deconstruction** | Understand Structure | Use GitHub Copilot to explore template architecture, Bicep files, and code organization | 30 min |
| **4. Configuration** | azure.yaml: Tiefenanalyse | Beherrschen Sie die `azure.yaml`-Konfiguration, Lifecycle-Hooks und Umgebungsvariablen | 30 min |
| **5. Customization** | Make It Yours | Aktivieren Sie AI Search, Tracing, Evaluation und passen Sie es an Ihr Szenario an | 45 min |
| **6. Teardown** | Clean Up | Ressourcen sicher mit `azd down --purge` entfernen | 15 min |
| **7. Wrap-up** | Next Steps | Überprüfen Sie Errungenschaften, Schlüsselkonzepte und setzen Sie Ihre Lernreise fort | 15 min |

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
# Klicken Sie auf "Code" → "Create codespace on main" im Repository

# Option 2: Lokale Entwicklung
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Befolgen Sie die Einrichtungshinweise in workshop/README.md
```

#### 🎯 Lernziele des Workshops
Durch den Abschluss des Workshops werden die Teilnehmenden:
- **Produktive KI-Anwendungen bereitstellen**: Verwenden Sie AZD mit Microsoft Foundry-Diensten
- **Multi-Agenten-Architekturen meistern**: Implementieren Sie koordinierte AI-Agentenlösungen
- **Sicherheits-Best-Practices umsetzen**: Konfigurieren Sie Authentifizierung und Zugriffskontrolle
- **Für Skalierung optimieren**: Entwerfen Sie kosteneffiziente, leistungsfähige Bereitstellungen
- **Fehlerbehebung bei Bereitstellungen**: Beheben Sie häufige Probleme eigenständig

#### 📖 Workshop-Ressourcen
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) - Browserbasiertes Lernumfeld
- **📋 Modul-für-Modul-Anleitungen**:
  - [0. Introduction](workshop/docs/instructions/0-Introduction.md) - Workshop-Übersicht und Ziele
  - [1. Selection](workshop/docs/instructions/1-Select-AI-Template.md) - AI-Vorlagen finden und auswählen
  - [2. Validation](workshop/docs/instructions/2-Validate-AI-Template.md) - Vorlagen bereitstellen und überprüfen
  - [3. Deconstruction](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Vorlagenarchitektur erkunden
  - [4. Configuration](workshop/docs/instructions/4-Configure-AI-Template.md) - azure.yaml meistern
  - [5. Customization](workshop/docs/instructions/5-Customize-AI-Template.md) - Für Ihr Szenario anpassen
  - [6. Teardown](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Ressourcen bereinigen
  - [7. Wrap-up](workshop/docs/instructions/7-Wrap-up.md) - Rückblick und nächste Schritte
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-fokussierte Übungen
- **💡 Schnellstart**: [Workshop-Einrichtungsanleitung](workshop/README.md#quick-start) - Umgebungskonfiguration

**Ideal für**: Unternehmensschulungen, Universitätskurse, selbstgesteuertes Lernen und Entwickler-Bootcamps.

---

## 📖 Deep Dive: AZD-Funktionen

Über die Grundlagen hinaus bietet AZD leistungsstarke Funktionen für Produktions-Bereitstellungen:

- **Vorlagenbasierte Bereitstellungen** - Verwenden Sie vorgefertigte Vorlagen für gängige Anwendungs-Muster
- **Infrastructure as Code** - Verwalten Sie Azure-Ressourcen mit Bicep oder Terraform  
- **Integrierte Workflows** - Provisionieren, bereitstellen und überwachen Sie Anwendungen nahtlos
- **Entwicklerfreundlich** - Optimiert für Entwicklerproduktivität und -erfahrung

### **AZD + Microsoft Foundry: Perfekt für KI-Bereitstellungen**

**Warum AZD für KI-Lösungen?** AZD adressiert die wichtigsten Herausforderungen, mit denen KI-Entwickler konfrontiert sind:

- **KI-fertige Vorlagen** - Vorgefertigte Vorlagen für Azure OpenAI, Cognitive Services und ML-Workloads
- **Sichere KI-Bereitstellungen** - Eingebaute Sicherheitsmuster für KI-Dienste, API-Schlüssel und Modellendpunkte  
- **Produktions-KI-Muster** - Best Practices für skalierbare, kosteneffiziente KI-Anwendungsbereitstellungen
- **End-to-End KI-Workflows** - Von der Modellentwicklung bis zur Produktionsbereitstellung mit angemessenem Monitoring
- **Kostenoptimierung** - Intelligente Ressourcenverteilung und Skalierungsstrategien für KI-Workloads
- **Microsoft Foundry-Integration** - Nahtlose Verbindung zum Microsoft Foundry Modellkatalog und zu Endpunkten

---

## 🎯 Templates & Examples Library

### Hervorgehoben: Microsoft Foundry-Vorlagen
**Beginnen Sie hier, wenn Sie KI-Anwendungen bereitstellen!**

> **Hinweis:** Diese Vorlagen demonstrieren verschiedene KI-Muster. Einige sind externe Azure Samples, andere sind lokale Implementierungen.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Hervorgehoben: Komplette Lernszenarien
**Produktionsbereite Anwendungsvorlagen, zugeordnet zu Lernkapiteln**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlegende KI-Bereitstellungsmuster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-Implementierung mit Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Integration von Document Intelligence |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agent-Framework und Funktionsaufrufe |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise-KI-Orchestrierung |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-Agenten-Architektur mit Kunden- und Bestandsagenten |

### Lernen anhand von Beispieltypen

> **📌 Lokale vs. externe Beispiele:**  
> **Lokale Beispiele** (in diesem Repo) = Sofort einsatzbereit  
> **Externe Beispiele** (Azure Samples) = Klonen Sie die verlinkten Repositories

#### Lokale Beispiele (Sofort einsatzbereit)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Vollständige, produktionsbereite Implementierung mit ARM-Vorlagen
  - Multi-Agent-Architektur (Kunden- + Bestandsagenten)
  - Umfassendes Monitoring und Bewertung
  - Ein-Klick-Bereitstellung über ARM-Vorlage

#### Lokale Beispiele - Container-Anwendungen (Kapitel 2–5)
**Umfassende Beispiele für Container-Bereitstellungen in diesem Repository:**
- [**Container App Examples**](examples/container-app/README.md) - Vollständige Anleitung für containerisierte Bereitstellungen
  - [Simple Flask API](../../examples/container-app/simple-flask-api) - Grundlegende REST-API mit Scale-to-Zero
  - [Microservices Architecture](../../examples/container-app/microservices) - Produktionsbereite Multi-Service-Bereitstellung
  - Schnellstart-, Produktions- und Fortgeschrittene Bereitstellungsmuster
  - Hinweise zu Monitoring, Sicherheit und Kostenoptimierung

#### Externe Beispiele - Einfache Anwendungen (Kapitel 1-2)
**Klonen Sie diese Azure Samples Repositories, um zu beginnen:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Grundlegende Bereitstellungsmuster
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Bereitstellung statischer Inhalte
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API-Bereitstellung

#### Externe Beispiele - Datenbankintegration (Kapitel 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Muster für Datenbankverbindungen
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless-Daten-Workflows

#### Externe Beispiele - Fortgeschrittene Muster (Kapitel 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Multi-Service-Architekturen
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Hintergrundverarbeitung  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Produktionsreife ML-Muster

### Externe Vorlagen-Sammlungen
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratierte Sammlung offizieller und Community-Vorlagen
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn Vorlagen-Dokumentation
- [**Examples Directory**](examples/README.md) - Lokale Lernbeispiele mit ausführlichen Erklärungen

---

## 📚 Lernressourcen & Referenzen

### Schnellreferenzen
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Wichtige azd-Befehle, nach Kapitel geordnet
- [**Glossary**](resources/glossary.md) - Azure- und azd-Terminologie  
- [**FAQ**](resources/faq.md) - Häufige Fragen, nach Lernkapitel geordnet
- [**Study Guide**](resources/study-guide.md) - Umfangreiche Übungsaufgaben

### Praktische Workshops
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-bereitstellbar (2–3 Stunden)
- [**Interactive Workshop**](workshop/README.md) - 8-modulige geführte Übungen mit MkDocs und GitHub Codespaces
  - Folgt: Einführung → Auswahl → Validierung → Dekonstruktion → Konfiguration → Anpassung → Abbau → Abschluss

### Externe Lernressourcen
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Kurze Fehlerbehebungsanleitung

**Häufige Probleme bei Einsteigern und sofortige Lösungen:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

```bash
# Installiere AZD zuerst
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
<summary><strong>❌ "No subscription found" or "Subscription not set"</strong></summary>

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
<summary><strong>❌ "Unzureichendes Kontingent" oder "Kontingent überschritten"</strong></summary>

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
<summary><strong>❌ "azd up" schlägt auf halbem Weg fehl</strong></summary>

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
<summary><strong>❌ "Ressource existiert bereits" oder Namenskonflikte</strong></summary>

```bash
# AZD erzeugt eindeutige Namen, aber wenn es zu einem Konflikt kommt:
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
- Anwendung mit Datenbank: 10-15 Minuten
- KI-Anwendungen: 15-25 Minuten (OpenAI-Bereitstellung ist langsam)

```bash
# Fortschritt überprüfen
azd show

# Wenn länger als 30 Minuten feststeckt, das Azure-Portal prüfen:
azd monitor
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
<summary><strong>❌ Kann die bereitgestellte Anwendungs-URL nicht finden</strong></summary>

```bash
# Alle Serviceendpunkte anzeigen
azd show

# Oder das Azure-Portal öffnen
azd monitor

# Bestimmten Dienst überprüfen
azd env get-values
# Nach *_URL-Variablen suchen
```
</details>

### 📚 Vollständige Fehlerbehebungsressourcen

- **Anleitung zu häufigen Problemen:** [Detaillierte Lösungen](docs/chapter-07-troubleshooting/common-issues.md)
- **KI-spezifische Probleme:** [KI-Fehlerbehebung](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Debugging-Anleitung:** [Schritt-für-Schritt-Debugging](docs/chapter-07-troubleshooting/debugging.md)
- **Hilfe erhalten:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursabschluss & Zertifizierung

### Fortschrittsverfolgung
Verfolge deinen Lernfortschritt in jedem Kapitel:

- [ ] **Kapitel 1**: Grundlagen & Schnellstart ✅
- [ ] **Kapitel 2**: KI-zentrierte Entwicklung ✅  
- [ ] **Kapitel 3**: Konfiguration & Authentifizierung ✅
- [ ] **Kapitel 4**: Infrastruktur als Code & Bereitstellung ✅
- [ ] **Kapitel 5**: Multi-Agenten-KI-Lösungen ✅
- [ ] **Kapitel 6**: Validierung & Planung vor der Bereitstellung ✅
- [ ] **Kapitel 7**: Fehlerbehebung & Debugging ✅
- [ ] **Kapitel 8**: Produktions- & Unternehmensmuster ✅

### Lernüberprüfung
Nachdem du jedes Kapitel abgeschlossen hast, überprüfe dein Wissen durch:
1. **Praktische Übung**: Führe die praktische Bereitstellung des Kapitels durch
2. **Wissenstest**: Überprüfe den FAQ-Bereich für dein Kapitel
3. **Community-Diskussion**: Teile deine Erfahrungen im Azure Discord
4. **Nächstes Kapitel**: Gehe zum nächsten Komplexitätsniveau

### Vorteile nach Kursabschluss
Nach Abschluss aller Kapitel wirst du haben:
- **Produktions-Erfahrung**: Echte KI-Anwendungen auf Azure bereitgestellt
- **Fachliche Fähigkeiten**: Bereitstellungsfähigkeiten für den Unternehmenseinsatz  
- **Community-Anerkennung**: Aktives Mitglied der Azure-Entwickler-Community
- **Karriereförderung**: Gefragte AZD- und KI-Bereitstellungs-Expertise

---

## 🤝 Community & Unterstützung

### Hilfe & Unterstützung
- **Technische Probleme**: [Bugs melden und Features anfragen](https://github.com/microsoft/azd-for-beginners/issues)
- **Lernfragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) and [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **KI-spezifische Hilfe**: Trete dem [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) bei
- **Dokumentation**: [Offizielle Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-Einblicke aus dem Microsoft Foundry Discord

**Aktuelle Umfrageergebnisse aus dem #Azure-Kanal:**
- **45%** der Entwickler möchten AZD für KI-Workloads verwenden
- **Hauptprobleme**: Multi-Service-Bereitstellungen, Zugangsdatenverwaltung, Produktionsbereitschaft  
- **Am häufigsten angefragt**: KI-spezifische Vorlagen, Fehlerbehebungsleitfäden, bewährte Verfahren

**Tritt unserer Community bei, um:**
- Teile deine AZD + KI-Erfahrungen und erhalte Hilfe
- Erhalte frühzeitigen Zugriff auf neue KI-Vorlagen
- Trage zu Best Practices für KI-Bereitstellungen bei
- Beeinflusse die zukünftige Entwicklung von KI- + AZD-Funktionen

### Zum Kurs beitragen
Beiträge sind willkommen! Bitte lies unseren [Leitfaden für Beiträge](CONTRIBUTING.md) für Details zu:
- **Inhaltsverbesserungen**: Verbessere vorhandene Kapitel und Beispiele
- **Neue Beispiele**: Füge praxisnahe Szenarien und Vorlagen hinzu  
- **Übersetzung**: Hilf bei der Pflege der Mehrsprachunterstützung
- **Fehlerberichte**: Verbessere Genauigkeit und Klarheit
- **Community-Standards**: Befolge unsere inklusiven Community-Richtlinien

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

### Azure / Edge / MCP / Agents
[![AZD für Einsteiger](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI für Einsteiger](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP für Einsteiger](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![KI-Agenten für Einsteiger](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative AI Series
[![Generative KI für Einsteiger](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative KI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative KI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative KI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Core Learning
[![ML für Einsteiger](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science für Einsteiger](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![KI für Einsteiger](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersicherheit für Einsteiger](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-Entwicklung für Einsteiger](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT für Einsteiger](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-Entwicklung für Einsteiger](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Series
[![Copilot für KI-Paarprogrammierung](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot für C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-Abenteuer](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigation

**🚀 Bereit, mit dem Lernen zu beginnen?**

**Einsteiger**: Beginne mit [Kapitel 1: Grundlagen & Schnellstart](../..)  
**KI-Entwickler**: Springe zu [Kapitel 2: KI-zentrierte Entwicklung](../..)  
**Erfahrene Entwickler**: Beginne mit [Kapitel 3: Konfiguration & Authentifizierung](../..)

**Nächste Schritte**: [Beginne Kapitel 1 - AZD-Grundlagen](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mithilfe des KI-Übersetzungsdienstes [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ausgangssprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->