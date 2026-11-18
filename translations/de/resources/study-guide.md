# Studienleitfaden - Umfassende Lernziele

**Navigationspfad des Lernens**
- **📚 Kursstartseite**: [AZD für Anfänger](../README.md)
- **📖 Lernen beginnen**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: [Kursabschluss](../README.md#-course-completion--certification)

## Einführung

Dieser umfassende Studienleitfaden bietet strukturierte Lernziele, Schlüsselkriterien, Übungsaufgaben und Bewertungsmaterialien, um Ihnen zu helfen, Azure Developer CLI (azd) zu meistern. Verwenden Sie diesen Leitfaden, um Ihren Fortschritt zu verfolgen und sicherzustellen, dass Sie alle wesentlichen Themen abgedeckt haben.

## Lernziele

Durch das Abschließen dieses Studienleitfadens werden Sie:
- Alle grundlegenden und fortgeschrittenen Konzepte der Azure Developer CLI beherrschen
- Praktische Fähigkeiten in der Bereitstellung und Verwaltung von Azure-Anwendungen entwickeln
- Vertrauen im Troubleshooting und der Optimierung von Bereitstellungen aufbauen
- Produktionsreife Bereitstellungspraktiken und Sicherheitsaspekte verstehen

## Lernergebnisse

Nach Abschluss aller Abschnitte dieses Studienleitfadens werden Sie in der Lage sein:
- Komplette Anwendungsarchitekturen mit azd zu entwerfen, bereitzustellen und zu verwalten
- Umfassende Überwachungs-, Sicherheits- und Kostenoptimierungsstrategien umzusetzen
- Komplexe Bereitstellungsprobleme eigenständig zu beheben
- Eigene Vorlagen zu erstellen und zur azd-Community beizutragen

## Lernstruktur mit 8 Kapiteln

### Kapitel 1: Grundlagen & Schnellstart (Woche 1)
**Dauer**: 30-45 Minuten | **Komplexität**: ⭐

#### Lernziele
- Kernkonzepte und Terminologie der Azure Developer CLI verstehen
- AZD erfolgreich auf Ihrer Entwicklungsplattform installieren und konfigurieren
- Ihre erste Anwendung mit einer vorhandenen Vorlage bereitstellen
- Die AZD-Befehlszeilenschnittstelle effektiv nutzen

#### Schlüsselkonzepte zum Meistern
- AZD-Projektstruktur und Komponenten (azure.yaml, infra/, src/)
- Vorlagebasierte Bereitstellungsabläufe
- Grundlagen der Umgebungs-Konfiguration
- Verwaltung von Ressourcengruppen und Abonnements

#### Praktische Übungen
1. **Installationsüberprüfung**: Installieren Sie AZD und verifizieren Sie mit `azd version`
2. **Erste Bereitstellung**: Stellen Sie die Vorlage todo-nodejs-mongo erfolgreich bereit
3. **Umgebungseinrichtung**: Konfigurieren Sie Ihre ersten Umgebungsvariablen
4. **Ressourcenerkundung**: Navigieren Sie die bereitgestellten Ressourcen im Azure-Portal

#### Bewertungsfragen
- Was sind die Kernkomponenten eines AZD-Projekts?
- Wie initialisieren Sie ein neues Projekt aus einer Vorlage?
- Was ist der Unterschied zwischen `azd up` und `azd deploy`?
- Wie verwalten Sie mehrere Umgebungen mit AZD?

---

### Kapitel 2: KI-Erst-Entwicklung (Woche 2)
**Dauer**: 4-5 Stunden inklusive Workshop | **Komplexität**: ⭐⭐

#### Lernziele
- Integration von Microsoft Foundry-Diensten in AZD-Workflows
- Verwendung des GA-`microsoft.foundry`-Pakets mit AZD 1.37.0+ für Hosted-Agent-Entwicklung
- Bereitstellung und Konfiguration KI-gestützter Anwendungen
- Verständnis von RAG (Retrieval-Augmented Generation)-Implementierungsmustern
- Verwaltung von KI-Modellbereitstellungen und Skalierung

#### Schlüsselkonzepte zum Meistern
- Integration des Microsoft Foundry Models-Dienstes und API-Management
- KI-Suchkonfiguration und Vektorindizierung
- Strategien zur Modellbereitstellung und Kapazitätsplanung
- Überwachung von KI-Anwendungen und Leistungsoptimierung
- Lokal Agent Inspector versus Cloud-Traces, Quellcode-Bereitstellung und Evaluationsartefakte in der Versionskontrolle

#### Praktische Übungen
1. **KI-Chat-Bereitstellung**: Stellen Sie die Vorlage azure-search-openai-demo bereit
2. **RAG-Implementierung**: Konfigurieren Sie Dokumentenindexierung und -abruf
3. **Modellkonfiguration**: Richten Sie mehrere KI-Modelle mit verschiedenen Zwecken ein
4. **KI-Überwachung**: Implementieren Sie Application Insights für KI-Workloads
5. **GA Hosted Agent**: Folgen Sie dem [hosted-agent walkthrough](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); vergleichen Sie lokale und Cloud-Antworten, überprüfen Sie ein Evaluierungsergebnis und verifizieren Sie die Bereinigungszuständigkeit

#### Bewertungsfragen
- Wie konfigurieren Sie Microsoft Foundry Models-Dienste in einer AZD-Vorlage?
- Was sind die Hauptkomponenten einer RAG-Architektur?
- Wie verwalten Sie Kapazität und Skalierung von KI-Modellen?
- Welche Überwachungsmetriken sind für KI-Anwendungen wichtig?
- Welche Erweiterungen sind in `microsoft.foundry` enthalten und warum werden Evaluierungen separat installiert?
- Warum verursachen lokale Agententests trotzdem Azure-Modellgebühren?
- Was hinterlässt `azd down`, wenn Sie ein bestehendes Foundry-Projekt wiederverwenden?

---

### Kapitel 3: Konfiguration & Authentifizierung (Woche 3)
**Dauer**: 45-60 Minuten | **Komplexität**: ⭐⭐

#### Lernziele
- Umweltkonfigurations- und Verwaltungsstrategien beherrschen
- Sichere Authentifizierungsmuster und Managed Identity implementieren
- Ressourcen mit geeigneten Namenskonventionen organisieren
- Multi-Umgebungs-Bereitstellungen (dev, staging, prod) konfigurieren

#### Schlüsselkonzepte zum Meistern
- Umwelt-Hierarchie und Konfigurationsvorrang
- Managed Identity und Service Principal Authentifizierung
- Key Vault Integration zur Geheimnisverwaltung
- Umgebungsabhängige Parameterverwaltung

#### Praktische Übungen
1. **Multi-Umgebungs-Einrichtung**: Konfigurieren Sie dev-, staging- und prod-Umgebungen
2. **Sicherheitskonfiguration**: Implementieren Sie Managed Identity Authentifizierung
3. **Geheimnisverwaltung**: Integrieren Sie Azure Key Vault für sensible Daten
4. **Parameterverwaltung**: Erstellen Sie umgebungsspezifische Konfigurationen

#### Bewertungsfragen
- Wie konfigurieren Sie unterschiedliche Umgebungen mit AZD?
- Welche Vorteile bietet Managed Identity gegenüber Service Principal?
- Wie verwalten Sie Anwendungssgeheimnisse sicher?
- Wie ist die Konfigurationshierarchie in AZD?

---

### Kapitel 4: Infrastruktur als Code & Bereitstellung (Woche 4-5)
**Dauer**: 1-1,5 Stunden | **Komplexität**: ⭐⭐⭐

#### Lernziele
- Erstellen und Anpassen von Bicep-Infrastrukturvorlagen
- Fortgeschrittene Bereitstellungsmuster und Workflows implementieren
- Ressourcenbereitstellungsstrategien verstehen
- Skalierbare Multi-Service-Architekturen entwerfen

- Containerisierte Anwendungen mit Azure Container Apps und AZD bereitstellen


#### Schlüsselkonzepte zum Meistern
- Bicep-Vorlagenstruktur und Best Practices
- Ressourcenabhängigkeiten und Bereitstellungsreihenfolge
- Parameterdateien und Vorlagenmodularität
- Benutzerdefinierte Hooks und Automatisierung der Bereitstellung
- Muster zur Container-App-Bereitstellung (Schnellstart, Produktion, Microservices)

#### Praktische Übungen
1. **Eigene Vorlage erstellen**: Erstellen Sie eine Multi-Service-Anwendungs-Vorlage
2. **Bicep Beherrschung**: Erstellen Sie modulare, wiederverwendbare Infrastrukturkomponenten
3. **Bereitstellungsautomatisierung**: Implementieren Sie Pre- und Post-Deployment-Hooks
4. **Architekturdesign**: Stellen Sie komplexe Microservices-Architekturen bereit
5. **Container-App Bereitstellung**: Stellen Sie die Beispiele [Simple Flask API](../../../examples/container-app/simple-flask-api) und [Microservices Architecture](../../../examples/container-app/microservices) mit AZD bereit

#### Bewertungsfragen
- Wie erstellen Sie benutzerdefinierte Bicep-Vorlagen für AZD?
- Was sind die Best Practices zur Organisation von Infrastrukturcode?
- Wie handhaben Sie Ressourcenabhängigkeiten in Vorlagen?
- Welche Bereitstellungsmuster unterstützen Zero-Downtime-Updates?

---

### Kapitel 5: Multi-Agent KI-Lösungen (Woche 6-7)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Multi-Agent KI-Architekturen entwerfen und implementieren
- Agenten-Koordination und Kommunikation orchestrieren
- Produktionsreife KI-Lösungen mit Überwachung bereitstellen
- Agentenspezialisierung und Workflow-Muster verstehen
- In Multi-Agenten-Lösungen containerisierte Microservices integrieren

#### Schlüsselkonzepte zum Meistern
- Muster für Multi-Agenten-Architekturen und Designprinzipien
- Agentenkommunikationsprotokolle und Datenfluss
- Lastverteilung und Skalierungsstrategien für KI-Agenten
- Produktionsüberwachung für Multi-Agenten-Systeme
- Service-to-Service-Kommunikation in containerisierten Umgebungen

#### Praktische Übungen
1. **Überprüfung der Retail-Architektur**: Analysieren Sie das Retail-Blueprint und identifizieren Sie, welche Anwendungsbestandteile vor der Bereitstellung implementiert werden müssen
2. **Agentenanpassung**: Modifizieren Sie das Verhalten von Customer- und Inventory-Agenten
3. **Architekturskalierung**: Implementieren Sie Lastverteilung und Auto-Skalierung
4. **Produktionsüberwachung**: Richten Sie umfassende Überwachung und Alarmierung ein
5. **Microservices-Integration**: Erweitern Sie das Beispiel [Microservices Architecture](../../../examples/container-app/microservices) zur Unterstützung agentenbasierter Workflows

#### Bewertungsfragen
- Wie entwerfen Sie effektive Kommunikationmuster für Multi-Agenten?
- Was sind die wichtigsten Überlegungen zur Skalierung von KI-Agenten-Workloads?
- Wie überwachen und debuggen Sie Multi-Agent KI-Systeme?
- Welche Produktionsmuster gewährleisten Zuverlässigkeit für KI-Agenten?

---

### Kapitel 6: Validierung & Planung vor der Bereitstellung (Woche 8)
**Dauer**: 1 Stunde | **Komplexität**: ⭐⭐

#### Lernziele
- Umfassende Kapazitätsplanung und Ressourcenvalidierung durchführen
- Optimale Azure-SKUs für Kostenwirksamkeit auswählen
- Automatisierte Pre-Flight-Checks und Validierung implementieren
- Bereitstellungen mit Kostenoptimierungsstrategien planen

#### Schlüsselkonzepte zum Meistern
- Azure-Ressourcenquoten und Kapazitätsbeschränkungen
- Auswahlkriterien für SKUs und Kostenoptimierung
- Automatisierte Validierungsskripte und Tests
- Bereitstellungsplanung und Risikoabschätzung

#### Praktische Übungen
1. **Kapazitätsanalyse**: Analysieren Sie Ressourcenanforderungen für Ihre Anwendungen
2. **SKU-Optimierung**: Vergleichen und wählen Sie kosteneffiziente Service-Stufen aus
3. **Validierungsautomatisierung**: Implementieren Sie Skripte für Pre-Deployment-Checks
4. **Kostenplanung**: Erstellen Sie Kostenvoranschläge und Budgets für Bereitstellungen

#### Bewertungsfragen
- Wie validieren Sie Azure-Kapazität vor der Bereitstellung?
- Welche Faktoren beeinflussen SKU-Auswahlentscheidungen?
- Wie automatisieren Sie die Validierung vor der Bereitstellung?
- Welche Strategien helfen, Bereitstellungskosten zu optimieren?

---

### Kapitel 7: Fehlerbehebung & Debugging (Woche 9)
**Dauer**: 1-1,5 Stunden | **Komplexität**: ⭐⭐

#### Lernziele
- Systematische Debugging-Ansätze für AZD-Bereitstellungen entwickeln
- Häufige Probleme bei Bereitstellung und Konfiguration lösen
- KI-spezifische Probleme und Leistungsprobleme debuggen
- Überwachung und Alarmierung für proaktive Fehlererkennung implementieren

#### Schlüsselkonzepte zum Meistern
- Diagnosetechniken und Protokollierungsstrategien
- Häufige Fehlerbilder und deren Lösungen
- Leistungsüberwachung und -optimierung
- Vorfallsreaktion und Wiederherstellungsverfahren

#### Praktische Übungen
1. **Diagnosefähigkeiten**: Üben Sie mit absichtlich fehlerhaften Bereitstellungen
2. **Protokollanalyse**: Nutzen Sie Azure Monitor und Application Insights effektiv
3. **Leistungsoptimierung**: Optimieren Sie langsam laufende Anwendungen
4. **Wiederherstellungsverfahren**: Implementieren Sie Backup- und Notfallwiederherstellungslösungen

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
- Best Practices für Produktiv-Bereitstellungen von Container-Apps anwenden (Sicherheit, Überwachung, Kosten, CI/CD)

#### Schlüsselkonzepte zum Meistern
- Unternehmenssicherheit und Compliance-Anforderungen
- Governance-Rahmenwerke und Richtlinienimplementierung
- Fortgeschrittene Überwachung und Kostenmanagement
- CI/CD-Integration und automatisierte Bereitstellungspipelines
- Blue-Green- und Canary-Bereitstellungsstrategien für containerisierte Workloads

#### Praktische Übungen
1. **Unternehmenssicherheit**: Implementieren Sie umfassende Sicherheitsmuster
2. **Governance-Rahmenwerk**: Richten Sie Azure Policy und Ressourcenmanagement ein
3. **Fortgeschrittene Überwachung**: Erstellen Sie Dashboards und automatisierte Alarmierungen
4. **CI/CD-Integration**: Erstellen Sie automatisierte Bereitstellungspipelines
5. **Produktions-Container-Apps**: Wenden Sie Sicherheit, Überwachung und Kostenoptimierung auf das Beispiel [Microservices Architecture](../../../examples/container-app/microservices) an

#### Bewertungsfragen
- Wie implementieren Sie Unternehmenssicherheit in AZD-Bereitstellungen?
- Welche Governance-Muster gewährleisten Compliance und Kostenkontrolle?
- Wie entwerfen Sie skalierbare Überwachung für Produktivsysteme?
- Welche CI/CD-Muster funktionieren am besten mit AZD-Workflows?

#### Lernziele
- Azure Developer CLI Grundlagen und Kernkonzepte verstehen
- Erfolgreiche Installation und Konfiguration von azd in Ihrer Entwicklungsumgebung
- Ihre erste Bereitstellung mit einer bestehenden Vorlage abschließen
- Azd-Projektstruktur navigieren und Schlüsselkomponenten verstehen

#### Schlüsselkonzepte zum Meistern
- Vorlagen, Umgebungen und Dienste
- Struktur der azure.yaml-Konfiguration
- Grundlegende azd-Befehle (init, up, down, deploy)
- Prinzipien von Infrastruktur als Code
- Azure-Authentifizierung und -Autorisierung

#### Übungsaufgaben

**Übung 1.1: Installation und Einrichtung**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Übung 1.2: Erste Bereitstellung**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
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
3. Wie helfen Umgebungen bei der Verwaltung unterschiedlicher Bereitstellungsziele?
4. Welche Authentifizierungsmethoden können mit azd verwendet werden?
5. Was passiert, wenn Sie `azd up` zum ersten Mal ausführen?

---

## Fortschrittsverfolgung und Bewertungsrahmen
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Übung 2.2: Erweiterte Konfiguration**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Übung 2.3: Sicherheitskonfiguration**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selbstbewertungsfragen
1. Wie handhabt azd die Priorität von Umgebungsvariablen?
2. Was sind bereitstellungsbezogene Hooks und wann sollten sie verwendet werden?
3. Wie konfigurieren Sie unterschiedliche SKUs für verschiedene Umgebungen?
4. Welche Sicherheitsimplikationen haben unterschiedliche Authentifizierungsmethoden?
5. Wie verwalten Sie Geheimnisse und sensible Konfigurationsdaten?

### Modul 3: Bereitstellung und Provisionierung (Woche 4)

#### Lernziele
- Deployment-Workflows und Best Practices beherrschen
- Infrastruktur als Code mit Bicep-Vorlagen verstehen
- Komplexe Multi-Service-Architekturen implementieren
- Leistung und Zuverlässigkeit bei Bereitstellungen optimieren

#### Schlüsselkonzepte zum Meistern
- Bicep-Vorlagenstruktur und Module
- Ressourcenabhängigkeiten und Reihenfolge
- Bereitstellungsstrategien (Blue-Green, Rolling Updates)
- Multi-Regional-Bereitstellungen
- Datenbankmigrationen und Datenverwaltung

#### Übungsaufgaben

**Übung 3.1: Eigene Infrastruktur**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Übung 3.2: Multi-Service-Anwendung**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Übung 3.3: Datenbankintegration**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Fragen zur Selbstbewertung
1. Welche Vorteile hat die Verwendung von Bicep im Vergleich zu ARM-Vorlagen?
2. Wie werden Datenbankmigrationen bei azd-Bereitstellungen gehandhabt?
3. Welche Strategien gibt es für Deployments ohne Ausfallzeiten?
4. Wie verwalten Sie Abhängigkeiten zwischen Diensten?
5. Welche Überlegungen gibt es für Deployments in mehreren Regionen?

### Modul 4: Validierung vor der Bereitstellung (Woche 5)

#### Lernziele
- Umfassende Prüfungen vor der Bereitstellung implementieren
- Kapazitätsplanung und Ressourcenvalidierung beherrschen
- SKU-Auswahl und Kostenoptimierung verstehen
- Automatisierte Validierungspipelines erstellen

#### Wichtige Konzepte zum Beherrschen
- Azure-Ressourcenquoten und -limits
- Kriterien zur SKU-Auswahl und Kostenauswirkungen
- Automatisierte Validierungsskripte und -tools
- Methoden der Kapazitätsplanung
- Leistungstests und -optimierung

#### Übungsaufgaben

**Übung 4.1: Kapazitätsplanung**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Übung 4.2: Validierung vor dem Start**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Übung 4.3: SKU-Optimierung**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Fragen zur Selbstbewertung
1. Welche Faktoren sollten die Auswahl einer SKU beeinflussen?
2. Wie validieren Sie die Verfügbarkeit von Azure-Ressourcen vor der Bereitstellung?
3. Was sind die wichtigsten Komponenten eines Validierungssystems vor dem Start?
4. Wie schätzen und kontrollieren Sie Bereitstellungskosten?
5. Welche Überwachung ist für die Kapazitätsplanung unerlässlich?

### Modul 5: Fehlerbehebung und Debugging (Woche 6)

#### Lernziele
- Systematische Fehlerbehebungsmethoden beherrschen
- Expertise im Debugging komplexer Bereitstellungsprobleme entwickeln
- Umfassende Überwachung und Alarmierung implementieren
- Verfahren zur Vorfallreaktion und Wiederherstellung erstellen

#### Wichtige Konzepte zum Beherrschen
- Häufige Muster von Bereitstellungsfehlern
- Techniken zur Protokollanalyse und Korrelation
- Leistungsüberwachung und -optimierung
- Erkennung und Reaktion auf Sicherheitsvorfälle
- Notfallwiederherstellung und Geschäftskontinuität

#### Übungsaufgaben

**Übung 5.1: Fehlerbehebungsszenarien**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Übung 5.2: Implementierung der Überwachung**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Übung 5.3: Vorfallreaktion**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Fragen zur Selbstbewertung
1. Was ist der systematische Ansatz zur Fehlerbehebung bei azd-Bereitstellungen?
2. Wie korrelieren Sie Protokolle über mehrere Dienste und Ressourcen hinweg?
3. Welche Überwachungsmetriken sind für die frühzeitige Problemkennung am wichtigsten?
4. Wie implementieren Sie effektive Verfahren zur Notfallwiederherstellung?
5. Was sind die Hauptbestandteile eines Vorfallreaktionsplans?

### Modul 6: Fortgeschrittene Themen und Best Practices (Woche 7-8)

#### Lernziele
- Enterprise-Grade-Bereitstellungsmuster implementieren
- CI/CD-Integration und Automatisierung beherrschen
- Eigene Vorlagen entwickeln und zur Community beitragen
- Fortgeschrittene Sicherheits- und Compliance-Anforderungen verstehen

#### Wichtige Konzepte zum Beherrschen
- Integrationsmuster für CI/CD-Pipelines
- Entwicklung und Verteilung benutzerdefinierter Vorlagen
- Unternehmenssteuerung und Compliance
- Fortgeschrittene Netzwerk- und Sicherheitskonfigurationen
- Leistungsoptimierung und Kostenmanagement

#### Übungsaufgaben

**Übung 6.1: CI/CD-Integration**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Übung 6.2: Entwicklung benutzerdefinierter Vorlagen**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Übung 6.3: Unternehmensimplementierung**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Fragen zur Selbstbewertung
1. Wie integrieren Sie azd in bestehende CI/CD-Workflows?
2. Was sind die wichtigsten Überlegungen für die Entwicklung benutzerdefinierter Vorlagen?
3. Wie implementieren Sie Governance und Compliance bei azd-Bereitstellungen?
4. Was sind die Best Practices für Bereitstellungen im Unternehmensmaßstab?
5. Wie tragen Sie effektiv zur azd-Community bei?

## Praktische Projekte

### Projekt 1: Persönliche Portfolio-Webseite
**Komplexität**: Anfänger  
**Dauer**: 1-2 Wochen

Erstellen und bereitstellen einer persönlichen Portfolio-Webseite mit:
- Statisches Hosting auf Azure Storage
- Konfiguration einer benutzerdefinierten Domain
- CDN-Integration für globale Leistung
- Automatisierte Bereitstellungspipeline

**Liefergegenstände**:
- Funktionierende Webseite auf Azure bereitgestellt
- Benutzerdefinierte azd-Vorlage für Portfolio-Bereitstellungen
- Dokumentation des Bereitstellungsprozesses
- Kostenanalyse und Optimierungsempfehlungen

### Projekt 2: Aufgabenverwaltungsanwendung
**Komplexität**: Mittelstufe  
**Dauer**: 2-3 Wochen

Erstellen einer Full-Stack-Aufgabenverwaltungsanwendung mit:
- React-Frontend, bereitgestellt auf App Service
- Node.js-API-Backend mit Authentifizierung
- PostgreSQL-Datenbank mit Migrationen
- Application Insights Überwachung

**Liefergegenstände**:
- Vollständige Anwendung mit Benutzer-Authentifizierung
- Datenbankschema und Migrationsskripte
- Überwachungs-Dashboards und Alarmierungsregeln
- Multi-Umgebungsbereitstellungskonfiguration

### Projekt 3: Microservices E-Commerce-Plattform
**Komplexität**: Fortgeschritten  
**Dauer**: 4-6 Wochen

Entwerfen und implementieren einer Microservices-basierten E-Commerce-Plattform:
- Mehrere API-Dienste (Katalog, Bestellungen, Zahlungen, Benutzer)
- Nachrichtenwarteschlangenintegration mit Service Bus
- Redis-Cache zur Leistungsoptimierung
- Umfassende Protokollierung und Überwachung

**Referenzbeispiel**: Siehe [Microservices Architecture](../../../examples/container-app/microservices) für ein Lernbeispiel mit zwei Diensten und Bereitstellungsanleitung. Warteschlangen, Persistenz, Authentifizierung, Zahlungsabwicklung und Produktionshärtung sind separate Projektarbeiten.

**Liefergegenstände**:
- Vollständige Microservices-Architektur
- Kommunikationsmuster zwischen Diensten
- Leistungstests und -optimierung
- Produktionsreife Sicherheitsimplementierung

## Bewertung und Zertifizierung

### Wissenskontrollen

Führen Sie diese Bewertungen nach jedem Modul durch:

**Modul 1 Bewertung**: Grundkonzepte und Installation
- Multiple-Choice-Fragen zu Kernkonzepten
- Praktische Installations- und Konfigurationsaufgaben
- Einfache Bereitstellungsübung

**Modul 2 Bewertung**: Konfiguration und Umgebungen
- Szenarien zum Umgebungsmanagement
- Fehlerbehebungsübungen zur Konfiguration
- Implementierung der Sicherheitskonfiguration

**Modul 3 Bewertung**: Bereitstellung und Bereitstellung
- Herausforderungen im Infrastrukturdesign
- Multi-Service-Bereitstellungsszenarien
- Leistungsoptimierungsübungen

**Modul 4 Bewertung**: Validierung vor der Bereitstellung
- Fallstudien zur Kapazitätsplanung
- Szenarien zur Kostenoptimierung
- Implementierung von Validierungspipelines

**Modul 5 Bewertung**: Fehlerbehebung und Debugging
- Übungen zur Problemdiagnose
- Aufgaben zur Überwachungsimplementierung
- Simulationen zur Vorfallreaktion

**Modul 6 Bewertung**: Fortgeschrittene Themen
- CI/CD-Pipeline-Design
- Entwicklung benutzerdefinierter Vorlagen
- Szenarien zur Unternehmensarchitektur

### Abschlussprojekt

Entwerfen und implementieren Sie eine vollständige Lösung, die die Beherrschung aller Konzepte demonstriert:

**Anforderungen**:
- Mehrschichtige Anwendungsarchitektur
- Mehrere Bereitstellungsumgebungen
- Umfassende Überwachung und Alarmierung
- Sicherheits- und Compliance-Implementierung
- Kostenoptimierung und Leistungsanpassung
- Vollständige Dokumentation und Runbooks

**Bewertungskriterien**:
- Technische Implementierungsqualität
- Vollständigkeit der Dokumentation
- Einhaltung von Sicherheits- und Best-Practice-Vorgaben
- Leistung und Kostenoptimierung
- Effektivität von Fehlerbehebung und Überwachung

## Lernressourcen und Referenzen

### Offizielle Dokumentation
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep-Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architekturzentrum](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-Ressourcen
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub-Organisation](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub-Repository](https://github.com/Azure/azure-dev)

### Übungsumgebungen
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Zusätzliche Tools
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Empfehlungen zum Lernzeitplan

### Vollzeitstudium (8 Wochen)
- **Wochen 1-2**: Module 1-2 (Erste Schritte, Konfiguration)
- **Wochen 3-4**: Module 3-4 (Bereitstellung, Validierung vor der Bereitstellung)
- **Wochen 5-6**: Module 5-6 (Fehlerbehebung, Fortgeschrittene Themen)
- **Wochen 7-8**: Praktische Projekte und Abschlussbewertung

### Teilzeitstudium (16 Wochen)
- **Wochen 1-4**: Modul 1 (Erste Schritte)
- **Wochen 5-7**: Modul 2 (Konfiguration und Umgebungen)
- **Wochen 8-10**: Modul 3 (Bereitstellung und Bereitstellung)
- **Wochen 11-12**: Modul 4 (Validierung vor der Bereitstellung)
- **Wochen 13-14**: Modul 5 (Fehlerbehebung und Debugging)
- **Wochen 15-16**: Modul 6 (Fortgeschrittene Themen und Bewertung)

---

## Fortschrittsverfolgung und Bewertungsrahmen

### Checkliste zum Kapitelabschluss

Verfolgen Sie Ihren Fortschritt in jedem Kapitel mit diesen messbaren Ergebnissen:

#### 📚 Kapitel 1: Grundlagen & Schnellstart
- [ ] **Installation abgeschlossen**: AZD auf Ihrer Plattform installiert und überprüft
- [ ] **Erste Bereitstellung**: Vorlage todo-nodejs-mongo erfolgreich bereitgestellt
- [ ] **Umgebungskonfiguration**: Erste Umgebungsvariablen konfiguriert
- [ ] **Ressourcennavigation**: Bereitgestellte Ressourcen im Azure-Portal erkundet
- [ ] **Befehlsbeherrschung**: Sicherer Umgang mit grundlegenden AZD-Befehlen

#### 🤖 Kapitel 2: KI-First-Entwicklung  
- [ ] **KI-Vorlagenbereitstellung**: azure-search-openai-demo erfolgreich bereitgestellt
- [ ] **RAG-Implementierung**: Dokumentenindexierung und -abruf konfiguriert
- [ ] **Modellkonfiguration**: Mehrere KI-Modelle mit unterschiedlichen Zwecken eingerichtet
- [ ] **KI-Überwachung**: Application Insights für KI-Workloads implementiert
- [ ] **Leistungsoptimierung**: KI-Anwendungsleistung verbessert

#### ⚙️ Kapitel 3: Konfiguration & Authentifizierung
- [ ] **Multi-Umgebungs-Setup**: Dev-, Staging- und Prod-Umgebungen konfiguriert
- [ ] **Sicherheitsimplementierung**: Managed Identity-Authentifizierung eingerichtet
- [ ] **Geheimnisverwaltung**: Azure Key Vault für sensible Daten integriert
- [ ] **Parameterverwaltung**: Umgebungspezifische Konfigurationen erstellt
- [ ] **Authenfizierungsbeherrschung**: Sichere Zugriffsmuster implementiert

#### 🏗️ Kapitel 4: Infrastruktur als Code & Bereitstellung
- [ ] **Eigene Vorlage erstellt**: Multi-Service-Anwendungsvorlage erstellt
- [ ] **Bicep-Beherrschung**: Modulare, wiederverwendbare Infrastrukturkomponenten erstellt
- [ ] **Deployment-Automatisierung**: Pre- und Post-Deployment-Hooks implementiert
- [ ] **Architekturdesign**: Komplexe Microservices-Architektur bereitgestellt
- [ ] **Vorlagenoptimierung**: Vorlagen für Leistung und Kosten optimiert

#### 🎯 Kapitel 5: Multi-Agent KI-Lösungen
- [ ] **Retail-Architekturüberprüfung**: Fehlende Anwendungsbestandteile identifiziert und deren Implementierung und Validierung geplant
- [ ] **Agentenanpassung**: Verhaltensweisen der Kunden- und Bestandsagenten modifiziert
- [ ] **Architekturskalierung**: Lastenausgleich und Auto-Scaling implementiert
- [ ] **Produktionsüberwachung**: Umfassende Überwachung und Alarmierung eingerichtet
- [ ] **Leistungsoptimierung**: Leistung des Multi-Agenten-Systems optimiert

#### 🔍 Kapitel 6: Validierung & Planung vor der Bereitstellung
- [ ] **Kapazitätsanalyse**: Ressourcenanforderungen für Anwendungen analysiert
- [ ] **SKU-Optimierung**: Kostenwirksame Service-Tiers ausgewählt
- [ ] **Validierungsautomatisierung**: Prüfungs-Skripte vor der Bereitstellung implementiert
- [ ] **Kostenplanung**: Bereitstellungskosten geschätzt und Budgets erstellt
- [ ] **Risikobewertung**: Bereitstellungsrisiken identifiziert und minimiert

#### 🚨 Kapitel 7: Fehlerbehebung & Debugging
- [ ] **Diagnosefähigkeiten**: Absichtlich fehlerhafte Bereitstellungen erfolgreich debuggt
- [ ] **Protokollanalyse**: Azure Monitor und Application Insights wirkungsvoll genutzt
- [ ] **Leistungsoptimierung**: Langsam laufende Anwendungen optimiert
- [ ] **Wiederherstellungsverfahren**: Backup und Notfallwiederherstellung implementiert
- [ ] **Überwachung eingerichted**: Proaktive Überwachung und Alarmierung erstellt

#### 🏢 Kapitel 8: Produktions- & Unternehmensmuster
- [ ] **Enterprise Security**: Umfassende Sicherheitsmuster implementiert
- [ ] **Governance Framework**: Azure Policy und Ressourcenmanagement eingerichtet
- [ ] **Fortgeschrittene Überwachung**: Dashboards und automatisierte Alarmierung erstellt
- [ ] **CI/CD-Integration**: Automatisierte Bereitstellungspipelines gebaut
- [ ] **Compliance-Implementierung**: Unternehmensweite Compliance-Anforderungen erfüllt

### Lernzeitplan und Meilensteine

#### Woche 1-2: Grundlagen schaffen
- **Meilenstein**: Erste KI-Anwendung mit AZD bereitgestellt
- **Validierung**: Funktionierende Anwendung über öffentliche URL zugänglich
- **Fähigkeiten**: Grundlegende AZD-Workflows und KI-Service-Integration

#### Woche 3-4: Konfigurationsbeherrschung
- **Meilenstein**: Multi-Umgebungsbereitstellung mit sicherer Authentifizierung
- **Validierung**: Dieselbe Anwendung in Dev/Staging/Prod bereitgestellt
- **Fähigkeiten**: Umgebungsmanagement und Sicherheitsimplementierung

#### Woche 5-6: Infrastruktur-Expertise
- **Meilenstein**: Eigene Vorlage für komplexe Multi-Service-Anwendung
- **Validierung**: Wiederverwendbare Vorlage von anderem Teammitglied bereitgestellt
- **Fähigkeiten**: Bicep-Beherrschung und Infrastrukturautomatisierung

#### Woche 7-8: Fortgeschrittene KI-Implementierung
- **Meilenstein**: Produktionsreife Multi-Agent KI-Lösung
- **Validierung**: System bewältigt Real-World-Last mit Überwachung
- **Fähigkeiten**: Multi-Agent-Orchestrierung und Leistungsoptimierung

#### Woche 9-10: Produktionsreife
- **Meilenstein**: Unternehmensgerechte Bereitstellung mit voller Compliance
- **Validierung**: Besteht Sicherheitsprüfung und Kostenoptimierungsaudit
- **Fähigkeiten**: Governance, Überwachung und CI/CD-Integration

### Bewertung und Zertifizierung

#### Methoden zur Wissensvalidierung
1. **Praktische Implementierungen**: Funktionierende Anwendungen für jedes Kapitel
2. **Code Reviews**: Bewertung von Vorlagen und Konfigurationsqualität
3. **Problemlösung**: Fehlerszenarien und Lösungen
4. **Peer Teaching**: Konzepte anderen Lernenden erklären
5. **Community-Beitrag**: Vorlagen oder Verbesserungen teilen

#### Ergebnisse der beruflichen Weiterentwicklung
- **Portfolio-Projekte**: Lernimplementierungen und Architekturübungen; Produktionsreife erfordert separate Implementierung und Überprüfung
- **Technische Fähigkeiten**: Branchenübliche AZD- und KI-Bereitstellungskompetenz
- **Problemlösefähigkeiten**: Unabhängige Fehlersuche und Optimierung
- **Community-Anerkennung**: Aktive Teilnahme an der Azure-Entwickler-Community
- **Karrierefortschritt**: Direkt anwendbare Fähigkeiten für Cloud- und KI-Rollen

#### Erfolgsmessungen
- **Bereitstellungserfolgsquote**: >95% erfolgreiche Bereitstellungen
- **Fehlersuchzeit**: <30 Minuten für häufige Probleme
- **Leistungsoptimierung**: Nachweisbare Verbesserungen bei Kosten und Leistung
- **Sicherheitsprüfung**: Dokumentieren Sie Kontrollen und verbleibende Lücken im Vergleich zu den Anforderungen Ihrer Organisation; Kursabschluss zertifiziert keine Compliance
- **Wissensweitergabe**: Fähigkeit, andere Entwickler zu betreuen

### Kontinuierliches Lernen und Community-Engagement

#### Bleiben Sie auf dem Laufenden
- **Azure-Updates**: Folgen Sie den Release Notes der Azure Developer CLI
- **Community-Veranstaltungen**: Nehmen Sie an Azure- und KI-Entwicklerveranstaltungen teil
- **Dokumentation**: Tragen Sie zur Community-Dokumentation und zu Beispielen bei
- **Feedback-Schleife**: Geben Sie Feedback zum Kursinhalt und zu Azure-Diensten

#### Karriereentwicklung
- **Professionelles Netzwerk**: Vernetzen Sie sich mit Azure- und KI-Experten
- **Vortragsmöglichkeiten**: Präsentieren Sie Lerninhalte auf Konferenzen oder Meetups
- **Open Source Beitrag**: Beiträge zu AZD-Vorlagen und Tools leisten
- **Mentoring**: Begleiten Sie andere Entwickler auf ihrem AZD-Lernweg

---

**Kapitel-Navigation:**
- **📚 Kursstartseite**: [AZD For Beginners](../README.md)
- **📖 Lernen beginnen**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: Verfolgen Sie Ihren Fortschritt durch das umfassende 8-Kapitel-Lernsystem
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) für Unterstützung und Diskussion

**Studienfortschrittsverfolgung**: Nutzen Sie diesen strukturierten Leitfaden, um die Azure Developer CLI durch fortschreitendes, praktisches Lernen mit messbaren Ergebnissen und Vorteilen für die berufliche Entwicklung zu meistern.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->