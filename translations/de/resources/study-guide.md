# Studienführer - Umfassende Lernziele

**Navigation des Lernpfads**
- **📚 Kursstartseite**: [AZD für Anfänger](../README.md)
- **📖 Lernen beginnen**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: [Kursabschluss](../README.md#-course-completion--certification)

## Einführung

Dieser umfassende Studienführer bietet strukturierte Lernziele, Schlüsselkonzepte, Übungsaufgaben und Bewertungsmaterialien, um Ihnen zu helfen, Azure Developer CLI (azd) zu meistern. Nutzen Sie diesen Leitfaden, um Ihren Fortschritt zu verfolgen und sicherzustellen, dass Sie alle wesentlichen Themen abgedeckt haben.

## Lernziele

Durch das Abschließen dieses Studienführers werden Sie:
- Alle grundlegenden und fortgeschrittenen Konzepte von Azure Developer CLI beherrschen
- Praktische Fähigkeiten für das Bereitstellen und Verwalten von Azure-Anwendungen entwickeln
- Vertrauen beim Beheben und Optimieren von Bereitstellungen aufbauen
- Produktionsreife Bereitstellungspraktiken und Sicherheitsaspekte verstehen

## Lernergebnisse

Nach Abschluss aller Abschnitte dieses Studienführers werden Sie in der Lage sein:
- Vollständige Anwendungsarchitekturen mit azd zu entwerfen, bereitzustellen und zu verwalten
- Umfassende Überwachungs-, Sicherheits- und Kostenoptimierungsstrategien umzusetzen
- Komplexe Bereitstellungsprobleme eigenständig zu beheben
- Eigene Vorlagen zu erstellen und zur azd-Community beizutragen

## 8-Kapitel Lernstruktur

### Kapitel 1: Grundlagen & Schnellstart (Woche 1)
**Dauer**: 30-45 Minuten | **Komplexität**: ⭐

#### Lernziele
- Azure Developer CLI-Kernkonzepte und Terminologie verstehen
- AZD erfolgreich auf Ihrer Entwicklungsplattform installieren und konfigurieren
- Ihre erste Anwendung mit einer vorhandenen Vorlage bereitstellen
- Die AZD-Befehlszeilenschnittstelle effektiv navigieren

#### Schlüsselkonzepte zum Meistern
- AZD-Projektstruktur und Komponenten (azure.yaml, infra/, src/)
- Vorlagebasierte Bereitstellungs-Workflows
- Grundlagen der Umgebungs-Konfiguration
- Verwaltung von Ressourcengruppen und Abonnements

#### Praktische Übungen
1. **Installationsprüfung**: Installieren Sie AZD und überprüfen Sie mit `azd version`
2. **Erste Bereitstellung**: Setzen Sie die Vorlage todo-nodejs-mongo erfolgreich ein
3. **Umgebungssetup**: Konfigurieren Sie Ihre ersten Umgebungsvariablen
4. **Ressourcenerkundung**: Navigieren Sie zu bereitgestellten Ressourcen im Azure-Portal

#### Bewertungsfragen
- Was sind die Kernkomponenten eines AZD-Projekts?
- Wie initialisieren Sie ein neues Projekt aus einer Vorlage?
- Was ist der Unterschied zwischen `azd up` und `azd deploy`?
- Wie verwalten Sie mehrere Umgebungen mit AZD?

---

### Kapitel 2: AI-First Entwicklung (Woche 2)
**Dauer**: 1-2 Stunden | **Komplexität**: ⭐⭐

#### Lernziele
- Microsoft Foundry Dienste in AZD-Workflows integrieren
- KI-gestützte Anwendungen bereitstellen und konfigurieren
- RAG (Retrieval-Augmented Generation) Implementierungsmuster verstehen
- KI-Modell-Bereitstellungen und Skalierung verwalten

#### Schlüsselkonzepte zum Meistern
- Integration von Microsoft Foundry Models Service und API-Verwaltung
- KI-Suchkonfiguration und Vektorindexierung
- Modellbereitstellungsstrategien und Kapazitätsplanung
- KI-Anwendung-Monitoring und Leistungsoptimierung

#### Praktische Übungen
1. **KI-Chat-Bereitstellung**: Verteilen Sie die Vorlage azure-search-openai-demo
2. **RAG-Implementierung**: Konfigurieren Sie Dokumentindexierung und Abruf
3. **Modellkonfiguration**: Richten Sie mehrere KI-Modelle mit unterschiedlichen Zwecken ein
4. **KI-Überwachung**: Implementieren Sie Application Insights für KI-Workloads

#### Bewertungsfragen
- Wie konfigurieren Sie Microsoft Foundry Models Dienste in einer AZD-Vorlage?
- Was sind die Hauptkomponenten einer RAG-Architektur?
- Wie verwalten Sie KI-Modellkapazität und Skalierung?
- Welche Überwachungsmetriken sind für KI-Anwendungen wichtig?

---

### Kapitel 3: Konfiguration & Authentifizierung (Woche 3)
**Dauer**: 45-60 Minuten | **Komplexität**: ⭐⭐

#### Lernziele
- Umweltkonfigurations- und Verwaltungsstrategien beherrschen
- Sichere Authentifizierungsmuster und verwaltete Identitäten implementieren
- Ressourcen mit passenden Benennungskonventionen organisieren
- Multi-Umgebungs-Bereitstellungen (dev, staging, prod) konfigurieren

#### Schlüsselkonzepte zum Meistern
- Umwelt-Hierarchie und Konfigurationsvorrang
- Verwaltete Identität und Dienstprinzipal-Authentifizierung
- Key Vault-Integration für Geheimnisverwaltung
- Umwelt-spezifische Parameterverwaltung

#### Praktische Übungen
1. **Multi-Umgebungs-Setup**: Konfigurieren Sie dev-, staging- und prod-Umgebungen
2. **Sicherheitskonfiguration**: Implementieren Sie verwaltete Identitätsauthentifizierung
3. **Geheimnisverwaltung**: Integrieren Sie Azure Key Vault für sensible Daten
4. **Parameterverwaltung**: Erstellen Sie umgebungsspezifische Konfigurationen

#### Bewertungsfragen
- Wie konfigurieren Sie verschiedene Umgebungen mit AZD?
- Was sind die Vorteile der Nutzung verwalteter Identitäten gegenüber Dienstprinzipalen?
- Wie verwalten Sie Anwendungsgeheimnisse sicher?
- Wie ist die Konfigurationshierarchie in AZD?

---

### Kapitel 4: Infrastructure as Code & Deployment (Woche 4-5)
**Dauer**: 1-1,5 Stunden | **Komplexität**: ⭐⭐⭐

#### Lernziele
- Erstellen und Anpassen von Bicep-Infrastrukturvorlagen
- Fortgeschrittene Bereitstellungsmuster und Workflows implementieren
- Strategien zur Ressourcenbereitstellung verstehen
- Skalierbare Multi-Service-Architekturen entwerfen

- Containerisierte Anwendungen mit Azure Container Apps und AZD bereitstellen


#### Schlüsselkonzepte zum Meistern
- Bicep-Vorlagenstruktur und Best Practices
- Ressourcenabhängigkeiten und Bereitstellungsreihenfolge
- Parameterdateien und Vorlagenmodularität
- Benutzerdefinierte Hooks und Bereitstellungsautomatisierung
- Container-App-Bereitstellungsmuster (Schnellstart, Produktion, Microservices)

#### Praktische Übungen
1. **Erstellung benutzerdefinierter Vorlagen**: Erstellen Sie eine Multi-Service-Anwendungsvorlage
2. **Bicep-Fertigkeiten**: Erstellen Sie modulare, wiederverwendbare Infrastrukturkomponenten
3. **Bereitstellungsautomatisierung**: Implementieren Sie Pre-/Post-Bereitstellungshooks
4. **Architekturdesign**: Stellen Sie eine komplexe Microservices-Architektur bereit
5. **Container-App-Bereitstellung**: Implementieren Sie die Beispiele [Simple Flask API](../../../examples/container-app/simple-flask-api) und [Microservices Architecture](../../../examples/container-app/microservices) mit AZD

#### Bewertungsfragen
- Wie erstellen Sie benutzerdefinierte Bicep-Vorlagen für AZD?
- Was sind die Best Practices zur Organisation von Infrastrukturcode?
- Wie gehen Sie mit Ressourcenabhängigkeiten in Vorlagen um?
- Welche Bereitstellungsmuster unterstützen Updates ohne Ausfallzeiten?

---

### Kapitel 5: Multi-Agent KI-Lösungen (Woche 6-7)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Multi-Agent KI-Architekturen entwerfen und implementieren
- Agentenkoordination und Kommunikation orchestrieren
- Produktionsreife KI-Lösungen mit Monitoring bereitstellen
- Agentenspezialisierung und Workflow-Muster verstehen
- Containerisierte Microservices in Multi-Agent-Lösungen integrieren

#### Schlüsselkonzepte zum Meistern
- Multi-Agent Architektur-Muster und Designprinzipien
- Agent-Kommunikationsprotokolle und Datenfluss
- Lastverteilungs- und Skalierungsstrategien für KI-Agenten
- Produktionsüberwachung für Multi-Agent-Systeme
- Service-zu-Service-Kommunikation in containerisierten Umgebungen

#### Praktische Übungen
1. **Überprüfung der Einzelhandelsarchitektur**: Analysieren Sie das Einzelhandels-Blueprint und identifizieren Sie, welche Anwendungskomponenten vor der Bereitstellung implementiert werden müssen
2. **Agentenanpassung**: Modifizieren Sie das Verhalten der Kunden- und Inventar-Agenten
3. **Architekturskalierung**: Implementieren Sie Lastverteilung und Auto-Skalierung
4. **Produktionsüberwachung**: Richten Sie umfassendes Monitoring und Alarmierung ein
5. **Microservices-Integration**: Erweitern Sie das Beispiel [Microservices Architecture](../../../examples/container-app/microservices) zur Unterstützung agentenbasierter Workflows

#### Bewertungsfragen
- Wie entwerfen Sie effektive Multi-Agent-Kommunikationsmuster?
- Was sind die wichtigsten Überlegungen zur Skalierung von KI-Agenten-Workloads?
- Wie überwachen und debuggen Sie Multi-Agent-KI-Systeme?
- Welche Produktionsmuster gewährleisten Zuverlässigkeit für KI-Agenten?

---

### Kapitel 6: Validierung & Planung vor der Bereitstellung (Woche 8)
**Dauer**: 1 Stunde | **Komplexität**: ⭐⭐

#### Lernziele
- Umfassende Kapazitätsplanung und Ressourcenvalidierung durchführen
- Optimale Azure-SKUs für Kosten-Effizienz auswählen
- Automatisierte Pre-Flight-Checks und Validierungen implementieren
- Bereitstellungen mit Kostenoptimierungsstrategien planen

#### Schlüsselkonzepte zum Meistern
- Azure-Ressourcenquoten und Kapazitätsbeschränkungen
- SKU-Auswahlkriterien und Kostenoptimierung
- Automatisierte Validierungsskripte und Tests
- Bereitstellungsplanung und Risikobewertung

#### Praktische Übungen
1. **Kapazitätsanalyse**: Analysieren Sie die Ressourcenerfordernisse für Ihre Anwendungen
2. **SKU-Optimierung**: Vergleichen und wählen Sie kosteneffiziente Service-Stufen aus
3. **Validierungsautomatisierung**: Implementieren Sie Pre-Bereitstellungs-Checkskripte
4. **Kostenplanung**: Erstellen Sie Kostenschätzungen und Budgets für Bereitstellungen

#### Bewertungsfragen
- Wie validieren Sie Azure-Kapazität vor einer Bereitstellung?
- Welche Faktoren beeinflussen SKU-Auswahlentscheidungen?
- Wie automatisieren Sie die Validierung vor der Bereitstellung?
- Welche Strategien helfen, Bereitstellungskosten zu optimieren?

---

### Kapitel 7: Fehlerbehebung & Debugging (Woche 9)
**Dauer**: 1-1,5 Stunden | **Komplexität**: ⭐⭐

#### Lernziele
- Systematische Debugging-Ansätze für AZD-Bereitstellungen entwickeln
- Häufige Bereitstellungs- und Konfigurationsprobleme lösen
- KI-spezifische Probleme und Leistungsengpässe debuggen
- Monitoring und Alarmierung zur proaktiven Fehlererkennung implementieren

#### Schlüsselkonzepte zum Meistern
- Diagnosetechniken und Protokollierungsstrategien
- Häufige Fehlerbilder und deren Lösungen
- Leistungsüberwachung und Optimierung
- Incident-Response- und Wiederherstellungsverfahren

#### Praktische Übungen
1. **Diagnosefähigkeiten**: Üben Sie mit absichtlich defekten Bereitstellungen
2. **Protokollanalyse**: Nutzen Sie Azure Monitor und Application Insights effektiv
3. **Leistungsoptimierung**: Optimieren Sie Anwendungen mit langsamer Leistung
4. **Wiederherstellungsverfahren**: Implementieren Sie Backup und Katastrophenwiederherstellung

#### Bewertungsfragen
- Was sind die häufigsten AZD-Bereitstellungsfehler?
- Wie debuggen Sie Authentifizierungs- und Berechtigungsprobleme?
- Welche Monitoring-Strategien helfen, Produktionsprobleme zu vermeiden?
- Wie optimieren Sie die Anwendungsleistung in Azure?

---

### Kapitel 8: Produktions- & Unternehmensmuster (Woche 10-11)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Enterprise-Bereitstellungsstrategien umsetzen
- Sicherheitsmuster und Compliance-Rahmenwerke entwerfen
- Monitoring, Governance und Kostenmanagement etablieren
- Skalierbare CI/CD-Pipelines mit AZD-Integration erstellen
- Best Practices für Produktionscontainer-App-Bereitstellungen anwenden (Sicherheit, Überwachung, Kosten, CI/CD)

#### Schlüsselkonzepte zum Meistern
- Unternehmenssicherheit und Compliance-Anforderungen
- Governance-Rahmenwerke und Richtlinienimplementierung
- Fortgeschrittenes Monitoring und Kostenmanagement
- CI/CD-Integration und automatisierte Bereitstellungspipelines
- Blue-Green- und Canary-Bereitstellungsstrategien für containerisierte Workloads

#### Praktische Übungen
1. **Unternehmenssicherheit**: Implementieren Sie umfassende Sicherheitsmuster
2. **Governance-Rahmenwerk**: Richten Sie Azure Policy und Ressourcenverwaltung ein
3. **Fortgeschrittenes Monitoring**: Erstellen Sie Dashboards und automatisierte Alarmierungen
4. **CI/CD-Integration**: Erstellen Sie automatisierte Bereitstellungspipelines
5. **Produktionscontainer-Apps**: Wenden Sie Sicherheit, Überwachung und Kostenoptimierung auf das Beispiel [Microservices Architecture](../../../examples/container-app/microservices) an

#### Bewertungsfragen
- Wie implementieren Sie Unternehmenssicherheit bei AZD-Bereitstellungen?
- Welche Governance-Muster gewährleisten Compliance und Kostenkontrolle?
- Wie entwerfen Sie skalierbares Monitoring für Produktionssysteme?
- Welche CI/CD-Muster funktionieren am besten mit AZD-Workflows?

#### Lernziele
- Azure Developer CLI Grundlagen und Kernkonzepte verstehen
- Azd erfolgreich in Ihrer Entwicklungsumgebung installieren und konfigurieren
- Ihre erste Bereitstellung mit einer vorhandenen Vorlage abschließen
- Die azd-Projektstruktur navigieren und Schlüsselkomponenten verstehen

#### Schlüsselkonzepte zum Meistern
- Vorlagen, Umgebungen und Dienste
- Konfigurationsstruktur von azure.yaml
- Grundlegende azd-Befehle (init, up, down, deploy)
- Infrastructure as Code Prinzipien
- Azure-Authentifizierung und Autorisierung

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

**Übung 1.3: Projektstrukturanalyse**
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
1. Wie handhabt azd die Vorrangigkeit von Umgebungsvariablen?
2. Was sind Bereitstellungshooks und wann sollten Sie diese verwenden?
3. Wie konfigurieren Sie unterschiedliche SKUs für verschiedene Umgebungen?
4. Welche Sicherheitsimplikationen ergeben sich aus unterschiedlichen Authentifizierungsmethoden?
5. Wie verwalten Sie Geheimnisse und sensible Konfigurationsdaten?

### Modul 3: Bereitstellung und Provisionierung (Woche 4)

#### Lernziele
- Bereitstellungs-Workflows und Best Practices beherrschen
- Infrastructure as Code mit Bicep-Vorlagen verstehen
- Komplexe Multi-Service-Architekturen implementieren
- Bereitstellungsleistung und Zuverlässigkeit optimieren

#### Schlüsselkonzepte zum Meistern
- Bicep-Vorlagenstruktur und Module
- Ressourcenabhängigkeiten und Reihenfolge
- Bereitstellungsstrategien (Blue-Green, Rolling Updates)
- Multi-Region-Bereitstellungen
- Datenbankmigrationen und Datenmanagement

#### Übungsaufgaben

**Übung 3.1: Benutzerdefinierte Infrastruktur**
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

#### Selbstbewertungsfragen
1. Was sind die Vorteile von Bicep gegenüber ARM-Vorlagen?
2. Wie handhaben Sie Datenbankmigrationen bei azd-Bereitstellungen?
3. Welche Strategien gibt es für Bereitstellungen ohne Ausfallzeiten?
4. Wie verwalten Sie Abhängigkeiten zwischen Diensten?
5. Welche Überlegungen sind bei Multi-Region-Bereitstellungen wichtig?

### Modul 4: Validierung vor der Bereitstellung (Woche 5)

#### Lernziele
- Implementieren Sie umfassende Vorbereitungsprüfungen vor der Bereitstellung  
- Beherrschen Sie Kapazitätsplanung und Ressourcenvalidierung  
- Verstehen Sie die Auswahl von SKUs und Kostenoptimierung  
- Erstellen Sie automatisierte Validierungspipelines  

#### Wesentliche Konzepte zum Beherrschen  
- Azure-Ressourcenkontingente und -grenzen  
- Auswahlkriterien für SKUs und Kostenfolgen  
- Automatisierte Validierungsskripte und -werkzeuge  
- Methoden der Kapazitätsplanung  
- Leistungstest und -optimierung  

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
  
**Übung 4.2: Pre-flight-Validierung**  
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
  
#### Selbstbewertungsfragen  
1. Welche Faktoren sollten Entscheidungen zur SKU-Auswahl beeinflussen?  
2. Wie validieren Sie die Verfügbarkeit von Azure-Ressourcen vor der Bereitstellung?  
3. Was sind die Hauptkomponenten eines Pre-flight-Prüfsystems?  
4. Wie schätzen und kontrollieren Sie Bereitstellungskosten?  
5. Welche Überwachung ist für die Kapazitätsplanung wesentlich?  

### Modul 5: Fehlerbehebung und Debugging (Woche 6)  

#### Lernziele  
- Beherrschen Sie systematische Fehlerbehebungsmethoden  
- Entwickeln Sie Fachkenntnisse im Debuggen komplexer Bereitstellungsprobleme  
- Implementieren Sie umfassendes Monitoring und Alarmierung  
- Erstellen Sie Prozeduren für Vorfallreaktion und Wiederherstellung  

#### Wesentliche Konzepte zum Beherrschen  
- Häufige Muster bei Bereitstellungsfehlern  
- Techniken zur Protokollanalyse und -korrelation  
- Leistungsüberwachung und -optimierung  
- Erkennung und Reaktion auf Sicherheitsvorfälle  
- Katastrophenwiederherstellung und Geschäftskontinuität  

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
  
#### Selbstbewertungsfragen  
1. Was ist der systematische Ansatz zur Fehlerbehebung bei azd-Bereitstellungen?  
2. Wie korrelieren Sie Protokolle über mehrere Dienste und Ressourcen hinweg?  
3. Welche Überwachungsmetriken sind für die frühzeitige Problemerkennung am wichtigsten?  
4. Wie implementieren Sie effektive Katastrophenwiederherstellungsverfahren?  
5. Was sind die Hauptbestandteile eines Plans zur Vorfallreaktion?  

### Modul 6: Fortgeschrittene Themen und Best Practices (Wochen 7-8)  

#### Lernziele  
- Implementieren Sie unternehmensgerechte Bereitstellungsmuster  
- Beherrschen Sie CI/CD-Integration und Automatisierung  
- Entwickeln Sie eigene Vorlagen und tragen Sie zur Community bei  
- Verstehen Sie fortgeschrittene Sicherheits- und Compliance-Anforderungen  

#### Wesentliche Konzepte zum Beherrschen  
- CI/CD-Pipeline-Integrationsmuster  
- Entwicklung und Verteilung benutzerdefinierter Vorlagen  
- Unternehmensführung und Compliance  
- Fortgeschrittene Netzwerk- und Sicherheitseinstellungen  
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
  
#### Selbstbewertungsfragen  
1. Wie integrieren Sie azd in bestehende CI/CD-Arbeitsabläufe?  
2. Was sind wichtige Überlegungen bei der Entwicklung benutzerdefinierter Vorlagen?  
3. Wie implementieren Sie Governance und Compliance in azd-Bereitstellungen?  
4. Was sind die Best Practices für Bereitstellungen in Unternehmensgröße?  
5. Wie tragen Sie effektiv zur azd-Community bei?  

## Praktische Projekte  

### Projekt 1: Persönliche Portfolio-Webseite  
**Komplexität**: Anfänger  
**Dauer**: 1-2 Wochen  

Erstellen und bereitstellen einer persönlichen Portfolio-Webseite mit:  
- Hosting einer statischen Webseite auf Azure Storage  
- Konfiguration einer benutzerdefinierten Domain  
- CDN-Integration für globale Performance  
- Automatisierte Bereitstellungspipeline  

**Liefergegenstände**:  
- Funktionierende Webseite auf Azure bereitgestellt  
- Benutzerdefinierte azd-Vorlage für Portfolio-Bereitstellungen  
- Dokumentation des Bereitstellungsprozesses  
- Kostenanalyse und Optimierungsempfehlungen  

### Projekt 2: Aufgabenverwaltungsanwendung  
**Komplexität**: Mittel  
**Dauer**: 2-3 Wochen  

Erstellen einer Full-Stack-Aufgabenverwaltungsanwendung mit:  
- React-Frontend bereitgestellt auf App Service  
- Node.js-API-Backend mit Authentifizierung  
- PostgreSQL-Datenbank mit Migrationen  
- Application Insights Monitoring  

**Liefergegenstände**:  
- Vollständige Anwendung mit Benutzer-Authentifizierung  
- Datenbankschema und Migrationsskripte  
- Überwachungs-Dashboards und Alarmregeln  
- Konfiguration für Bereitstellung in mehreren Umgebungen  

### Projekt 3: Microservices E-Commerce-Plattform  
**Komplexität**: Fortgeschritten  
**Dauer**: 4-6 Wochen  

Design und Implementierung einer Microservices-basierten E-Commerce-Plattform:  
- Mehrere API-Dienste (Katalog, Bestellungen, Zahlungen, Benutzer)  
- Nachrichtenwarteschlangen-Integration mit Service Bus  
- Redis Cache zur Leistungsoptimierung  
- Umfassendes Protokollieren und Monitoring  

**Referenzbeispiel**: Siehe [Microservices Architecture](../../../examples/container-app/microservices) für eine Lernprobe mit zwei Diensten und Bereitstellungsanleitung. Warteschlangen, Persistenz, Authentifizierung, Zahlungsabwicklung und Produktionshärtung sind separate Projektarbeiten.  

**Liefergegenstände**:  
- Vollständige Microservices-Architektur  
- Kommunikationsmuster zwischen Diensten  
- Leistungstest und Optimierung  
- Produktionsreife Sicherheitsimplementierung  

## Bewertung und Zertifizierung  

### Wissensüberprüfungen  

Absolvieren Sie diese Bewertungen nach jedem Modul:  

**Modul 1 Bewertung**: Grundkonzepte und Installation  
- Multiple-Choice-Fragen zu Kernkonzepten  
- Praktische Installations- und Konfigurationsaufgaben  
- Einfache Bereitstellungsübung  

**Modul 2 Bewertung**: Konfiguration und Umgebungen  
- Umgebungsverwaltungs-Szenarien  
- Fehlerbehebungsübungen bei Konfiguration  
- Implementierung von Sicherheitskonfigurationen  

**Modul 3 Bewertung**: Bereitstellung und Provisionierung  
- Herausforderungen im Infrastrukturdesign  
- Szenarien für Multi-Service-Bereitstellungen  
- Übungen zur Leistungsoptimierung  

**Modul 4 Bewertung**: Validierung vor der Bereitstellung  
- Fallstudien zur Kapazitätsplanung  
- Szenarien zur Kostenoptimierung  
- Implementierung von Validierungspipelines  

**Modul 5 Bewertung**: Fehlerbehebung und Debugging  
- Übungen zur Problemdiagnose  
- Aufgaben zur Implementierung der Überwachung  
- Simulationen von Vorfallreaktionen  

**Modul 6 Bewertung**: Fortgeschrittene Themen  
- Design von CI/CD-Pipelines  
- Entwicklung benutzerdefinierter Vorlagen  
- Unternehmensarchitektur-Szenarien  

### Abschlussprojekt  

Entwerfen und implementieren Sie eine vollständige Lösung, die die Beherrschung aller Konzepte demonstriert:  

**Anforderungen**:  
- Mehrschichtige Anwendungsarchitektur  
- Mehrere Bereitstellungsumgebungen  
- Umfassendes Monitoring und Alarmierung  
- Sicherheits- und Compliance-Implementierung  
- Kostenoptimierung und Leistungsanpassung  
- Vollständige Dokumentation und Runbooks  

**Bewertungskriterien**:  
- Technische Implementierungsqualität  
- Vollständigkeit der Dokumentation  
- Einhaltung von Sicherheit und Best Practices  
- Leistung und Kostenoptimierung  
- Effektivität von Fehlerbehebung und Überwachung  

## Lernressourcen und Referenzen  

### Offizielle Dokumentation  
- [Azure Developer CLI Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community-Ressourcen  
- [AZD Template Galerie](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub-Organisation](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Übungsumgebungen  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Zusätzliche Werkzeuge  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Empfehlungen für den Lernplan  

### Vollzeitstudium (8 Wochen)  
- **Wochen 1-2**: Module 1-2 (Erste Schritte, Konfiguration)  
- **Wochen 3-4**: Module 3-4 (Bereitstellung, Vorbereitungsprüfung)  
- **Wochen 5-6**: Module 5-6 (Fehlerbehebung, Fortgeschrittene Themen)  
- **Wochen 7-8**: Praktische Projekte und Abschlusstest  

### Teilzeitstudium (16 Wochen)  
- **Wochen 1-4**: Modul 1 (Erste Schritte)  
- **Wochen 5-7**: Modul 2 (Konfiguration und Umgebungen)  
- **Wochen 8-10**: Modul 3 (Bereitstellung und Provisionierung)  
- **Wochen 11-12**: Modul 4 (Vorbereitungsprüfung)  
- **Wochen 13-14**: Modul 5 (Fehlerbehebung und Debugging)  
- **Wochen 15-16**: Modul 6 (Fortgeschrittene Themen und Bewertung)  

---  

## Fortschritts- und Bewertungsrahmen  

### Kapitel-Abschlusscheckliste  

Verfolgen Sie Ihren Fortschritt in jedem Kapitel mit diesen messbaren Ergebnissen:  

#### 📚 Kapitel 1: Grundlagen & Schnellstart  
- [ ] **Installation abgeschlossen**: AZD installiert und auf Ihrer Plattform verifiziert  
- [ ] **Erste Bereitstellung**: Erfolgreiche Bereitstellung der todo-nodejs-mongo Vorlage  
- [ ] **Umgebung eingerichtet**: Erste Umgebungsvariablen konfiguriert  
- [ ] **Ressourcennavigation**: Erkundung bereitgestellter Ressourcen im Azure-Portal  
- [ ] **Befehlsbeherrschung**: Sicher im Umgang mit grundlegenden AZD-Befehlen  

#### 🤖 Kapitel 2: AI-First Entwicklung  
- [ ] **AI-Vorlagenbereitsellung**: Erfolgreiche Bereitstellung von azure-search-openai-demo  
- [ ] **RAG-Implementierung**: Konfiguration der Dokumentindizierung und -abfrage  
- [ ] **Modellkonfiguration**: Einrichtung mehrerer KI-Modelle mit verschiedenen Zwecken  
- [ ] **AI-Überwachung**: Implementierung von Application Insights für KI-Arbeitslasten  
- [ ] **Leistungsoptimierung**: Feinabstimmung der KI-Anwendungsleistung  

#### ⚙️ Kapitel 3: Konfiguration & Authentifizierung  
- [ ] **Multi-Umgebungs-Einrichtung**: Konfiguration von Entwicklungs-, Test- und Produktionsumgebungen  
- [ ] **Sicherheitsimplementierung**: Einrichtung einer Managed Identity Authentication  
- [ ] **Geheimnisverwaltung**: Integration von Azure Key Vault für sensible Daten  
- [ ] **Parameterverwaltung**: Erstellung umgebungsspezifischer Konfigurationen  
- [ ] **Authentifizierungsbeherrschung**: Implementierung sicherer Zugriffsmodelle  

#### 🏗️ Kapitel 4: Infrastructure as Code & Bereitstellung  
- [ ] **Erstellung benutzerdefinierter Vorlagen**: Erstellung einer Multi-Service-Anwendungsvorlage  
- [ ] **Bicep-Beherrschung**: Erstellung modularer, wiederverwendbarer Infrastrukturkomponenten  
- [ ] **Bereitstellungsautomatisierung**: Implementierung von Vor- und Nachbereitungshooks  
- [ ] **Architekturdesign**: Bereitstellung komplexer Microservices-Architektur  
- [ ] **Vorlagenoptimierung**: Optimierung von Vorlagen für Leistung und Kosten  

#### 🎯 Kapitel 5: Multi-Agent AI-Lösungen  
- [ ] **Einzelhandelsarchitektur-Überprüfung**: Identifikation fehlender Anwendungsbestandteile und Planung deren Umsetzung und Validierung  
- [ ] **Agentenanpassung**: Modifikation der Verhaltensweisen der Kunden- und Inventaragenten  
- [ ] **Architekturskalierung**: Implementierung von Lastenausgleich und Auto-Skalierung  
- [ ] **Produktionsüberwachung**: Einrichtung umfassender Monitoring- und Alarmierungssysteme  
- [ ] **Leistungsoptimierung**: Optimierung der Multi-Agenten-Systemperformance  

#### 🔍 Kapitel 6: Validierung & Planung vor der Bereitstellung  
- [ ] **Kapazitätsanalyse**: Analyse von Ressourcenanforderungen für Anwendungen  
- [ ] **SKU-Optimierung**: Auswahl kosten-effizienter Servicestufen  
- [ ] **Validierungsautomatisierung**: Implementierung von Vorbereitungsprüfskripten  
- [ ] **Kostenplanung**: Erstellung von Kostenschätzungen und Budgets für Bereitstellungen  
- [ ] **Risikobewertung**: Identifikation und Minderung von Bereitstellungsrisiken  

#### 🚨 Kapitel 7: Fehlerbehebung & Debugging  
- [ ] **Diagnosefähigkeiten**: Erfolgreiches Debuggen absichtlich fehlerhafter Bereitstellungen  
- [ ] **Protokollanalyse**: Effektive Nutzung von Azure Monitor und Application Insights  
- [ ] **Leistungsoptimierung**: Optimierung von Anwendungen mit schlechter Performance  
- [ ] **Wiederherstellungsverfahren**: Implementierung von Backup- und Katastrophenschutz  
- [ ] **Überwachungseinrichtung**: Erstellung proaktiver Monitoring- und Alarmierungssysteme  

#### 🏢 Kapitel 8: Produktions- und Unternehmensmuster  
- [ ] **Unternehmenssicherheit**: Implementierung umfassender Sicherheitsmuster  
- [ ] **Governance-Rahmenwerk**: Einrichtung von Azure Policy und Ressourcenmanagement  
- [ ] **Fortgeschrittenes Monitoring**: Erstellung von Dashboards und automatisierter Alarmierung  
- [ ] **CI/CD-Integration**: Erstellung automatisierter Deployment-Pipelines  
- [ ] **Compliance-Implementierung**: Erfüllung von Unternehmens-Compliance-Anforderungen  

### Lernzeitplan und Meilensteine  

#### Woche 1-2: Grundlagenaufbau  
- **Meilenstein**: Erste KI-Anwendung mit AZD bereitgestellt  
- **Validierung**: Funktionierende Anwendung mit öffentlicher URL  
- **Fähigkeiten**: Grundlegende AZD-Arbeitsabläufe und KI-Serviceintegration  

#### Woche 3-4: Konfigurationsbeherrschung  
- **Meilenstein**: Multi-Umgebungs-Bereitstellung mit sicherer Authentifizierung  
- **Validierung**: Dieselbe Anwendung auf dev/staging/prod bereitgestellt  
- **Fähigkeiten**: Umgebungsmanagement und Sicherheitsimplementierung  

#### Woche 5-6: Infrastrukturkompetenz  
- **Meilenstein**: Benutzerdefinierte Vorlage für komplexe Multi-Service-Anwendung  
- **Validierung**: Wiederverwendbare Vorlage wurde von einem anderen Teammitglied bereitgestellt  
- **Fähigkeiten**: Bicep-Beherrschung und Infrastrukturautomatisierung  

#### Woche 7-8: Fortgeschrittene KI-Implementierung  
- **Meilenstein**: Produktionsreife Multi-Agenten-KI-Lösung  
- **Validierung**: System bewältigt reale Last mit Monitoring  
- **Fähigkeiten**: Multi-Agenten-Orchestrierung und Leistungsoptimierung  

#### Woche 9-10: Produktionsbereitschaft  
- **Meilenstein**: Bereitstellung auf Unternehmensniveau mit voller Compliance  
- **Validierung**: Besteht Sicherheitsprüfung und Kostenoptimierungsaudit  
- **Fähigkeiten**: Governance, Monitoring und CI/CD-Integration  

### Bewertung und Zertifizierung  

#### Methoden zur Wissensvalidierung  
1. **Praktische Bereitstellungen**: Funktionierende Anwendungen für jedes Kapitel  
2. **Code-Reviews**: Bewertung der Qualität von Vorlagen und Konfigurationen  
3. **Problemlösung**: Szenarien zur Fehlerbehebung und deren Lösungen  
4. **Peer Teaching**: Erklären von Konzepten an andere Lernende  
5. **Community-Beitrag**: Teilen von Vorlagen oder Verbesserungen  

#### Berufliche Entwicklungsergebnisse  
- **Portfolio-Projekte**: Lern-Bereitstellungen und Architekturübungen; Produktionsreife erfordert separate Implementierung und Überprüfung  
- **Technische Fähigkeiten**: Branchenübliche AZD- und KI-Bereitstellungskompetenz  
- **Problemlösefähigkeiten**: Selbstständige Fehlerbehebung und Optimierung  
- **Community-Anerkennung**: Aktive Teilnahme an der Azure-Entwickler-Community  
- **Karrierefortschritt**: Fertigkeiten, die direkt auf Cloud- und KI-Rollen anwendbar sind

#### Erfolgskennzahlen
- **Bereitstellungserfolgsquote**: >95 % erfolgreiche Bereitstellungen
- **Fehlerbehebungsdauer**: <30 Minuten bei gängigen Problemen
- **Leistungsoptimierung**: Nachweisbare Verbesserungen bei Kosten und Leistung
- **Sicherheitsüberprüfung**: Dokumentierte Kontrollen und verbleibende Lücken im Hinblick auf die Anforderungen Ihrer Organisation; Kursabschluss zertifiziert keine Compliance
- **Wissensweitergabe**: Fähigkeit, andere Entwickler zu betreuen

### Kontinuierliches Lernen und Community-Engagement

#### Auf dem Laufenden bleiben
- **Azure-Updates**: Folgen Sie den Release-Notes der Azure Developer CLI
- **Community-Events**: Nehmen Sie an Azure- und KI-Entwicklerveranstaltungen teil
- **Dokumentation**: Tragen Sie zur Community-Dokumentation und zu Beispielen bei
- **Feedback-Schleife**: Geben Sie Rückmeldungen zu Kursinhalten und Azure-Diensten

#### Karriereentwicklung
- **Professionelles Netzwerk**: Vernetzen Sie sich mit Azure- und KI-Experten
- **Sprechgelegenheiten**: Präsentieren Sie Erkenntnisse bei Konferenzen oder Meetups
- **Beitrag zu Open Source**: Tragen Sie zu AZD-Vorlagen und Tools bei
- **Mentoring**: Begleiten Sie andere Entwickler auf ihrer AZD-Lernreise

---

**Kapitel-Navigation:**
- **📚 Kursstartseite**: [AZD Für Einsteiger](../README.md)
- **📖 Lernen starten**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: Verfolgen Sie Ihren Fortschritt durch das umfassende 8-Kapitel-Lernsystem
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) für Unterstützung und Austausch

**Studienfortschrittsverfolgung**: Nutzen Sie diesen strukturierten Leitfaden, um die Azure Developer CLI durch schrittweises, praktisches Lernen mit messbaren Ergebnissen und Vorteilen für die berufliche Entwicklung zu meistern.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->