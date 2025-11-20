<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-19T22:47:53+00:00",
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
- Selbstbewusstsein im Beheben von Problemen und Optimieren von Bereitstellungen aufbauen
- Produktionsreife Bereitstellungspraktiken und Sicherheitsüberlegungen verstehen

## Lernergebnisse

Nach Abschluss aller Abschnitte dieses Studienleitfadens werden Sie in der Lage sein:
- Vollständige Anwendungsarchitekturen mit azd zu entwerfen, bereitzustellen und zu verwalten
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

#### Schlüsselkonzepte zum Meistern
- AZD-Projektstruktur und Komponenten (azure.yaml, infra/, src/)
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
- Microsoft Foundry-Dienste in AZD-Workflows integrieren
- KI-gestützte Anwendungen bereitstellen und konfigurieren
- Implementierungsmuster für RAG (Retrieval-Augmented Generation) verstehen
- KI-Modellbereitstellungen und Skalierung verwalten

#### Schlüsselkonzepte zum Meistern
- Integration des Azure OpenAI-Dienstes und API-Verwaltung
- KI-Suchkonfiguration und Vektorindizierung
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
- Sichere Authentifizierungsmuster und verwaltete Identität implementieren
- Ressourcen mit geeigneten Namenskonventionen organisieren
- Bereitstellungen für mehrere Umgebungen (Entwicklung, Staging, Produktion) konfigurieren

#### Schlüsselkonzepte zum Meistern
- Hierarchie der Umgebungen und Konfigurationsvorrang
- Authentifizierung mit verwalteter Identität und Dienstprinzipal
- Integration von Key Vault für Geheimnisverwaltung
- Verwaltung von umgebungsspezifischen Parametern

#### Praktische Übungen
1. **Einrichtung mehrerer Umgebungen**: Entwicklungs-, Staging- und Produktionsumgebungen konfigurieren
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
- Skalierbare Architekturen mit mehreren Diensten entwerfen

- Containerisierte Anwendungen mit Azure Container Apps und AZD bereitstellen

#### Schlüsselkonzepte zum Meistern
- Struktur und Best Practices für Bicep-Vorlagen
- Ressourcendependenzen und Bereitstellungsreihenfolge
- Parameterdateien und Vorlagenmodularität
- Benutzerdefinierte Hooks und Bereitstellungsautomatisierung
- Muster für die Bereitstellung von Container-Apps (Schnellstart, Produktion, Microservices)

#### Praktische Übungen
1. **Erstellung benutzerdefinierter Vorlagen**: Vorlage für eine Anwendung mit mehreren Diensten erstellen
2. **Bicep-Meisterschaft**: Modulare, wiederverwendbare Infrastrukturkomponenten erstellen
3. **Automatisierung der Bereitstellung**: Pre-/Post-Bereitstellungshooks implementieren
4. **Architekturdesign**: Komplexe Microservices-Architektur bereitstellen
5. **Bereitstellung von Container-Apps**: [Simple Flask API](../../../examples/container-app/simple-flask-api) und [Microservices Architecture](../../../examples/container-app/microservices) Beispiele mit AZD bereitstellen

#### Bewertungsfragen
- Wie erstellen Sie benutzerdefinierte Bicep-Vorlagen für AZD?
- Was sind die Best Practices für die Organisation von Infrastrukturcode?
- Wie handhaben Sie Ressourcendependenzen in Vorlagen?
- Welche Bereitstellungsmuster unterstützen Updates ohne Ausfallzeiten?

---

### Kapitel 5: KI-Lösungen mit mehreren Agenten (Woche 6-7)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Architekturen mit mehreren KI-Agenten entwerfen und implementieren
- Koordination und Kommunikation zwischen Agenten orchestrieren
- Produktionsreife KI-Lösungen mit Überwachung bereitstellen
- Spezialisierung von Agenten und Workflow-Muster verstehen
- Containerisierte Microservices als Teil von Lösungen mit mehreren Agenten integrieren

#### Schlüsselkonzepte zum Meistern
- Muster und Designprinzipien für Architekturen mit mehreren Agenten
- Kommunikationsprotokolle und Datenfluss zwischen Agenten
- Lastverteilung und Skalierungsstrategien für KI-Agenten
- Produktionsüberwachung für Systeme mit mehreren Agenten
- Kommunikation zwischen Diensten in containerisierten Umgebungen

#### Praktische Übungen
1. **Bereitstellung einer Einzelhandelslösung**: Komplettes Szenario mit mehreren Agenten bereitstellen
2. **Agentenanpassung**: Verhalten von Kunden- und Inventaragenten modifizieren
3. **Architekturskalierung**: Lastverteilung und automatische Skalierung implementieren
4. **Produktionsüberwachung**: Umfassende Überwachung und Alarmierung einrichten
5. **Integration von Microservices**: [Microservices Architecture](../../../examples/container-app/microservices) Beispiel erweitern, um agentenbasierte Workflows zu unterstützen

#### Bewertungsfragen
- Wie entwerfen Sie effektive Kommunikationsmuster für mehrere Agenten?
- Was sind die wichtigsten Überlegungen zur Skalierung von KI-Agenten-Workloads?
- Wie überwachen und debuggen Sie KI-Systeme mit mehreren Agenten?
- Welche Produktionsmuster gewährleisten die Zuverlässigkeit von KI-Agenten?

---

### Kapitel 6: Validierung & Planung vor der Bereitstellung (Woche 8)
**Dauer**: 1 Stunde | **Komplexität**: ⭐⭐

#### Lernziele
- Umfassende Kapazitätsplanung und Ressourcenvalidierung durchführen
- Optimale Azure-SKUs für Kosteneffizienz auswählen
- Automatisierte Pre-Flight-Checks und Validierung implementieren
- Bereitstellungen mit Kostenoptimierungsstrategien planen

#### Schlüsselkonzepte zum Meistern
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

#### Schlüsselkonzepte zum Meistern
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
- Welche Überwachungsstrategien helfen, Produktionsprobleme zu verhindern?
- Wie optimieren Sie die Anwendungsleistung in Azure?

---

### Kapitel 8: Produktions- & Unternehmensmuster (Woche 10-11)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Unternehmensgerechte Bereitstellungsstrategien implementieren
- Sicherheitsmuster und Compliance-Rahmenwerke entwerfen
- Überwachung, Governance und Kostenmanagement etablieren
- Skalierbare CI/CD-Pipelines mit AZD-Integration erstellen
- Best Practices für die Bereitstellung von Produktions-Container-Apps anwenden (Sicherheit, Überwachung, Kosten, CI/CD)

#### Schlüsselkonzepte zum Meistern
- Sicherheits- und Compliance-Anforderungen für Unternehmen
- Governance-Rahmenwerke und Richtlinienimplementierung
- Erweiterte Überwachung und Kostenmanagement
- CI/CD-Integration und automatisierte Bereitstellungspipelines
- Blue-Green- und Canary-Bereitstellungsmuster für containerisierte Workloads

#### Praktische Übungen
1. **Unternehmenssicherheit**: Umfassende Sicherheitsmuster implementieren
2. **Governance-Rahmenwerk**: Azure Policy und Ressourcenmanagement einrichten
3. **Erweiterte Überwachung**: Dashboards und automatisierte Alarmierung erstellen
4. **CI/CD-Integration**: Automatisierte Bereitstellungspipelines erstellen
5. **Produktions-Container-Apps**: Sicherheit, Überwachung und Kostenoptimierung auf das [Microservices Architecture](../../../examples/container-app/microservices) Beispiel anwenden

#### Bewertungsfragen
- Wie implementieren Sie Unternehmenssicherheit in AZD-Bereitstellungen?
- Welche Governance-Muster gewährleisten Compliance und Kostenkontrolle?
- Wie entwerfen Sie skalierbare Überwachung für Produktionssysteme?
- Welche CI/CD-Muster funktionieren am besten mit AZD-Workflows?

#### Lernziele
- Grundlagen und Kernkonzepte der Azure Developer CLI verstehen
- azd erfolgreich auf Ihrer Entwicklungsumgebung installieren und konfigurieren
- Ihre erste Bereitstellung mithilfe einer vorhandenen Vorlage abschließen
- Die azd-Projektstruktur navigieren und wichtige Komponenten verstehen

#### Schlüsselkonzepte zum Meistern
- Vorlagen, Umgebungen und Dienste
- Konfigurationsstruktur der azure.yaml
- Grundlegende azd-Befehle (init, up, down, deploy)
- Prinzipien der Infrastruktur als Code
- Azure-Authentifizierung und -Autorisierung

#### Übungsaufgaben

**Übung 1.1: Installation und Einrichtung**
```bash
# Schließen Sie diese Aufgaben ab:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Übung 1.2: Erste Bereitstellung**
```bash
# Eine einfache Webanwendung bereitstellen:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Übung 1.3: Analyse der Projektstruktur**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Selbstbewertungsfragen
1. Was sind die drei Kernkonzepte der azd-Architektur?
2. Was ist der Zweck der azure.yaml-Datei?
3. Wie helfen Umgebungen, verschiedene Bereitstellungsziele zu verwalten?
4. Welche Authentifizierungsmethoden können mit azd verwendet werden?
5. Was passiert, wenn Sie `azd up` zum ersten Mal ausführen?

---

## Fortschrittsverfolgung und Bewertungsrahmen
```bash
# Erstellen und Konfigurieren mehrerer Umgebungen:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Übung 2.2: Erweiterte Konfiguration**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Übung 2.3: Sicherheitskonfiguration**
```bash
# Sicherheitsbestpraktiken umsetzen:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selbstbewertungsfragen
1. Wie handhabt azd die Vorrangigkeit von Umgebungsvariablen?
2. Was sind Bereitstellungshooks und wann sollten Sie sie verwenden?
3. Wie konfigurieren Sie verschiedene SKUs für unterschiedliche Umgebungen?
4. Welche Sicherheitsimplikationen haben verschiedene Authentifizierungsmethoden?
5. Wie verwalten Sie Geheimnisse und sensible Konfigurationsdaten?

### Modul 3: Bereitstellung und Provisionierung (Woche 4)

#### Lernziele
- Bereitstellungsabläufe und Best Practices meistern
- Infrastruktur als Code mit Bicep-Vorlagen verstehen
- Komplexe Architekturen mit mehreren Diensten implementieren
- Bereitstellungsleistung und Zuverlässigkeit optimieren

#### Schlüsselkonzepte zum Meistern
- Struktur und Module von Bicep-Vorlagen
- Ressourcendependenzen und Reihenfolge
- Bereitstellungsstrategien (Blue-Green, Rolling Updates)
- Bereitstellungen in mehreren Regionen
- Datenbankmigrationen und Datenmanagement

#### Übungsaufgaben

**Übung 3.1: Benutzerdefinierte Infrastruktur**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Übung 3.2: Anwendung mit mehreren Diensten**
```bash
# Bereitstellung einer Microservices-Architektur:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Übung 3.3: Datenbankintegration**
```bash
# Implementieren Sie Datenbankbereitstellungsmuster:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Selbstbewertungsfragen
1. Welche Vorteile bietet die Verwendung von Bicep gegenüber ARM-Vorlagen?
2. Wie handhaben Sie Datenbankmigrationen in azd-Bereitstellungen?
3. Welche Strategien gibt es für Bereitstellungen ohne Ausfallzeiten?
4. Wie verwalten Sie Abhängigkeiten zwischen Diensten?
5. Welche Überlegungen gibt es bei Bereitstellungen in mehreren Regionen?

### Modul 4: Validierung vor der Bereitstellung (Woche 5)

#### Lernziele
- Umfassende Prüfungen vor der Bereitstellung durchführen
- Kapazitätsplanung und Ressourcenvalidierung meistern
- SKU-Auswahl und Kostenoptimierung verstehen
- Automatisierte Validierungspipelines erstellen

#### Wichtige Konzepte zum Meistern
- Azure-Ressourcenquoten und -limits
- Kriterien für die SKU-Auswahl und Kostenfolgen
- Automatisierte Validierungsskripte und -tools
- Methoden der Kapazitätsplanung
- Leistungstests und Optimierung

#### Übungsaufgaben

**Übung 4.1: Kapazitätsplanung**
```bash
# Implementieren Sie die Kapazitätsvalidierung:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Übung 4.2: Validierung vor der Bereitstellung**
```powershell
# Erstellen Sie eine umfassende Validierungspipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Übung 4.3: SKU-Optimierung**
```bash
# Optimieren Sie die Dienstkonfigurationen:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Selbstbewertungsfragen
1. Welche Faktoren sollten die Entscheidungen zur SKU-Auswahl beeinflussen?
2. Wie validieren Sie die Verfügbarkeit von Azure-Ressourcen vor der Bereitstellung?
3. Was sind die Hauptkomponenten eines Systems zur Validierung vor der Bereitstellung?
4. Wie schätzen und kontrollieren Sie Bereitstellungskosten?
5. Welche Überwachung ist für die Kapazitätsplanung unerlässlich?

### Modul 5: Fehlerbehebung und Debugging (Woche 6)

#### Lernziele
- Systematische Methoden zur Fehlerbehebung meistern
- Expertise im Debugging komplexer Bereitstellungsprobleme entwickeln
- Umfassende Überwachung und Alarmierung implementieren
- Verfahren zur Incident-Reaktion und Wiederherstellung erstellen

#### Wichtige Konzepte zum Meistern
- Häufige Muster von Bereitstellungsfehlern
- Techniken zur Protokollanalyse und -korrelation
- Leistungsüberwachung und Optimierung
- Erkennung und Reaktion auf Sicherheitsvorfälle
- Notfallwiederherstellung und Geschäftskontinuität

#### Übungsaufgaben

**Übung 5.1: Fehlerbehebungsszenarien**
```bash
# Üben Sie das Lösen häufiger Probleme:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Übung 5.2: Überwachungsimplementierung**
```bash
# Umfassende Überwachung einrichten:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Übung 5.3: Incident-Reaktion**
```bash
# Erstellen Sie Verfahren zur Vorfallreaktion:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Selbstbewertungsfragen
1. Was ist der systematische Ansatz zur Fehlerbehebung bei azd-Bereitstellungen?
2. Wie korrelieren Sie Protokolle über mehrere Dienste und Ressourcen hinweg?
3. Welche Überwachungsmetriken sind für die frühzeitige Problemidentifikation am wichtigsten?
4. Wie implementieren Sie effektive Verfahren zur Notfallwiederherstellung?
5. Was sind die Hauptkomponenten eines Plans zur Incident-Reaktion?

### Modul 6: Fortgeschrittene Themen und Best Practices (Woche 7-8)

#### Lernziele
- Bereitstellungsmuster auf Unternehmensniveau implementieren
- CI/CD-Integration und Automatisierung meistern
- Eigene Vorlagen entwickeln und zur Community beitragen
- Fortgeschrittene Sicherheits- und Compliance-Anforderungen verstehen

#### Wichtige Konzepte zum Meistern
- CI/CD-Pipeline-Integrationsmuster
- Entwicklung und Verteilung benutzerdefinierter Vorlagen
- Unternehmensgovernance und Compliance
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

**Übung 6.2: Entwicklung benutzerdefinierter Vorlagen**
```bash
# Erstellen und Veröffentlichen von benutzerdefinierten Vorlagen:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Übung 6.3: Unternehmensimplementierung**
```bash
# Implementieren Sie Funktionen in Unternehmensqualität:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selbstbewertungsfragen
1. Wie integrieren Sie azd in bestehende CI/CD-Workflows?
2. Was sind die wichtigsten Überlegungen bei der Entwicklung benutzerdefinierter Vorlagen?
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
- Automatisierte Bereitstellungspipeline

**Liefergegenstände**:
- Funktionierende Website, bereitgestellt auf Azure
- Benutzerdefinierte azd-Vorlage für Portfolio-Bereitstellungen
- Dokumentation des Bereitstellungsprozesses
- Kostenanalyse und Optimierungsempfehlungen

### Projekt 2: Aufgabenverwaltungsanwendung
**Komplexität**: Mittel  
**Dauer**: 2-3 Wochen

Erstellen einer Full-Stack-Aufgabenverwaltungsanwendung mit:
- React-Frontend, bereitgestellt auf App Service
- Node.js-API-Backend mit Authentifizierung
- PostgreSQL-Datenbank mit Migrationen
- Überwachung mit Application Insights

**Liefergegenstände**:
- Vollständige Anwendung mit Benutzerauthentifizierung
- Datenbankschema und Migrationsskripte
- Überwachungs-Dashboards und Alarmierungsregeln
- Konfiguration für Bereitstellungen in mehreren Umgebungen

### Projekt 3: Microservices E-Commerce-Plattform
**Komplexität**: Fortgeschritten  
**Dauer**: 4-6 Wochen

Entwerfen und implementieren einer Microservices-basierten E-Commerce-Plattform:
- Mehrere API-Dienste (Katalog, Bestellungen, Zahlungen, Benutzer)
- Nachrichtenwarteschlangen-Integration mit Service Bus
- Redis-Cache für Leistungsoptimierung
- Umfassende Protokollierung und Überwachung

**Referenzbeispiel**: Siehe [Microservices-Architektur](../../../examples/container-app/microservices) für eine produktionsreife Vorlage und Bereitstellungsanleitung

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
- Szenarien zur Umgebungsverwaltung
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
- Entwicklung benutzerdefinierter Vorlagen
- Szenarien für Unternehmensarchitekturen

### Abschlussprojekt

Entwerfen und implementieren Sie eine vollständige Lösung, die die Beherrschung aller Konzepte demonstriert:

**Anforderungen**:
- Mehrschichtige Anwendungsarchitektur
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

## Empfehlungen für den Lernplan

### Vollzeitstudium (8 Wochen)
- **Wochen 1-2**: Module 1-2 (Erste Schritte, Konfiguration)
- **Wochen 3-4**: Module 3-4 (Bereitstellung, Validierung vor der Bereitstellung)
- **Wochen 5-6**: Module 5-6 (Fehlerbehebung, Fortgeschrittene Themen)
- **Wochen 7-8**: Praktische Projekte und Abschlussbewertung

### Teilzeitstudium (16 Wochen)
- **Wochen 1-4**: Modul 1 (Erste Schritte)
- **Wochen 5-7**: Modul 2 (Konfiguration und Umgebungen)
- **Wochen 8-10**: Modul 3 (Bereitstellung und Provisionierung)
- **Wochen 11-12**: Modul 4 (Validierung vor der Bereitstellung)
- **Wochen 13-14**: Modul 5 (Fehlerbehebung und Debugging)
- **Wochen 15-16**: Modul 6 (Fortgeschrittene Themen und Bewertung)

---

## Fortschrittsverfolgung und Bewertungsrahmen

### Kapitelabschluss-Checkliste

Verfolgen Sie Ihren Fortschritt durch jedes Kapitel mit diesen messbaren Ergebnissen:

#### 📚 Kapitel 1: Grundlagen & Schnellstart
- [ ] **Installation abgeschlossen**: AZD auf Ihrer Plattform installiert und überprüft
- [ ] **Erste Bereitstellung**: Erfolgreich bereitgestellte todo-nodejs-mongo Vorlage
- [ ] **Umgebungseinrichtung**: Erste Umgebungsvariablen konfiguriert
- [ ] **Ressourcennavigation**: Bereitgestellte Ressourcen im Azure-Portal erkundet
- [ ] **Befehlsbeherrschung**: Vertraut mit grundlegenden AZD-Befehlen

#### 🤖 Kapitel 2: KI-First-Entwicklung  
- [ ] **KI-Vorlagenbereitstellung**: Erfolgreich azure-search-openai-demo bereitgestellt
- [ ] **RAG-Implementierung**: Dokumentenindizierung und -abruf konfiguriert
- [ ] **Modellkonfiguration**: Mehrere KI-Modelle mit unterschiedlichen Zwecken eingerichtet
- [ ] **KI-Überwachung**: Application Insights für KI-Workloads implementiert
- [ ] **Leistungsoptimierung**: Leistung der KI-Anwendung abgestimmt

#### ⚙️ Kapitel 3: Konfiguration & Authentifizierung
- [ ] **Multi-Umgebungs-Einrichtung**: Entwicklungs-, Staging- und Produktionsumgebungen konfiguriert
- [ ] **Sicherheitsimplementierung**: Managed Identity-Authentifizierung eingerichtet
- [ ] **Geheimnisverwaltung**: Azure Key Vault für sensible Daten integriert
- [ ] **Parameterverwaltung**: Umgebungsspezifische Konfigurationen erstellt
- [ ] **Authentifizierungsbeherrschung**: Sichere Zugriffsmuster implementiert

#### 🏗️ Kapitel 4: Infrastruktur als Code & Bereitstellung
- [ ] **Erstellung benutzerdefinierter Vorlagen**: Vorlage für eine Anwendung mit mehreren Diensten erstellt
- [ ] **Bicep-Beherrschung**: Modulare, wiederverwendbare Infrastrukturkomponenten erstellt
- [ ] **Automatisierung der Bereitstellung**: Pre/Post-Bereitstellungshooks implementiert
- [ ] **Architekturdesign**: Komplexe Microservices-Architektur bereitgestellt
- [ ] **Vorlagenoptimierung**: Vorlagen für Leistung und Kosten optimiert

#### 🎯 Kapitel 5: Multi-Agent-KI-Lösungen
- [ ] **Bereitstellung der Einzelhandelslösung**: Vollständiges Multi-Agent-Einzelhandelsszenario bereitgestellt
- [ ] **Agentenanpassung**: Verhalten von Kunden- und Inventaragenten modifiziert
- [ ] **Architekturskalierung**: Lastenausgleich und automatische Skalierung implementiert
- [ ] **Produktionsüberwachung**: Umfassende Überwachung und Alarmierung eingerichtet
- [ ] **Leistungsabstimmung**: Leistung des Multi-Agent-Systems optimiert

#### 🔍 Kapitel 6: Validierung & Planung vor der Bereitstellung
- [ ] **Kapazitätsanalyse**: Ressourcenanforderungen für Anwendungen analysiert
- [ ] **SKU-Optimierung**: Kostenwirksame Servicestufen ausgewählt
- [ ] **Validierungsautomatisierung**: Skripte zur Validierung vor der Bereitstellung implementiert
- [ ] **Kostenplanung**: Schätzungen und Budgets für Bereitstellungskosten erstellt
- [ ] **Risikobewertung**: Bereitstellungsrisiken identifiziert und gemindert

#### 🚨 Kapitel 7: Fehlerbehebung & Debugging
- [ ] **Diagnosefähigkeiten**: Erfolgreich absichtlich fehlerhafte Bereitstellungen debuggt
- [ ] **Protokollanalyse**: Azure Monitor und Application Insights effektiv genutzt
- [ ] **Leistungsabstimmung**: Langsam laufende Anwendungen optimiert
- [ ] **Wiederherstellungsverfahren**: Backup und Notfallwiederherstellung implementiert
- [ ] **Überwachungssetup**: Proaktive Überwachung und Alarmierung erstellt

#### 🏢 Kapitel 8: Produktion & Unternehmensmuster
- [ ] **Unternehmenssicherheit**: Umfassende Sicherheitsmuster implementiert
- [ ] **Governance-Rahmenwerk**: Azure Policy und Ressourcenmanagement eingerichtet
- [ ] **Fortgeschrittene Überwachung**: Dashboards und automatisierte Alarmierung erstellt
- [ ] **CI/CD-Integration**: Automatisierte Bereitstellungspipelines erstellt
- [ ] **Compliance-Implementierung**: Unternehmens-Compliance-Anforderungen erfüllt

### Lernzeitplan und Meilensteine

#### Woche 1-2: Grundlagen schaffen
- **Meilenstein**: Erste KI-Anwendung mit AZD bereitstellen
- **Validierung**: Funktionierende Anwendung über öffentliche URL zugänglich
- **Fähigkeiten**: Grundlegende AZD-Workflows und KI-Dienstintegration

#### Woche 3-4: Konfigurationsbeherrschung
- **Meilenstein**: Bereitstellung in mehreren Umgebungen mit sicherer Authentifizierung
- **Validierung**: Dieselbe Anwendung in Entwicklung/Staging/Produktion bereitgestellt
- **Fähigkeiten**: Umgebungsverwaltung und Sicherheitsimplementierung

#### Woche 5-6: Infrastruktur-Expertise
- **Meilenstein**: Benutzerdefinierte Vorlage für komplexe Anwendung mit mehreren Diensten
- **Validierung**: Wiederverwendbare Vorlage von einem anderen Teammitglied bereitgestellt
- **Fähigkeiten**: Bicep-Beherrschung und Infrastrukturautomatisierung

#### Woche 7-8: Fortgeschrittene KI-Implementierung
- **Meilenstein**: Produktionsreife Multi-Agent-KI-Lösung
- **Validierung**: System bewältigt reale Last mit Überwachung
- **Fähigkeiten**: Multi-Agent-Orchestrierung und Leistungsoptimierung

#### Woche 9-10: Produktionsbereitschaft
- **Meilenstein**: Unternehmensgerechte Bereitstellung mit vollständiger Compliance
- **Validierung**: Besteht Sicherheitsprüfung und Kostenoptimierungs-Audit
- **Fähigkeiten**: Governance, Überwachung und CI/CD-Integration

### Bewertung und Zertifizierung

#### Methoden zur Wissensvalidierung
1. **Praktische Bereitstellungen**: Funktionierende Anwendungen für jedes Kapitel
2. **Code-Reviews**: Qualitätsbewertung von Vorlagen und Konfigurationen
3. **Problemlösung**: Szenarien zur Fehlerbehebung und Lösungen
4. **Peer-Learning**: Konzepte anderen Lernenden erklären
5. **Beitrag zur Community**: Teilen Sie Vorlagen oder Verbesserungen

#### Ergebnisse der beruflichen Entwicklung
- **Portfolio-Projekte**: 8 einsatzbereite Deployments
- **Technische Fähigkeiten**: Branchenübliche AZD- und KI-Deployment-Expertise
- **Problemlösungsfähigkeiten**: Eigenständige Fehlerbehebung und Optimierung
- **Anerkennung in der Community**: Aktive Teilnahme an der Azure-Entwickler-Community
- **Karrierefortschritt**: Fähigkeiten, die direkt auf Cloud- und KI-Rollen anwendbar sind

#### Erfolgsmessung
- **Erfolgsquote bei Deployments**: >95 % erfolgreiche Deployments
- **Fehlerbehebungszeit**: <30 Minuten für häufige Probleme
- **Leistungsoptimierung**: Nachweisbare Verbesserungen bei Kosten und Leistung
- **Sicherheitskonformität**: Alle Deployments erfüllen Unternehmenssicherheitsstandards
- **Wissensweitergabe**: Fähigkeit, andere Entwickler zu betreuen

### Kontinuierliches Lernen und Engagement in der Community

#### Auf dem Laufenden bleiben
- **Azure-Updates**: Verfolgen Sie die Release Notes des Azure Developer CLI
- **Community-Events**: Nehmen Sie an Azure- und KI-Entwicklerveranstaltungen teil
- **Dokumentation**: Tragen Sie zur Community-Dokumentation und zu Beispielen bei
- **Feedback-Schleife**: Geben Sie Feedback zu Kursinhalten und Azure-Diensten

#### Karriereentwicklung
- **Professionelles Netzwerk**: Vernetzen Sie sich mit Azure- und KI-Experten
- **Vortragsmöglichkeiten**: Präsentieren Sie Ihre Erkenntnisse auf Konferenzen oder Meetups
- **Open-Source-Beitrag**: Tragen Sie zu AZD-Vorlagen und Tools bei
- **Mentoring**: Unterstützen Sie andere Entwickler bei ihrer AZD-Lernreise

---

**Kapitel-Navigation:**
- **📚 Kursübersicht**: [AZD für Einsteiger](../README.md)
- **📖 Lernen beginnen**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschritt verfolgen**: Verfolgen Sie Ihren Fortschritt durch das umfassende 8-Kapitel-Lernsystem
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) für Unterstützung und Diskussion

**Fortschrittsverfolgung beim Lernen**: Nutzen Sie diesen strukturierten Leitfaden, um den Azure Developer CLI durch schrittweises, praxisorientiertes Lernen mit messbaren Ergebnissen und Vorteilen für die berufliche Entwicklung zu meistern.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->