<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-17T16:15:00+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "de"
}
-->
# Studienleitfaden - Umfassende Lernziele

**Navigation des Lernpfads**
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)
- **📖 Lernen starten**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: [Kursabschluss](../README.md#-course-completion--certification)

## Einführung

Dieser umfassende Studienleitfaden bietet strukturierte Lernziele, Schlüsselkonzepte, Übungsaufgaben und Bewertungsmaterialien, um Ihnen zu helfen, die Azure Developer CLI (azd) zu meistern. Nutzen Sie diesen Leitfaden, um Ihren Fortschritt zu verfolgen und sicherzustellen, dass Sie alle wesentlichen Themen abgedeckt haben.

## Lernziele

Durch das Abschließen dieses Studienleitfadens werden Sie:
- Alle grundlegenden und fortgeschrittenen Konzepte der Azure Developer CLI beherrschen
- Praktische Fähigkeiten in der Bereitstellung und Verwaltung von Azure-Anwendungen entwickeln
- Sicherheit im Umgang mit Fehlerbehebung und Optimierung von Bereitstellungen gewinnen
- Produktionsreife Bereitstellungspraktiken und Sicherheitsaspekte verstehen

## Lernergebnisse

Nach Abschluss aller Abschnitte dieses Studienleitfadens werden Sie in der Lage sein:
- Komplette Anwendungsarchitekturen mit azd zu entwerfen, bereitzustellen und zu verwalten
- Umfassende Strategien für Überwachung, Sicherheit und Kostenoptimierung umzusetzen
- Komplexe Bereitstellungsprobleme eigenständig zu beheben
- Eigene Vorlagen zu erstellen und zur azd-Community beizutragen

## 8-Kapitel-Lernstruktur

### Kapitel 1: Grundlagen & Schnellstart (Woche 1)
**Dauer**: 30-45 Minuten | **Komplexität**: ⭐

#### Lernziele
- Grundlegende Konzepte und Terminologie der Azure Developer CLI verstehen
- AZD erfolgreich auf Ihrer Entwicklungsplattform installieren und konfigurieren
- Ihre erste Anwendung mithilfe einer vorhandenen Vorlage bereitstellen
- Die AZD-Befehlszeilenschnittstelle effektiv navigieren

#### Schlüsselkonzepte
- Projektstruktur und Komponenten von AZD (azure.yaml, infra/, src/)
- Vorlagenbasierte Bereitstellungsabläufe
- Grundlagen der Umgebungskonfiguration
- Verwaltung von Ressourcengruppen und Abonnements

#### Praktische Übungen
1. **Installationsüberprüfung**: AZD installieren und mit `azd version` überprüfen
2. **Erste Bereitstellung**: Vorlage todo-nodejs-mongo erfolgreich bereitstellen
3. **Umgebungseinrichtung**: Ihre ersten Umgebungsvariablen konfigurieren
4. **Ressourcen erkunden**: Bereitgestellte Ressourcen im Azure-Portal navigieren

#### Bewertungsfragen
- Was sind die Kernkomponenten eines AZD-Projekts?
- Wie initialisieren Sie ein neues Projekt aus einer Vorlage?
- Was ist der Unterschied zwischen `azd up` und `azd deploy`?
- Wie verwalten Sie mehrere Umgebungen mit AZD?

---

### Kapitel 2: KI-First-Entwicklung (Woche 2)
**Dauer**: 1-2 Stunden | **Komplexität**: ⭐⭐

#### Lernziele
- Azure AI Foundry-Dienste in AZD-Workflows integrieren
- KI-gestützte Anwendungen bereitstellen und konfigurieren
- Implementierungsmuster für RAG (Retrieval-Augmented Generation) verstehen
- KI-Modellbereitstellungen und Skalierung verwalten

#### Schlüsselkonzepte
- Integration des Azure OpenAI-Dienstes und API-Management
- Konfiguration von KI-Suche und Vektorindizierung
- Strategien für Modellbereitstellung und Kapazitätsplanung
- Überwachung und Leistungsoptimierung von KI-Anwendungen

#### Praktische Übungen
1. **KI-Chat-Bereitstellung**: Vorlage azure-search-openai-demo bereitstellen
2. **RAG-Implementierung**: Dokumentenindizierung und -abruf konfigurieren
3. **Modellkonfiguration**: Mehrere KI-Modelle mit unterschiedlichen Zwecken einrichten
4. **KI-Überwachung**: Application Insights für KI-Workloads implementieren

#### Bewertungsfragen
- Wie konfigurieren Sie Azure OpenAI-Dienste in einer AZD-Vorlage?
- Was sind die Hauptkomponenten einer RAG-Architektur?
- Wie verwalten Sie die Kapazität und Skalierung von KI-Modellen?
- Welche Überwachungsmetriken sind für KI-Anwendungen wichtig?

---

### Kapitel 3: Konfiguration & Authentifizierung (Woche 3)
**Dauer**: 45-60 Minuten | **Komplexität**: ⭐⭐

#### Lernziele
- Strategien für die Verwaltung und Konfiguration von Umgebungen meistern
- Sichere Authentifizierungsmuster und verwaltete Identitäten implementieren
- Ressourcen mit geeigneten Namenskonventionen organisieren
- Multi-Umgebungs-Bereitstellungen (dev, staging, prod) konfigurieren

#### Schlüsselkonzepte
- Hierarchie der Umgebungen und Konfigurationsvorrang
- Authentifizierung mit verwalteter Identität und Dienstprinzipal
- Integration von Key Vault für Geheimnisverwaltung
- Verwaltung von umgebungsspezifischen Parametern

#### Praktische Übungen
1. **Multi-Umgebungs-Einrichtung**: Entwicklungs-, Staging- und Produktionsumgebungen konfigurieren
2. **Sicherheitskonfiguration**: Authentifizierung mit verwalteter Identität implementieren
3. **Geheimnisverwaltung**: Azure Key Vault für sensible Daten integrieren
4. **Parameterverwaltung**: Umgebungsspezifische Konfigurationen erstellen

#### Bewertungsfragen
- Wie konfigurieren Sie verschiedene Umgebungen mit AZD?
- Welche Vorteile bietet die Verwendung von verwalteter Identität gegenüber Dienstprinzipalen?
- Wie verwalten Sie Anwendungsgeheimnisse sicher?
- Was ist die Konfigurationshierarchie in AZD?

---

### Kapitel 4: Infrastruktur als Code & Bereitstellung (Woche 4-5)
**Dauer**: 1-1,5 Stunden | **Komplexität**: ⭐⭐⭐

#### Lernziele
- Bicep-Infrastrukturvorlagen erstellen und anpassen
- Fortgeschrittene Bereitstellungsmuster und Workflows implementieren
- Strategien für die Ressourcenbereitstellung verstehen
- Skalierbare Multi-Service-Architekturen entwerfen

#### Schlüsselkonzepte
- Struktur und Best Practices für Bicep-Vorlagen
- Ressourcenabhängigkeiten und Bereitstellungsreihenfolge
- Parameterdateien und Vorlagenmodularität
- Benutzerdefinierte Hooks und Bereitstellungsautomatisierung

#### Praktische Übungen
1. **Erstellung benutzerdefinierter Vorlagen**: Vorlage für eine Multi-Service-Anwendung erstellen
2. **Bicep-Meisterung**: Modulare, wiederverwendbare Infrastrukturkomponenten erstellen
3. **Automatisierung der Bereitstellung**: Pre-/Post-Bereitstellungshooks implementieren
4. **Architekturdesign**: Komplexe Microservices-Architektur bereitstellen

#### Bewertungsfragen
- Wie erstellen Sie benutzerdefinierte Bicep-Vorlagen für AZD?
- Was sind die Best Practices für die Organisation von Infrastrukturcode?
- Wie handhaben Sie Ressourcenabhängigkeiten in Vorlagen?
- Welche Bereitstellungsmuster unterstützen Updates ohne Ausfallzeiten?

---

### Kapitel 5: Multi-Agent-KI-Lösungen (Woche 6-7)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Multi-Agent-KI-Architekturen entwerfen und implementieren
- Koordination und Kommunikation zwischen Agenten orchestrieren
- Produktionsreife KI-Lösungen mit Überwachung bereitstellen
- Spezialisierung von Agenten und Workflow-Muster verstehen

#### Schlüsselkonzepte
- Muster und Designprinzipien für Multi-Agent-Architekturen
- Kommunikationsprotokolle und Datenfluss zwischen Agenten
- Strategien für Lastverteilung und Skalierung von KI-Agenten
- Produktionsüberwachung für Multi-Agent-Systeme

#### Praktische Übungen
1. **Bereitstellung einer Einzelhandelslösung**: Komplettes Multi-Agent-Einzelhandelsszenario bereitstellen
2. **Agentenanpassung**: Verhalten von Kunden- und Inventaragenten modifizieren
3. **Architekturskalierung**: Lastverteilung und automatische Skalierung implementieren
4. **Produktionsüberwachung**: Umfassende Überwachung und Alarmierung einrichten

#### Bewertungsfragen
- Wie entwerfen Sie effektive Kommunikationsmuster für Multi-Agenten?
- Was sind die wichtigsten Überlegungen zur Skalierung von KI-Agenten?
- Wie überwachen und debuggen Sie Multi-Agent-KI-Systeme?
- Welche Produktionsmuster gewährleisten die Zuverlässigkeit von KI-Agenten?

---

### Kapitel 6: Validierung & Planung vor der Bereitstellung (Woche 8)
**Dauer**: 1 Stunde | **Komplexität**: ⭐⭐

#### Lernziele
- Umfassende Kapazitätsplanung und Ressourcenvalidierung durchführen
- Optimale Azure-SKUs für Kosteneffizienz auswählen
- Automatisierte Pre-Flight-Checks und Validierung implementieren
- Bereitstellungen mit Kostenoptimierungsstrategien planen

#### Schlüsselkonzepte
- Azure-Ressourcenquoten und Kapazitätsbeschränkungen
- Kriterien für die Auswahl von SKUs und Kostenoptimierung
- Automatisierte Validierungsskripte und Tests
- Bereitstellungsplanung und Risikobewertung

#### Praktische Übungen
1. **Kapazitätsanalyse**: Ressourcenanforderungen für Ihre Anwendungen analysieren
2. **SKU-Optimierung**: Kostenwirksame Servicestufen vergleichen und auswählen
3. **Validierungsautomatisierung**: Pre-Bereitstellungs-Check-Skripte implementieren
4. **Kostenplanung**: Bereitstellungskosten schätzen und Budgets erstellen

#### Bewertungsfragen
- Wie validieren Sie die Azure-Kapazität vor der Bereitstellung?
- Welche Faktoren beeinflussen Entscheidungen zur SKU-Auswahl?
- Wie automatisieren Sie die Validierung vor der Bereitstellung?
- Welche Strategien helfen, Bereitstellungskosten zu optimieren?

---

### Kapitel 7: Fehlerbehebung & Debugging (Woche 9)
**Dauer**: 1-1,5 Stunden | **Komplexität**: ⭐⭐

#### Lernziele
- Systematische Debugging-Ansätze für AZD-Bereitstellungen entwickeln
- Häufige Bereitstellungs- und Konfigurationsprobleme lösen
- KI-spezifische Probleme und Leistungsprobleme debuggen
- Überwachung und Alarmierung für proaktive Fehlererkennung implementieren

#### Schlüsselkonzepte
- Diagnosetechniken und Protokollierungsstrategien
- Häufige Fehlerbilder und deren Lösungen
- Leistungsüberwachung und Optimierung
- Verfahren zur Vorfallreaktion und Wiederherstellung

#### Praktische Übungen
1. **Diagnosefähigkeiten**: Mit absichtlich fehlerhaften Bereitstellungen üben
2. **Protokollanalyse**: Azure Monitor und Application Insights effektiv nutzen
3. **Leistungsoptimierung**: Langsam laufende Anwendungen optimieren
4. **Wiederherstellungsverfahren**: Backup und Disaster Recovery implementieren

#### Bewertungsfragen
- Was sind die häufigsten AZD-Bereitstellungsfehler?
- Wie debuggen Sie Authentifizierungs- und Berechtigungsprobleme?
- Welche Überwachungsstrategien helfen, Produktionsprobleme zu vermeiden?
- Wie optimieren Sie die Anwendungsleistung in Azure?

---

### Kapitel 8: Produktions- & Unternehmensmuster (Woche 10-11)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Unternehmensgerechte Bereitstellungsstrategien implementieren
- Sicherheitsmuster und Compliance-Rahmenwerke entwerfen
- Überwachung, Governance und Kostenmanagement etablieren
- Skalierbare CI/CD-Pipelines mit AZD-Integration erstellen

#### Schlüsselkonzepte
- Sicherheits- und Compliance-Anforderungen für Unternehmen
- Governance-Rahmenwerke und Richtlinienimplementierung
- Fortgeschrittene Überwachung und Kostenmanagement
- CI/CD-Integration und automatisierte Bereitstellungspipelines

#### Praktische Übungen
1. **Unternehmenssicherheit**: Umfassende Sicherheitsmuster implementieren
2. **Governance-Rahmenwerk**: Azure Policy und Ressourcenmanagement einrichten
3. **Fortgeschrittene Überwachung**: Dashboards und automatisierte Alarmierung erstellen
4. **CI/CD-Integration**: Automatisierte Bereitstellungspipelines erstellen

#### Bewertungsfragen
- Wie implementieren Sie Unternehmenssicherheit in AZD-Bereitstellungen?
- Welche Governance-Muster gewährleisten Compliance und Kostenkontrolle?
- Wie entwerfen Sie skalierbare Überwachung für Produktionssysteme?
- Welche CI/CD-Muster funktionieren am besten mit AZD-Workflows?
2. Wie validieren Sie die Verfügbarkeit von Azure-Ressourcen vor der Bereitstellung?  
3. Was sind die wichtigsten Komponenten eines Pre-Flight-Check-Systems?  
4. Wie schätzen und kontrollieren Sie Bereitstellungskosten?  
5. Welche Überwachung ist für die Kapazitätsplanung unerlässlich?

### Modul 5: Fehlerbehebung und Debugging (Woche 6)

#### Lernziele
- Systematische Methoden zur Fehlerbehebung meistern  
- Expertise im Debugging komplexer Bereitstellungsprobleme entwickeln  
- Umfassende Überwachung und Alarmierung implementieren  
- Verfahren zur Incident-Reaktion und Wiederherstellung aufbauen  

#### Wichtige Konzepte zum Meistern
- Häufige Muster von Bereitstellungsfehlern  
- Log-Analyse und Korrelationstechniken  
- Leistungsüberwachung und Optimierung  
- Erkennung und Reaktion auf Sicherheitsvorfälle  
- Katastrophenwiederherstellung und Geschäftskontinuität  

#### Übungsaufgaben

**Übung 5.1: Fehlerbehebungsszenarien**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Übung 5.2: Überwachungsimplementierung**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Übung 5.3: Incident-Reaktion**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Selbstbewertungsfragen
1. Was ist der systematische Ansatz zur Fehlerbehebung bei azd-Bereitstellungen?  
2. Wie korrelieren Sie Logs über mehrere Dienste und Ressourcen hinweg?  
3. Welche Überwachungsmetriken sind für die frühzeitige Problemidentifikation am wichtigsten?  
4. Wie implementieren Sie effektive Verfahren zur Katastrophenwiederherstellung?  
5. Was sind die wichtigsten Komponenten eines Incident-Reaktionsplans?  

### Modul 6: Fortgeschrittene Themen und Best Practices (Woche 7-8)

#### Lernziele
- Bereitstellungsmuster auf Unternehmensniveau implementieren  
- CI/CD-Integration und Automatisierung meistern  
- Eigene Templates entwickeln und zur Community beitragen  
- Fortgeschrittene Sicherheits- und Compliance-Anforderungen verstehen  

#### Wichtige Konzepte zum Meistern
- CI/CD-Pipeline-Integrationsmuster  
- Entwicklung und Verteilung eigener Templates  
- Unternehmens-Governance und Compliance  
- Fortgeschrittene Netzwerk- und Sicherheitskonfigurationen  
- Leistungsoptimierung und Kostenmanagement  

#### Übungsaufgaben

**Übung 6.1: CI/CD-Integration**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Übung 6.2: Entwicklung eigener Templates**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Übung 6.3: Unternehmensimplementierung**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Selbstbewertungsfragen
1. Wie integrieren Sie azd in bestehende CI/CD-Workflows?  
2. Was sind die wichtigsten Überlegungen bei der Entwicklung eigener Templates?  
3. Wie implementieren Sie Governance und Compliance in azd-Bereitstellungen?  
4. Was sind die Best Practices für Bereitstellungen im Unternehmensmaßstab?  
5. Wie tragen Sie effektiv zur azd-Community bei?  

## Praktische Projekte

### Projekt 1: Persönliche Portfolio-Website  
**Komplexität**: Anfänger  
**Dauer**: 1-2 Wochen  

Erstellen und bereitstellen einer persönlichen Portfolio-Website mit:  
- Statischem Website-Hosting auf Azure Storage  
- Konfiguration einer benutzerdefinierten Domain  
- CDN-Integration für globale Leistung  
- Automatisierter Bereitstellungspipeline  

**Liefergegenstände**:  
- Funktionierende Website, bereitgestellt auf Azure  
- Benutzerdefiniertes azd-Template für Portfolio-Bereitstellungen  
- Dokumentation des Bereitstellungsprozesses  
- Kostenanalyse und Optimierungsempfehlungen  

### Projekt 2: Aufgabenverwaltungsanwendung  
**Komplexität**: Mittel  
**Dauer**: 2-3 Wochen  

Erstellen einer Full-Stack-Aufgabenverwaltungsanwendung mit:  
- React-Frontend, bereitgestellt auf App Service  
- Node.js-API-Backend mit Authentifizierung  
- PostgreSQL-Datenbank mit Migrationen  
- Application Insights-Überwachung  

**Liefergegenstände**:  
- Vollständige Anwendung mit Benutzer-Authentifizierung  
- Datenbankschema und Migrationsskripte  
- Überwachungs-Dashboards und Alarmierungsregeln  
- Multi-Umgebungs-Bereitstellungskonfiguration  

### Projekt 3: Microservices-E-Commerce-Plattform  
**Komplexität**: Fortgeschritten  
**Dauer**: 4-6 Wochen  

Entwurf und Implementierung einer Microservices-basierten E-Commerce-Plattform:  
- Mehrere API-Dienste (Katalog, Bestellungen, Zahlungen, Benutzer)  
- Nachrichtenwarteschlangen-Integration mit Service Bus  
- Redis-Cache für Leistungsoptimierung  
- Umfassende Protokollierung und Überwachung  

**Liefergegenstände**:  
- Vollständige Microservices-Architektur  
- Muster für die Kommunikation zwischen Diensten  
- Leistungstests und Optimierung  
- Produktionsreife Sicherheitsimplementierung  

## Bewertung und Zertifizierung

### Wissensüberprüfungen

Absolvieren Sie diese Bewertungen nach jedem Modul:

**Modul 1 Bewertung**: Grundkonzepte und Installation  
- Multiple-Choice-Fragen zu Kernkonzepten  
- Praktische Installations- und Konfigurationsaufgaben  
- Einfaches Bereitstellungsprojekt  

**Modul 2 Bewertung**: Konfiguration und Umgebungen  
- Szenarien zur Verwaltung von Umgebungen  
- Übungen zur Fehlerbehebung bei Konfigurationen  
- Implementierung von Sicherheitskonfigurationen  

**Modul 3 Bewertung**: Bereitstellung und Provisionierung  
- Herausforderungen im Infrastrukturdesign  
- Szenarien für die Bereitstellung mehrerer Dienste  
- Übungen zur Leistungsoptimierung  

**Modul 4 Bewertung**: Validierung vor der Bereitstellung  
- Fallstudien zur Kapazitätsplanung  
- Szenarien zur Kostenoptimierung  
- Implementierung von Validierungspipelines  

**Modul 5 Bewertung**: Fehlerbehebung und Debugging  
- Übungen zur Problemdiagnose  
- Aufgaben zur Überwachungsimplementierung  
- Simulationen zur Incident-Reaktion  

**Modul 6 Bewertung**: Fortgeschrittene Themen  
- Entwurf von CI/CD-Pipelines  
- Entwicklung eigener Templates  
- Szenarien für Unternehmensarchitekturen  

### Abschlussprojekt

Entwerfen und implementieren Sie eine vollständige Lösung, die die Beherrschung aller Konzepte demonstriert:

**Anforderungen**:  
- Multi-Tier-Anwendungsarchitektur  
- Mehrere Bereitstellungsumgebungen  
- Umfassende Überwachung und Alarmierung  
- Sicherheits- und Compliance-Implementierung  
- Kostenoptimierung und Leistungsabstimmung  
- Vollständige Dokumentation und Runbooks  

**Bewertungskriterien**:  
- Qualität der technischen Implementierung  
- Vollständigkeit der Dokumentation  
- Einhaltung von Sicherheits- und Best-Practice-Standards  
- Optimierung von Leistung und Kosten  
- Effektivität bei Fehlerbehebung und Überwachung  

## Lernressourcen und Referenzen

### Offizielle Dokumentation  
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community-Ressourcen  
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisation](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Übungsumgebungen  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Zusätzliche Tools  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Lernzeitplan-Empfehlungen

### Vollzeitstudium (8 Wochen)  
- **Woche 1-2**: Module 1-2 (Erste Schritte, Konfiguration)  
- **Woche 3-4**: Module 3-4 (Bereitstellung, Validierung vor der Bereitstellung)  
- **Woche 5-6**: Module 5-6 (Fehlerbehebung, Fortgeschrittene Themen)  
- **Woche 7-8**: Praktische Projekte und Abschlussbewertung  

### Teilzeitstudium (16 Wochen)  
- **Woche 1-4**: Modul 1 (Erste Schritte)  
- **Woche 5-7**: Modul 2 (Konfiguration und Umgebungen)  
- **Woche 8-10**: Modul 3 (Bereitstellung und Provisionierung)  
- **Woche 11-12**: Modul 4 (Validierung vor der Bereitstellung)  
- **Woche 13-14**: Modul 5 (Fehlerbehebung und Debugging)  
- **Woche 15-16**: Modul 6 (Fortgeschrittene Themen und Bewertung)  

---

## Fortschrittsverfolgung und Bewertungsrahmen

### Kapitel-Abschluss-Checkliste

Verfolgen Sie Ihren Fortschritt durch jedes Kapitel mit diesen messbaren Ergebnissen:

#### 📚 Kapitel 1: Grundlagen & Schnellstart  
- [ ] **Installation abgeschlossen**: AZD auf Ihrer Plattform installiert und verifiziert  
- [ ] **Erste Bereitstellung**: Erfolgreich das Template todo-nodejs-mongo bereitgestellt  
- [ ] **Umgebung eingerichtet**: Erste Umgebungsvariablen konfiguriert  
- [ ] **Ressourcennavigation**: Bereitgestellte Ressourcen im Azure-Portal erkundet  
- [ ] **Befehlsbeherrschung**: Vertraut mit grundlegenden AZD-Befehlen  

#### 🤖 Kapitel 2: KI-First-Entwicklung  
- [ ] **KI-Template-Bereitstellung**: azure-search-openai-demo erfolgreich bereitgestellt  
- [ ] **RAG-Implementierung**: Dokumentenindexierung und -abruf konfiguriert  
- [ ] **Modellkonfiguration**: Mehrere KI-Modelle mit unterschiedlichen Zwecken eingerichtet  
- [ ] **KI-Überwachung**: Application Insights für KI-Workloads implementiert  
- [ ] **Leistungsoptimierung**: Leistung der KI-Anwendung abgestimmt  

#### ⚙️ Kapitel 3: Konfiguration & Authentifizierung  
- [ ] **Multi-Umgebungs-Setup**: Entwicklungs-, Staging- und Produktionsumgebungen konfiguriert  
- [ ] **Sicherheitsimplementierung**: Managed Identity-Authentifizierung eingerichtet  
- [ ] **Geheimnisverwaltung**: Azure Key Vault für sensible Daten integriert  
- [ ] **Parameterverwaltung**: Umgebungsspezifische Konfigurationen erstellt  
- [ ] **Authentifizierungsbeherrschung**: Sichere Zugriffsmuster implementiert  

#### 🏗️ Kapitel 4: Infrastruktur als Code & Bereitstellung  
- [ ] **Erstellung eigener Templates**: Template für eine Multi-Service-Anwendung erstellt  
- [ ] **Bicep-Beherrschung**: Modulare, wiederverwendbare Infrastrukturkomponenten erstellt  
- [ ] **Automatisierung der Bereitstellung**: Pre-/Post-Bereitstellungshooks implementiert  
- [ ] **Architekturdesign**: Komplexe Microservices-Architektur bereitgestellt  
- [ ] **Template-Optimierung**: Templates für Leistung und Kosten optimiert  

#### 🎯 Kapitel 5: Multi-Agent-KI-Lösungen  
- [ ] **Einzelhandelslösung bereitgestellt**: Vollständiges Multi-Agent-Einzelhandelsszenario bereitgestellt  
- [ ] **Agentenanpassung**: Verhalten von Kunden- und Inventaragenten modifiziert  
- [ ] **Architekturskalierung**: Lastverteilung und Auto-Skalierung implementiert  
- [ ] **Produktionsüberwachung**: Umfassende Überwachung und Alarmierung eingerichtet  
- [ ] **Leistungsabstimmung**: Leistung des Multi-Agent-Systems optimiert  

#### 🔍 Kapitel 6: Validierung vor der Bereitstellung & Planung  
- [ ] **Kapazitätsanalyse**: Ressourcenanforderungen für Anwendungen analysiert  
- [ ] **SKU-Optimierung**: Kostenwirksame Service-Tiers ausgewählt  
- [ ] **Validierungsautomatisierung**: Pre-Bereitstellungs-Check-Skripte implementiert  
- [ ] **Kostenplanung**: Bereitstellungskosten geschätzt und Budgets erstellt  
- [ ] **Risikobewertung**: Bereitstellungsrisiken identifiziert und gemindert  

#### 🚨 Kapitel 7: Fehlerbehebung & Debugging  
- [ ] **Diagnosefähigkeiten**: Erfolgreich absichtlich fehlerhafte Bereitstellungen debuggt  
- [ ] **Log-Analyse**: Azure Monitor und Application Insights effektiv genutzt  
- [ ] **Leistungsabstimmung**: Langsam laufende Anwendungen optimiert  
- [ ] **Wiederherstellungsverfahren**: Backup- und Katastrophenwiederherstellung implementiert  
- [ ] **Überwachungs-Setup**: Proaktive Überwachung und Alarmierung erstellt  

#### 🏢 Kapitel 8: Produktion & Unternehmensmuster  
- [ ] **Unternehmenssicherheit**: Umfassende Sicherheitsmuster implementiert  
- [ ] **Governance-Framework**: Azure Policy und Ressourcenmanagement eingerichtet  
- [ ] **Fortgeschrittene Überwachung**: Dashboards und automatisierte Alarmierung erstellt  
- [ ] **CI/CD-Integration**: Automatisierte Bereitstellungspipelines erstellt  
- [ ] **Compliance-Implementierung**: Unternehmens-Compliance-Anforderungen erfüllt  

### Lernzeitplan und Meilensteine

#### Woche 1-2: Grundlagen schaffen  
- **Meilenstein**: Erste KI-Anwendung mit AZD bereitstellen  
- **Validierung**: Funktionierende Anwendung über öffentliche URL zugänglich  
- **Fähigkeiten**: Grundlegende AZD-Workflows und KI-Dienstintegration  

#### Woche 3-4: Konfigurationsbeherrschung  
- **Meilenstein**: Multi-Umgebungs-Bereitstellung mit sicherer Authentifizierung  
- **Validierung**: Dieselbe Anwendung in Entwicklungs-, Staging- und Produktionsumgebungen bereitgestellt  
- **Fähigkeiten**: Verwaltung von Umgebungen und Sicherheitsimplementierung  

#### Woche 5-6: Infrastruktur-Expertise  
- **Meilenstein**: Eigenes Template für komplexe Multi-Service-Anwendung  
- **Validierung**: Wiederverwendbares Template von einem anderen Teammitglied bereitgestellt  
- **Fähigkeiten**: Bicep-Beherrschung und Infrastrukturautomatisierung  

#### Woche 7-8: Fortgeschrittene KI-Implementierung  
- **Meilenstein**: Produktionsreife Multi-Agent-KI-Lösung  
- **Validierung**: System bewältigt reale Last mit Überwachung  
- **Fähigkeiten**: Multi-Agent-Orchestrierung und Leistungsoptimierung  

#### Woche 9-10: Produktionsreife  
- **Meilenstein**: Unternehmensgerechte Bereitstellung mit vollständiger Compliance  
- **Validierung**: Besteht Sicherheitsprüfung und Kostenoptimierungs-Audit  
- **Fähigkeiten**: Governance, Überwachung und CI/CD-Integration  

### Bewertung und Zertifizierung

#### Methoden zur Wissensvalidierung  
1. **Praktische Bereitstellungen**: Funktionierende Anwendungen für jedes Kapitel  
2. **Code-Reviews**: Bewertung der Qualität von Templates und Konfigurationen  
3. **Problemlösung**: Szenarien zur Fehlerbehebung und Lösungen  
4. **Peer-Teaching**: Konzepte anderen Lernenden erklären  
5. **Community-Beitrag**: Templates oder Verbesserungen teilen  

#### Ergebnisse der beruflichen Entwicklung  
- **Portfolio-Projekte**: 8 produktionsreife Bereitstellungen  
- **Technische Fähigkeiten**: Branchenübliche AZD- und KI-Bereitstellungskompetenz  
- **Problemlösungsfähigkeiten**: Eigenständige Fehlerbehebung und Optimierung  
- **Community-Anerkennung**: Aktive Teilnahme an der Azure-Entwickler-Community  
- **Karriereförderung**: Fähigkeiten direkt anwendbar für Cloud- und KI-Rollen  

#### Erfolgskriterien  
- **Bereitstellungserfolgsrate**: >95 % erfolgreiche Bereitstellungen  
- **Fehlerbehebungszeit**: <30 Minuten für häufige Probleme  
- **Leistungsoptimierung**: Nachweisbare Verbesserungen bei Kosten und Leistung  
- **Sicherheits-Compliance**: Alle Bereitstellungen erfüllen Unternehmenssicherheitsstandards  
- **Wissensweitergabe**: Fähigkeit, andere Entwickler zu betreuen  

### Kontinuierliches Lernen und Community-Engagement

#### Aktuell bleiben  
- **Azure-Updates**: Release Notes des Azure Developer CLI verfolgen  
- **Community-Events**: Teilnahme an Azure- und KI-Entwicklerveranstaltungen  
- **Dokumentation**: Trage zur Community-Dokumentation und zu Beispielen bei
- **Feedback-Schleife**: Gib Rückmeldungen zu Kursinhalten und Azure-Diensten

#### Karriereentwicklung
- **Professionelles Netzwerk**: Vernetze dich mit Azure- und KI-Experten
- **Vortragsmöglichkeiten**: Teile deine Erkenntnisse auf Konferenzen oder Meetups
- **Open-Source-Beitrag**: Trage zu AZD-Vorlagen und Tools bei
- **Mentoring**: Unterstütze andere Entwickler auf ihrer AZD-Lernreise

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)
- **📖 Lernen starten**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: Verfolge deinen Fortschritt durch das umfassende 8-Kapitel-Lernsystem
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) für Unterstützung und Diskussion

**Fortschrittsverfolgung beim Lernen**: Nutze diesen strukturierten Leitfaden, um die Azure Developer CLI durch schrittweises, praxisorientiertes Lernen mit messbaren Ergebnissen und Vorteilen für die berufliche Entwicklung zu meistern.

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.