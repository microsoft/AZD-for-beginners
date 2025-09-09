<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T17:43:16+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "de"
}
-->
# Studienleitfaden - AZD für Anfänger

## Einführung

Dieser umfassende Studienleitfaden bietet strukturierte Lernziele, Schlüsselkonzepte, Übungsaufgaben und Bewertungsmaterialien, um Ihnen zu helfen, die Azure Developer CLI (azd) zu meistern. Nutzen Sie diesen Leitfaden, um Ihren Fortschritt zu verfolgen und sicherzustellen, dass Sie alle wesentlichen Themen abgedeckt haben.

## Lernziele

Durch das Abschließen dieses Studienleitfadens werden Sie:
- Alle grundlegenden und fortgeschrittenen Konzepte der Azure Developer CLI beherrschen
- Praktische Fähigkeiten in der Bereitstellung und Verwaltung von Azure-Anwendungen entwickeln
- Vertrauen in die Fehlerbehebung und Optimierung von Bereitstellungen gewinnen
- Produktionsreife Bereitstellungspraktiken und Sicherheitsaspekte verstehen

## Lernergebnisse

Nach Abschluss aller Abschnitte dieses Studienleitfadens werden Sie in der Lage sein:
- Vollständige Anwendungsarchitekturen mit azd zu entwerfen, bereitzustellen und zu verwalten
- Umfassende Strategien für Überwachung, Sicherheit und Kostenoptimierung umzusetzen
- Komplexe Bereitstellungsprobleme eigenständig zu beheben
- Eigene Vorlagen zu erstellen und zur azd-Community beizutragen

## Kursstruktur

### Modul 1: Erste Schritte (Wochen 1-2)

#### Lernziele
- Grundlagen und Kernkonzepte der Azure Developer CLI verstehen
- azd erfolgreich auf Ihrer Entwicklungsumgebung installieren und konfigurieren
- Ihre erste Bereitstellung mit einer vorhandenen Vorlage abschließen
- Die azd-Projektstruktur navigieren und die wichtigsten Komponenten verstehen

#### Schlüsselkonzepte
- Vorlagen, Umgebungen und Dienste
- azure.yaml-Konfigurationsstruktur
- Grundlegende azd-Befehle (init, up, down, deploy)
- Prinzipien der Infrastruktur als Code
- Azure-Authentifizierung und -Autorisierung

#### Übungsaufgaben

**Übung 1.1: Installation und Einrichtung**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Übung 1.2: Erste Bereitstellung**  
```bash
# Deploy a simple web application:
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

### Modul 2: Konfiguration und Umgebungen (Woche 3)

#### Lernziele
- Umgebungsmanagement und Konfiguration meistern
- Fortgeschrittene azure.yaml-Konfigurationen verstehen
- Umgebungsspezifische Einstellungen und Variablen implementieren
- Authentifizierung für verschiedene Szenarien konfigurieren

#### Schlüsselkonzepte
- Hierarchie von Umgebungen und Vorrang von Variablen
- Dienstkonfiguration und Parameter
- Hooks und Lebenszyklusereignisse
- Authentifizierungsmethoden (Benutzer, Service Principal, Managed Identity)
- Verwaltung von Konfigurationsdateien

#### Übungsaufgaben

**Übung 2.1: Einrichtung mehrerer Umgebungen**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Übung 2.2: Fortgeschrittene Konfiguration**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Übung 2.3: Sicherheitskonfiguration**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Selbstbewertungsfragen
1. Wie handhabt azd den Vorrang von Umgebungsvariablen?
2. Was sind Bereitstellungshooks und wann sollten Sie sie verwenden?
3. Wie konfigurieren Sie verschiedene SKUs für unterschiedliche Umgebungen?
4. Was sind die Sicherheitsimplikationen verschiedener Authentifizierungsmethoden?
5. Wie verwalten Sie Geheimnisse und sensible Konfigurationsdaten?

### Modul 3: Bereitstellung und Provisionierung (Woche 4)

#### Lernziele
- Bereitstellungsabläufe und Best Practices meistern
- Infrastruktur als Code mit Bicep-Vorlagen verstehen
- Komplexe Architekturen mit mehreren Diensten implementieren
- Bereitstellungsleistung und Zuverlässigkeit optimieren

#### Schlüsselkonzepte
- Struktur und Module von Bicep-Vorlagen
- Ressourcenabhängigkeiten und Reihenfolge
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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Übung 3.3: Datenbankintegration**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Selbstbewertungsfragen
1. Was sind die Vorteile von Bicep gegenüber ARM-Vorlagen?
2. Wie handhaben Sie Datenbankmigrationen in azd-Bereitstellungen?
3. Welche Strategien gibt es für Bereitstellungen ohne Ausfallzeiten?
4. Wie verwalten Sie Abhängigkeiten zwischen Diensten?
5. Was sind die Überlegungen für Bereitstellungen in mehreren Regionen?

### Modul 4: Validierung vor der Bereitstellung (Woche 5)

#### Lernziele
- Umfassende Prüfungen vor der Bereitstellung implementieren
- Kapazitätsplanung und Ressourcenvalidierung meistern
- SKU-Auswahl und Kostenoptimierung verstehen
- Automatisierte Validierungspipelines erstellen

#### Schlüsselkonzepte
- Azure-Ressourcenquoten und -limits
- Kriterien für die SKU-Auswahl und Kostenimplikationen
- Automatisierte Validierungsskripte und -tools
- Methoden der Kapazitätsplanung
- Leistungstests und Optimierung

#### Übungsaufgaben

**Übung 4.1: Kapazitätsplanung**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Übung 4.2: Validierung vor der Bereitstellung**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Übung 4.3: SKU-Optimierung**  
```bash
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
3. Was sind die wichtigsten Komponenten eines Systems zur Vorabprüfung?
4. Wie schätzen und kontrollieren Sie Bereitstellungskosten?
5. Welche Überwachung ist für die Kapazitätsplanung unerlässlich?

### Modul 5: Fehlerbehebung und Debugging (Woche 6)

#### Lernziele
- Systematische Fehlerbehebungsmethoden meistern
- Expertise im Debugging komplexer Bereitstellungsprobleme entwickeln
- Umfassende Überwachung und Alarmierung implementieren
- Verfahren zur Reaktion und Wiederherstellung bei Vorfällen erstellen

#### Schlüsselkonzepte
- Häufige Muster von Bereitstellungsfehlern
- Protokollanalyse und Korrelationstechniken
- Leistungsüberwachung und Optimierung
- Erkennung und Reaktion auf Sicherheitsvorfälle
- Notfallwiederherstellung und Geschäftskontinuität

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

**Übung 5.3: Reaktion auf Vorfälle**  
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
2. Wie korrelieren Sie Protokolle über mehrere Dienste und Ressourcen hinweg?
3. Welche Überwachungsmetriken sind für die frühzeitige Problemidentifikation am wichtigsten?
4. Wie implementieren Sie effektive Verfahren zur Notfallwiederherstellung?
5. Was sind die wichtigsten Komponenten eines Plans zur Reaktion auf Vorfälle?

### Modul 6: Fortgeschrittene Themen und Best Practices (Wochen 7-8)

#### Lernziele
- Bereitstellungsmuster auf Unternehmensniveau implementieren
- CI/CD-Integration und Automatisierung meistern
- Benutzerdefinierte Vorlagen entwickeln und zur Community beitragen
- Fortgeschrittene Sicherheits- und Compliance-Anforderungen verstehen

#### Schlüsselkonzepte
- CI/CD-Pipeline-Integrationsmuster
- Entwicklung und Verteilung benutzerdefinierter Vorlagen
- Unternehmensrichtlinien und Compliance
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
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Übung 6.3: Implementierung auf Unternehmensebene**  
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
2. Was sind die wichtigsten Überlegungen bei der Entwicklung benutzerdefinierter Vorlagen?
3. Wie implementieren Sie Governance und Compliance in azd-Bereitstellungen?
4. Was sind die Best Practices für Bereitstellungen im Unternehmensmaßstab?
5. Wie tragen Sie effektiv zur azd-Community bei?

## Praktische Projekte

### Projekt 1: Persönliche Portfolio-Website
**Komplexität**: Anfänger  
**Dauer**: 1-2 Wochen

Erstellen und bereitstellen Sie eine persönliche Portfolio-Website mit:
- Statischem Website-Hosting auf Azure Storage
- Konfiguration einer benutzerdefinierten Domain
- CDN-Integration für globale Leistung
- Automatisierter Bereitstellungspipeline

**Liefergegenstände**:
- Funktionierende Website, bereitgestellt auf Azure
- Benutzerdefinierte azd-Vorlage für Portfolio-Bereitstellungen
- Dokumentation des Bereitstellungsprozesses
- Kostenanalyse und Optimierungsempfehlungen

### Projekt 2: Aufgabenverwaltungsanwendung
**Komplexität**: Mittel  
**Dauer**: 2-3 Wochen

Erstellen Sie eine vollständige Aufgabenverwaltungsanwendung mit:
- React-Frontend, bereitgestellt auf App Service
- Node.js-API-Backend mit Authentifizierung
- PostgreSQL-Datenbank mit Migrationen
- Application Insights-Überwachung

**Liefergegenstände**:
- Vollständige Anwendung mit Benutzerauthentifizierung
- Datenbankschema und Migrationsskripte
- Überwachungs-Dashboards und Alarmierungsregeln
- Konfiguration für Bereitstellungen in mehreren Umgebungen

### Projekt 3: E-Commerce-Plattform mit Microservices
**Komplexität**: Fortgeschritten  
**Dauer**: 4-6 Wochen

Entwerfen und implementieren Sie eine E-Commerce-Plattform mit Microservices:
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

Schließen Sie diese Bewertungen nach jedem Modul ab:

**Bewertung Modul 1**: Grundkonzepte und Installation  
- Multiple-Choice-Fragen zu Kernkonzepten  
- Praktische Aufgaben zur Installation und Konfiguration  
- Einfache Bereitstellungsübung  

**Bewertung Modul 2**: Konfiguration und Umgebungen  
- Szenarien zur Umgebungsverwaltung  
- Übungen zur Fehlerbehebung bei Konfigurationen  
- Implementierung von Sicherheitskonfigurationen  

**Bewertung Modul 3**: Bereitstellung und Provisionierung  
- Herausforderungen im Infrastrukturdesign  
- Szenarien für Bereitstellungen mit mehreren Diensten  
- Übungen zur Leistungsoptimierung  

**Bewertung Modul 4**: Validierung vor der Bereitstellung  
- Fallstudien zur Kapazitätsplanung  
- Szenarien zur Kostenoptimierung  
- Implementierung von Validierungspipelines  

**Bewertung Modul 5**: Fehlerbehebung und Debugging  
- Übungen zur Problemdiagnose  
- Aufgaben zur Überwachungsimplementierung  
- Simulationen zur Reaktion auf Vorfälle  

**Bewertung Modul 6**: Fortgeschrittene Themen  
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
- Einhaltung von Sicherheits- und Best Practices  
- Optimierung von Leistung und Kosten  
- Effektivität bei Fehlerbehebung und Überwachung  

## Studienressourcen und Referenzen

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

## Empfehlungen für den Studienplan

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

### Selbstgesteuertes Studium
- Schließen Sie jedes Modul in Ihrem eigenen Tempo ab  
- Verbringen Sie zusätzliche Zeit mit herausfordernden Konzepten  
- Wiederholen Sie Übungen, bis Sie die Inhalte beherrschen  
- Nehmen Sie an Community-Diskussionen teil und stellen Sie Fragen  

## Erfolgstipps

### Effektive Lernstrategien
1. **Regelmäßig üben**: Anwendungen häufig bereitstellen, um Routine zu entwickeln  
2. **Mutig experimentieren**: Entwicklungsumgebungen nutzen, um neue Konfigurationen auszuprobieren  
3. **Lernen dokumentieren**: Notizen zu Lösungen von Problemen führen  
4. **Community beitreten**: An Diskussionen teilnehmen und zu Projekten beitragen  
5. **Aktuell bleiben**: Azure-Updates und neue azd-Funktionen verfolgen  

### Häufige Fehler vermeiden
1. **Voraussetzungen überspringen**: Stellen Sie sicher, dass Sie über ausreichendes Grundlagenwissen verfügen  
2. **Konzepte überfliegen**: Nehmen Sie sich Zeit, um die Grundlagen gründlich zu verstehen  
3. **Sicherheit ignorieren**: Implementieren Sie Sicherheitsbest Practices von Anfang an  
4. **Unzureichendes Testen**: Testen Sie Bereitstellungen in mehreren Umgebungen  
5. **Dokumentation vernachlässigen**: Gute Dokumentation ist entscheidend für die Wartung  

### Praktische Erfahrung sammeln
1. **Klein anfangen**: Beginnen Sie mit einfachen Anwendungen und steigern Sie die Komplexität schrittweise  
2. **Aus Fehlern lernen**: Nutzen Sie Übungen zur Fehlerbehebung als Lernmöglichkeiten  
3. **Trage zu Open Source bei**: Teile deine Vorlagen und Lösungen mit der Community  
4. **Lehre andere**: Das Erklären von Konzepten an andere stärkt dein eigenes Verständnis  
5. **Bleibe neugierig**: Erkunde kontinuierlich neue Azure-Dienste und Integrationsmuster  

---

**Navigation**  
- **Vorherige Lektion**: [FAQ](faq.md)  
- **Nächste Lektion**: [Changelog](../changelog.md)  

**Verfolgung des Lernfortschritts**: Nutze diesen Leitfaden, um deine Lernreise zu verfolgen und sicherzustellen, dass du alle Konzepte und Praktiken des Azure Developer CLI umfassend abdeckst.  

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.