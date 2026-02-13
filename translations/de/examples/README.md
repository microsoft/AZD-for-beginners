# Beispiele - Praktische AZD-Vorlagen und Konfigurationen

**Lernen durch Beispiele - Nach Kapitel organisiert**
- **📚 Kursübersicht**: [AZD für Einsteiger](../README.md)
- **📖 Kapitelzuordnung**: Beispiele nach Lernkomplexität organisiert
- **🚀 Lokales Beispiel**: [Einzelhandels-Multi-Agent-Lösung](retail-scenario.md)
- **🤖 Externe KI-Beispiele**: Links zu Azure-Samples-Repositories

> **📍 WICHTIG: Lokale vs. externe Beispiele**  
> Dieses Repository enthält **4 vollständige lokale Beispiele** mit kompletten Implementierungen:  
> - **Azure OpenAI Chat** (GPT-4-Bereitstellung mit Chatoberfläche)  
> - **Container Apps** (Einfache Flask-API + Microservices)  
> - **Datenbank-App** (Web + SQL-Datenbank)  
> - **Retail Multi-Agent** (Enterprise-KI-Lösung)  
>  
> Zusätzliche Beispiele sind **externe Verweise** auf Azure-Samples-Repositories, die Sie klonen können.

## Einführung

Dieses Verzeichnis bietet praktische Beispiele und Verweise, die Ihnen helfen, die Azure Developer CLI durch praktische Übungen zu erlernen. Das Retail Multi-Agent-Szenario ist eine vollständige, produktionsreife Implementierung, die in diesem Repository enthalten ist. Zusätzliche Beispiele verweisen auf offizielle Azure Samples, die verschiedene AZD-Muster demonstrieren.

### Legende der Komplexitätsbewertung

- ⭐ **Anfänger** - Grundlegende Konzepte, ein einzelner Dienst, 15-30 Minuten
- ⭐⭐ **Mittelstufe** - Mehrere Dienste, Datenbankintegration, 30-60 Minuten
- ⭐⭐⭐ **Fortgeschritten** - Komplexe Architektur, KI-Integration, 1-2 Stunden
- ⭐⭐⭐⭐ **Experte** - Produktionsreif, Enterprise-Muster, 2+ Stunden

## 🎯 Was tatsächlich in diesem Repository enthalten ist

### ✅ Lokale Implementierung (Einsatzbereit)

#### [Azure OpenAI Chat-Anwendung](azure-openai-chat/README.md) 🆕
**Vollständige GPT-4-Bereitstellung mit Chatoberfläche in diesem Repo enthalten**

- **Standort:** `examples/azure-openai-chat/`
- **Komplexität:** ⭐⭐ (Mittelstufe)
- **Enthalten:**
  - Vollständige Azure OpenAI-Bereitstellung (GPT-4)
  - Python-Kommandozeilen-Chatoberfläche
  - Key Vault-Integration für sichere API-Schlüssel
  - Bicep-Infrastrukturvorlagen
  - Token-Nutzung und Kostenverfolgung
  - Ratenbegrenzung und Fehlerbehandlung

**Schnellstart:**
```bash
# Wechsle ins Beispielverzeichnis
cd examples/azure-openai-chat

# Stelle alles bereit
azd up

# Installiere Abhängigkeiten und beginne zu chatten
pip install -r src/requirements.txt
python src/chat.py
```

**Technologien:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container-App-Beispiele](container-app/README.md) 🆕
**Umfassende Container-Bereitstellungsbeispiele in diesem Repo enthalten**

- **Standort:** `examples/container-app/`
- **Komplexität:** ⭐-⭐⭐⭐⭐ (Anfänger bis Experte)
- **Enthalten:**
  - [Hauptleitfaden](container-app/README.md) - Vollständiger Überblick über Container-Bereitstellungen
  - [Einfache Flask-API](../../../examples/container-app/simple-flask-api) - Einfaches REST-API-Beispiel
  - [Microservices-Architektur](../../../examples/container-app/microservices) - Produktionsreife Multi-Service-Bereitstellung
  - Schnellstart-, Produktions- und erweiterte Muster
  - Überwachung, Sicherheit und Kostenoptimierung

**Schnellstart:**
```bash
# Masterleitfaden anzeigen
cd examples/container-app

# Einfache Flask-API bereitstellen
cd simple-flask-api
azd up

# Microservices-Beispiel bereitstellen
cd ../microservices
azd up
```

**Technologien:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Einzelhandels-Multi-Agent-Lösung](retail-scenario.md) 🆕
**Vollständige produktionsreife Implementierung in diesem Repo enthalten**

- **Standort:** `examples/retail-multiagent-arm-template/`
- **Komplexität:** ⭐⭐⭐⭐ (Experte)
- **Enthalten:**
  - Vorlage für vollständige ARM-Bereitstellung
  - Multi-Agent-Architektur (Kunde + Inventar)
  - Azure OpenAI-Integration
  - KI-Suche mit RAG
  - Umfassende Überwachung
  - Ein-Klick-Bereitstellungsskript

**Schnellstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologien:** Azure OpenAI, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure Samples (Zum Klonen)

Die folgenden Beispiele werden in offiziellen Azure-Samples-Repositories gepflegt. Klonen Sie sie, um verschiedene AZD-Muster zu erkunden:

### Einfache Anwendungen (Kapitel 1-2)

| Vorlage | Repository | Komplexität | Dienste |
|:---------|:-----------|:-----------|:---------|
| **Python Flask-API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Mehrere Dienste, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**Wie man sie verwendet:**
```bash
# Beliebiges Beispiel klonen
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Bereitstellen
azd up
```

### KI-Anwendungsbeispiele (Kapitel 2, 5, 8)

| Vorlage | Repository | Komplexität | Schwerpunkt |
|:---------|:-----------|:-----------|:------|
| **Azure OpenAI-Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4-Bereitstellung |
| **KI-Chat Schnellstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlegender KI-Chat |
| **KI-Agenten** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenten-Framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-Muster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise-KI |

### Datenbank- & erweiterte Muster (Kapitel 3-8)

| Vorlage | Repository | Komplexität | Schwerpunkt |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Datenbankintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL-Serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Mehrere Dienste |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Lernziele

Durch die Bearbeitung dieser Beispiele werden Sie:
- Azure Developer CLI-Workflows mit realistischen Anwendungsszenarien üben
- Unterschiedliche Anwendungsarchitekturen und deren azd-Implementierungen verstehen
- Infrastructure-as-Code-Muster für verschiedene Azure-Dienste beherrschen
- Konfigurationsmanagement und umgebungsspezifische Bereitstellungsstrategien anwenden
- Überwachungs-, Sicherheits- und Skalierungsmuster in praktischen Kontexten implementieren
- Erfahrung in der Fehlerbehebung und dem Debugging realer Bereitstellungsszenarien sammeln

## Lernergebnisse

Nach Abschluss dieser Beispiele werden Sie in der Lage sein:
- Verschiedene Anwendungstypen sicher mit der Azure Developer CLI bereitzustellen
- Bereitgestellte Vorlagen an Ihre eigenen Anwendungsanforderungen anzupassen
- Benutzerdefinierte Infrastrukturmuster mit Bicep zu entwerfen und zu implementieren
- Komplexe Multi-Service-Anwendungen mit korrekten Abhängigkeiten zu konfigurieren
- Sicherheits-, Überwachungs- und Leistungs-Best-Practices in realen Szenarien anzuwenden
- Probleme zu beheben und Bereitstellungen basierend auf praktischer Erfahrung zu optimieren

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

> **💡 Neu bei AZD?** Beginnen Sie mit Beispiel Nr. 1 (Flask-API) – es dauert ca. 20 Minuten und vermittelt Kernkonzepte.

### Für Anfänger
1. **[Container-App - Python Flask-API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Bereitstellen einer einfachen REST-API mit Scale-to-Zero  
   **Zeit:** 20-25 Minuten | **Kosten:** $0-5/month  
   **Sie lernen:** Grundlegender azd-Workflow, Containerisierung, Health Probes  
   **Erwartetes Ergebnis:** Funktionierender API-Endpunkt, der "Hello, World!" zurückgibt, mit Überwachung

2. **[Einfache Web-App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Bereitstellen einer Node.js Express-Webanwendung mit MongoDB  
   **Zeit:** 25-35 Minuten | **Kosten:** $10-30/month  
   **Sie lernen:** Datenbankintegration, Umgebungsvariablen, Verbindungszeichenfolgen  
   **Erwartetes Ergebnis:** Todo-Listen-Anwendung mit Erstellen/Lesen/Aktualisieren/Löschen-Funktionalität

3. **[Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosten einer statischen React-Website mit Azure Static Web Apps  
   **Zeit:** 20-30 Minuten | **Kosten:** $0-10/month  
   **Sie lernen:** Statisches Hosting, serverlose Funktionen, CDN-Bereitstellung  
   **Erwartetes Ergebnis:** React-Oberfläche mit API-Backend, automatischem SSL, globalem CDN

### Für Fortgeschrittene
4. **[Azure OpenAI-Chat-Anwendung](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   GPT-4 mit Chatoberfläche und sicherer API-Schlüsselverwaltung bereitstellen  
   **Zeit:** 35-45 Minuten | **Kosten:** $50-200/month  
   **Sie lernen:** Azure OpenAI-Bereitstellung, Key Vault-Integration, Token-Tracking  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit GPT-4 und Kostenüberwachung

5. **[Container-App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsreife Multi-Service-Architektur  
   **Zeit:** 45-60 Minuten | **Kosten:** $50-150/month  
   **Sie lernen:** Servicekommunikation, Nachrichtenwarteschlangen, verteiltes Tracing  
   **Erwartetes Ergebnis:** 2-Service-System (API-Gateway + Produktservice) mit Überwachung

6. **[Datenbank-App - C# mit Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webanwendung mit C#-API und Azure SQL-Datenbank  
   **Zeit:** 30-45 Minuten | **Kosten:** $20-80/month  
   **Sie lernen:** Entity Framework, Datenbankmigrationen, Verbindungs­sicherheit  
   **Erwartetes Ergebnis:** C#-API mit Azure SQL-Backend, automatische Schema-Bereitstellung

7. **[Serverless-Funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions mit HTTP-Triggern und Cosmos DB  
   **Zeit:** 30-40 Minuten | **Kosten:** $10-40/month  
   **Sie lernen:** Ereignisgesteuerte Architektur, serverloses Skalieren, NoSQL-Integration  
   **Erwartetes Ergebnis:** Function App, die auf HTTP-Anfragen reagiert und Cosmos DB-Speicherung verwendet

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-Service-Java-Anwendung mit Container Apps und API-Gateway  
   **Zeit:** 60-90 Minuten | **Kosten:** $80-200/month  
   **Sie lernen:** Spring Boot-Bereitstellung, Service Mesh, Load Balancing  
   **Erwartetes Ergebnis:** Multi-Service-Java-System mit Service-Erkennung und Routing

### Microsoft Foundry-Vorlagen

1. **[Azure OpenAI Chat App - Local Example](../../../examples/azure-openai-chat)** ⭐⭐  
   Vollständige GPT-4-Bereitstellung mit Chatoberfläche  
   **Zeit:** 35-45 Minuten | **Kosten:** $50-200/month  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit Token-Tracking und Kostenüberwachung

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente Chat-Anwendung mit RAG-Architektur  
   **Zeit:** 60-90 Minuten | **Kosten:** $100-300/month  
   **Erwartetes Ergebnis:** RAG-gestützte Chat-Oberfläche mit Dokumentensuche und Zitaten

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentenanalyse unter Verwendung von Azure AI-Diensten  
   **Zeit:** 40-60 Minuten | **Kosten:** $20-80/month  
   **Erwartetes Ergebnis:** API, die Text, Tabellen und Entitäten aus hochgeladenen Dokumenten extrahiert

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-Workflow mit Azure Machine Learning  
   **Zeit:** 2-3 Stunden | **Kosten:** $150-500/month  
   **Erwartetes Ergebnis:** Automatisierte ML-Pipeline mit Training, Bereitstellung und Überwachung

### Reale Szenarien

#### **Einzelhandels-Multi-Agent-Lösung** 🆕  
**[Vollständiger Implementierungsleitfaden](./retail-scenario.md)**

Eine umfassende, produktionsreife Multi-Agent-Kundensupport-Lösung, die die Bereitstellung von Enterprise-KI-Anwendungen mit AZD demonstriert. Dieses Szenario bietet:

- **Vollständige Architektur**: Multi-Agenten-System mit spezialisierten Kundenservice- und Bestandsverwaltungsagenten
- **Produktionsinfrastruktur**: Multi-Region Azure OpenAI-Bereitstellungen, Azure AI Search, Container Apps und umfassendes Monitoring
- **Einsatzbereites ARM-Template**: Ein-Klick-Bereitstellung mit mehreren Konfigurationsmodi (Minimal/Standard/Premium)
- **Erweiterte Funktionen**: Red-Teaming-Sicherheitsvalidierung, Agentenbewertungs-Framework, Kostenoptimierung und Anleitungen zur Fehlerbehebung
- **Echter Geschäftskontext**: Anwendungsfall Kundensupport im Einzelhandel mit Dateiuploads, Suchintegration und dynamischer Skalierung

**Technologien**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexität**: ⭐⭐⭐⭐ (Fortgeschritten - Enterprise produktionsbereit)

**Perfekt für**: KI-Entwickler, Lösungsarchitekten und Teams, die produktive Multi-Agenten-Systeme entwickeln

**Schnellstart**: Stellen Sie die komplette Lösung in unter 30 Minuten mit dem enthaltenen ARM-Template bereit mit `./deploy.sh -g myResourceGroup`

## 📋 Nutzungsanweisungen

### Voraussetzungen

Bevor Sie ein Beispiel ausführen:
- ✅ Azure-Abonnement mit Owner- oder Contributor-Zugriff
- ✅ Azure Developer CLI installiert ([Installationsanleitung](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop ausgeführt (für Container-Beispiele)
- ✅ Entsprechende Azure-Quoten (prüfen Sie die beispielspezifischen Anforderungen)

> **💰 Kostenwarnung:** Alle Beispiele erstellen echte Azure-Ressourcen, die Kosten verursachen. Siehe die jeweiligen README-Dateien für Kostenschätzungen. Denken Sie daran, `azd down` auszuführen, wenn Sie fertig sind, um laufende Kosten zu vermeiden.

### Beispiele lokal ausführen

1. **Beispiel klonen oder kopieren**
   ```bash
   # Zum gewünschten Beispiel navigieren
   cd examples/simple-web-app
   ```

2. **AZD-Umgebung initialisieren**
   ```bash
   # Mit vorhandener Vorlage initialisieren
   azd init
   
   # Oder eine neue Umgebung erstellen
   azd env new my-environment
   ```

3. **Umgebung konfigurieren**
   ```bash
   # Erforderliche Variablen festlegen
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Bereitstellen**
   ```bash
   # Infrastruktur und Anwendung bereitstellen
   azd up
   ```

5. **Bereitstellung überprüfen**
   ```bash
   # Service-Endpunkte abrufen
   azd env get-values
   
   # Endpunkt testen (Beispiel)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Erwartete Erfolgshinweise:**
   - ✅ `azd up` wird ohne Fehler abgeschlossen
   - ✅ Service-Endpunkt liefert HTTP 200 zurück
   - ✅ Azure-Portal zeigt den Status "Running"
   - ✅ Application Insights empfängt Telemetrie

> **⚠️ Probleme?** Siehe [Häufige Probleme](../docs/chapter-07-troubleshooting/common-issues.md) für die Fehlerbehebung bei der Bereitstellung

### Beispiele anpassen

Jedes Beispiel enthält:
- **README.md** - Detaillierte Anleitungen zur Einrichtung und Anpassung
- **azure.yaml** - AZD-Konfiguration mit Kommentaren
- **infra/** - Bicep-Vorlagen mit Parametererklärungen
- **src/** - Beispielanwendungscode
- **scripts/** - Hilfsskripte für gängige Aufgaben

## 🎯 Lernziele

### Beispielkategorien

#### **Einfache Bereitstellungen**
- Einzelservice-Anwendungen
- Einfache Infrastrukturmuster
- Basis-Konfigurationsverwaltung
- Kostenoptimierte Entwicklungsumgebungen

#### **Fortgeschrittene Szenarien**
- Mehrservice-Architekturen
- Komplexe Netzwerk-Konfigurationen
- Datenbank-Integrationsmuster
- Sicherheits- und Compliance-Implementierungen

#### **Produktionsreife Muster**
- Hochverfügbarkeitskonfigurationen
- Überwachung und Beobachtbarkeit
- CI/CD-Integration
- Notfallwiederherstellungskonzepte

## 📖 Beispielbeschreibungen

### Einfache Web-App - Node.js Express
**Technologien**: Node.js, Express, MongoDB, Container Apps  
**Komplexität**: Anfänger  
**Konzepte**: Basisbereitstellung, REST-API, NoSQL-Datenbankintegration

### Statische Website - React SPA
**Technologien**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexität**: Anfänger  
**Konzepte**: Statisches Hosting, serverloses Backend, moderne Webentwicklung

### Container-App - Python Flask
**Technologien**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexität**: Anfänger  
**Konzepte**: Containerisierung, REST-API, Scale-to-Zero, Health-Probes, Monitoring  
**Ort**: [Lokales Beispiel](../../../examples/container-app/simple-flask-api)

### Container-App - Microservices-Architektur
**Technologien**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexität**: Fortgeschritten  
**Konzepte**: Mehrservice-Architektur, Dienstkommunikation, Message Queuing, Distributed Tracing  
**Ort**: [Lokales Beispiel](../../../examples/container-app/microservices)

### Datenbank-App - C# mit Azure SQL
**Technologien**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexität**: Mittelstufe  
**Konzepte**: Entity Framework, Datenbankverbindungen, Web-API-Entwicklung

### Serverlose Funktion - Python Azure Functions
**Technologien**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexität**: Mittelstufe  
**Konzepte**: Ereignisgesteuerte Architektur, serverloses Computing, Full-Stack-Entwicklung

### Microservices - Java Spring Boot
**Technologien**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexität**: Mittelstufe  
**Konzepte**: Microservices-Kommunikation, verteilte Systeme, Enterprise-Muster

### Microsoft Foundry Beispiele

#### Azure OpenAI Chat-App
**Technologien**: Azure OpenAI, Cognitive Search, App Service  
**Komplexität**: Mittelstufe  
**Konzepte**: RAG-Architektur, Vektor-Suche, LLM-Integration

#### KI-Dokumentenverarbeitung
**Technologien**: Azure AI Document Intelligence, Storage, Functions  
**Komplexität**: Mittelstufe  
**Konzepte**: Dokumentenanalyse, OCR, Datenauszug

#### Machine-Learning-Pipeline
**Technologien**: Azure ML, MLOps, Container Registry  
**Komplexität**: Fortgeschritten  
**Konzepte**: Modelltraining, Bereitstellungspipelines, Monitoring

## 🛠 Konfigurationsbeispiele

Das `configurations/` Verzeichnis enthält wiederverwendbare Komponenten:

### Umgebungskonfigurationen
- Einstellungen für die Entwicklungsumgebung
- Konfigurationen für die Staging-Umgebung
- Produktionsreife Konfigurationen
- Mehrregionen-Bereitstellungen

### Bicep-Module
- Wiederverwendbare Infrastrukturkomponenten
- Gängige Ressourcenmuster
- Sicherheitsgehärtete Vorlagen
- Kostenoptimierte Konfigurationen

### Hilfsskripte
- Automatisierung der Umgebungsbereitstellung
- Datenbank-Migrationsskripte
- Tools zur Validierung der Bereitstellung
- Kostenüberwachungs-Tools

## 🔧 Anpassungsanleitung

### Beispiele an Ihren Anwendungsfall anpassen

1. **Voraussetzungen prüfen**
   - Überprüfen Sie die Anforderungen der Azure-Dienste
   - Überprüfen Sie die Kontingente Ihres Abonnements
   - Verstehen Sie die Kostenfolgen

2. **Konfiguration ändern**
   - Aktualisieren Sie die Service-Definitionen in `azure.yaml`
   - Passen Sie die Bicep-Vorlagen an
   - Passen Sie Umgebungsvariablen an

3. **Gründlich testen**
   - Zuerst in der Entwicklungsumgebung bereitstellen
   - Funktionalität validieren
   - Skalierung und Leistung testen

4. **Sicherheitsüberprüfung**
   - Zugriffssteuerungen überprüfen
   - Geheimnisverwaltung implementieren
   - Überwachung und Benachrichtigungen aktivieren

## 📊 Vergleichsmatrix

| Beispiel | Dienste | Datenbank | Auth | Monitoring | Komplexität |
|---------|----------|----------|------|------------|------------|
| **Azure OpenAI Chat** (Lokal) | 2 | ❌ | Key Vault | Vollständig | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Basis | Vollständig | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Enterprise | Fortgeschritten | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basis | Basis | ⭐ |
| React SPA + Functions | 3 | ✅ | Basis | Vollständig | ⭐ |
| Python Flask Container | 2 | ❌ | Basis | Vollständig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Vollständig | Vollständig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Vollständig | Vollständig | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Vollständig | Vollständig | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Vollständig | Vollständig | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Basis | Vollständig | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Vollständig | Vollständig | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Enterprise** | **Fortgeschritten** | **⭐⭐⭐⭐** |

## 🎓 Lernpfad

### Empfohlene Reihenfolge

1. **Beginnen Sie mit einer einfachen Web-App**
   - Lernen Sie die grundlegenden AZD-Konzepte
   - Verstehen Sie den Bereitstellungs-Workflow
   - Üben Sie das Umgebungsmanagement

2. **Testen Sie die statische Website**
   - Untersuchen Sie verschiedene Hosting-Optionen
   - Lernen Sie CDN-Integration kennen
   - Verstehen Sie DNS-Konfiguration

3. **Wechseln Sie zur Container-App**
   - Lernen Sie die Grundlagen der Containerisierung
   - Verstehen Sie Skalierungskonzepte
   - Üben Sie mit Docker

4. **Datenbankintegration hinzufügen**
   - Lernen Sie die Bereitstellung von Datenbanken
   - Verstehen Sie Connection-Strings
   - Üben Sie Geheimnisverwaltung

5. **Serverless erkunden**
   - Verstehen Sie ereignisgesteuerte Architektur
   - Lernen Sie Trigger und Bindings kennen
   - Üben Sie mit APIs

6. **Microservices erstellen**
   - Lernen Sie Dienstkommunikation
   - Verstehen Sie verteilte Systeme
   - Üben Sie komplexe Bereitstellungen

## 🔍 Das richtige Beispiel finden

### Nach Technologiestack
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Containers**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Databases**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Lösung**
- **Multi-Agent Systems**: **Retail Multi-Agent Lösung**
- **OpenAI Integration**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Lösung
- **Enterprise Production**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Lösung**

### Nach Architekturmustern
- **Simple REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Statisch + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerisiert**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **KI-gestützt**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Lösung**
- **Multi-Agent-Architektur**: **Retail Multi-Agent Lösung**
- **Enterprise Multi-Service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Lösung**

### Nach Komplexitätsgrad
- **Anfänger**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mittelstufe**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Fortgeschritten**: ML Pipeline
- **Unternehmensproduktionsbereit**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Mehrdienst mit Message Queuing), **Retail Multi-Agent Lösung** (Vollständiges Multi-Agenten-System mit ARM-Template-Bereitstellung)

## 📚 Zusätzliche Ressourcen

### Dokumentationslinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-Beispiele
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App with C# and Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App with Python and MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-App mit Node.js und PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-Web-App mit C#-API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps-Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions mit Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste Vorgehensweisen
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Beispiele beitragen

Haben Sie ein nützliches Beispiel, das Sie teilen möchten? Wir freuen uns über Beiträge!

### Einreichungsrichtlinien
1. Befolgen Sie die festgelegte Verzeichnisstruktur
2. Fügen Sie eine umfassende README.md bei
3. Fügen Sie Kommentare zu den Konfigurationsdateien hinzu
4. Testen Sie gründlich, bevor Sie einreichen
5. Fügen Sie Kostenabschätzungen und Voraussetzungen hinzu

### Struktur der Beispielvorlage
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

**Profi-Tipp**: Beginnen Sie mit dem einfachsten Beispiel, das zu Ihrem Technologie-Stack passt, und steigern Sie dann nach und nach die Komplexität. Jedes Beispiel baut auf Konzepten der vorherigen auf!

## 🚀 Bereit loszulegen?

### Ihr Lernpfad

1. **Kompletter Anfänger?** → Beginnen Sie mit [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 Minuten)
2. **Haben Sie grundlegende AZD-Kenntnisse?** → Probieren Sie [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 Minuten)
3. **Bauen Sie KI-Anwendungen?** → Beginnen Sie mit [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 Minuten) oder erkunden Sie [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ Stunden)
4. **Benötigen Sie einen bestimmten Tech-Stack?** → Verwenden Sie den Abschnitt [Das richtige Beispiel finden](../../../examples) oben

### Nächste Schritte

- ✅ Überprüfen Sie die [Voraussetzungen](../../../examples) oben
- ✅ Wählen Sie ein Beispiel, das Ihrem Fähigkeitsniveau entspricht (siehe [Komplexitätslegende](../../../examples))
- ✅ Lesen Sie die README des Beispiels gründlich, bevor Sie es bereitstellen
- ✅ Legen Sie eine Erinnerung fest, nach dem Testen `azd down` auszuführen
- ✅ Teilen Sie Ihre Erfahrungen über GitHub Issues oder Discussions

### Brauchen Sie Hilfe?

- 📖 [FAQ](../resources/faq.md) - Häufige Fragen beantwortet
- 🐛 [Fehlerbehebungsanleitung](../docs/chapter-07-troubleshooting/common-issues.md) - Beheben Sie Bereitstellungsprobleme
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Stellen Sie Fragen an die Community
- 📚 [Study Guide](../resources/study-guide.md) - Vertiefen Sie Ihr Wissen

---

**Navigation**
- **📚 Kursstartseite**: [AZD For Beginners](../README.md)
- **📖 Lernmaterialien**: [Lernleitfaden](../resources/study-guide.md) | [Spickzettel](../resources/cheat-sheet.md) | [Glossar](../resources/glossary.md)
- **🔧 Ressourcen**: [FAQ](../resources/faq.md) | [Fehlerbehebung](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zuletzt aktualisiert: November 2025 | [Probleme melden](https://github.com/microsoft/AZD-for-beginners/issues) | [Beispiele beitragen](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Haftungsausschluss:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->