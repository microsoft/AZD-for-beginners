<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "6d5c886052b605349d9219cea5f2f6a1",
  "translation_date": "2026-01-16T07:59:27+00:00",
  "source_file": "README.md",
  "language_code": "de"
}
-->
# AZD für Anfänger: Eine strukturierte Lernreise

![AZD-for-beginners](../../../../translated_images/de/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

## Erste Schritte mit diesem Kurs

Folgen Sie diesen Schritten, um Ihre AZD-Lernreise zu beginnen:

1. **Repository forken**: Klicken Sie auf [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Repository klonen**: `git clone https://github.com/microsoft/azd-for-beginners.git`
3. **Der Community beitreten**: [Azure Discord Communities](https://discord.com/invite/ByRwuEEgH4) für Expertenunterstützung
4. **Wählen Sie Ihren Lernpfad**: Wählen Sie unten ein Kapitel aus, das Ihrem Erfahrungslevel entspricht

### Mehrsprachige Unterstützung

#### Automatisierte Übersetzungen (immer aktuell)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabisch](../ar/README.md) | [Bengalisch](../bn/README.md) | [Bulgarisch](../bg/README.md) | [Birmanisch (Myanmar)](../my/README.md) | [Chinesisch (vereinfacht)](../zh/README.md) | [Chinesisch (traditionell, Hongkong)](../hk/README.md) | [Chinesisch (traditionell, Macau)](../mo/README.md) | [Chinesisch (traditionell, Taiwan)](../tw/README.md) | [Kroatisch](../hr/README.md) | [Tschechisch](../cs/README.md) | [Dänisch](../da/README.md) | [Niederländisch](../nl/README.md) | [Estnisch](../et/README.md) | [Finnisch](../fi/README.md) | [Französisch](../fr/README.md) | [Deutsch](./README.md) | [Griechisch](../el/README.md) | [Hebräisch](../he/README.md) | [Hindi](../hi/README.md) | [Ungarisch](../hu/README.md) | [Indonesisch](../id/README.md) | [Italienisch](../it/README.md) | [Japanisch](../ja/README.md) | [Kannada](../kn/README.md) | [Koreanisch](../ko/README.md) | [Litauisch](../lt/README.md) | [Malaiisch](../ms/README.md) | [Malajaladam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepalesisch](../ne/README.md) | [Nigerianisches Pidgin](../pcm/README.md) | [Norwegisch](../no/README.md) | [Persisch (Farsi)](../fa/README.md) | [Polnisch](../pl/README.md) | [Portugiesisch (Brasilien)](../br/README.md) | [Portugiesisch (Portugal)](../pt/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumänisch](../ro/README.md) | [Russisch](../ru/README.md) | [Serbisch (Kyrillisch)](../sr/README.md) | [Slowakisch](../sk/README.md) | [Slowenisch](../sl/README.md) | [Spanisch](../es/README.md) | [Swahili](../sw/README.md) | [Schwedisch](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thailändisch](../th/README.md) | [Türkisch](../tr/README.md) | [Ukrainisch](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamesisch](../vi/README.md)

> **Möchten Sie lieber lokal klonen?**

> Dieses Repository enthält über 50 Sprachübersetzungen, was die Downloadgröße erheblich erhöht. Um ohne Übersetzungen zu klonen, verwenden Sie Sparse Checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> So erhalten Sie alles, was Sie für den Kurs benötigen, mit deutlich schnellerem Download.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## Kursübersicht

Beherrschen Sie die Azure Developer CLI (azd) durch strukturierte Kapitel, die für progressives Lernen entwickelt wurden. **Besonderer Fokus auf die Bereitstellung von KI-Anwendungen mit Microsoft Foundry-Integration.**

### Warum dieser Kurs für moderne Entwickler unerlässlich ist

Basierend auf Erkenntnissen der Microsoft Foundry Discord-Community möchten **45 % der Entwickler AZD für KI-Workloads verwenden**, stoßen jedoch auf Herausforderungen bei:
- Komplexen Multi-Service-KI-Architekturen
- Best Practices für die Produktion von KI-Deployments  
- Azure KI-Dienstintegration und -Konfiguration
- Kostenoptimierung für KI-Workloads
- Fehlerbehebung bei KI-spezifischen Deployment-Problemen

### Lernziele

Mit Abschluss dieses strukturierten Kurses werden Sie:
- **AZD-Grundlagen meistern**: Kernkonzepte, Installation und Konfiguration
- **KI-Anwendungen bereitstellen**: AZD mit Microsoft Foundry-Diensten verwenden
- **Infrastruktur als Code implementieren**: Azure-Ressourcen mit Bicep-Vorlagen verwalten
- **Deployments debuggen**: Häufige Probleme lösen und Fehler beheben
- **Für die Produktion optimieren**: Sicherheit, Skalierung, Überwachung und Kostenmanagement
- **Multi-Agent-Lösungen bauen**: Komplexe KI-Architekturen bereitstellen

## 📚 Lernkapitel

*Wählen Sie Ihren Lernpfad basierend auf Erfahrung und Zielen*

### 🚀 Kapitel 1: Grundlagen & Schnellstart
**Voraussetzungen**: Azure-Abonnement, Grundkenntnisse an der Kommandozeile  
**Dauer**: 30-45 Minuten  
**Komplexität**: ⭐

#### Was Sie lernen werden
- Grundlagen der Azure Developer CLI verstehen
- AZD auf Ihrer Plattform installieren
- Ihre erste erfolgreiche Bereitstellung

#### Lernressourcen
- **🎯 Startpunkt**: [Was ist Azure Developer CLI?](../..)
- **📖 Theorie**: [AZD-Grundlagen](docs/getting-started/azd-basics.md) – Kernkonzepte und Terminologie
- **⚙️ Einrichtung**: [Installation & Setup](docs/getting-started/installation.md) – Plattform-spezifische Anleitungen
- **🛠️ Praxis**: [Ihr erstes Projekt](docs/getting-started/first-project.md) – Schritt-für-Schritt-Tutorial
- **📋 Schneller Überblick**: [Befehlsreferenz](resources/cheat-sheet.md)

#### Praktische Übungen
```bash
# Schnelle Installationsüberprüfung
azd version

# Bereitstellen Ihrer ersten Anwendung
azd init --template todo-nodejs-mongo
azd up
```

**💡 Ziel des Kapitels**: Erfolgreiche Bereitstellung einer einfachen Webanwendung auf Azure mit AZD

**✅ Erfolgskontrolle:**
```bash
# Nach Abschluss von Kapitel 1 sollten Sie in der Lage sein:
azd version              # Zeigt die installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert das Projekt
azd up                  # Stellt auf Azure bereit
azd show                # Zeigt die URL der laufenden App an
# Anwendung öffnet sich im Browser und funktioniert
azd down --force --purge  # Bereinigt Ressourcen
```

**📊 Zeitaufwand:** 30-45 Minuten  
**📈 Fertigkeitslevel danach:** Kann einfache Anwendungen eigenständig bereitstellen

**✅ Erfolgskontrolle:**
```bash
# Nach Abschluss von Kapitel 1 sollten Sie in der Lage sein:
azd version              # Zeigt installierte Version an
azd init --template todo-nodejs-mongo  # Initialisiert Projekt
azd up                  # Stellt auf Azure bereit
azd show                # Zeigt URL der laufenden App an
# Anwendung öffnet sich im Browser und funktioniert
azd down --force --purge  # Bereinigt Ressourcen
```

**📊 Zeitaufwand:** 30-45 Minuten  
**📈 Fertigkeitslevel danach:** Kann einfache Anwendungen eigenständig bereitstellen

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
- **🎯 Startpunkt**: [Microsoft Foundry Integration](docs/microsoft-foundry/microsoft-foundry-integration.md)
- **📖 Muster**: [Bereitstellung von KI-Modellen](docs/microsoft-foundry/ai-model-deployment.md) – KI-Modelle bereitstellen und verwalten
- **🛠️ Workshop**: [KI-Workshop-Labor](docs/microsoft-foundry/ai-workshop-lab.md) – Machen Sie Ihre KI-Lösungen AZD-bereit
- **🎥 Interaktiver Leitfaden**: [Workshop Materialien](workshop/README.md) – Browserbasiertes Lernen mit MkDocs * DevContainer Environment
- **📋 Vorlagen**: [Microsoft Foundry Templates](../..)
- **📝 Beispiele**: [AZD Deployment Beispiele](examples/README.md)

#### Praktische Übungen
```bash
# Stellen Sie Ihre erste KI-Anwendung bereit
azd init --template azure-search-openai-demo
azd up

# Probieren Sie weitere KI-Vorlagen aus
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Ziel des Kapitels**: Bereitstellung und Konfiguration einer KI-gestützten Chat-Anwendung mit RAG-Funktionen

**✅ Erfolgskontrolle:**
```bash
# Nach Kapitel 2 solltest du in der Lage sein:
azd init --template azure-search-openai-demo
azd up
# Die KI-Chat-Schnittstelle zu testen
# Fragen zu stellen und KI-gestützte Antworten mit Quellen zu erhalten
# Die Suchintegration zu überprüfen
azd monitor  # Zu überprüfen, ob Application Insights Telemetrie anzeigt
azd down --force --purge
```

**📊 Zeitaufwand:** 1-2 Stunden  
**📈 Fertigkeitslevel danach:** Kann produktionsreife KI-Anwendungen bereitstellen und konfigurieren  
**💰 Kostenbewusstsein:** Kenntnis von $80-150/Monat Entwicklungskosten, $300-3500/Monat Produktionskosten

#### 💰 Kostenüberlegungen für KI-Deployments

**Entwicklungsumgebung (geschätzt $80-150/Monat):**
- Azure OpenAI (Pay-as-you-go): $0-50/Monat (abhängig von der Token-Nutzung)
- KI-Suche (Basisstufe): $75/Monat
- Container Apps (Verbrauchsmodell): $0-20/Monat
- Speicher (Standard): $1-5/Monat

**Produktionsumgebung (geschätzt $300-3.500+/Monat):**
- Azure OpenAI (PTU für konsistente Leistung): $3.000+/Monat ODER Pay-as-you-go bei hohem Volumen
- KI-Suche (Standardstufe): $250/Monat
- Container Apps (dediziert): $50-100/Monat
- Application Insights: $5-50/Monat
- Speicher (Premium): $10-50/Monat

**💡 Tipps zur Kostenoptimierung:**
- Verwenden Sie die **kostenlose Stufe** von Azure OpenAI zum Lernen (50.000 Tokens/Monat inklusive)
- Führen Sie `azd down` aus, um Ressourcen bei Nichtbenutzung freizugeben
- Beginnen Sie mit Abrechnung nach Verbrauch, PTU nur für Produktion nutzen
- Verwenden Sie `azd provision --preview`, um Kosten vor der Bereitstellung abzuschätzen
- Auto-Skalierung aktivieren: Bezahlen Sie nur die tatsächliche Nutzung

**Kostenüberwachung:**
```bash
# Geschätzte monatliche Kosten überprüfen
azd provision --preview

# Aktuelle Kosten im Azure-Portal überwachen
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Kapitel 3: Konfiguration & Authentifizierung
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Dauer**: 45-60 Minuten  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Umweltkonfiguration und Management
- Authentifizierungs- und Sicherheitsbest Practices
- Benennung und Organisation von Ressourcen

#### Lernressourcen
- **📖 Konfiguration**: [Konfigurationsanleitung](docs/getting-started/configuration.md) – Einrichtung der Umgebung
- **🔐 Sicherheit**: [Authentifizierungsmuster und Managed Identity](docs/getting-started/authsecurity.md) – Authentifizierungsmuster
- **📝 Beispiele**: [Datenbank-App-Beispiel](examples/database-app/README.md) – AZD-Datenbank-Beispiele

#### Praktische Übungen
- Konfigurieren mehrerer Umgebungen (dev, staging, prod)
- Einrichtung der Managed Identity Authentifizierung
- Implementierung umgebungsspezifischer Konfigurationen

**💡 Ziel des Kapitels**: Verwaltet mehrere Umgebungen mit korrekter Authentifizierung und Sicherheit

---

### 🏗️ Kapitel 4: Infrastruktur als Code & Deployment
**Voraussetzungen**: Kapitel 1-3 abgeschlossen  
**Dauer**: 1-1,5 Stunden  
**Komplexität**: ⭐⭐⭐

#### Was Sie lernen werden
- Erweiterte Deployment-Muster
- Infrastruktur als Code mit Bicep
- Strategien zur Ressourcenbereitstellung

#### Lernressourcen
- **📖 Deployment**: [Deployment-Anleitung](docs/deployment/deployment-guide.md) – vollständige Workflows
- **🏗️ Bereitstellung**: [Bereitstellung von Ressourcen](docs/deployment/provisioning.md) – Azure-Ressourcenverwaltung
- **📝 Beispiele**: [Container-App-Beispiel](../../examples/container-app) – containerisierte Deployments

#### Praktische Übungen
- Eigene Bicep-Vorlagen erstellen
- Multi-Service-Anwendungen bereitstellen
- Blue-Green-Deployment-Strategien implementieren

**💡 Ziel des Kapitels**: Komplexe Multi-Service-Anwendungen mit individuellen Infrastruktur-Vorlagen bereitstellen

---

### 🎯 Kapitel 5: Multi-Agent KI-Lösungen (Fortgeschritten)
**Voraussetzungen**: Kapitel 1-2 abgeschlossen  
**Dauer**: 2-3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Multi-Agent-Architektur-Muster

- Agenten-Orchestrierung und Koordination  
- Produktionsreife KI-Bereitstellungen

#### Lernressourcen
- **🤖 Vorgestelltes Projekt**: [Retail Multi-Agent Solution](examples/retail-scenario.md) – Komplette Implementierung  
- **🛠️ ARM-Vorlagen**: [ARM Template Package](../../examples/retail-multiagent-arm-template) – One-Click-Bereitstellung  
- **📖 Architektur**: [Multi-Agenten-Koordinationsmuster](/docs/pre-deployment/coordination-patterns.md) – Muster

#### Praktische Übungen
```bash
# Setzen Sie die vollständige Multi-Agenten-Lösung für den Einzelhandel ein
cd examples/retail-multiagent-arm-template
./deploy.sh

# Erforschen Sie Agentenkonfigurationen
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Kapitelziel**: Bereitstellung und Verwaltung einer produktionsreifen Multi-Agenten-KI-Lösung mit Kunden- und Lageragenten

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
- **📊 Planung**: [Kapazitätsplanung](docs/pre-deployment/capacity-planning.md) – Ressourcenvalidierung  
- **💰 Auswahl**: [SKU-Auswahl](docs/pre-deployment/sku-selection.md) – Kosteneffiziente Entscheidungen  
- **✅ Validierung**: [Pre-Flight-Checks](docs/pre-deployment/preflight-checks.md) – Automatisierte Skripte

#### Praktische Übungen
- Ausführen von Kapazitätsvalidierungsskripten  
- Optimieren der SKU-Auswahl hinsichtlich Kosten  
- Implementierung automatisierter Pre-Deployment-Checks

**💡 Kapitelziel**: Validierung und Optimierung der Bereitstellung vor deren Durchführung

---

### 🚨 Kapitel 7: Fehlerbehebung & Debugging  
**Voraussetzungen**: Beliebiges Bereitstellungskapitel abgeschlossen  
**Dauer**: 1–1,5 Stunden  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Systematische Debugging-Methoden  
- Häufige Probleme und deren Lösungen  
- KI-spezifische Fehlerbehebung

#### Lernressourcen
- **🔧 Häufige Probleme**: [Häufige Probleme](docs/troubleshooting/common-issues.md) – FAQ und Lösungen  
- **🕵️ Debugging**: [Debugging-Anleitung](docs/troubleshooting/debugging.md) – Schritt-für-Schritt-Strategien  
- **🤖 KI-Probleme**: [KI-spezifische Fehlerbehebung](docs/troubleshooting/ai-troubleshooting.md) – KI-Dienstprobleme

#### Praktische Übungen
- Diagnose von Bereitstellungsfehlern  
- Behebung von Authentifizierungsproblemen  
- Debugging der KI-Dienst-Konnektivität

**💡 Kapitelziel**: Selbstständiges Diagnostizieren und Beheben typischer Bereitstellungsprobleme

---

### 🏢 Kapitel 8: Produktions- & Enterprise-Muster  
**Voraussetzungen**: Kapitel 1–4 abgeschlossen  
**Dauer**: 2–3 Stunden  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Strategien für Produktionsbereitstellung  
- Sicherheitspatterns für Unternehmen  
- Überwachung und Kostenoptimierung

#### Lernressourcen
- **🏭 Produktion**: [Produktionsorientierte KI Best Practices](docs/microsoft-foundry/production-ai-practices.md) – Enterprise Muster  
- **📝 Beispiele**: [Microservices-Beispiel](../../examples/microservices) – Komplexe Architekturen  
- **📊 Überwachung**: [Application Insights-Integration](docs/pre-deployment/application-insights.md) – Monitoring

#### Praktische Übungen
- Implementierung von Enterprise-Sicherheitsmustern  
- Einrichtung umfassender Überwachung  
- Produktionsbereitstellung mit ordnungsgemäßer Governance

**💡 Kapitelziel**: Bereitstellung von unternehmensreifen Anwendungen mit vollständigen Produktionsfähigkeiten

---

## 🎓 Workshop-Übersicht: Praxisorientiertes Lernerlebnis

> **⚠️ WORKSHOP-STATUS: Aktive Entwicklung**  
> Die Workshop-Materialien werden gerade entwickelt und verfeinert. Kernmodule sind funktional, aber einige fortgeschrittene Abschnitte sind noch unvollständig. Wir arbeiten aktiv daran, alle Inhalte abzuschließen. [Fortschritt verfolgen →](workshop/README.md)

### Interaktive Workshop-Materialien  
**Umfassendes, praxisorientiertes Lernen mit browserbasierten Tools und geführten Übungen**

Unsere Workshop-Materialien bieten ein strukturiertes, interaktives Lernerlebnis, das den oben beschriebenen kapitelbasierten Lehrplan ergänzt. Der Workshop ist sowohl für selbstständiges Lernen als auch für geleitete Kurse konzipiert.

#### 🛠️ Workshop-Funktionen
- **Browser-basierte Oberfläche:** Vollständiger MkDocs-basierter Workshop mit Such-, Kopier- und Themenfunktionen  
- **GitHub Codespaces Integration:** One-Click-Einrichtung der Entwicklungsumgebung  
- **Strukturierter Lernpfad:** 7-stufige geführte Übungen (insgesamt 3,5 Stunden)  
- **Discovery → Deployment → Customization:** Progressives Methodikmodell  
- **Interaktive DevContainer-Umgebung:** Vorgefertigte Tools und Abhängigkeiten

#### 📚 Workshop-Struktur  
Der Workshop folgt der Methodik **Discovery → Deployment → Customization**:

1. **Discovery-Phase** (45 Minuten)  
   - Erforschung von Microsoft Foundry-Vorlagen und Diensten  
   - Verständnis von Multi-Agenten-Architekturmustern  
   - Überprüfung von Bereitstellungsanforderungen und Voraussetzungen

2. **Deployment-Phase** (2 Stunden)  
   - Praktische Bereitstellung von KI-Anwendungen mit AZD  
   - Konfiguration von Azure KI-Diensten und Endpunkten  
   - Implementierung von Sicherheits- und Authentifizierungsmustern

3. **Customization-Phase** (45 Minuten)  
   - Anpassung von Anwendungen für spezifische Anwendungsfälle  
   - Optimierung für Produktionsbereitstellung  
   - Implementierung von Monitoring und Kostenmanagement

#### 🚀 Einstieg in den Workshop  
```bash
# Option 1: GitHub Codespaces (Empfohlen)
# Klicken Sie im Repository auf "Code" → "Codespace auf main erstellen"

# Option 2: Lokale Entwicklung
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Folgen Sie den Einrichtungsanweisungen in workshop/README.md
```
  
#### 🎯 Workshop-Lernergebnisse  
Nach Abschluss des Workshops werden die Teilnehmenden in der Lage sein:  
- **Produktionsreife KI-Anwendungen bereitzustellen**: Verwendung von AZD mit Microsoft Foundry-Diensten  
- **Multi-Agenten-Architekturen zu meistern**: Implementierung koordinierter KI-Agenten-Lösungen  
- **Sicherheits-Best Practices anzuwenden**: Konfiguration von Authentifizierung und Zugriffskontrolle  
- **Für Skalierung zu optimieren**: Design von kosteneffizienten, leistungsfähigen Bereitstellungen  
- **Bereitstellungen zu debuggen**: Selbstständiges Lösen häufiger Probleme

#### 📖 Workshop-Ressourcen  
- **🎥 Interaktiver Leitfaden**: [Workshop-Materialien](workshop/README.md) – browsergestützte Lernumgebung  
- **📋 Schritt-für-Schritt-Anleitungen**: [Geführte Übungen](../../workshop/docs/instructions) – Detaillierte Durchläufe  
- **🛠️ AI Workshop Lab**: [AI Workshop Lab](docs/microsoft-foundry/ai-workshop-lab.md) – KI-zentrierte Übungen  
- **💡 Schnellstart**: [Workshop-Setup-Guide](workshop/README.md#quick-start) – Umgebungs-Konfiguration

**Perfekt für**: Firmen-Schulungen, Universitätskurse, eigenständiges Lernen und Entwickler-Bootcamps.

---

## 📖 Was ist Azure Developer CLI?

Azure Developer CLI (azd) ist eine Entwickler-fokussierte Kommandozeilenschnittstelle, die den Prozess des Erstellens und Bereitstellens von Anwendungen in Azure beschleunigt. Sie bietet:

- **Vorlagenbasierte Bereitstellungen** – Verwendung vordefinierter Vorlagen für gängige Anwendungsmuster  
- **Infrastructure as Code** – Verwaltung von Azure-Ressourcen mit Bicep oder Terraform  
- **Integrierte Workflows** – Nahtlose Bereitstellung, Verwaltung und Überwachung von Anwendungen  
- **Entwicklerfreundlich** – Optimiert für Produktivität und Nutzererfahrung von Entwicklern

### **AZD + Microsoft Foundry: Perfekt für KI-Bereitstellungen**

**Warum AZD für KI-Lösungen?** AZD adressiert die wichtigsten Herausforderungen, denen KI-Entwickler gegenüberstehen:

- **KI-fertige Vorlagen** – Vorgefertigte Vorlagen für Azure OpenAI, Cognitive Services und ML-Workloads  
- **Sichere KI-Bereitstellungen** – Eingebaute Sicherheitsmuster für KI-Dienste, API-Schlüssel und Modellendpunkte  
- **Produktionsreife KI-Pattern** – Best Practices für skalierbare, kosteneffiziente KI-Anwendungsbereitstellungen  
- **End-to-End KI-Workflows** – Vom Modell-Training bis zur Produktionsbereitstellung mit umfassendem Monitoring  
- **Kostenoptimierung** – Intelligente Ressourcenzuweisung und Skalierung für KI-Workloads  
- **Microsoft Foundry Integration** – Nahtlose Verbindung zu Microsoft Foundry Modulkatalog und Endpunkten

---

## 🎯 Vorlagen- & Beispielbibliothek

### Vorgestellt: Microsoft Foundry Vorlagen  
**Hier starten, wenn Sie KI-Anwendungen bereitstellen!**

> **Hinweis:** Diese Vorlagen demonstrieren verschiedene KI-Muster. Einige sind externe Azure Samples, andere lokale Implementierungen.

| Vorlage | Kapitel | Komplexität | Dienste | Typ |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Kapitel 2 | ⭐⭐ | Azure AI Agent Service + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights | Extern |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Extern |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Extern |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Extern |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Extern |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokal** |

### Vorgestellt: Komplette Lern-Szenarien  
**Produktionsreife Anwendungsvorlagen, zugeordnet zu Lernkapiteln**

| Vorlage | Lernkapitel | Komplexität | Wichtigste Lerninhalte |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Kapitel 2 | ⭐ | Grundlegende KI-Bereitstellungsmuster |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Kapitel 2 | ⭐⭐ | RAG-Implementierung mit Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Kapitel 4 | ⭐⭐ | Dokumentenintelligenz-Integration |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Kapitel 5 | ⭐⭐⭐ | Agent Framework und Funktionsaufrufe |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Kapitel 8 | ⭐⭐⭐ | Enterprise KI-Orchestrierung |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Kapitel 5 | ⭐⭐⭐⭐ | Multi-Agenten-Architektur mit Kunden- und Lageragenten |

### Lernen nach Beispieltyp

> **📌 Lokale vs. externe Beispiele:**  
> **Lokale Beispiele** (in diesem Repo) = sofort einsatzbereit  
> **Externe Beispiele** (Azure Samples) = aus verlinkten Repositories klonen

#### Lokale Beispiele (sofort einsatzbereit)  
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) – Komplette produktionsreife Implementierung mit ARM-Vorlagen  
  - Multi-Agenten-Architektur (Kunden- + Lageragenten)  
  - Umfassendes Monitoring und Evaluierung  
  - One-Click-Bereitstellung per ARM-Vorlage

#### Lokale Beispiele – Container-Anwendungen (Kapitel 2–5)  
**Umfassende Beispiele zur Container-Bereitstellung in diesem Repository:**  
- [**Container App Beispiele**](examples/container-app/README.md) – Komplettanleitung für containerisierte Bereitstellungen  
  - [Einfache Flask-API](../../examples/container-app/simple-flask-api) – Basis-REST-API mit Scale-to-Zero  
  - [Microservices-Architektur](../../examples/container-app/microservices) – Produktionsreife Multi-Service-Bereitstellung  
  - Schnellstart-, Produktions- und erweiterte Bereitstellungsmuster  
  - Leitfäden zu Monitoring, Sicherheit und Kostenoptimierung

#### Externe Beispiele – Einfache Anwendungen (Kapitel 1–2)  
**Diese Azure-Samples-Repositories klonen, um zu starten:**  
- [Einfache Web App – Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) – Grundlegende Bereitstellungsmuster  
- [Statische Webseite – React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) – Statische Inhaltsbereitstellung  
- [Container App – Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) – REST API-Bereitstellung

#### Externe Beispiele – Datenbank-Integration (Kapitel 3–4)  
- [Datenbank-App – C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) – Datenbank-Konnektivitätsmuster  
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) – Serverless Datenworkflows

#### Externe Beispiele – Erweiterte Muster (Kapitel 4–8)  
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) – Multi-Service-Architekturen  
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) – Hintergrundverarbeitung  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) – Produktionsreife ML-Muster

### Externe Vorlagen-Sammlungen  
- [**Offizielle AZD Template Galerie**](https://azure.github.io/awesome-azd/) – Kuratierte Sammlung offizieller und Community-Vorlagen  
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) – Microsoft Learn Template-Dokumentation
- [**Beispielverzeichnis**](examples/README.md) - Lokale Lernbeispiele mit ausführlichen Erklärungen

---

## 📚 Lernressourcen & Referenzen

### Schnellübersichten
- [**Befehls-Übersicht**](resources/cheat-sheet.md) - Wichtige azd-Befehle nach Kapiteln geordnet
- [**Glossar**](resources/glossary.md) - Azure- und azd-Terminologie  
- [**FAQ**](resources/faq.md) - Häufige Fragen nach Lernkapitel geordnet
- [**Studienleitfaden**](resources/study-guide.md) - Umfassende Übungsaufgaben

### Praktische Workshops
- [**KI-Workshop-Lab**](docs/microsoft-foundry/ai-workshop-lab.md) - Machen Sie Ihre KI-Lösungen AZD-bereit (2-3 Stunden)
- [**Interaktiver Workshop-Leitfaden**](workshop/README.md) - Browserbasierter Workshop mit MkDocs und DevContainer-Umgebung
- [**Strukturierter Lernpfad**](../../workshop/docs/instructions) - 7-stufige geführte Übungen (Entdeckung → Bereitstellung → Anpassung)
- [**AZD Für Einsteiger Workshop**](workshop/README.md) - Vollständige Workshop-Materialien mit GitHub Codespaces Integration

### Externe Lernressourcen
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Preisrechner](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Schnelle Fehlerbehebungs-Anleitung

**Häufige Probleme bei Anfängern und sofortige Lösungen:**

### ❌ "azd: Befehl nicht gefunden"

```bash
# Installieren Sie zuerst AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Überprüfen Sie die Installation
azd version
```

### ❌ "Keine Abonnements gefunden" oder "Abonnement nicht gesetzt"

```bash
# Verfügbare Abonnements auflisten
az account list --output table

# Standardsubskription festlegen
az account set --subscription "<subscription-id-or-name>"

# Für AZD-Umgebung einstellen
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Überprüfen
az account show
```

### ❌ "Unzureichendes Kontingent" oder "Kontingent überschritten"

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

### ❌ "azd up" schlägt mitten im Vorgang fehl

```bash
# Option 1: Bereinigen und erneut versuchen
azd down --force --purge
azd up

# Option 2: Nur Infrastruktur reparieren
azd provision

# Option 3: Detaillierte Protokolle überprüfen
azd show
azd logs
```

### ❌ "Authentifizierung fehlgeschlagen" oder "Token abgelaufen"

```bash
# Erneut authentifizieren
az logout
az login

azd auth logout
azd auth login

# Authentifizierung überprüfen
az account show
```

### ❌ "Ressource existiert bereits" oder Namenskonflikte

```bash
# AZD generiert eindeutige Namen, aber bei Konflikten:
azd down --force --purge

# Dann erneut mit einer frischen Umgebung versuchen
azd env new dev-v2
azd up
```

### ❌ Vorlagenbereitstellung dauert zu lange

**Normale Wartezeiten:**
- Einfache Web-App: 5-10 Minuten
- App mit Datenbank: 10-15 Minuten
- KI-Anwendungen: 15-25 Minuten (OpenAI Bereitstellung ist langsam)

```bash
# Fortschritt prüfen
azd show

# Wenn mehr als 30 Minuten keine Fortschritte, Portal Azure prüfen:
azd monitor
# Nach fehlgeschlagenen Bereitstellungen suchen
```

### ❌ "Zugriff verweigert" oder "Verboten"

```bash
# Überprüfen Sie Ihre Azure-Rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sie benötigen mindestens die Rolle "Mitwirkender"
# Bitten Sie Ihren Azure-Administrator, zu gewähren:
# - Mitwirkender (für Ressourcen)
# - Benutzerzugriffsadministrator (für Rollenzuweisungen)
```

### ❌ Kann die URL der bereitgestellten Anwendung nicht finden

```bash
# Alle Dienstendpunkte anzeigen
azd show

# Oder Azure-Portal öffnen
azd monitor

# Bestimmten Dienst überprüfen
azd env get-values
# Nach *_URL-Variablen suchen
```

### 📚 Vollständige Fehlerbehebungs-Ressourcen

- **Leitfaden zu häufigen Problemen:** [Ausführliche Lösungen](docs/troubleshooting/common-issues.md)
- **KI-spezifische Probleme:** [KI-Fehlerbehebung](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging-Leitfaden:** [Schritt-für-Schritt-Debugging](docs/troubleshooting/debugging.md)
- **Hilfe erhalten:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🔧 Schnelle Fehlerbehebungs-Anleitung

**Häufige Probleme bei Anfängern und sofortige Lösungen:**

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
<summary><strong>❌ "Keine Abonnements gefunden" oder "Abonnement nicht gesetzt"</strong></summary>

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
# Probieren Sie verschiedene Azure-Regionen aus
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

# Option 3: Detaillierte Protokolle prüfen
azd show
azd logs
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
# AZD generiert einzigartige Namen, aber im Falle eines Konflikts:
azd down --force --purge

# Dann erneut mit einer neuen Umgebung versuchen
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Vorlagenbereitstellung dauert zu lange</strong></summary>

**Normale Wartezeiten:**
- Einfache Web-App: 5-10 Minuten
- App mit Datenbank: 10-15 Minuten
- KI-Anwendungen: 15-25 Minuten (OpenAI Bereitstellung ist langsam)

```bash
# Fortschritt überprüfen
azd show

# Wenn Sie länger als 30 Minuten feststecken, überprüfen Sie das Azure-Portal:
azd monitor
# Nach fehlgeschlagenen Bereitstellungen suchen
```
</details>

<details>
<summary><strong>❌ "Zugriff verweigert" oder "Verboten"</strong></summary>

```bash
# Überprüfen Sie Ihre Azure-Rolle
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Sie benötigen mindestens die Rolle "Mitwirkender"
# Bitten Sie Ihren Azure-Administrator um folgende Berechtigungen:
# - Mitwirkender (für Ressourcen)
# - Benutzerzugriffsadministrator (für Rollenzuweisungen)
```
</details>

<details>
<summary><strong>❌ Kann die URL der bereitgestellten Anwendung nicht finden</strong></summary>

```bash
# Alle Service-Endpunkte anzeigen
azd show

# Oder Azure-Portal öffnen
azd monitor

# Spezifischen Service überprüfen
azd env get-values
# Nach *_URL Variablen suchen
```
</details>

### 📚 Vollständige Fehlerbehebungs-Ressourcen

- **Leitfaden zu häufigen Problemen:** [Ausführliche Lösungen](docs/troubleshooting/common-issues.md)
- **KI-spezifische Probleme:** [KI-Fehlerbehebung](docs/troubleshooting/ai-troubleshooting.md)
- **Debugging-Leitfaden:** [Schritt-für-Schritt-Debugging](docs/troubleshooting/debugging.md)
- **Hilfe erhalten:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kursabschluss & Zertifizierung

### Fortschrittsverfolgung
Verfolge deinen Lernfortschritt durch jedes Kapitel:

- [ ] **Kapitel 1**: Grundlagen & Schnellstart ✅
- [ ] **Kapitel 2**: AI-First Entwicklung ✅  
- [ ] **Kapitel 3**: Konfiguration & Authentifizierung ✅
- [ ] **Kapitel 4**: Infrastructure as Code & Bereitstellung ✅
- [ ] **Kapitel 5**: Multi-Agent KI-Lösungen ✅
- [ ] **Kapitel 6**: Validierung & Planung vor Bereitstellung ✅
- [ ] **Kapitel 7**: Fehlerbehebung & Debugging ✅
- [ ] **Kapitel 8**: Produktion & Enterprise-Muster ✅

### Lernüberprüfung
Nach Abschluss jedes Kapitels überprüfe dein Wissen durch:
1. **Praxisübung**: Komplettiere die praktische Bereitstellung des Kapitels
2. **Wissenscheck**: Sieh dir den FAQ-Bereich für dein Kapitel an
3. **Community-Diskussion**: Teile deine Erfahrungen im Azure Discord
4. **Nächstes Kapitel**: Wechsle zum nächsten Komplexitätslevel

### Vorteile beim Kursabschluss
Nach Abschluss aller Kapitel hast du:
- **Produktionserfahrung**: Echtzeit-KI-Anwendungen in Azure bereitgestellt
- **Fachkompetenz**: Einsatzbereite Enterprise-Bereitstellungsfähigkeiten  
- **Community-Anerkennung**: Aktives Mitglied der Azure-Entwickler-Community
- **Karrierefortschritt**: Gefragte AZD- und KI-Bereitstellungskompetenz

---

## 🤝 Community & Support

### Hilfe & Unterstützung erhalten
- **Technische Probleme**: [Fehler melden und Funktionen anfragen](https://github.com/microsoft/azd-for-beginners/issues)
- **Lernfragen**: [Microsoft Azure Discord Community](https://discord.gg/microsoft-azure) und [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **KI-spezifische Hilfe**: Tritt dem [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG) bei
- **Dokumentation**: [Offizielle Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Community-Einblicke vom Microsoft Foundry Discord

**Aktuelle Umfrageergebnisse vom #Azure-Kanal:**
- **45%** der Entwickler wollen AZD für KI-Arbeitslasten nutzen
- **Hauptprobleme**: Multi-Service-Bereitstellungen, Anmeldeinformationen-Verwaltung, Produktionsreife  
- **Am meisten gewünscht**: KI-spezifische Vorlagen, Fehlerbehebungsleitfäden, Best Practices

**Werde Mitglied unserer Community und:**
- Teile deine AZD + KI-Erfahrungen und hole dir Hilfe
- Greife auf frühe Vorschauen neuer KI-Vorlagen zu
- Trage zu Best Practices für KI-Bereitstellung bei
- Beeinflusse die zukünftige Entwicklung von KI + AZD Features

### Beitrag zum Kurs leisten
Wir freuen uns über Beiträge! Bitte lies unseren [Beitragsleitfaden](CONTRIBUTING.md) für Details zu:
- **Inhaltsverbesserungen**: Bestehende Kapitel und Beispiele verbessern
- **Neue Beispiele**: Realwelt-Szenarien und Vorlagen hinzufügen  
- **Übersetzung**: Mehrsprachige Unterstützung pflegen
- **Fehlerberichte**: Genauigkeit und Klarheit verbessern
- **Community-Standards**: Unsere inklusiven Community-Richtlinien beachten

---

## 📄 Kursinformationen

### Lizenz
Dieses Projekt ist unter der MIT-Lizenz lizenziert - siehe die [LICENSE](../../LICENSE) Datei für Details.

### Verwandte Microsoft Lernressourcen

Unser Team produziert weitere umfassende Lernkurse:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j für Einsteiger](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js für Einsteiger](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)

---

### Azure / Edge / MCP / Agenten
[![AZD für Einsteiger](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge KI für Einsteiger](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP für Einsteiger](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![KI-Agenten für Einsteiger](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generative KI Serie
[![Generative KI für Einsteiger](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generative KI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generative KI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative KI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Kernlernangebote
[![ML für Einsteiger](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Datenwissenschaft für Einsteiger](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![KI für Anfänger](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersicherheit für Anfänger](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-Entwicklung für Anfänger](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT für Anfänger](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-Entwicklung für Anfänger](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-Serie
[![Copilot für KI-Paarprogrammierung](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot für C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-Abenteuer](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Kursnavigation

**🚀 Bereit zum Lernen?**

**Anfänger**: Beginnen Sie mit [Kapitel 1: Grundlagen & Schnellstart](../..)  
**KI-Entwickler**: Springen Sie zu [Kapitel 2: KI-zentrierte Entwicklung](../..)  
**Erfahrene Entwickler**: Starten Sie mit [Kapitel 3: Konfiguration & Authentifizierung](../..)

**Nächste Schritte**: [Beginnen Sie Kapitel 1 - AZD Grundlagen](docs/getting-started/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir um Genauigkeit bemüht sind, kann es bei automatischen Übersetzungen zu Fehlern oder Ungenauigkeiten kommen. Das Originaldokument in seiner Ursprungssprache gilt als verbindliche Quelle. Für wichtige Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die durch die Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->