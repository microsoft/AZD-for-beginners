<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-17T16:12:55+00:00",
  "source_file": "examples/README.md",
  "language_code": "de"
}
-->
# Beispiele - Praktische AZD-Vorlagen und Konfigurationen

**Lernen durch Beispiele - Nach Kapiteln organisiert**
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)
- **📖 Kapitelübersicht**: Beispiele nach Lernkomplexität organisiert
- **🚀 Einfach starten**: [Kapitel 1 Beispiele](../../../examples)
- **🤖 KI-Beispiele**: [Kapitel 2 & 5 KI-Lösungen](../../../examples)

## Einführung

Dieses Verzeichnis enthält praktische Beispiele, Vorlagen und reale Szenarien, die Ihnen helfen, die Azure Developer CLI durch praktische Übungen zu erlernen. Jedes Beispiel bietet vollständigen funktionierenden Code, Infrastrukturvorlagen und detaillierte Anleitungen für verschiedene Anwendungsarchitekturen und Bereitstellungsmuster.

## Lernziele

Durch die Arbeit mit diesen Beispielen werden Sie:
- Azure Developer CLI-Workflows mit realistischen Anwendungsszenarien üben
- Verschiedene Anwendungsarchitekturen und deren AZD-Implementierungen verstehen
- Infrastruktur-als-Code-Muster für verschiedene Azure-Dienste meistern
- Konfigurationsmanagement und umgebungsspezifische Bereitstellungsstrategien anwenden
- Überwachungs-, Sicherheits- und Skalierungsmuster in praktischen Kontexten implementieren
- Erfahrung im Troubleshooting und Debugging von echten Bereitstellungsszenarien sammeln

## Lernergebnisse

Nach Abschluss dieser Beispiele werden Sie in der Lage sein:
- Verschiedene Anwendungstypen sicher mit der Azure Developer CLI bereitzustellen
- Die bereitgestellten Vorlagen an Ihre eigenen Anwendungsanforderungen anzupassen
- Eigene Infrastrukturmuster mit Bicep zu entwerfen und umzusetzen
- Komplexe Multi-Service-Anwendungen mit den richtigen Abhängigkeiten zu konfigurieren
- Sicherheits-, Überwachungs- und Leistungsbest-Practices in realen Szenarien anzuwenden
- Bereitstellungen basierend auf praktischen Erfahrungen zu optimieren und zu beheben

## Verzeichnisstruktur

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Schnellstart-Beispiele

### Für Anfänger
1. **[Einfache Web-App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Bereitstellung einer Node.js Express-Webanwendung mit MongoDB
2. **[Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hosting einer React-Website mit Azure Static Web Apps
3. **[Container-App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Bereitstellung einer containerisierten Python Flask-Anwendung

### Für fortgeschrittene Nutzer
4. **[Datenbank-App - C# mit Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Webanwendung mit C# API und Azure SQL-Datenbank
5. **[Serverless-Funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions mit HTTP-Triggers und Cosmos DB
6. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Multi-Service-Java-Anwendung mit Container Apps und API-Gateway

### Azure AI Foundry-Vorlagen

1. **[Azure OpenAI Chat-App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Intelligente Chat-Anwendung mit Azure OpenAI
2. **[KI-Dokumentenverarbeitung](https://github.com/Azure-Samples/azure-ai-document-processing)** - Dokumentenanalyse mit Azure AI-Diensten
3. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps-Workflow mit Azure Machine Learning

### Reale Szenarien

#### **Retail Multi-Agent Lösung** 🆕
**[Komplette Implementierungsanleitung](./retail-scenario.md)**

Eine umfassende, produktionsreife Multi-Agent-Kundenlösung, die den Einsatz von KI-Anwendungen auf Unternehmensniveau mit AZD demonstriert. Dieses Szenario bietet:

- **Komplette Architektur**: Multi-Agent-System mit spezialisierten Kundenservice- und Bestandsmanagement-Agenten
- **Produktionsinfrastruktur**: Multi-Region Azure OpenAI-Bereitstellungen, KI-Suche, Container Apps und umfassende Überwachung
- **Bereitstellungsfertige ARM-Vorlage**: Ein-Klick-Bereitstellung mit mehreren Konfigurationsmodi (Minimal/Standard/Premium)
- **Erweiterte Funktionen**: Sicherheitsvalidierung, Agentenbewertungsframework, Kostenoptimierung und Troubleshooting-Anleitungen
- **Realer Geschäftskontext**: Einzelhandels-Kundenservice-Anwendungsfall mit Datei-Uploads, Suchintegration und dynamischer Skalierung

**Technologien**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexität**: ⭐⭐⭐⭐ (Fortgeschritten - Produktionsreif für Unternehmen)

**Perfekt für**: KI-Entwickler, Lösungsarchitekten und Teams, die produktionsreife Multi-Agent-Systeme entwickeln

**Schnellstart**: Bereitstellung der kompletten Lösung in weniger als 30 Minuten mit der enthaltenen ARM-Vorlage und `./deploy.sh -g myResourceGroup`

## 📋 Nutzungsanweisungen

### Beispiele lokal ausführen

1. **Beispiel klonen oder kopieren**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **AZD-Umgebung initialisieren**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Umgebung konfigurieren**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Bereitstellen**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Beispiele anpassen

Jedes Beispiel enthält:
- **README.md** - Detaillierte Setup- und Anpassungsanweisungen
- **azure.yaml** - AZD-Konfiguration mit Kommentaren
- **infra/** - Bicep-Vorlagen mit Parametererklärungen
- **src/** - Beispielanwendungscode
- **scripts/** - Hilfsskripte für häufige Aufgaben

## 🎯 Lernziele

### Beispielkategorien

#### **Einfache Bereitstellungen**
- Einzelservice-Anwendungen
- Einfache Infrastrukturmuster
- Grundlegendes Konfigurationsmanagement
- Kostenoptimierte Entwicklungsumgebungen

#### **Fortgeschrittene Szenarien**
- Multi-Service-Architekturen
- Komplexe Netzwerk-Konfigurationen
- Datenbank-Integrationsmuster
- Sicherheits- und Compliance-Implementierungen

#### **Produktionsreife Muster**
- Hochverfügbarkeitskonfigurationen
- Überwachung und Beobachtbarkeit
- CI/CD-Integration
- Disaster-Recovery-Setups

## 📖 Beispielbeschreibungen

### Einfache Web-App - Node.js Express
**Technologien**: Node.js, Express, MongoDB, Container Apps  
**Komplexität**: Anfänger  
**Konzepte**: Grundlegende Bereitstellung, REST-API, NoSQL-Datenbankintegration

### Statische Website - React SPA
**Technologien**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexität**: Anfänger  
**Konzepte**: Statisches Hosting, serverloses Backend, moderne Webentwicklung

### Container-App - Python Flask
**Technologien**: Python Flask, Docker, Container Apps, Container Registry  
**Komplexität**: Anfänger  
**Konzepte**: Containerisierung, Microservices-Architektur, API-Entwicklung

### Datenbank-App - C# mit Azure SQL
**Technologien**: C# ASP.NET Core, Azure SQL-Datenbank, App Service  
**Komplexität**: Fortgeschritten  
**Konzepte**: Entity Framework, Datenbankverbindungen, Web-API-Entwicklung

### Serverless-Funktion - Python Azure Functions
**Technologien**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexität**: Fortgeschritten  
**Konzepte**: Eventgesteuerte Architektur, serverloses Computing, Full-Stack-Entwicklung

### Microservices - Java Spring Boot
**Technologien**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexität**: Fortgeschritten  
**Konzepte**: Microservices-Kommunikation, verteilte Systeme, Unternehmensmuster

### Azure AI Foundry Beispiele

#### Azure OpenAI Chat-App
**Technologien**: Azure OpenAI, Cognitive Search, App Service  
**Komplexität**: Fortgeschritten  
**Konzepte**: RAG-Architektur, Vektorsuche, LLM-Integration

#### KI-Dokumentenverarbeitung
**Technologien**: Azure AI Document Intelligence, Storage, Functions  
**Komplexität**: Fortgeschritten  
**Konzepte**: Dokumentenanalyse, OCR, Datenextraktion

#### Machine Learning Pipeline
**Technologien**: Azure ML, MLOps, Container Registry  
**Komplexität**: Fortgeschritten  
**Konzepte**: Modelltraining, Bereitstellungspipelines, Überwachung

## 🛠 Konfigurationsbeispiele

Das Verzeichnis `configurations/` enthält wiederverwendbare Komponenten:

### Umgebungskonfigurationen
- Einstellungen für Entwicklungsumgebungen
- Konfigurationen für Staging-Umgebungen
- Produktionsreife Konfigurationen
- Multi-Region-Bereitstellungs-Setups

### Bicep-Module
- Wiederverwendbare Infrastrukturkomponenten
- Häufige Ressourcenmuster
- Sicherheitsgehärtete Vorlagen
- Kostenoptimierte Konfigurationen

### Hilfsskripte
- Automatisierung der Umgebungseinrichtung
- Datenbank-Migrationsskripte
- Tools zur Bereitstellungsvalidierung
- Kostenüberwachungswerkzeuge

## 🔧 Anpassungsanleitung

### Beispiele für Ihren Anwendungsfall anpassen

1. **Voraussetzungen überprüfen**
   - Anforderungen an Azure-Dienste prüfen
   - Abonnementlimits überprüfen
   - Kostenimplikationen verstehen

2. **Konfiguration ändern**
   - `azure.yaml`-Service-Definitionen aktualisieren
   - Bicep-Vorlagen anpassen
   - Umgebungsvariablen anpassen

3. **Gründlich testen**
   - Zuerst in der Entwicklungsumgebung bereitstellen
   - Funktionalität validieren
   - Skalierung und Leistung testen

4. **Sicherheitsüberprüfung**
   - Zugriffskontrollen überprüfen
   - Geheimnismanagement implementieren
   - Überwachung und Alarmierung aktivieren

## 📊 Vergleichsmatrix

| Beispiel | Dienste | Datenbank | Auth | Überwachung | Komplexität |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |
| React SPA + Functions | 3 | ✅ | Basic | Full | ⭐ |
| Python Flask Container | 2 | ❌ | Basic | Full | ⭐ |
| C# Web API + SQL | 2 | ✅ | Full | Full | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Full | Full | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Full | Full | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Full | Full | ⭐⭐⭐ |
| KI-Dokumentenverarbeitung | 2 | ❌ | Basic | Full | ⭐⭐ |
| ML-Pipeline | 4+ | ✅ | Full | Full | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Advanced** | **⭐⭐⭐⭐** |

## 🎓 Lernpfad

### Empfohlene Reihenfolge

1. **Mit einfacher Web-App beginnen**
   - Grundlegende AZD-Konzepte lernen
   - Bereitstellungsworkflow verstehen
   - Umgebungskonfiguration üben

2. **Statische Website ausprobieren**
   - Verschiedene Hosting-Optionen erkunden
   - CDN-Integration lernen
   - DNS-Konfiguration verstehen

3. **Zu Container-App wechseln**
   - Grundlagen der Containerisierung lernen
   - Skalierungskonzepte verstehen
   - Mit Docker üben

4. **Datenbankintegration hinzufügen**
   - Datenbankbereitstellung lernen
   - Verbindungsstrings verstehen
   - Geheimnismanagement üben

5. **Serverless erkunden**
   - Eventgesteuerte Architektur verstehen
   - Triggers und Bindings lernen
   - Mit APIs üben

6. **Microservices erstellen**
   - Service-Kommunikation lernen
   - Verteilte Systeme verstehen
   - Komplexe Bereitstellungen üben

## 🔍 Das richtige Beispiel finden

### Nach Technologie-Stack
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML-Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Container**: Python Flask Container App, Java Microservices
- **Datenbanken**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **KI/ML**: Azure OpenAI Chat App, KI-Dokumentenverarbeitung, ML-Pipeline, **Retail Multi-Agent Lösung**
- **Multi-Agent-Systeme**: **Retail Multi-Agent Lösung**
- **Produktionsreife Lösungen**: **Retail Multi-Agent Lösung**

### Nach Architektur-Muster
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Statisch + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: Java Spring Boot Microservices
- **Containerisiert**: Python Flask Container App
- **KI-gestützt**: Azure OpenAI Chat App, KI-Dokumentenverarbeitung, ML-Pipeline, **Retail Multi-Agent Lösung**
- **Multi-Agent-Architektur**: **Retail Multi-Agent Lösung**
- **Multi-Service für Unternehmen**: **Retail Multi-Agent Lösung**

### Nach Komplexitätsstufe
- **Anfänger**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Fortgeschritten**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, KI-Dokumentenverarbeitung
- **Fortgeschritten**: ML-Pipeline
- **Produktionsreif für Unternehmen**: **Retail Multi-Agent Lösung** (Komplettes Multi-Agent-System mit ARM-Vorlagen-Bereitstellung)

## 📚 Zusätzliche Ressourcen

### Dokumentationslinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD-Vorlagen](https://github.com/Azure/ai-foundry-templates)
- [Bicep-Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-Beispiele
- [Azure Samples AZD-Vorlagen](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry-Vorlagen](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galerie](https://azure.github.io/awesome-azd/)
- [Todo-App mit C# und Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-App mit Python und MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-App mit Node.js und PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-Web-App mit C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions mit Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Beispiele beitragen

Haben Sie ein nützliches Beispiel, das Sie teilen möchten? Wir freuen uns über Beiträge!

### Richtlinien für Einreichungen
1. Halten Sie sich an die vorgegebene Verzeichnisstruktur
2. Fügen Sie eine umfassende README.md hinzu
3. Kommentieren Sie Konfigurationsdateien
4. Testen Sie gründlich vor der Einreichung
5. Fügen Sie Kostenabschätzungen und Voraussetzungen hinzu

### Beispielvorlagenstruktur
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Tipp**: Beginnen Sie mit dem einfachsten Beispiel, das zu Ihrem Technologiestack passt, und arbeiten Sie sich schrittweise zu komplexeren Szenarien vor. Jedes Beispiel baut auf Konzepten der vorherigen auf!

**Nächste Schritte**: 
- Wählen Sie ein Beispiel, das Ihrem Kenntnisstand entspricht
- Folgen Sie den Setup-Anweisungen im README des Beispiels
- Experimentieren Sie mit Anpassungen
- Teilen Sie Ihre Erkenntnisse mit der Community

---

**Navigation**
- **Vorherige Lektion**: [Lernleitfaden](../resources/study-guide.md)
- **Zurück zu**: [Haupt-README](../README.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.