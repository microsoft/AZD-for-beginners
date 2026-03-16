# Beispiele - Praktische AZD-Vorlagen und Konfigurationen

**Lernen durch Beispiele - Nach Kapiteln organisiert**
- **📚 Kurs-Startseite**: [AZD für Einsteiger](../README.md)
- **📖 Kapitelzuordnung**: Beispiele nach Lernkomplexität organisiert
- **🚀 Lokales Beispiel**: [Retail Multi-Agent-Lösung](retail-scenario.md)
- **🤖 Externe KI-Beispiele**: Links zu Azure-Samples-Repositories

> **📍 WICHTIG: Lokale vs. Externe Beispiele**  
> Dieses Repository enthält **4 vollständige lokale Beispiele** mit vollständigen Implementierungen:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-Bereitstellung mit Chat-Oberfläche)  
> - **Container Apps** (Einfache Flask-API + Microservices)  
> - **Datenbank-App** (Web + SQL-Datenbank)  
> - **Retail Multi-Agent** (Enterprise-KI-Lösung)  
>  
> Zusätzliche Beispiele sind **externe Verweise** auf Azure-Samples-Repositories, die Sie klonen können.

## Einführung

Dieses Verzeichnis bietet praktische Beispiele und Verweise, um Ihnen das Erlernen der Azure Developer CLI durch praktische Übungen zu erleichtern. Das Retail Multi-Agent-Szenario ist eine vollständige, produktionsreife Implementierung, die in diesem Repository enthalten ist. Zusätzliche Beispiele verweisen auf offizielle Azure Samples, die verschiedene AZD-Muster demonstrieren.

### Legende der Komplexitätsbewertungen

- ⭐ **Anfänger** - Grundkonzepte, einzelner Dienst, 15–30 Minuten
- ⭐⭐ **Fortgeschritten** - Mehrere Dienste, Datenbankintegration, 30–60 Minuten
- ⭐⭐⭐ **Erweitert** - Komplexe Architektur, KI-Integration, 1–2 Stunden
- ⭐⭐⭐⭐ **Experte** - Produktionsreif, Unternehmensmuster, 2+ Stunden

## 🎯 Was sich tatsächlich in diesem Repository befindet

### ✅ Lokale Implementierung (Einsatzbereit)

#### [Microsoft Foundry Models Chat-Anwendung](azure-openai-chat/README.md) 🆕
**Vollständige gpt-4.1-Bereitstellung mit Chat-Oberfläche in diesem Repository enthalten**

- **Ort:** `examples/azure-openai-chat/`
- **Komplexität:** ⭐⭐ (Fortgeschritten)
- **Enthalten:**
  - Vollständige Microsoft Foundry Models-Bereitstellung (gpt-4.1)
  - Python-Kommandozeilen-Chat-Interface
  - Key Vault-Integration für sichere API-Schlüssel
  - Bicep-Infrastrukturvorlagen
  - Token-Nutzung und Kostenverfolgung
  - Ratenbegrenzung und Fehlerbehandlung

**Schnellstart:**
```bash
# Zum Beispiel navigieren
cd examples/azure-openai-chat

# Alles bereitstellen
azd up

# Abhängigkeiten installieren und mit dem Chatten beginnen
pip install -r src/requirements.txt
python src/chat.py
```

**Technologien:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container-App-Beispiele](container-app/README.md) 🆕
**Umfassende Beispiele für Container-Bereitstellungen in diesem Repository enthalten**

- **Ort:** `examples/container-app/`
- **Komplexität:** ⭐-⭐⭐⭐⭐ (Anfänger bis Experte)
- **Enthalten:**
  - [Hauptleitfaden](container-app/README.md) - Vollständige Übersicht über Container-Bereitstellungen
  - [Einfache Flask-API](../../../examples/container-app/simple-flask-api) - Einfaches REST-API-Beispiel
  - [Microservices-Architektur](../../../examples/container-app/microservices) - Produktionsbereite Multi-Service-Bereitstellung
  - Schnellstart-, Produktions- und erweiterte Muster
  - Überwachung, Sicherheit und Kostenoptimierung

**Schnellstart:**
```bash
# Master-Anleitung anzeigen
cd examples/container-app

# Einfache Flask-API bereitstellen
cd simple-flask-api
azd up

# Microservices-Beispiel bereitstellen
cd ../microservices
azd up
```

**Technologien:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent-Lösung](retail-scenario.md) 🆕
**Vollständige produktionsreife Implementierung in diesem Repository enthalten**

- **Ort:** `examples/retail-multiagent-arm-template/`
- **Komplexität:** ⭐⭐⭐⭐ (Erweitert)
- **Enthalten:**
  - Vollständige ARM-Bereitstellungsvorlage
  - Multi-Agent-Architektur (Kunde + Inventar)
  - Integration von Microsoft Foundry Models
  - KI-Suche mit RAG
  - Umfassende Überwachung
  - Ein-Klick-Bereitstellungsskript

**Schnellstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologien:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure Samples (zum Klonen)

Die folgenden Beispiele werden in offiziellen Azure-Samples-Repositories gepflegt. Klonen Sie sie, um verschiedene AZD-Muster zu erkunden:

### Einfache Anwendungen (Kapitel 1-2)

| Vorlage | Repository | Komplexität | Dienste |
|:---------|:-----------|:-----------|:---------|
| **Python Flask-API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Mehrere Dienste, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**So verwenden Sie es:**
```bash
# Beliebiges Beispiel klonen
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Bereitstellen
azd up
```

### KI-Anwendungsbeispiele (Kapitel 2, 5, 8)

| Vorlage | Repository | Komplexität | Fokus |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-Bereitstellung |
| **KI-Chat Schnellstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlegender KI-Chat |
| **KI-Agenten** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenten-Framework |
| **Suche + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-Muster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise-KI |

### Datenbank- & erweiterte Muster (Kapitel 3-8)

| Vorlage | Repository | Komplexität | Fokus |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Datenbankintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | Serverless NoSQL |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Mehrere Dienste |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Lernziele

Wenn Sie diese Beispiele durcharbeiten, werden Sie:
- Azure Developer CLI-Workflows mit realistischen Anwendungsszenarien üben
- Verschiedene Anwendungsarchitekturen und ihre azd-Implementierungen verstehen
- Infrastructure-as-Code-Muster für verschiedene Azure-Dienste beherrschen
- Konfigurationsmanagement und umgebungsspezifische Bereitstellungsstrategien anwenden
- Überwachungs-, Sicherheits- und Skalierungsmuster in praktischen Kontexten implementieren
- Erfahrung im Troubleshooting und Debuggen realer Bereitstellungsszenarien sammeln

## Lernergebnisse

Nach Abschluss dieser Beispiele werden Sie in der Lage sein:
- Verschiedene Anwendungstypen mit der Azure Developer CLI sicher bereitstellen
- Bereitgestellte Vorlagen an Ihre eigenen Anwendungsanforderungen anpassen
- Eigene Infrastrukturmuster mit Bicep entwerfen und implementieren
- Komplexe Multi-Service-Anwendungen mit korrekten Abhängigkeiten konfigurieren
- Sicherheits-, Überwachungs- und Performance-Best-Practices in realen Szenarien anwenden
- Probleme bei Bereitstellungen beheben und Optimierungen basierend auf praktischer Erfahrung durchführen

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

> **💡 Neu bei AZD?** Beginnen Sie mit Beispiel Nr. 1 (Flask-API) - es dauert ca. 20 Minuten und vermittelt die Kernkonzepte.

### Für Anfänger
1. **[Container-App - Python Flask-API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Einfaches REST-API mit Scale-to-Zero bereitstellen  
   **Zeit:** 20–25 Minuten | **Kosten:** $0-5/Monat  
   **Sie lernen:** Grundlegender azd-Workflow, Containerisierung, Health Probes  
   **Erwartetes Ergebnis:** Funktionierender API-Endpunkt, der "Hello, World!" zurückgibt, mit Überwachung

2. **[Einfache Web-App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Node.js Express-Webanwendung mit MongoDB bereitstellen  
   **Zeit:** 25–35 Minuten | **Kosten:** $10-30/Monat  
   **Sie lernen:** Datenbankintegration, Umgebungsvariablen, Verbindungszeichenfolgen  
   **Erwartetes Ergebnis:** Todo-Liste mit Erstellen/Lesen/Aktualisieren/Löschen-Funktionalität

3. **[Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   React-Statikwebsite mit Azure Static Web Apps hosten  
   **Zeit:** 20–30 Minuten | **Kosten:** $0-10/Monat  
   **Sie lernen:** Statisches Hosting, serverlose Funktionen, CDN-Bereitstellung  
   **Erwartetes Ergebnis:** React-UI mit API-Backend, automatische SSL, globales CDN

### Für Fortgeschrittene
4. **[Microsoft Foundry Models Chat-Anwendung](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   gpt-4.1 mit Chat-Oberfläche und sicherer API-Schlüsselverwaltung bereitstellen  
   **Zeit:** 35–45 Minuten | **Kosten:** $50-200/Monat  
   **Sie lernen:** Microsoft Foundry Models-Bereitstellung, Key Vault-Integration, Token-Tracking  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit gpt-4.1 und Kostenüberwachung

5. **[Container-App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsbereite Multi-Service-Architektur  
   **Zeit:** 45–60 Minuten | **Kosten:** $50-150/Monat  
   **Sie lernen:** Service-Kommunikation, Nachrichtenqueuing, verteiltes Tracing  
   **Erwartetes Ergebnis:** 2-Service-System (API-Gateway + Produkt-Service) mit Überwachung

6. **[Datenbank-App - C# mit Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webanwendung mit C#-API und Azure SQL-Datenbank  
   **Zeit:** 30–45 Minuten | **Kosten:** $20-80/Monat  
   **Sie lernen:** Entity Framework, Datenbankmigrationen, Verbindungs­sicherheit  
   **Erwartetes Ergebnis:** C#-API mit Azure SQL-Backend, automatische Schema-Bereitstellung

7. **[Serverless Function - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions mit HTTP-Triggern und Cosmos DB  
   **Zeit:** 30–40 Minuten | **Kosten:** $10-40/Monat  
   **Sie lernen:** Ereignisgesteuerte Architektur, serverloses Scaling, NoSQL-Integration  
   **Erwartetes Ergebnis:** Function App, die auf HTTP-Anfragen reagiert und Daten in Cosmos DB speichert

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-Service-Java-Anwendung mit Container Apps und API-Gateway  
   **Zeit:** 60–90 Minuten | **Kosten:** $80-200/Monat  
   **Sie lernen:** Spring Boot-Bereitstellung, Service Mesh, Load Balancing  
   **Erwartetes Ergebnis:** Multi-Service-Java-System mit Service-Discovery und Routing

### Microsoft Foundry-Vorlagen

1. **[Microsoft Foundry Models Chat App - Lokales Beispiel](../../../examples/azure-openai-chat)** ⭐⭐  
   Vollständige gpt-4.1-Bereitstellung mit Chat-Oberfläche  
   **Zeit:** 35–45 Minuten | **Kosten:** $50-200/Monat  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit Token-Tracking und Kostenüberwachung

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente Chat-Anwendung mit RAG-Architektur  
   **Zeit:** 60–90 Minuten | **Kosten:** $100-300/Monat  
   **Erwartetes Ergebnis:** RAG-gestützte Chat-Oberfläche mit Dokumentensuche und Zitaten

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentenanalyse mit Azure AI-Diensten  
   **Zeit:** 40–60 Minuten | **Kosten:** $20-80/Monat  
   **Erwartetes Ergebnis:** API zur Extraktion von Text, Tabellen und Entitäten aus hochgeladenen Dokumenten

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-Workflow mit Azure Machine Learning  
   **Zeit:** 2-3 Stunden | **Kosten:** $150-500/Monat  
   **Erwartetes Ergebnis:** Automatisierte ML-Pipeline mit Training, Bereitstellung und Überwachung

### Anwendungsbeispiele aus der Praxis

#### **Retail Multi-Agent-Lösung** 🆕  
**[Vollständige Implementierungsanleitung](./retail-scenario.md)**

Eine umfassende, produktionsreife Multi-Agent-Kundenservice-Lösung, die die Bereitstellung von Unternehmens-KI-Anwendungen mit AZD demonstriert. Dieses Szenario bietet:
- **Komplette Architektur**: Multi-Agenten-System mit spezialisierten Kundenservice- und Bestandsverwaltungsagenten
- **Produktionsinfrastruktur**: Multi-Region Microsoft Foundry Models Bereitstellungen, AI Search, Container Apps und umfassendes Monitoring
- **Bereitstellungsbereites ARM-Template**: Ein-Klick-Bereitstellung mit mehreren Konfigurationsmodi (Minimal/Standard/Premium)
- **Erweiterte Funktionen**: Red-Teaming-Sicherheitsvalidierung, Agentenbewertungsframework, Kostenoptimierung und Troubleshooting-Anleitungen
- **Realer Geschäftskontext**: Einzelhändler-Kundensupport-Anwendungsfall mit Dateiuploads, Suchintegration und dynamischer Skalierung

**Technologien**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexität**: ⭐⭐⭐⭐ (Fortgeschritten - Produktionsbereit für Unternehmen)

**Perfekt für**: KI-Entwickler, Lösungsarchitekten und Teams, die produktionsreife Multi-Agenten-Systeme bauen

**Schnellstart**: Stellen Sie die komplette Lösung in unter 30 Minuten mit dem enthaltenen ARM-Template bereit mit `./deploy.sh -g myResourceGroup`

## 📋 Nutzungshinweise

### Voraussetzungen

Bevor Sie ein Beispiel ausführen:
- ✅ Azure-Abonnement mit Owner- oder Contributor-Zugriff
- ✅ Azure Developer CLI installiert ([Installationsanleitung](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop läuft (für Container-Beispiele)
- ✅ Angemessene Azure-Quoten (prüfen Sie die beispielspezifischen Anforderungen)

> **💰 Kostenwarnung:** Alle Beispiele erstellen echte Azure-Ressourcen, die Kosten verursachen. Siehe die jeweiligen README-Dateien für Kostenschätzungen. Denken Sie daran, `azd down` auszuführen, wenn Sie fertig sind, um fortlaufende Kosten zu vermeiden.

### Beispiele lokal ausführen

1. **Klonen oder Kopieren des Beispiels**
   ```bash
   # Navigiere zum gewünschten Beispiel
   cd examples/simple-web-app
   ```

2. **AZD-Umgebung initialisieren**
   ```bash
   # Mit vorhandener Vorlage initialisieren
   azd init
   
   # Oder neue Umgebung erstellen
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
   
   # Den Endpunkt testen (Beispiel)
   curl https://your-app-url.azurecontainer.io/health
   ```
   
   **Erwartete Erfolgsindikatoren:**
   - ✅ `azd up` wird ohne Fehler abgeschlossen
   - ✅ Service-Endpunkt gibt HTTP 200 zurück
   - ✅ Azure-Portal zeigt den Status „Running“ an
   - ✅ Application Insights empfängt Telemetriedaten

> **⚠️ Probleme?** Siehe [Häufige Probleme](../docs/chapter-07-troubleshooting/common-issues.md) für Bereitstellungs-Troubleshooting

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
- Einfache Infrastruktur-Patterns
- Basis-Konfigurationsmanagement
- Kostenoptimierte Entwicklungsumgebungen

#### **Erweiterte Szenarien**
- Multi-Service-Architekturen
- Komplexe Netzwerk-Konfigurationen
- Datenbank-Integrationsmuster
- Sicherheits- und Compliance-Implementierungen

#### **Produktionsbereite Muster**
- Hochverfügbarkeitskonfigurationen
- Monitoring und Observability
- CI/CD-Integration
- Disaster-Recovery-Setups

## 📖 Beispielbeschreibungen

### Simple Web App - Node.js Express
**Technologien**: Node.js, Express, MongoDB, Container Apps  
**Komplexität**: Einsteiger  
**Konzepte**: Grundlegende Bereitstellung, REST-API, NoSQL-Datenbankintegration

### Static Website - React SPA
**Technologien**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexität**: Einsteiger  
**Konzepte**: Statisches Hosting, serverloses Backend, moderne Webentwicklung

### Container App - Python Flask
**Technologien**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexität**: Einsteiger  
**Konzepte**: Containerisierung, REST-API, Skalierung auf null, Health-Probes, Monitoring  
**Ort**: [Lokales Beispiel](../../../examples/container-app/simple-flask-api)

### Container App - Microservices Architecture
**Technologien**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexität**: Fortgeschritten  
**Konzepte**: Multi-Service-Architektur, Service-Kommunikation, Message-Queuing, verteiltes Tracing  
**Ort**: [Lokal](../../../examples/container-app/microservices)

### Database App - C# with Azure SQL
**Technologien**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexität**: Mittelstufe  
**Konzepte**: Entity Framework, Datenbankverbindungen, Web-API-Entwicklung

### Serverless Function - Python Azure Functions
**Technologien**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexität**: Mittelstufe  
**Konzepte**: Event-getriebene Architektur, serverloses Computing, Full-Stack-Entwicklung

### Microservices - Java Spring Boot
**Technologien**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexität**: Mittelstufe  
**Konzepte**: Microservices-Kommunikation, verteilte Systeme, Unternehmensmuster

### Microsoft Foundry Beispiele

#### Microsoft Foundry Models Chat App
**Technologien**: Microsoft Foundry Models, Cognitive Search, App Service  
**Komplexität**: Mittelstufe  
**Konzepte**: RAG-Architektur, Vektor-Suche, LLM-Integration

#### KI-Dokumentverarbeitung
**Technologien**: Azure AI Document Intelligence, Storage, Functions  
**Komplexität**: Mittelstufe  
**Konzepte**: Dokumentenanalyse, OCR, Datenauszug

#### Machine Learning Pipeline
**Technologien**: Azure ML, MLOps, Container Registry  
**Komplexität**: Fortgeschritten  
**Konzepte**: Modelltraining, Bereitstellungspipelines, Monitoring

## 🛠 Konfigurationsbeispiele

Das Verzeichnis `configurations/` enthält wiederverwendbare Komponenten:

### Umgebungskonfigurationen
- Einstellungen für Entwicklungsumgebungen
- Staging-Umgebungskonfigurationen
- Produktionsbereite Konfigurationen
- Multi-Region Bereitstellungs-Setups

### Bicep-Module
- Wiederverwendbare Infrastrukturkomponenten
- Gängige Ressourcen-Patterns
- Sicherheitsgehärtete Templates
- Kostenoptimierte Konfigurationen

### Hilfsskripte
- Automatisierung der Umgebungseinrichtung
- Datenbank-Migrationsskripte
- Validierungstools für Bereitstellungen
- Kostenüberwachungs-Utilities

## 🔧 Anpassungsanleitung

### Beispiele an Ihren Anwendungsfall anpassen

1. **Voraussetzungen prüfen**
   - Prüfen Sie Azure-Service-Anforderungen
   - Überprüfen Sie Abonnementlimits
   - Verstehen Sie Kostenauswirkungen

2. **Konfiguration anpassen**
   - Aktualisieren Sie `azure.yaml` Service-Definitionen
   - Passen Sie Bicep-Vorlagen an
   - Ändern Sie Umgebungsvariablen

3. **Gründlich testen**
   - Zuerst in der Entwicklungsumgebung bereitstellen
   - Funktionalität validieren
   - Skalierung und Performance testen

4. **Sicherheitsüberprüfung**
   - Zugriffskontrollen überprüfen
   - Secrets-Management implementieren
   - Monitoring und Alerting aktivieren

## 📊 Vergleichsmatrix

| Beispiel | Dienste | Datenbank | Auth | Monitoring | Komplexität |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokal) | 2 | ❌ | Key Vault | Voll | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Basis | Voll | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Enterprise | Erweitert | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Basis | Basis | ⭐ |
| React SPA + Functions | 3 | ✅ | Basis | Voll | ⭐ |
| Python Flask Container | 2 | ❌ | Basis | Voll | ⭐ |
| C# Web API + SQL | 2 | ✅ | Voll | Voll | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Voll | Voll | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Voll | Voll | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Voll | Voll | ⭐⭐⭐ |
| KI-Dokumentverarbeitung | 2 | ❌ | Basis | Voll | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Voll | Voll | ⭐⭐⭐⭐ |
| **Einzelhandels-Multi-Agent** (Lokal) | **8+** | **✅** | **Enterprise** | **Erweitert** | **⭐⭐⭐⭐** |

## 🎓 Lernpfad

### Empfohlene Reihenfolge

1. **Mit der Simple Web App beginnen**
   - Lernen Sie grundlegende AZD-Konzepte
   - Verstehen Sie den Bereitstellungs-Workflow
   - Üben Sie Umgebungsverwaltung

2. **Statische Website ausprobieren**
   - Verschiedene Hosting-Optionen erkunden
   - Lernen Sie CDN-Integration kennen
   - Verstehen Sie DNS-Konfiguration

3. **Zu Container App wechseln**
   - Grundlagen der Containerisierung lernen
   - Skalierungskonzepte verstehen
   - Mit Docker üben

4. **Datenbankintegration hinzufügen**
   - Bereitstellung von Datenbanken lernen
   - Verstehen von Connection Strings
   - Secrets-Management üben

5. **Serverless erkunden**
   - Event-getriebene Architektur verstehen
   - Triggers und Bindings kennenlernen
   - Mit APIs üben

6. **Microservices bauen**
   - Service-Kommunikation lernen
   - Verteilte Systeme verstehen
   - Komplexe Bereitstellungen üben

## 🔍 Das richtige Beispiel finden

### Nach Technologie-Stack
- **Container Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Microsoft Foundry Models Chat App, ML Pipeline
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Container**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices
- **Datenbanken**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, KI-Dokumentverarbeitung, ML Pipeline, **Einzelhandels-Multi-Agenten-Lösung**
- **Multi-Agenten-Systeme**: **Einzelhandels-Multi-Agenten-Lösung**
- **OpenAI-Integration**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Einzelhandels-Multi-Agenten-Lösung
- **Enterprise-Produktion**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Einzelhandels-Multi-Agenten-Lösung**

### Nach Architektur-Muster
- **Einfache REST-API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Static + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerisiert**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **KI-gestützt**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, KI-Dokumentverarbeitung, ML Pipeline, **Einzelhandels-Multi-Agenten-Lösung**
- **Multi-Agenten-Architektur**: **Einzelhandels-Multi-Agenten-Lösung**
- **Enterprise Multi-Service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Einzelhandels-Multi-Agenten-Lösung**

### Nach Komplexitätsstufe
- **Einsteiger**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mittelstufe**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, KI-Dokumentverarbeitung
- **Fortgeschritten**: ML Pipeline
- **Produktionsbereit für Unternehmen**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-Service mit Message-Queuing), **Einzelhandels-Multi-Agenten-Lösung** (Komplettes Multi-Agenten-System mit ARM-Template-Bereitstellung)

## 📚 Zusätzliche Ressourcen

### Dokumentationslinks
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Microsoft Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-Beispiele
- [Azure Samples AZD Vorlagen](https://github.com/Azure-Samples/azd-templates)
- [Microsoft Foundry Vorlagen](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galerie](https://azure.github.io/awesome-azd/)
- [Todo-App mit C# und Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo-App mit Python und MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo-App mit Node.js und PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-Webanwendung mit C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions mit Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Beste Vorgehensweisen
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Beispiele beitragen

Haben Sie ein nützliches Beispiel, das Sie teilen möchten? Wir freuen uns über Beiträge!

### Einreichungsrichtlinien
1. Folgen Sie der festgelegten Verzeichnisstruktur
2. Enthalten Sie ein umfassendes README.md
3. Fügen Sie Kommentare zu Konfigurationsdateien hinzu
4. Testen Sie gründlich, bevor Sie einreichen
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

**Profi-Tipp**: Beginnen Sie mit dem einfachsten Beispiel, das zu Ihrem Technologie-Stack passt, und arbeiten Sie sich dann schrittweise zu komplexeren Szenarien vor. Jedes Beispiel baut auf den Konzepten der vorherigen auf!

## 🚀 Bereit loszulegen?

### Ihr Lernpfad

1. **Kompletter Anfänger?** → Starten Sie mit [Flask-API](../../../examples/container-app/simple-flask-api) (⭐, 20 mins)
2. **Haben Sie grundlegende AZD-Kenntnisse?** → Probieren Sie [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 mins)
3. **Bauen Sie KI-Anwendungen?** → Beginnen Sie mit [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 mins) oder erkunden Sie [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ hours)
4. **Benötigen Sie einen bestimmten Technologie-Stack?** → Verwenden Sie den Abschnitt [Das passende Beispiel finden](../../../examples) oben

### Nächste Schritte

- ✅ Überprüfen Sie die [Voraussetzungen](../../../examples) oben
- ✅ Wählen Sie ein Beispiel aus, das Ihrem Fähigkeitsniveau entspricht (siehe [Legende zur Komplexität](../../../examples))
- ✅ Lesen Sie das README des Beispiels gründlich, bevor Sie es bereitstellen
- ✅ Stellen Sie eine Erinnerung ein, `azd down` nach dem Testen auszuführen
- ✅ Teilen Sie Ihre Erfahrungen über GitHub Issues oder Discussions

### Brauchen Sie Hilfe?

- 📖 [FAQ](../resources/faq.md) - Häufig gestellte Fragen
- 🐛 [Fehlerbehebungsleitfaden](../docs/chapter-07-troubleshooting/common-issues.md) - Beheben Sie Bereitstellungsprobleme
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Fragen Sie die Community
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
Dieses Dokument wurde mit dem KI-Übersetzungsdienst Co-op Translator (https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache ist als maßgebliche Quelle zu betrachten. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die durch die Nutzung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->