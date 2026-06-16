# Beispiele - Praktische AZD-Vorlagen und Konfigurationen

**Lernen durch Beispiele - Nach Kapiteln organisiert**
- **📚 Kursübersicht**: [AZD für Einsteiger](../README.md)
- **📖 Kapitelzuordnung**: Beispiele nach Lernkomplexität organisiert
- **🚀 Lokales Beispiel**: [Retail-Multi-Agent-Lösung](retail-scenario.md)
- **🤖 Externe KI-Beispiele**: Links zu Azure-Samples-Repositories

> **📍 WICHTIG: Lokale vs. externe Beispiele**  
> Dieses Repository enthält **4 vollständige lokale Beispiele** mit vollständigen Implementierungen:  
> - **Microsoft Foundry Models Chat** (gpt-4.1-Bereitstellung mit Chat-Oberfläche)  
> - **Container Apps** (Einfache Flask-API + Microservices)  
> - **Datenbank-App** (Web + SQL-Datenbank)  
> - **Retail Multi-Agent** (Enterprise-KI-Lösung)  
>  
> Zusätzliche Beispiele sind **externe Verweise** auf Azure-Samples-Repositories, die Sie klonen können.

## Einführung

Dieses Verzeichnis bietet praktische Beispiele und Verweise, um Azure Developer CLI durch praktische Übungen zu erlernen. Das Retail Multi-Agent-Szenario ist eine vollständige, produktionsreife Implementierung, die in diesem Repository enthalten ist. Weitere Beispiele verweisen auf offizielle Azure Samples, die verschiedene AZD-Muster demonstrieren.

### Legende zur Komplexitätsbewertung

- ⭐ **Anfänger** - Grundlegende Konzepte, einzelner Dienst, 15–30 Minuten
- ⭐⭐ **Fortgeschrittene** - Mehrere Dienste, Datenbankintegration, 30–60 Minuten
- ⭐⭐⭐ **Fortgeschritten** - Komplexe Architektur, KI-Integration, 1–2 Stunden
- ⭐⭐⭐⭐ **Experte** - Produktionsreif, Enterprise-Muster, 2+ Stunden

## 🎯 Was sich tatsächlich in diesem Repository befindet

### ✅ Lokale Implementierung (Einsatzbereit)

#### [Microsoft Foundry Models Chat-Anwendung](azure-openai-chat/README.md) 🆕
**Komplette gpt-4.1-Bereitstellung mit Chat-Oberfläche in diesem Repo enthalten**

- **Ort:** `examples/azure-openai-chat/`
- **Komplexität:** ⭐⭐ (Fortgeschrittene)
- **Enthalten:**
  - Komplette Microsoft Foundry Models Bereitstellung (gpt-4.1)
  - Python-Kommandozeilen-Chat-Oberfläche
  - Key Vault-Integration für sichere API-Schlüssel
  - Bicep-Infrastrukturvorlagen
  - Token-Nutzung und Kostenverfolgung
  - Ratenbegrenzung und Fehlerbehandlung

**Schnellstart:**
```bash
# Navigiere zum Beispiel
cd examples/azure-openai-chat

# Alles bereitstellen
azd up

# Abhängigkeiten installieren und mit dem Chat beginnen
pip install -r src/requirements.txt
python src/chat.py
```

**Technologien:** Microsoft Foundry Models, gpt-4.1, Key Vault, Python, Bicep

#### [Container-App-Beispiele](container-app/README.md) 🆕
**Umfassende Container-Bereitstellungsbeispiele in diesem Repo enthalten**

- **Ort:** `examples/container-app/`
- **Komplexität:** ⭐-⭐⭐⭐⭐ (Anfänger bis Experte)
- **Enthalten:**
  - [Master Guide](container-app/README.md) - Vollständige Übersicht zu Container-Bereitstellungen
  - [Einfache Flask-API](../../../examples/container-app/simple-flask-api) - Einfaches REST-API-Beispiel
  - [Microservices-Architektur](../../../examples/container-app/microservices) - Produktionsreife Multi-Service-Bereitstellung
  - Schnellstart-, Produktions- und erweiterte Muster
  - Überwachung, Sicherheit und Kostenoptimierung

**Schnellstart:**
```bash
# Master-Leitfaden anzeigen
cd examples/container-app

# Einfache Flask-API bereitstellen
cd simple-flask-api
azd up

# Microservices-Beispiel bereitstellen
cd ../microservices
azd up
```

**Technologien:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail-Multi-Agent-Lösung](retail-scenario.md) 🆕
**Vollständige produktionsreife Implementierung in diesem Repo enthalten**

- **Ort:** `examples/retail-multiagent-arm-template/`
- **Komplexität:** ⭐⭐⭐⭐ (Fortgeschritten)
- **Enthalten:**
  - Vollständige ARM-Bereitstellungsvorlage
  - Multi-Agent-Architektur (Kunde + Inventar)
  - Integration von Microsoft Foundry Models
  - AI Search mit RAG
  - Umfassende Überwachung
  - Ein-Klick-Bereitstellungsskript

**Schnellstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologien:** Microsoft Foundry Models, AI Search, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure-Beispiele (Zum Klonen)

Die folgenden Beispiele werden in offiziellen Azure-Samples-Repositories gepflegt. Klonen Sie sie, um verschiedene AZD-Muster zu erkunden:

### Einfache Anwendungen (Kapiteln 1–2)

| Vorlage | Repository | Komplexität | Dienste |
|:---------|:-----------|:-----------|:---------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**So verwenden Sie sie:**
```bash
# Beliebiges Beispiel klonen
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Bereitstellen
azd up
```

### KI-Anwendungsbeispiele (Kapiteln 2, 5, 8)

| Vorlage | Repository | Komplexität | Schwerpunkt |
|:---------|:-----------|:-----------|:------|
| **Microsoft Foundry Models Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | gpt-4.1-Bereitstellung |
| **AI Chat Quickstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlegender KI-Chat |
| **AI Agents** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenten-Framework |
| **Search + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-Muster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise-KI |

### Datenbank- & Erweiterte Muster (Kapitel 3–8)

| Vorlage | Repository | Komplexität | Schwerpunkt |
|:---------|:-----------|:-----------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Datenbankintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverlos |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Mehrere Dienste |
| **ML Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Lernziele

Durch die Bearbeitung dieser Beispiele werden Sie:
- Azure Developer CLI-Workflows mit realistischen Anwendungsszenarien üben
- Verschiedene Anwendungsarchitekturen und deren azd-Implementierungen verstehen
- Infrastructure-as-Code-Muster für verschiedene Azure-Dienste beherrschen
- Konfigurationsmanagement und umgebungsspezifische Bereitstellungsstrategien anwenden
- Überwachungs-, Sicherheits- und Skalierungsmuster in praktischen Kontexten implementieren
- Erfahrung im Troubleshooting und Debugging realer Bereitstellungsszenarien sammeln

## Lernergebnisse

Nach Abschluss dieser Beispiele werden Sie in der Lage sein:
- Verschiedene Anwendungsarten mit der Azure Developer CLI selbstbewusst bereitstellen
- Bereitgestellte Vorlagen an Ihre eigenen Anforderungsprofile anpassen
- Eigene Infrastrukturmuster mit Bicep entwerfen und implementieren
- Komplexe Multi-Service-Anwendungen mit korrekten Abhängigkeiten konfigurieren
- Sicherheits-, Überwachungs- und Performance-Best-Practices in realen Szenarien anwenden
- Bereitstellungen auf Basis praktischer Erfahrungen troubleshooten und optimieren

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

> **💡 Neu bei AZD?** Beginnen Sie mit Beispiel Nr. 1 (Flask-API) – es dauert ~20 Minuten und vermittelt Kernkonzepte.

### Für Anfänger
1. **[Container-App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Stellen Sie eine einfache REST-API mit Scale-to-Zero bereit  
   **Zeit:** 20–25 Minuten | **Kosten:** $0-5/Monat  
   **Sie lernen:** Grundlegender azd-Workflow, Containerisierung, Health-Probes  
   **Erwartetes Ergebnis:** Funktionierender API-Endpunkt, der "Hello, World!" zurückgibt, mit Überwachung

2. **[Einfache Webanwendung - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Stellen Sie eine Node.js Express-Webanwendung mit MongoDB bereit  
   **Zeit:** 25–35 Minuten | **Kosten:** $10-30/Monat  
   **Sie lernen:** Datenbankintegration, Umgebungsvariablen, Verbindungszeichenfolgen  
   **Erwartetes Ergebnis:** Todo-Listen-App mit Erstellen/Lesen/Aktualisieren/Löschen-Funktionalität

3. **[Statische Webseite - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosten Sie eine React-Statische Website mit Azure Static Web Apps  
   **Zeit:** 20–30 Minuten | **Kosten:** $0-10/Monat  
   **Sie lernen:** Statisches Hosting, serverlose Funktionen, CDN-Bereitstellung  
   **Erwartetes Ergebnis:** React-UI mit API-Backend, automatische SSL, globales CDN

### Für Fortgeschrittene
4. **[Microsoft Foundry Models Chat-Anwendung](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Stellen Sie gpt-4.1 mit Chat-Oberfläche und sicherer API-Schlüsselverwaltung bereit  
   **Zeit:** 35–45 Minuten | **Kosten:** $50-200/Monat  
   **Sie lernen:** Bereitstellung von Microsoft Foundry Models, Key Vault-Integration, Token-Tracking  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit gpt-4.1 und Kostenüberwachung

5. **[Container-App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsreife Multi-Service-Architektur  
   **Zeit:** 45–60 Minuten | **Kosten:** $50-150/Monat  
   **Sie lernen:** Dienstkommunikation, Nachrichtenwarteschlangen, verteiltes Tracing  
   **Erwartetes Ergebnis:** 2-Dienst-System (API-Gateway + Produktdienst) mit Überwachung

6. **[Datenbank-App - C# mit Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webanwendung mit C#-API und Azure SQL-Datenbank  
   **Zeit:** 30–45 Minuten | **Kosten:** $20-80/Monat  
   **Sie lernen:** Entity Framework, Datenbankmigrationen, Verbindungssicherheit  
   **Erwartetes Ergebnis:** C#-API mit Azure SQL-Backend, automatische Schema-Bereitstellung

7. **[Serverless-Funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions mit HTTP-Triggern und Cosmos DB  
   **Zeit:** 30–40 Minuten | **Kosten:** $10-40/Monat  
   **Sie lernen:** Ereignisgesteuerte Architektur, serverlose Skalierung, NoSQL-Integration  
   **Erwartetes Ergebnis:** Function-App, die auf HTTP-Anfragen reagiert und Cosmos DB als Speicher verwendet

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Mehrdienstige Java-Anwendung mit Container Apps und API-Gateway  
   **Zeit:** 60–90 Minuten | **Kosten:** $80-200/Monat  
   **Sie lernen:** Spring Boot-Bereitstellung, Service-Mesh, Lastverteilung  
   **Erwartetes Ergebnis:** Multi-Service-Java-System mit Service-Discovery und Routing

### Microsoft Foundry-Vorlagen

1. **[Microsoft Foundry Models Chat-App - Lokales Beispiel](../../../examples/azure-openai-chat)** ⭐⭐  
   Komplette gpt-4.1-Bereitstellung mit Chat-Oberfläche  
   **Zeit:** 35–45 Minuten | **Kosten:** $50-200/Monat  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit Token-Tracking und Kostenüberwachung

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente Chat-Anwendung mit RAG-Architektur  
   **Zeit:** 60–90 Minuten | **Kosten:** $100-300/Monat  
   **Erwartetes Ergebnis:** RAG-gestützte Chat-Oberfläche mit Dokumentensuche und Zitaten

3. **[AI Document Processing](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentenanalyse mit Azure AI-Diensten  
   **Zeit:** 40–60 Minuten | **Kosten:** $20-80/Monat  
   **Erwartetes Ergebnis:** API, die Text, Tabellen und Entitäten aus hochgeladenen Dokumenten extrahiert

4. **[Machine Learning Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-Workflow mit Azure Machine Learning  
   **Zeit:** 2–3 Stunden | **Kosten:** $150-500/Monat  
   **Erwartetes Ergebnis:** Automatisierte ML-Pipeline mit Training, Bereitstellung und Überwachung

### Szenarien aus der Praxis

#### **Retail Multi-Agent-Lösung** 🆕
**[Vollständige Implementierungsanleitung](./retail-scenario.md)**

Eine umfassende, produktionsreife Multi-Agent-Kundensupport-Lösung, die die Bereitstellung von KI-Anwendungen in Unternehmensqualität mit AZD demonstriert. Dieses Szenario bietet:

- **Vollständige Architektur**: Multi-Agent-System mit spezialisierten Kundenservice- und Bestandsverwaltungsagenten
- **Produktionsinfrastruktur**: Multi-Region-Bereitstellungen von Microsoft Foundry Models, AI Search, Container Apps und umfassendes Monitoring
- **Bereitstellungsbereites ARM-Template**: One-Click-Bereitstellung mit mehreren Konfigurationsmodi (Minimal/Standard/Premium)
- **Erweiterte Funktionen**: Red-Teaming-Sicherheitsvalidierung, Agenten-Evaluierungsframework, Kostenoptimierung und Troubleshooting-Anleitungen
- **Echter Geschäftskontext**: Kundensupport-Anwendungsfall für Einzelhändler mit Datei-Uploads, Suchintegration und dynamischer Skalierung

**Technologien**: Microsoft Foundry Models (gpt-4.1, gpt-4.1-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Komplexität**: ⭐⭐⭐⭐ (Fortgeschritten - Enterprise Produktionsbereit)

**Perfekt für**: AI-Entwickler, Lösungsarchitekten und Teams, die produktionsreife Multi-Agent-Systeme bauen

**Schnellstart**: Stellen Sie die komplette Lösung in unter 30 Minuten mit dem beigefügten ARM-Template bereit mit `./deploy.sh -g myResourceGroup`

## 📋 Verwendungsanleitung

### Voraussetzungen

Vor dem Ausführen eines Beispiels:
- ✅ Azure-Abonnement mit Owner- oder Contributor-Zugriff
- ✅ Azure Developer CLI installiert ([Installationsanleitung](../docs/chapter-01-foundation/installation.md))
- ✅ Docker Desktop läuft (für Container-Beispiele)
- ✅ Entsprechende Azure-Quoten (prüfen Sie die beispielspezifischen Anforderungen)

> **💰 Kostenwarnung:** Alle Beispiele erstellen echte Azure-Ressourcen, die Kosten verursachen. Siehe die einzelnen README-Dateien für Kostenschätzungen. Denken Sie daran, `azd down` auszuführen, wenn Sie fertig sind, um fortlaufende Kosten zu vermeiden.

### Lokales Ausführen der Beispiele

1. **Klonen oder Kopieren des Beispiels**
   ```bash
   # Navigiere zum gewünschten Beispiel
   cd examples/simple-web-app
   ```

2. **AZD-Umgebung initialisieren**
   ```bash
   # Mit einer vorhandenen Vorlage initialisieren
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
   
   **Erwartete Erfolgsindikatoren:**
   - ✅ `azd up` wird ohne Fehler abgeschlossen
   - ✅ Service-Endpunkt gibt HTTP 200 zurück
   - ✅ Azure-Portal zeigt den Status "Running" an
   - ✅ Application Insights empfängt Telemetrie

> **⚠️ Probleme?** Siehe [Häufige Probleme](../docs/chapter-07-troubleshooting/common-issues.md) für Troubleshooting bei der Bereitstellung

### Beispiele anpassen

Jedes Beispiel enthält:
- **README.md** - Detaillierte Setup- und Anpassungsanweisungen
- **azure.yaml** - AZD-Konfiguration mit Kommentaren
- **infra/** - Bicep-Templates mit Parametererklärungen
- **src/** - Beispielanwendungscode
- **scripts/** - Hilfsskripte für gängige Aufgaben

## 🎯 Lernziele

### Beispielkategorien

#### **Grundlegende Bereitstellungen**
- Single-Service-Anwendungen
- Einfache Infrastrukturpatterns
- Grundlegendes Konfigurationsmanagement
- Kostenoptimierte Entwicklungs-Setups

#### **Fortgeschrittene Szenarien**
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

### Einfache Webanwendung - Node.js Express
**Technologien**: Node.js, Express, MongoDB, Container Apps  
**Komplexität**: Anfänger  
**Konzepte**: Einfache Bereitstellung, REST-API, NoSQL-Datenbankintegration

### Statische Website - React SPA
**Technologien**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Komplexität**: Anfänger  
**Konzepte**: Statisches Hosting, serverloses Backend, moderne Webentwicklung

### Container App - Python Flask
**Technologien**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexität**: Anfänger  
**Konzepte**: Containerisierung, REST-API, Scale-to-Zero, Health-Probes, Monitoring  
**Ort**: [Lokales Beispiel](../../../examples/container-app/simple-flask-api)

### Container App - Microservices-Architektur
**Technologien**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexität**: Fortgeschritten  
**Konzepte**: Multi-Service-Architektur, Service-Kommunikation, Messaging-Queues, Distributed Tracing  
**Ort**: [Lokales Beispiel](../../../examples/container-app/microservices)

### Datenbankanwendung - C# mit Azure SQL
**Technologien**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexität**: Mittelstufe  
**Konzepte**: Entity Framework, Datenbankverbindungen, Web-API-Entwicklung

### Serverless-Funktion - Python Azure Functions
**Technologien**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexität**: Mittelstufe  
**Konzepte**: Event-getriebene Architektur, serverloses Computing, Full-Stack-Entwicklung

### Microservices - Java Spring Boot
**Technologien**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexität**: Mittelstufe  
**Konzepte**: Microservices-Kommunikation, verteilte Systeme, Enterprise-Pattern

### Microsoft Foundry Beispiele

#### Microsoft Foundry Models Chat-App
**Technologien**: Microsoft Foundry Models, Azure AI Search, App Service  
**Komplexität**: Mittelstufe  
**Konzepte**: RAG-Architektur, Vector Search, LLM-Integration

#### KI-Dokumentverarbeitung
**Technologien**: Azure AI Document Intelligence, Storage, Functions  
**Komplexität**: Mittelstufe  
**Konzepte**: Dokumentenanalyse, OCR, Datenauszug

#### Machine-Learning-Pipeline
**Technologien**: Azure ML, MLOps, Container Registry  
**Komplexität**: Fortgeschritten  
**Konzepte**: Modelltraining, Bereitstellungspipelines, Monitoring

## 🛠 Konfigurationsbeispiele

Das Verzeichnis `configurations/` enthält wiederverwendbare Komponenten:

### Umgebungskonfigurationen
- Development-Umgebungseinstellungen
- Staging-Umgebungskonfigurationen
- Produktionsbereite Konfigurationen
- Multi-Region-Bereitstellungs-Setups

### Bicep-Module
- Wiederverwendbare Infrastrukturkomponenten
- Gängige Ressourcenpatterns
- Security-härtete Templates
- Kostenoptimierte Konfigurationen

### Hilfsskripte
- Automatisierung der Umgebungseinrichtung
- Datenbank-Migrationsskripte
- Deployment-Validierungstools
- Kostenüberwachungs-Utilities

## 🔧 Anpassungsleitfaden

### Anpassung der Beispiele für Ihren Anwendungsfall

1. **Voraussetzungen prüfen**
   - Überprüfen Sie die Azure-Service-Anforderungen
   - Verifizieren Sie Abonnementlimits
   - Verstehen Sie die Kostenimplikationen

2. **Konfiguration anpassen**
   - Aktualisieren Sie die Service-Definitionen in `azure.yaml`
   - Passen Sie Bicep-Templates an
   - Justieren Sie Umgebungsvariablen

3. **Ausführlich testen**
   - Zuerst in der Entwicklungsumgebung bereitstellen
   - Funktionalität validieren
   - Skalierung und Performance testen

4. **Sicherheitsüberprüfung**
   - Zugriffskontrollen prüfen
   - Secrets-Management implementieren
   - Monitoring und Alerts aktivieren

## 📊 Vergleichsmatrix

| Beispiel | Dienste | Datenbank | Auth | Überwachung | Komplexität |
|---------|----------|----------|------|------------|------------|
| **Microsoft Foundry Models Chat** (Lokal) | 2 | ❌ | Key Vault | Vollständig | ⭐⭐ |
| **Python Flask API** (Lokal) | 1 | ❌ | Grundlegend | Vollständig | ⭐ |
| **Microservices** (Lokal) | 5+ | ✅ | Enterprise | Erweitert | ⭐⭐⭐⭐ |
| Node.js Express Todo | 2 | ✅ | Grundlegend | Grundlegend | ⭐ |
| React SPA + Functions | 3 | ✅ | Grundlegend | Vollständig | ⭐ |
| Python Flask Container | 2 | ❌ | Grundlegend | Vollständig | ⭐ |
| C# Web API + SQL | 2 | ✅ | Vollständig | Vollständig | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Vollständig | Vollständig | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Vollständig | Vollständig | ⭐⭐ |
| Microsoft Foundry Models Chat | 3 | ✅ | Vollständig | Vollständig | ⭐⭐⭐ |
| KI-Dokumentverarbeitung | 2 | ❌ | Grundlegend | Vollständig | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Vollständig | Vollständig | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** (Lokal) | **8+** | **✅** | **Enterprise** | **Erweitert** | **⭐⭐⭐⭐** |

## 🎓 Lernpfad

### Empfohlene Reihenfolge

1. **Beginnen Sie mit der einfachen Webanwendung**
   - Grundlegende AZD-Konzepte lernen
   - Deployment-Workflow verstehen
   - Umgang mit Umgebungen üben

2. **Probieren Sie die statische Website**
   - Verschiedene Hosting-Optionen erkunden
   - CDN-Integration kennenlernen
   - DNS-Konfiguration verstehen

3. **Wechseln Sie zur Container-App**
   - Grundlagen der Containerisierung erlernen
   - Skalierungskonzepte verstehen
   - Mit Docker üben

4. **Datenbankintegration hinzufügen**
   - Bereitstellung von Datenbanken erlernen
   - Connection Strings verstehen
   - Secrets-Management üben

5. **Serverless erkunden**
   - Event-getriebene Architektur verstehen
   - Triggers und Bindings kennenlernen
   - APIs praktizieren

6. **Microservices bauen**
   - Service-Kommunikation lernen
   - Verteilte Systeme verstehen
   - Komplexe Deployments üben

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
- **AI/ML**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, KI-Dokumentverarbeitung, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent-Systeme**: **Retail Multi-Agent Solution**
- **OpenAI-Integration**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Retail Multi-Agent Solution
- **Enterprise Production**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Nach Architekturmustern
- **Simple REST API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL
- **Statisch + Serverless**: React SPA + Functions, Python Functions + SPA
- **Microservices**: [Production Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices
- **Containerisiert**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)
- **KI-gestützt**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, Microsoft Foundry Models Chat App, KI-Dokumentverarbeitung, ML Pipeline, **Retail Multi-Agent Solution**
- **Multi-Agent-Architektur**: **Retail Multi-Agent Solution**
- **Enterprise Multi-Service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Retail Multi-Agent Solution**

### Nach Komplexitätsstufe
- **Anfänger**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions
- **Mittelstufe**: **[Microsoft Foundry Models Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Microsoft Foundry Models Chat App, KI-Dokumentverarbeitung
- **Fortgeschritten**: ML Pipeline
- **Enterprise Produktionsbereit**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-Service mit Message-Queuing), **Retail Multi-Agent Solution** (Komplettes Multi-Agent-System mit ARM-Template-Bereitstellung)

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
- [Todo App with Node.js and PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React-Webanwendung mit C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
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
3. Fügen Sie Kommentare zu Konfigurationsdateien hinzu
4. Testen Sie gründlich, bevor Sie einreichen
5. Fügen Sie Kostenschätzungen und Voraussetzungen bei

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

1. **Kompletter Anfänger?** → Beginnen Sie mit [Flask-API](../../../examples/container-app/simple-flask-api) (⭐, 20 Min.)
2. **Grundkenntnisse in AZD?** → Probieren Sie [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 Min.)
3. **AI-Anwendungen bauen?** → Beginnen Sie mit [Microsoft Foundry Models Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 Min.) oder erkunden Sie [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ Std.)
4. **Benötigen Sie einen bestimmten Technologie-Stack?** → Nutzen Sie den Abschnitt [Das richtige Beispiel finden](#-finding-the-right-example) oben

### Nächste Schritte

- ✅ Prüfen Sie die [Voraussetzungen](#voraussetzungen) oben
- ✅ Wählen Sie ein Beispiel, das Ihrem Fähigkeitsniveau entspricht (siehe [Komplexitätslegende](#legende-zur-komplexitätsbewertung))
- ✅ Lesen Sie die README des Beispiels gründlich, bevor Sie bereitstellen
- ✅ Setzen Sie eine Erinnerung, `azd down` nach dem Testen auszuführen
- ✅ Teilen Sie Ihre Erfahrungen über GitHub Issues oder Discussions

### Brauchen Sie Hilfe?

- 📖 [FAQ](../resources/faq.md) - Häufig gestellte Fragen beantwortet
- 🐛 [Fehlerbehebungsleitfaden](../docs/chapter-07-troubleshooting/common-issues.md) - Beheben Sie Bereitstellungsprobleme
- 💬 [GitHub-Diskussionen](https://github.com/microsoft/AZD-for-beginners/discussions) - Fragen Sie die Community
- 📚 [Studienleitfaden](../resources/study-guide.md) - Vertiefen Sie Ihr Wissen

---

**Navigation**
- **📚 Kursstart**: [AZD für Anfänger](../README.md)
- **📖 Lernmaterialien**: [Studienleitfaden](../resources/study-guide.md) | [Spickzettel](../resources/cheat-sheet.md) | [Glossar](../resources/glossary.md)
- **🔧 Ressourcen**: [FAQ](../resources/faq.md) | [Fehlerbehebung](../docs/chapter-07-troubleshooting/common-issues.md)

---

*Zuletzt aktualisiert: November 2025 | [Probleme melden](https://github.com/microsoft/AZD-for-beginners/issues) | [Beispiele beitragen](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->