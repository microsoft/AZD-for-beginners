# Studienleitfaden - Umfassende Lernziele

**Lernpfad-Navigation**
- **📚 Kurs-Startseite**: [AZD für Anfänger](../README.md)
- **📖 Lernen starten**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: [Kursabschluss](../README.md#-course-completion--certification)

## Einführung

Dieser umfassende Studienleitfaden bietet strukturierte Lernziele, Schlüsselkonzepte, Praxisübungen und Bewertungsmaterialien, um Ihnen zu helfen, die Azure Developer CLI (azd) zu meistern. Verwenden Sie diesen Leitfaden, um Ihren Fortschritt zu verfolgen und sicherzustellen, dass Sie alle wesentlichen Themen abgedeckt haben.

## Lernziele

Durch das Abschließen dieses Studienleitfadens werden Sie:
- Alle grundlegenden und fortgeschrittenen Konzepte der Azure Developer CLI beherrschen
- Praktische Fähigkeiten beim Bereitstellen und Verwalten von Azure-Anwendungen entwickeln
- Vertrauen in die Fehlerbehebung und Optimierung von Bereitstellungen aufbauen
- Produktionsreife Bereitstellungspraktiken und Sicherheitsaspekte verstehen

## Lernergebnisse

Nach Abschluss aller Abschnitte dieses Studienleitfadens werden Sie in der Lage sein:
- Komplette Anwendungsarchitekturen mit azd zu entwerfen, bereitzustellen und zu verwalten
- Umfassende Überwachungs-, Sicherheits- und Kostenoptimierungsstrategien umzusetzen
- Komplexe Bereitstellungsprobleme eigenständig zu beheben
- Eigene Vorlagen zu erstellen und zur azd-Community beizutragen

## 8-Kapitel Lernstruktur

### Kapitel 1: Grundlagen & Schnellstart (Woche 1)
**Dauer**: 30-45 Minuten | **Komplexität**: ⭐

#### Lernziele
- Verstehen Sie die Kernkonzepte und Terminologie der Azure Developer CLI
- Installieren und konfigurieren Sie AZD erfolgreich auf Ihrer Entwicklungsplattform
- Stellen Sie Ihre erste Anwendung mithilfe einer vorhandenen Vorlage bereit
- Navigieren Sie effektiv in der AZD-Kommandozeilenschnittstelle

#### Zentrale Konzepte, die Sie beherrschen sollten
- AZD-Projektstruktur und -komponenten (azure.yaml, infra/, src/)
- Vorlagenbasierte Bereitstellungs-Workflows
- Grundlagen der Umgebungs-Konfiguration
- Verwaltung von Ressourcengruppen und Abonnements

#### Praktische Übungen
1. **Installationsüberprüfung**: Installieren Sie AZD und überprüfen Sie es mit `azd version`
2. **Erste Bereitstellung**: Stellen Sie die Vorlage todo-nodejs-mongo erfolgreich bereit
3. **Umgebungssetup**: Konfigurieren Sie Ihre ersten Umgebungsvariablen
4. **Ressourcenerkundung**: Navigieren Sie zu bereitgestellten Ressourcen im Azure-Portal

#### Bewertungsfragen
- Was sind die Kernkomponenten eines AZD-Projekts?
- Wie initialisieren Sie ein neues Projekt aus einer Vorlage?
- Was ist der Unterschied zwischen `azd up` und `azd deploy`?
- Wie verwalten Sie mehrere Umgebungen mit AZD?

---

### Kapitel 2: KI-zentrierte Entwicklung (Woche 2)
**Dauer**: 1-2 Stunden | **Komplexität**: ⭐⭐

#### Lernziele
- Integrieren Sie Microsoft Foundry-Services in AZD-Workflows
- Bereitstellen und Konfigurieren KI-gestützter Anwendungen
- Verstehen Sie RAG (Retrieval-Augmented Generation)-Implementierungsmuster
- Verwalten Sie Bereitstellungen und Skalierung von KI-Modellen

#### Zentrale Konzepte, die Sie beherrschen sollten
- Integration des Microsoft Foundry Models-Services und API-Management
- AI Search-Konfiguration und Vektorindizierung
- Strategien zur Bereitstellung von Modellen und Kapazitätsplanung
- Überwachung von KI-Anwendungen und Leistungsoptimierung

#### Praktische Übungen
1. **AI-Chat-Bereitstellung**: Stellen Sie die Vorlage azure-search-openai-demo bereit
2. **RAG-Implementierung**: Konfigurieren Sie Dokumentindizierung und -abruf
3. **Modellkonfiguration**: Richten Sie mehrere KI-Modelle mit unterschiedlichen Zwecken ein
4. **AI-Überwachung**: Implementieren Sie Application Insights für KI-Workloads

#### Bewertungsfragen
- Wie konfigurieren Sie Microsoft Foundry Models-Services in einer AZD-Vorlage?
- Was sind die Schlüsselkomponenten einer RAG-Architektur?
- Wie verwalten Sie Kapazität und Skalierung von KI-Modellen?
- Welche Überwachungsmetriken sind für KI-Anwendungen wichtig?

---

### Kapitel 3: Konfiguration & Authentifizierung (Woche 3)
**Dauer**: 45-60 Minuten | **Komplexität**: ⭐⭐

#### Lernziele
- Beherrschen Sie Strategien zur Verwaltung und Konfiguration von Umgebungen
- Implementieren Sie sichere Authentifizierungsmuster und Managed Identity
- Organisieren Sie Ressourcen mit geeigneten Namenskonventionen
- Konfigurieren Sie Mehrfach-Umgebungs-Bereitstellungen (dev, staging, prod)

#### Zentrale Konzepte, die Sie beherrschen sollten
- Umgebungs-Hierarchie und Konfigurations-Vorrang
- Managed Identity und Service Principal-Authentifizierung
- Key Vault-Integration für Secret-Management
- Umgebungsspezifische Parameterverwaltung

#### Praktische Übungen
1. **Mehrfach-Umgebungs-Setup**: Konfigurieren Sie dev-, staging- und prod-Umgebungen
2. **Sicherheitskonfiguration**: Implementieren Sie Managed Identity-Authentifizierung
3. **Secrets-Management**: Integrieren Sie Azure Key Vault für sensible Daten
4. **Parameterverwaltung**: Erstellen Sie umgebungsspezifische Konfigurationen

#### Bewertungsfragen
- Wie konfigurieren Sie verschiedene Umgebungen mit AZD?
- Welche Vorteile hat die Verwendung von Managed Identity gegenüber Service Principals?
- Wie verwalten Sie Anwendungsgeheimnisse sicher?
- Was ist die Konfigurations-Hierarchie in AZD?

---

### Kapitel 4: Infrastruktur als Code & Bereitstellung (Woche 4-5)
**Dauer**: 1-1.5 Stunden | **Komplexität**: ⭐⭐⭐

#### Lernziele
- Erstellen und Anpassen von Bicep-Infrastrukturvorlagen
- Implementieren Sie fortgeschrittene Bereitstellungsmuster und Workflows
- Verstehen Sie Strategien zur Ressourcenbereitstellung
- Entwerfen Sie skalierbare Multi-Service-Architekturen

- Stellen Sie containerisierte Anwendungen mit Azure Container Apps und AZD bereit


#### Zentrale Konzepte, die Sie beherrschen sollten
- Bicep-Vorlagenstruktur und Best Practices
- Ressourcenabhängigkeiten und Bereitstellungsreihenfolge
- Parameterdateien und Template-Modularität
- Benutzerdefinierte Hooks und Bereitstellungsautomatisierung
- Bereitstellungsmuster für Container-Apps (Schnellstart, Produktion, Microservices)

#### Praktische Übungen
1. **Erstellung einer benutzerdefinierten Vorlage**: Bauen Sie eine Multi-Service-Anwendungs-Vorlage
2. **Bicep-Beherrschung**: Erstellen Sie modulare, wiederverwendbare Infrastrukturkomponenten
3. **Bereitstellungsautomatisierung**: Implementieren Sie Pre-/Post-Bereitstellungs-Hooks
4. **Architekturdesign**: Stellen Sie eine komplexe Microservices-Architektur bereit
5. **Container-App-Bereitstellung**: Stellen Sie die [Einfache Flask-API](../../../examples/container-app/simple-flask-api) und die [Microservices-Architektur](../../../examples/container-app/microservices) Beispiele mit AZD bereit

#### Bewertungsfragen
- Wie erstellen Sie benutzerdefinierte Bicep-Vorlagen für AZD?
- Was sind Best Practices zur Organisation von Infrastrukturcode?
- Wie gehen Sie mit Ressourcenabhängigkeiten in Vorlagen um?
- Welche Bereitstellungsmuster unterstützen unterbrechungsfreie Updates?

---

### Kapitel 5: Multi-Agenten-KI-Lösungen (Woche 6-7)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Entwerfen und Implementieren von Multi-Agenten-KI-Architekturen
- Orchestrieren Sie Agentenkoordination und -kommunikation
- Stellen Sie produktionsreife KI-Lösungen mit Überwachung bereit
- Verstehen Sie Agentenspezialisierung und Workflow-Muster
- Integrieren Sie containerisierte Microservices als Teil von Multi-Agenten-Lösungen

#### Zentrale Konzepte, die Sie beherrschen sollten
- Multi-Agenten-Architekturmuster und Designprinzipien
- Agentenkommunikationsprotokolle und Datenfluss
- Lastverteilung und Skalierungsstrategien für KI-Agenten
- Produktionsüberwachung für Multi-Agenten-Systeme
- Service-to-Service-Kommunikation in containerisierten Umgebungen

#### Praktische Übungen
1. **Retail-Lösungs-Bereitstellung**: Stellen Sie das vollständige Multi-Agenten-Retail-Szenario bereit
2. **Agentenanpassung**: Ändern Sie das Verhalten von Customer- und Inventory-Agenten
3. **Architektur-Skalierung**: Implementieren Sie Load Balancing und Auto-Scaling
4. **Produktionsüberwachung**: Richten Sie umfassende Überwachung und Alerting ein
5. **Microservices-Integration**: Erweitern Sie das [Microservices-Architektur](../../../examples/container-app/microservices) Beispiel, um agentenbasierte Workflows zu unterstützen

#### Bewertungsfragen
- Wie entwerfen Sie effektive Multi-Agenten-Kommunikationsmuster?
- Welche Schlüsselfaktoren sind bei der Skalierung von KI-Agenten-Workloads zu beachten?
- Wie überwachen und debuggen Sie Multi-Agenten-KI-Systeme?
- Welche Produktionsmuster gewährleisten Zuverlässigkeit für KI-Agenten?

---

### Kapitel 6: Vorbereitende Validierung & Planung (Woche 8)
**Dauer**: 1 Stunde | **Komplexität**: ⭐⭐

#### Lernziele
- Führen Sie umfassende Kapazitätsplanung und Ressourcenvalidierung durch
- Wählen Sie optimale Azure-SKUs für Kosten-Effizienz aus
- Implementieren Sie automatisierte Pre-Flight-Checks und Validierungen
- Planen Sie Bereitstellungen mit kostenoptimierenden Strategien

#### Zentrale Konzepte, die Sie beherrschen sollten
- Azure-Ressourcenquoten und Kapazitätsgrenzen
- Kriterien zur SKU-Auswahl und Kostenoptimierung
- Automatisierte Validierungsskripte und Tests
- Bereitstellungsplanung und Risikoabschätzung

#### Praktische Übungen
1. **Kapazitätsanalyse**: Analysieren Sie Ressourcenanforderungen für Ihre Anwendungen
2. **SKU-Optimierung**: Vergleichen und wählen Sie kosteneffektive Service-Tiers
3. **Validierungsautomatisierung**: Implementieren Sie Pre-Bereitstellungs-Checkskripte
4. **Kostenplanung**: Erstellen Sie Kostenschätzungen und Budgets für Bereitstellungen

#### Bewertungsfragen
- Wie validieren Sie Azure-Kapazitäten vor einer Bereitstellung?
- Welche Faktoren beeinflussen Entscheidungen zur SKU-Auswahl?
- Wie automatisieren Sie Pre-Bereitstellungs-Validierungen?
- Welche Strategien helfen, Bereitstellungskosten zu optimieren?

---

### Kapitel 7: Fehlerbehebung & Debugging (Woche 9)
**Dauer**: 1-1.5 Stunden | **Komplexität**: ⭐⭐

#### Lernziele
- Entwickeln Sie systematische Debugging-Ansätze für AZD-Bereitstellungen
- Beheben Sie häufige Bereitstellungs- und Konfigurationsprobleme
- Debuggen Sie KI-spezifische Probleme und Performance-Engpässe
- Implementieren Sie Überwachung und Alerting für proaktive Problemerkennung

#### Zentrale Konzepte, die Sie beherrschen sollten
- Diagnosetechniken und Logging-Strategien
- Häufige Ausfallmuster und deren Lösungen
- Performance-Überwachung und -Optimierung
- Incident-Response- und Wiederherstellungsverfahren

#### Praktische Übungen
1. **Diagnosefähigkeiten**: Üben Sie mit absichtlich fehlerhaften Bereitstellungen
2. **Log-Analyse**: Nutzen Sie Azure Monitor und Application Insights effektiv
3. **Performance-Tuning**: Optimieren Sie langsam laufende Anwendungen
4. **Wiederherstellungsverfahren**: Implementieren Sie Backup- und Disaster-Recovery

#### Bewertungsfragen
- Was sind die häufigsten AZD-Bereitstellungsfehler?
- Wie debuggen Sie Authentifizierungs- und Berechtigungsprobleme?
- Welche Überwachungsstrategien helfen, Produktionsprobleme zu verhindern?
- Wie optimieren Sie die Anwendungsleistung in Azure?

---

### Kapitel 8: Produktions- & Unternehmensmuster (Woche 10-11)
**Dauer**: 2-3 Stunden | **Komplexität**: ⭐⭐⭐⭐

#### Lernziele
- Implementieren Sie unternehmensgerechte Bereitstellungsstrategien
- Entwerfen Sie Sicherheitsmuster und Compliance-Frameworks
- Etablieren Sie Überwachung, Governance und Kostenmanagement
- Erstellen Sie skalierbare CI/CD-Pipelines mit AZD-Integration
- Wenden Sie Best Practices für Produktions-Container-App-Bereitstellungen an (Sicherheit, Überwachung, Kosten, CI/CD)

#### Zentrale Konzepte, die Sie beherrschen sollten
- Unternehmenssicherheit und Compliance-Anforderungen
- Governance-Frameworks und Policy-Implementierung
- Erweiterte Überwachung und Kostenmanagement
- CI/CD-Integration und automatisierte Bereitstellungspipelines
- Blue-Green- und Canary-Bereitstellungsstrategien für containerisierte Workloads

#### Praktische Übungen
1. **Unternehmenssicherheit**: Implementieren Sie umfassende Sicherheitsmuster
2. **Governance-Framework**: Richten Sie Azure Policy und Ressourcenverwaltung ein
3. **Erweiterte Überwachung**: Erstellen Sie Dashboards und automatisierte Alerts
4. **CI/CD-Integration**: Bauen Sie automatisierte Bereitstellungspipelines
5. **Produktions-Container-Apps**: Wenden Sie Sicherheit, Überwachung und Kostenoptimierung auf das [Microservices-Architektur](../../../examples/container-app/microservices) Beispiel an

#### Bewertungsfragen
- Wie implementieren Sie Unternehmenssicherheit in AZD-Bereitstellungen?
- Welche Governance-Muster sorgen für Compliance und Kostenkontrolle?
- Wie entwerfen Sie skalierbare Überwachung für Produktionssysteme?
- Welche CI/CD-Muster funktionieren am besten mit AZD-Workflows?

#### Lernziele
- Verstehen Sie die Grundlagen und Kernkonzepte der Azure Developer CLI
- Installieren und konfigurieren Sie azd erfolgreich in Ihrer Entwicklungsumgebung
- Schließen Sie Ihre erste Bereitstellung mit einer vorhandenen Vorlage ab
- Navigieren Sie die azd-Projektstruktur und verstehen Sie die wichtigsten Komponenten

#### Zentrale Konzepte, die Sie beherrschen sollten
- Vorlagen, Umgebungen und Dienste
- azure.yaml Konfigurationsstruktur
- Grundlegende azd-Befehle (init, up, down, deploy)
- Prinzipien von Infrastruktur als Code
- Azure-Authentifizierung und -Autorisierung

#### Praxisübungen

**Übung 1.1: Installation und Einrichtung**
```bash
# Erledige diese Aufgaben:
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
3. Wie helfen Umgebungen bei der Verwaltung verschiedener Bereitstellungsziele?
4. Welche Authentifizierungsmethoden können mit azd verwendet werden?
5. Was passiert, wenn Sie `azd up` zum ersten Mal ausführen?

---

## Fortschrittsverfolgung und Bewertungsrahmen
```bash
# Mehrere Umgebungen erstellen und konfigurieren:
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
# Bewährte Sicherheitspraktiken umsetzen:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selbstbewertungsfragen
1. Wie behandelt azd die Vorrangregeln für Umgebungsvariablen?
2. Was sind Bereitstellungs-Hooks und wann sollten Sie diese verwenden?
3. Wie konfigurieren Sie unterschiedliche SKUs für verschiedene Umgebungen?
4. Welche Sicherheitsimplikationen haben verschiedene Authentifizierungsmethoden?
5. Wie verwalten Sie Geheimnisse und sensible Konfigurationsdaten?

### Modul 3: Bereitstellung und Provisionierung (Woche 4)

#### Lernziele
- Beherrschen Sie Bereitstellungs-Workflows und Best Practices
- Verstehen Sie Infrastruktur als Code mit Bicep-Vorlagen
- Implementieren Sie komplexe Multi-Service-Architekturen
- Optimieren Sie Bereitstellungsleistung und Zuverlässigkeit

#### Zentrale Konzepte, die Sie beherrschen sollten
- Bicep-Vorlagenstruktur und Module
- Ressourcenabhängigkeiten und Reihenfolge
- Bereitstellungsstrategien (Blue-Green, Rolling Updates)
- Multi-Region-Bereitstellungen
- Datenbankmigrationen und Datenmanagement

#### Praxisübungen

**Übung 3.1: Benutzerdefinierte Infrastruktur**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Übung 3.2: Multi-Service-Anwendung**
```bash
# Eine Microservices-Architektur bereitstellen:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Übung 3.3: Datenbankintegration**
```bash
# Datenbank-Bereitstellungsmuster implementieren:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Selbstbewertungsfragen
1. Welche Vorteile hat die Verwendung von Bicep gegenüber ARM-Vorlagen?
2. Wie gehen Sie mit Datenbankmigrationen in azd-Bereitstellungen um?
3. Welche Strategien gibt es für unterbrechungsfreie Bereitstellungen?
4. Wie verwalten Sie Abhängigkeiten zwischen Diensten?
5. Welche Überlegungen gelten für Multi-Region-Bereitstellungen?

### Modul 4: Vorbereitende Validierung (Woche 5)

#### Lernziele
- Umfassende Vorab-Prüfungen vor der Bereitstellung implementieren
- Kapazitätsplanung und Ressourcenvalidierung meistern
- SKU-Auswahl und Kostenoptimierung verstehen
- Automatisierte Validierungspipelines erstellen

#### Wichtige Konzepte, die es zu beherrschen gilt
- Azure-Ressourcenkontingente und -limits
- Kriterien zur SKU-Auswahl und Kostenfolgen
- Automatisierte Validierungsskripte und -tools
- Methoden der Kapazitätsplanung
- Leistungstests und Optimierung

#### Übungsaufgaben

**Übung 4.1: Kapazitätsplanung**
```bash
# Kapazitätsvalidierung implementieren:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Übung 4.2: Vorab-Validierung**
```powershell
# Erstelle eine umfassende Validierungspipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Übung 4.3: SKU-Optimierung**
```bash
# Dienstkonfigurationen optimieren:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Selbstbewertungsfragen
1. Welche Faktoren sollten die Entscheidung zur SKU-Auswahl beeinflussen?
2. Wie validieren Sie die Verfügbarkeit von Azure-Ressourcen vor der Bereitstellung?
3. Was sind die wichtigsten Komponenten eines Vorab-Prüfsystems?
4. Wie schätzen und kontrollieren Sie Bereitstellungskosten?
5. Welche Überwachung ist für die Kapazitätsplanung unerlässlich?

### Modul 5: Fehlerbehebung und Debugging (Woche 6)

#### Lernziele
- Systematische Fehlerbehebungsmethoden meistern
- Fachwissen im Debuggen komplexer Bereitstellungsprobleme entwickeln
- Umfassendes Monitoring und Alarmierung implementieren
- Vorfallreaktions- und Wiederherstellungsverfahren erstellen

#### Wichtige Konzepte, die es zu beherrschen gilt
- Häufige Muster von Bereitstellungsfehlern
- Protokollanalyse und Korrelationstechniken
- Leistungsüberwachung und -optimierung
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

**Übung 5.2: Implementierung von Monitoring**
```bash
# Richten Sie ein umfassendes Monitoring ein:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Übung 5.3: Vorfallreaktion**
```bash
# Erstellen von Verfahren zur Vorfallsreaktion:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Selbstbewertungsfragen
1. Wie lautet der systematische Ansatz zur Fehlerbehebung bei azd-Bereitstellungen?
2. Wie korrelieren Sie Protokolle über mehrere Dienste und Ressourcen hinweg?
3. Welche Monitoring-Metriken sind für die frühzeitige Fehlererkennung am wichtigsten?
4. Wie implementieren Sie effektive Notfallwiederherstellungsverfahren?
5. Was sind die Schlüsselkomponenten eines Incident-Response-Plans?

### Modul 6: Fortgeschrittene Themen und Best Practices (Woche 7-8)

#### Lernziele
- Unternehmensgerechte Bereitstellungsmuster implementieren
- CI/CD-Integration und -Automatisierung meistern
- Eigene Templates entwickeln und zur Community beitragen
- Erweiterte Sicherheits- und Compliance-Anforderungen verstehen

#### Wichtige Konzepte, die es zu beherrschen gilt
- Integrationsmuster für CI/CD-Pipelines
- Entwicklung und Verteilung benutzerdefinierter Templates
- Unternehmensweite Governance und Compliance
- Erweiterte Netzwerk- und Sicherheitskonfigurationen
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

**Übung 6.2: Entwicklung benutzerdefinierter Templates**
```bash
# Benutzerdefinierte Vorlagen erstellen und veröffentlichen:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Übung 6.3: Unternehmensimplementierung**
```bash
# Unternehmensgerechte Funktionen implementieren:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Selbstbewertungsfragen
1. Wie integrieren Sie azd in bestehende CI/CD-Workflows?
2. Welche Schlüsselfaktoren sind bei der Entwicklung benutzerdefinierter Templates zu beachten?
3. Wie setzen Sie Governance und Compliance bei azd-Bereitstellungen um?
4. Was sind Best Practices für Bereitstellungen in Unternehmensmaßstab?
5. Wie tragen Sie effektiv zur azd-Community bei?

## Praktische Projekte

### Projekt 1: Persönliche Portfolio-Website
**Komplexität**: Anfänger  
**Dauer**: 1-2 Wochen

Erstellen und bereitstellen einer persönlichen Portfolio-Website mit:
- Statisches Website-Hosting auf Azure Storage
- Konfiguration einer eigenen Domain
- CDN-Integration für globale Performance
- Automatisierte Deployment-Pipeline

**Ergebnisse**:
- Funktionierende Website auf Azure bereitgestellt
- Spezifisches azd-Template für Portfolio-Bereitstellungen
- Dokumentation des Bereitstellungsprozesses
- Kostenanalyse und Optimierungsempfehlungen

### Projekt 2: Aufgabenverwaltungsanwendung
**Komplexität**: Mittel  
**Dauer**: 2-3 Wochen

Erstellen Sie eine Full-Stack-Aufgabenverwaltung mit:
- React-Frontend, bereitgestellt in App Service
- Node.js-API-Backend mit Authentifizierung
- PostgreSQL-Datenbank mit Migrationen
- Application Insights für Monitoring

**Ergebnisse**:
- Vollständige Anwendung mit Benutzerauthentifizierung
- Datenbankschema und Migrationsskripte
- Monitoring-Dashboards und Alarmierungsregeln
- Deployment-Konfiguration für mehrere Umgebungen

### Projekt 3: Microservices-basierte E-Commerce-Plattform
**Komplexität**: Fortgeschritten  
**Dauer**: 4-6 Wochen

Entwerfen und implementieren Sie eine Microservices-basierte E-Commerce-Plattform:
- Mehrere API-Dienste (Katalog, Bestellungen, Zahlungen, Benutzer)
- Nachrichtenwarteschlangen-Integration mit Service Bus
- Redis-Cache zur Leistungsoptimierung
- Umfassendes Logging und Monitoring

**Referenzbeispiel**: Siehe [Microservices-Architektur](../../../examples/container-app/microservices) für ein produktionsreifes Template und Bereitstellungsleitfaden

**Ergebnisse**:
- Vollständige Microservices-Architektur
- Kommunikationsmuster zwischen Diensten
- Leistungstests und Optimierung
- Produktionsreife Sicherheitsimplementierung

## Bewertung und Zertifizierung

### Wissensüberprüfungen

Schließen Sie diese Bewertungen nach jedem Modul ab:

**Modul 1 Bewertung**: Grundkonzepte und Installation
- Multiple-Choice-Fragen zu Kernkonzepten
- Praktische Installations- und Konfigurationsaufgaben
- Einfache Bereitstellungsübung

**Modul 2 Bewertung**: Konfiguration und Umgebungen
- Szenarien zum Management von Umgebungen
- Übungen zur Fehlersuche in der Konfiguration
- Implementierung von Sicherheitskonfigurationen

**Modul 3 Bewertung**: Bereitstellung und Provisioning
- Herausforderungen im Infrastrukturd-Design
- Szenarien zur Bereitstellung mehrerer Dienste
- Übungen zur Leistungsoptimierung

**Modul 4 Bewertung**: Vorbereitungsvalidierung
- Fallstudien zur Kapazitätsplanung
- Szenarien zur Kostenoptimierung
- Implementierung von Validierungspipelines

**Modul 5 Bewertung**: Fehlerbehebung und Debugging
- Übungen zur Fehlerdiagnose
- Aufgaben zur Implementierung von Monitoring
- Simulationen zur Vorfallreaktion

**Modul 6 Bewertung**: Fortgeschrittene Themen
- Design von CI/CD-Pipelines
- Entwicklung benutzerdefinierter Templates
- Unternehmensarchitektur-Szenarien

### Abschlussprojekt

Entwerfen und implementieren Sie eine vollständige Lösung, die die Beherrschung aller Konzepte demonstriert:

**Anforderungen**:
- Mehrschichtige Anwendungsarchitektur
- Mehrere Bereitstellungsumgebungen
- Umfassendes Monitoring und Alarmierung
- Umsetzung von Sicherheits- und Compliance-Anforderungen
- Kostenoptimierung und Performance-Tuning
- Vollständige Dokumentation und Runbooks

**Bewertungskriterien**:
- Qualität der technischen Implementierung
- Vollständigkeit der Dokumentation
- Einhaltung von Sicherheits- und Best-Practice-Richtlinien
- Leistungs- und Kostenoptimierung
- Effektivität von Fehlerbehebung und Monitoring

## Studienressourcen und Referenzen

### Offizielle Dokumentation
- [Azure Developer CLI-Dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep-Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-Ressourcen
- [AZD Template-Galerie](https://azure.github.io/awesome-azd/)
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

## Empfehlungen für den Studienplan

### Vollzeitstudium (8 Wochen)
- **Wochen 1-2**: Module 1-2 (Erste Schritte, Konfiguration)
- **Wochen 3-4**: Module 3-4 (Bereitstellung, Vorbereitungen)
- **Wochen 5-6**: Module 5-6 (Fehlerbehebung, Fortgeschrittenes)
- **Wochen 7-8**: Praktische Projekte und Abschlussbewertung

### Teilzeitstudium (16 Wochen)
- **Wochen 1-4**: Modul 1 (Erste Schritte)
- **Wochen 5-7**: Modul 2 (Konfiguration und Umgebungen)
- **Wochen 8-10**: Modul 3 (Bereitstellung und Provisioning)
- **Wochen 11-12**: Modul 4 (Validierung vor der Bereitstellung)
- **Wochen 13-14**: Modul 5 (Fehlerbehebung und Debugging)
- **Wochen 15-16**: Modul 6 (Fortgeschrittene Themen und Bewertung)

---

## Fortschrittsverfolgung und Bewertungsrahmen

### Checkliste zum Abschluss der Kapitel

Verfolgen Sie Ihren Fortschritt in jedem Kapitel mit diesen messbaren Ergebnissen:

#### 📚 Kapitel 1: Grundlagen & Schnellstart
- [ ] **Installation abgeschlossen**: AZD auf Ihrer Plattform installiert und verifiziert
- [ ] **Erste Bereitstellung**: Erfolgreich das todo-nodejs-mongo-Template bereitgestellt
- [ ] **Umgebung eingerichtet**: Erste Umgebungsvariablen konfiguriert
- [ ] **Ressourcen-Navigation**: Bereitgestellte Ressourcen im Azure-Portal erkundet
- [ ] **Befehlsbeherrschung**: Sicher im Umgang mit grundlegenden AZD-Befehlen

#### 🤖 Kapitel 2: KI-fokussierte Entwicklung  
- [ ] **AI-Template-Bereitstellung**: azure-search-openai-demo erfolgreich bereitgestellt
- [ ] **RAG-Implementierung**: Dokumentindizierung und -abruf konfiguriert
- [ ] **Modellkonfiguration**: Mehrere KI-Modelle für unterschiedliche Zwecke eingerichtet
- [ ] **KI-Monitoring**: Application Insights für KI-Workloads implementiert
- [ ] **Leistungsoptimierung**: KI-Anwendungsleistung optimiert

#### ⚙️ Kapitel 3: Konfiguration & Authentifizierung
- [ ] **Multi-Environment-Setup**: Dev-, Staging- und Prod-Umgebungen konfiguriert
- [ ] **Sicherheitsimplementierung**: Managed Identity-Authentifizierung eingerichtet
- [ ] **Geheimnisverwaltung**: Azure Key Vault für sensible Daten integriert
- [ ] **Parameterverwaltung**: Umgebungspezifische Konfigurationen erstellt
- [ ] **Authentifizierungs-Beherrschung**: Sichere Zugriffsmuster implementiert

#### 🏗️ Kapitel 4: Infrastruktur als Code & Bereitstellung
- [ ] **Erstellung eigener Templates**: Ein Multi-Service-Anwendungstemplate gebaut
- [ ] **Bicep-Beherrschung**: Modulare, wiederverwendbare Infrastrukturkomponenten erstellt
- [ ] **Bereitstellungsautomatisierung**: Pre-/Post-Deployment-Hooks implementiert
- [ ] **Architekturdesign**: Komplexe Microservices-Architektur bereitgestellt
- [ ] **Template-Optimierung**: Templates für Leistung und Kosten optimiert

#### 🎯 Kapitel 5: Mehragenten-KI-Lösungen
- [ ] **Retail-Lösung bereitzgestellt**: Komplettes Mehragenten-Retail-Szenario bereitgestellt
- [ ] **Agenten-Anpassung**: Verhalten von Customer- und Inventory-Agenten modifiziert
- [ ] **Architektur-Skalierung**: Load Balancing und Auto-Scaling implementiert
- [ ] **Produktions-Monitoring**: Umfassendes Monitoring und Alerting eingerichtet
- [ ] **Leistungs-Tuning**: Mehragenten-Systemleistung optimiert

#### 🔍 Kapitel 6: Validierung und Planung vor der Bereitstellung
- [ ] **Kapazitätsanalyse**: Ressourcenanforderungen für Anwendungen analysiert
- [ ] **SKU-Optimierung**: Kostenoptimale Service-Tiers ausgewählt
- [ ] **Validierungsautomatisierung**: Pre-Deployment-Check-Skripte implementiert
- [ ] **Kostenplanung**: Bereitstellungskosten-Schätzungen und Budgets erstellt
- [ ] **Risikoabschätzung**: Bereitstellungsrisiken identifiziert und gemindert

#### 🚨 Kapitel 7: Fehlerbehebung & Debugging
- [ ] **Diagnosefähigkeiten**: Fehler absichtlich fehlerhafte Bereitstellungen erfolgreich debuggt
- [ ] **Protokollanalyse**: Azure Monitor und Application Insights effektiv genutzt
- [ ] **Leistungsoptimierung**: Langsame Anwendungen optimiert
- [ ] **Wiederherstellungsverfahren**: Backup- und Notfallwiederherstellung implementiert
- [ ] **Monitoring-Setup**: Proaktives Monitoring und Alerting erstellt

#### 🏢 Kapitel 8: Produktions- & Unternehmensmuster
- [ ] **Enterprise-Sicherheit**: Umfassende Sicherheitsmuster implementiert
- [ ] **Governance-Framework**: Azure Policy und Ressourcenverwaltung eingerichtet
- [ ] **Erweitertes Monitoring**: Dashboards und automatisiertes Alerting erstellt
- [ ] **CI/CD-Integration**: Automatisierte Deployment-Pipelines erstellt
- [ ] **Compliance-Implementierung**: Unternehmens-Compliance-Anforderungen erfüllt

### Lernzeitplan und Meilensteine

#### Woche 1-2: Grundlagen aufbauen
- **Meilenstein**: Erste KI-Anwendung mit AZD bereitgestellt
- **Validierung**: Funktionierende Anwendung über öffentliche URL erreichbar
- **Fähigkeiten**: Grundlegende AZD-Workflows und KI-Service-Integration

#### Woche 3-4: Konfigurations-Beherrschung
- **Meilenstein**: Multi-Environment-Bereitstellung mit sicherer Authentifizierung
- **Validierung**: Dieselbe Anwendung in Dev/Staging/Prod bereitgestellt
- **Fähigkeiten**: Umgebungsmanagement und Sicherheitsimplementierung

#### Woche 5-6: Infrastruktur-Expertise
- **Meilenstein**: Eigenes Template für komplexe Multi-Service-Anwendung
- **Validierung**: Wiederverwendbares Template von einem anderen Teammitglied bereitgestellt
- **Fähigkeiten**: Bicep-Beherrschung und Infrastrukturautomatisierung

#### Woche 7-8: Fortgeschrittene KI-Implementierung
- **Meilenstein**: Produktionsreife Mehragenten-KI-Lösung
- **Validierung**: System bewältigt reale Last mit Monitoring
- **Fähigkeiten**: Mehragenten-Orchestrierung und Leistungsoptimierung

#### Woche 9-10: Produktionsbereitschaft
- **Meilenstein**: Unternehmensgerechte Bereitstellung mit voller Compliance
- **Validierung**: Besteht Sicherheitsüberprüfung und Kostenoptimierungs-Audit
- **Fähigkeiten**: Governance, Monitoring und CI/CD-Integration

### Bewertung und Zertifizierung

#### Methoden zur Wissensvalidierung
1. **Praktische Bereitstellungen**: Funktionierende Anwendungen für jedes Kapitel
2. **Code-Reviews**: Bewertung der Qualität von Templates und Konfigurationen
3. **Problemlösung**: Szenarien zur Fehlerbehebung und deren Lösungen
4. **Peer-Unterricht**: Konzepte anderen Lernenden erklären
5. **Beitrag zur Community**: Templates oder Verbesserungen teilen

#### Berufliche Entwicklungsergebnisse
- **Portfolio-Projekte**: 8 produktionsreife Bereitstellungen
- **Technische Fähigkeiten**: Branchenübliche AZD- und KI-Bereitstellungs-Expertise
- **Problemlösungsfähigkeiten**: Eigenständige Fehlerbehebung und Optimierung
- **Anerkennung in der Community**: Aktive Teilnahme an der Azure-Entwickler-Community
- **Karrierefortschritt**: Fähigkeiten direkt anwendbar in Cloud- und KI-Rollen

#### Erfolgskennzahlen
- **Erfolgsquote der Bereitstellungen**: >95% erfolgreiche Bereitstellungen
- **Fehlerbehebungszeit**: <30 Minuten für häufige Probleme
- **Leistungsoptimierung**: Nachweisbare Verbesserungen bei Kosten und Leistung
- **Sicherheitskonformität**: Alle Bereitstellungen erfüllen Unternehmenssicherheitsstandards
- **Wissensvermittlung**: Fähigkeit, andere Entwickler zu betreuen

### Kontinuierliches Lernen und Community-Engagement

#### Auf dem Laufenden bleiben
- **Azure-Updates**: Verfolgen Sie die Release-Notes des Azure Developer CLI
- **Community-Veranstaltungen**: Nehmen Sie an Azure- und KI-Entwicklerveranstaltungen teil
- **Dokumentation**: Tragen Sie zur Community-Dokumentation und zu Beispielen bei
- **Feedback-Schleife**: Geben Sie Rückmeldungen zum Kursinhalt und zu Azure-Diensten

#### Karriereentwicklung
- **Professionelles Netzwerk**: Vernetzen Sie sich mit Azure- und KI-Experten
- **Vortragsmöglichkeiten**: Präsentieren Sie Ihre Erkenntnisse auf Konferenzen oder Meetups
- **Open-Source-Beiträge**: Tragen Sie zu AZD-Vorlagen und -Tools bei
- **Mentoring**: Begleiten Sie andere Entwickler auf ihrer AZD-Lernreise

---

**Kapitel-Navigation:**
- **📚 Kursstartseite**: [AZD für Einsteiger](../README.md)
- **📖 Loslegen**: [Kapitel 1: Grundlagen & Schnellstart](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Fortschrittsverfolgung**: Verfolgen Sie Ihren Fortschritt durch das umfassende 8-Kapitel-Lernsystem
- **🤝 Community**: [Azure Discord](https://discord.gg/microsoft-azure) für Unterstützung und Diskussion

**Verfolgung des Lernfortschritts**: Verwenden Sie diesen strukturierten Leitfaden, um das Azure Developer CLI durch fortschreitendes, praxisorientiertes Lernen mit messbaren Ergebnissen und beruflichen Entwicklungsvorteilen zu meistern.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI‑Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Bei wichtigen Informationen wird eine professionelle, menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->