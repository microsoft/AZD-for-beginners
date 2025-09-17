<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "babd9fee2001054ecde767c9b1c85394",
  "translation_date": "2025-09-17T16:05:48+00:00",
  "source_file": "course-outline.md",
  "language_code": "de"
}
-->
## 8-Kapitel-Lernstruktur

### Kapitel 1: Grundlagen & Schnellstart (30-45 Minuten) 🌱
**Voraussetzungen**: Azure-Abonnement, grundlegende Kenntnisse der Befehlszeile  
**Komplexität**: ⭐

#### Was Sie lernen werden
- Grundlagen des Azure Developer CLI verstehen
- AZD auf Ihrer Plattform installieren  
- Ihre erste erfolgreiche Bereitstellung
- Kernkonzepte und Terminologie

#### Lernressourcen
- [AZD Grundlagen](docs/getting-started/azd-basics.md) - Kernkonzepte
- [Installation & Einrichtung](docs/getting-started/installation.md) - Plattform-spezifische Anleitungen
- [Ihr erstes Projekt](docs/getting-started/first-project.md) - Praktisches Tutorial
- [Befehlsübersicht](resources/cheat-sheet.md) - Schnelle Referenz

#### Praktisches Ergebnis
Erfolgreiche Bereitstellung einer einfachen Webanwendung auf Azure mit AZD

---

### Kapitel 2: AI-First-Entwicklung (1-2 Stunden) 🤖
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Integration der Azure AI Foundry mit AZD
- Bereitstellung von KI-gestützten Anwendungen
- Konfiguration von KI-Diensten verstehen
- RAG (Retrieval-Augmented Generation)-Muster

#### Lernressourcen
- [Integration der Azure AI Foundry](docs/ai-foundry/azure-ai-foundry-integration.md)
- [Bereitstellung von KI-Modellen](docs/ai-foundry/ai-model-deployment.md)
- [KI-Workshop-Labor](docs/ai-foundry/ai-workshop-lab.md) - Praktisches Labor
- [Azure AI Foundry Vorlagen](README.md#featured-azure-ai-foundry-templates)

#### Praktisches Ergebnis
Bereitstellung und Konfiguration einer KI-gestützten Chat-Anwendung mit RAG-Funktionen

---

### Kapitel 3: Konfiguration & Authentifizierung (45-60 Minuten) ⚙️
**Voraussetzungen**: Kapitel 1 abgeschlossen  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Konfiguration und Verwaltung von Umgebungen
- Best Practices für Authentifizierung und Sicherheit
- Ressourcenbenennung und Organisation
- Bereitstellungen in mehreren Umgebungen

#### Lernressourcen
- [Konfigurationsleitfaden](docs/getting-started/configuration.md) - Einrichtung der Umgebung
- Sicherheitsmuster und verwaltete Identität
- Beispiele für mehrere Umgebungen

#### Praktisches Ergebnis
Verwaltung mehrerer Umgebungen mit angemessener Authentifizierung und Sicherheit

---

### Kapitel 4: Infrastruktur als Code & Bereitstellung (1-1,5 Stunden) 🏗️
**Voraussetzungen**: Kapitel 1-3 abgeschlossen  
**Komplexität**: ⭐⭐⭐

#### Was Sie lernen werden
- Erweiterte Bereitstellungsmuster
- Infrastruktur als Code mit Bicep
- Strategien zur Ressourcenbereitstellung
- Erstellung benutzerdefinierter Vorlagen

#### Lernressourcen
- [Bereitstellungsleitfaden](docs/deployment/deployment-guide.md) - Komplette Workflows
- [Ressourcenbereitstellung](docs/deployment/provisioning.md) - Ressourcenmanagement
- Beispiele für Container und Microservices

#### Praktisches Ergebnis
Bereitstellung komplexer Multi-Service-Anwendungen mit benutzerdefinierten Infrastrukturvorlagen

---

### Kapitel 5: Multi-Agent-KI-Lösungen (2-3 Stunden) 🤖🤖
**Voraussetzungen**: Kapitel 1-2 abgeschlossen  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Muster für Multi-Agent-Architekturen
- Orchestrierung und Koordination von Agenten
- Produktionsreife KI-Bereitstellungen
- Implementierungen von Kunden- und Inventaragenten

#### Lernressourcen
- [Retail Multi-Agent-Lösung](examples/retail-scenario.md) - Komplette Implementierung
- [ARM-Vorlagenpaket](../../examples/retail-multiagent-arm-template) - Ein-Klick-Bereitstellung
- Muster für Multi-Agent-Koordination

#### Praktisches Ergebnis
Bereitstellung und Verwaltung einer produktionsreifen Multi-Agent-KI-Lösung

---

### Kapitel 6: Validierung & Planung vor der Bereitstellung (1 Stunde) 🔍
**Voraussetzungen**: Kapitel 4 abgeschlossen  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Kapazitätsplanung und Ressourcenvalidierung
- Strategien zur Auswahl von SKUs
- Vorabprüfungen und Automatisierung
- Kostenoptimierungsplanung

#### Lernressourcen
- [Kapazitätsplanung](docs/pre-deployment/capacity-planning.md) - Ressourcenvalidierung
- [SKU-Auswahl](docs/pre-deployment/sku-selection.md) - Kostenbewusste Entscheidungen
- [Vorabprüfungen](docs/pre-deployment/preflight-checks.md) - Automatisierte Skripte

#### Praktisches Ergebnis
Validierung und Optimierung von Bereitstellungen vor der Ausführung

---

### Kapitel 7: Fehlerbehebung & Debugging (1-1,5 Stunden) 🔧
**Voraussetzungen**: Beliebiges Bereitstellungskapitel abgeschlossen  
**Komplexität**: ⭐⭐

#### Was Sie lernen werden
- Systematische Ansätze zur Fehlerbehebung
- Häufige Probleme und Lösungen
- KI-spezifische Fehlerbehebung
- Leistungsoptimierung

#### Lernressourcen
- [Häufige Probleme](docs/troubleshooting/common-issues.md) - FAQ und Lösungen
- [Debugging-Leitfaden](docs/troubleshooting/debugging.md) - Schritt-für-Schritt-Strategien
- [KI-spezifische Fehlerbehebung](docs/troubleshooting/ai-troubleshooting.md) - Probleme mit KI-Diensten

#### Praktisches Ergebnis
Eigenständige Diagnose und Lösung häufiger Bereitstellungsprobleme

---

### Kapitel 8: Produktions- & Unternehmensmuster (2-3 Stunden) 🏢
**Voraussetzungen**: Kapitel 1-4 abgeschlossen  
**Komplexität**: ⭐⭐⭐⭐

#### Was Sie lernen werden
- Strategien für Produktionsbereitstellungen
- Sicherheitsmuster für Unternehmen
- Überwachung und Kostenoptimierung
- Skalierbarkeit und Governance

#### Lernressourcen
- [Best Practices für Produktions-KI](docs/ai-foundry/production-ai-practices.md) - Unternehmensmuster
- Beispiele für Microservices und Unternehmen
- Frameworks für Überwachung und Governance

#### Praktisches Ergebnis
Bereitstellung unternehmensreifer Anwendungen mit vollständigen Produktionsfunktionen

---

## Lernfortschritt und Komplexität

### Fortschrittlicher Kompetenzaufbau

- **🌱 Anfänger**: Starten Sie mit Kapitel 1 (Grundlagen) → Kapitel 2 (KI-Entwicklung)
- **🔧 Fortgeschrittene**: Kapitel 3-4 (Konfiguration & Infrastruktur) → Kapitel 6 (Validierung)
- **🚀 Experten**: Kapitel 5 (Multi-Agent-Lösungen) → Kapitel 7 (Fehlerbehebung)
- **🏢 Unternehmen**: Alle Kapitel abschließen, Fokus auf Kapitel 8 (Produktionsmuster)

### Komplexitätsindikatoren

- **⭐ Basis**: Einzelne Konzepte, geführte Tutorials, 30-60 Minuten
- **⭐⭐ Mittel**: Mehrere Konzepte, praktische Übungen, 1-2 Stunden  
- **⭐⭐⭐ Fortgeschritten**: Komplexe Architekturen, benutzerdefinierte Lösungen, 1-3 Stunden
- **⭐⭐⭐⭐ Experte**: Produktionssysteme, Unternehmensmuster, 2-4 Stunden

### Flexible Lernpfade

#### 🎯 KI-Entwickler-Schnellkurs (4-6 Stunden)
1. **Kapitel 1**: Grundlagen & Schnellstart (45 Minuten)
2. **Kapitel 2**: AI-First-Entwicklung (2 Stunden)  
3. **Kapitel 5**: Multi-Agent-KI-Lösungen (3 Stunden)
4. **Kapitel 8**: Best Practices für Produktions-KI (1 Stunde)

#### 🛠️ Infrastruktur-Spezialist-Pfad (5-7 Stunden)
1. **Kapitel 1**: Grundlagen & Schnellstart (45 Minuten)
2. **Kapitel 3**: Konfiguration & Authentifizierung (1 Stunde)
3. **Kapitel 4**: Infrastruktur als Code & Bereitstellung (1,5 Stunden)
4. **Kapitel 6**: Validierung & Planung vor der Bereitstellung (1 Stunde)
5. **Kapitel 7**: Fehlerbehebung & Debugging (1,5 Stunden)
6. **Kapitel 8**: Produktions- & Unternehmensmuster (2 Stunden)

#### 🎓 Komplettes Lernprogramm (8-12 Stunden)
Sequentielles Abschließen aller 8 Kapitel mit praktischen Übungen und Validierung

## Rahmenwerk für Kursabschluss

### Wissensvalidierung
- **Kapitel-Checkpoints**: Praktische Übungen mit messbaren Ergebnissen
- **Praktische Überprüfung**: Funktionierende Lösungen für jedes Kapitel bereitstellen
- **Fortschrittsverfolgung**: Visuelle Indikatoren und Abschlussabzeichen
- **Community-Validierung**: Erfahrungen in Azure Discord-Kanälen teilen

### Bewertung der Lernergebnisse

#### Abschluss Kapitel 1-2 (Grundlagen + KI)
- ✅ Bereitstellung einer einfachen Webanwendung mit AZD
- ✅ Bereitstellung einer KI-gestützten Chat-Anwendung mit RAG
- ✅ Verständnis der AZD-Kernkonzepte und KI-Integration

#### Abschluss Kapitel 3-4 (Konfiguration + Infrastruktur)  
- ✅ Verwaltung von Bereitstellungen in mehreren Umgebungen
- ✅ Erstellung benutzerdefinierter Bicep-Infrastrukturvorlagen
- ✅ Implementierung sicherer Authentifizierungsmuster

#### Abschluss Kapitel 5-6 (Multi-Agent + Validierung)
- ✅ Bereitstellung komplexer Multi-Agent-KI-Lösungen
- ✅ Durchführung von Kapazitätsplanung und Kostenoptimierung
- ✅ Implementierung automatisierter Validierung vor der Bereitstellung

#### Abschluss Kapitel 7-8 (Fehlerbehebung + Produktion)
- ✅ Eigenständige Fehlerdiagnose und -behebung  
- ✅ Implementierung unternehmensgerechter Überwachung und Sicherheit
- ✅ Bereitstellung produktionsreifer Anwendungen mit Governance

### Zertifizierung und Anerkennung
- **Kursabschluss-Abzeichen**: Abschluss aller 8 Kapitel mit praktischer Validierung
- **Community-Anerkennung**: Aktive Teilnahme an Azure AI Foundry Discord
- **Berufliche Entwicklung**: Branchenrelevante AZD- und KI-Bereitstellungsfähigkeiten
- **Karriereförderung**: Fähigkeiten für unternehmensreife Cloud-Bereitstellungen

## Inhaltseignung für moderne Entwickler

### Technische Tiefe und Abdeckung
- **Azure OpenAI-Integration**: Vollständige Abdeckung von GPT-4o, Embeddings und Multi-Modell-Bereitstellungen
- **KI-Architekturmuster**: RAG-Implementierungen, Multi-Agent-Orchestrierung und Produktions-KI-Workflows
- **Infrastruktur als Code**: Bicep-Vorlagen, ARM-Bereitstellungen und automatisierte Bereitstellung
- **Produktionsreife**: Sicherheit, Skalierung, Überwachung, Kostenoptimierung und Governance
- **Unternehmensmuster**: Bereitstellungen in mehreren Umgebungen, CI/CD-Integration und Compliance-Frameworks

### Praktischer Lernfokus
- **Automatisierung der Bereitstellung**: Schwerpunkt auf praktischen AZD-Workflows, keine theoretischen Konzepte
- **Reale Szenarien**: Komplette Retail-Multi-Agent-Lösung mit Kunden- und Inventaragenten
- **Produktionsbeispiele**: ARM-Vorlagenpakete, Ein-Klick-Bereitstellungen und Unternehmensmuster
- **Fehlerbehebungsfähigkeiten**: KI-spezifisches Debugging, Multi-Service-Diagnose und Leistungsoptimierung
- **Branchenrelevanz**: Basierend auf Feedback der Azure AI Foundry-Community und Unternehmensanforderungen

### Community- und Support-Integration
- **Discord-Integration**: Aktive Teilnahme an Azure AI Foundry und Microsoft Azure Communities
- **GitHub-Diskussionen**: Kollaboratives Lernen und Problemlösung mit Kollegen und Experten
- **Expertenzugang**: Direkte Verbindung zu Microsoft-Ingenieuren und KI-Bereitstellungsspezialisten
- **Kontinuierliche Updates**: Kursinhalte entwickeln sich mit Azure-Plattform-Updates und Community-Feedback
- **Karriereentwicklung**: Fähigkeiten direkt anwendbar für moderne Cloud- und KI-Entwicklungsrollen

### Validierung der Lernergebnisse
- **Messbare Fähigkeiten**: Jedes Kapitel enthält praktische Bereitstellungsübungen mit überprüfbaren Ergebnissen
- **Portfolioentwicklung**: Fertige Projekte, die sich für professionelle Portfolios und Vorstellungsgespräche eignen
- **Branchenanerkennung**: Fähigkeiten entsprechen den aktuellen Anforderungen des Arbeitsmarktes für AZD- und KI-Bereitstellungsexpertise
- **Professionelles Netzwerk**: Zugang zur Azure-Entwickler-Community für Karriereförderung und Zusammenarbeit

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.