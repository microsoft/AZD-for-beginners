# Beispiele - Praktische AZD-Vorlagen und Konfigurationen

**Lernen durch Beispiele - Nach Kapiteln organisiert**
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)
- **📖 Kapitelzuordnung**: Beispiele nach Lernkomplexität organisiert
- **🚀 Lokales Beispiel**: [Retail Multi-Agent Lösung](retail-scenario.md)
- **🤖 Externe KI-Beispiele**: Links zu Azure Samples-Repositories

> **📍 WICHTIG: Lokale vs. externe Beispiele**  
> Dieses Repository enthält **4 vollständige lokale Beispiele** mit vollständigen Implementierungen:  
> - **Azure OpenAI Chat** (GPT-4-Bereitstellung mit Chat-Oberfläche)  
> - **Container Apps** (Einfaches Flask-API + Microservices)  
> - **Datenbank-App** (Web + SQL-Datenbank)  
> - **Retail Multi-Agent** (Enterprise-KI-Lösung)  
>  
> Zusätzliche Beispiele sind **externe Referenzen** zu Azure-Samples-Repositories, die Sie klonen können.

## Einführung

Dieses Verzeichnis bietet praktische Beispiele und Referenzen, um Ihnen zu helfen, Azure Developer CLI durch praktische Übungen zu lernen. Das Retail Multi-Agent-Szenario ist eine vollständige, produktionsreife Implementierung, die in diesem Repository enthalten ist. Zusätzliche Beispiele verweisen auf offizielle Azure Samples, die verschiedene AZD-Muster demonstrieren.

### Legende zur Komplexitätsbewertung

- ⭐ **Anfänger** - Grundlegende Konzepte, einzelner Dienst, 15-30 Minuten
- ⭐⭐ **Fortgeschritten** - Mehrere Dienste, Datenbankintegration, 30-60 Minuten
- ⭐⭐⭐ **Experte** - Komplexe Architektur, KI-Integration, 1-2 Stunden
- ⭐⭐⭐⭐ **Profi** - Produktionsreif, Enterprise-Muster, 2+ Stunden

## 🎯 Was ist tatsächlich in diesem Repository enthalten?

### ✅ Lokale Implementierung (Einsatzbereit)

#### [Azure OpenAI Chat-Anwendung](azure-openai-chat/README.md) 🆕
**Vollständige GPT-4-Bereitstellung mit Chat-Oberfläche in diesem Repository enthalten**

- **Ort:** `examples/azure-openai-chat/`
- **Komplexität:** ⭐⭐ (Fortgeschritten)
- **Was ist enthalten:**
  - Vollständige Azure OpenAI-Bereitstellung (GPT-4)
  - Python-Befehlszeilen-Chat-Oberfläche
  - Key Vault-Integration für sichere API-Schlüssel
  - Bicep-Infrastrukturvorlagen
  - Token-Nutzung und Kostenverfolgung
  - Ratenbegrenzung und Fehlerbehandlung

**Schnellstart:**
```bash
# Navigieren Sie zum Beispiel
cd examples/azure-openai-chat

# Alles bereitstellen
azd up

# Abhängigkeiten installieren und mit dem Chatten beginnen
pip install -r src/requirements.txt
python src/chat.py
```

**Technologien:** Azure OpenAI, GPT-4, Key Vault, Python, Bicep

#### [Container App Beispiele](container-app/README.md) 🆕
**Umfassende Container-Bereitstellungsbeispiele in diesem Repository enthalten**

- **Ort:** `examples/container-app/`
- **Komplexität:** ⭐-⭐⭐⭐⭐ (Anfänger bis Profi)
- **Was ist enthalten:**
  - [Master Guide](container-app/README.md) - Vollständige Übersicht über Container-Bereitstellungen
  - [Einfaches Flask-API](../../../examples/container-app/simple-flask-api) - Grundlegendes REST-API-Beispiel
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

# Beispiel für Microservices bereitstellen
cd ../microservices
azd up
```

**Technologien:** Azure Container Apps, Docker, Python Flask, Node.js, C#, Go, Application Insights

#### [Retail Multi-Agent Lösung](retail-scenario.md) 🆕
**Vollständige produktionsreife Implementierung in diesem Repository enthalten**

- **Ort:** `examples/retail-multiagent-arm-template/`
- **Komplexität:** ⭐⭐⭐⭐ (Profi)
- **Was ist enthalten:**
  - Vollständige ARM-Bereitstellungsvorlage
  - Multi-Agent-Architektur (Kunde + Inventar)
  - Azure OpenAI-Integration
  - KI-Suche mit RAG
  - Umfassende Überwachung
  - One-Click-Bereitstellungsskript

**Schnellstart:**
```bash
cd examples/retail-multiagent-arm-template
./deploy.sh -g myResourceGroup
```

**Technologien:** Azure OpenAI, KI-Suche, Container Apps, Cosmos DB, Application Insights

---

## 🔗 Externe Azure Samples (Zum Klonen)

Die folgenden Beispiele werden in offiziellen Azure-Samples-Repositories gepflegt. Klonen Sie sie, um verschiedene AZD-Muster zu erkunden:

### Einfache Anwendungen (Kapitel 1-2)

| Vorlage | Repository | Komplexität | Dienste |
|:--------|:-----------|:------------|:--------|
| **Python Flask API** | [Lokal: simple-flask-api](../../../examples/container-app/simple-flask-api) | ⭐ | Python, Container Apps, Application Insights |
| **Microservices** | [Lokal: microservices](../../../examples/container-app/microservices) | ⭐⭐⭐⭐ | Multi-Service, Service Bus, Cosmos DB, SQL |
| **Node.js + MongoDB** | [todo-nodejs-mongo](https://github.com/Azure-Samples/todo-nodejs-mongo) | ⭐ | Express, Cosmos DB, Container Apps |
| **React + Functions** | [todo-csharp-sql-swa-func](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | ⭐ | Static Web Apps, Functions, SQL |
| **Python Flask Container** | [container-apps-store-api](https://github.com/Azure-Samples/container-apps-store-api-microservice) | ⭐ | Python, Container Apps, API |

**So verwenden Sie es:**
```bash
# Klonen Sie ein beliebiges Beispiel
git clone https://github.com/Azure-Samples/todo-nodejs-mongo
cd todo-nodejs-mongo

# Bereitstellen
azd up
```

### KI-Anwendungsbeispiele (Kapitel 2, 5, 8)

| Vorlage | Repository | Komplexität | Fokus |
|:--------|:-----------|:------------|:------|
| **Azure OpenAI Chat** | [Lokal: azure-openai-chat](../../../examples/azure-openai-chat) | ⭐⭐ | GPT-4-Bereitstellung |
| **KI-Chat Schnellstart** | [get-started-with-ai-chat](https://github.com/Azure-Samples/get-started-with-ai-chat) | ⭐⭐ | Grundlegender KI-Chat |
| **KI-Agenten** | [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | ⭐⭐ | Agenten-Framework |
| **Suche + OpenAI Demo** | [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | ⭐⭐⭐ | RAG-Muster |
| **Contoso Chat** | [contoso-chat](https://github.com/Azure-Samples/contoso-chat) | ⭐⭐⭐⭐ | Enterprise-KI |

### Datenbank- & erweiterte Muster (Kapitel 3-8)

| Vorlage | Repository | Komplexität | Fokus |
|:--------|:-----------|:------------|:------|
| **C# + SQL** | [todo-csharp-sql](https://github.com/Azure-Samples/todo-csharp-sql) | ⭐⭐ | Datenbankintegration |
| **Python + Cosmos** | [todo-python-mongo-swa-func](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | ⭐⭐ | NoSQL serverless |
| **Java Microservices** | [java-microservices-aca-lab](https://github.com/Azure-Samples/java-microservices-aca-lab) | ⭐⭐⭐ | Multi-Service |
| **ML-Pipeline** | [mlops-v2](https://github.com/Azure-Samples/mlops-v2) | ⭐⭐⭐⭐ | MLOps |

## Lernziele

Durch die Arbeit mit diesen Beispielen werden Sie:
- Azure Developer CLI-Workflows mit realistischen Anwendungsszenarien üben
- Verschiedene Anwendungsarchitekturen und deren AZD-Implementierungen verstehen
- Infrastruktur als Code-Muster für verschiedene Azure-Dienste meistern
- Konfigurationsmanagement und umgebungsspezifische Bereitstellungsstrategien anwenden
- Überwachungs-, Sicherheits- und Skalierungsmuster in praktischen Kontexten implementieren
- Erfahrung mit der Fehlersuche und dem Debuggen von echten Bereitstellungsszenarien sammeln

## Lernergebnisse

Nach Abschluss dieser Beispiele werden Sie in der Lage sein:
- Verschiedene Anwendungstypen sicher mit Azure Developer CLI bereitzustellen
- Bereitgestellte Vorlagen an Ihre eigenen Anwendungsanforderungen anzupassen
- Eigene Infrastrukturmuster mit Bicep zu entwerfen und zu implementieren
- Komplexe Multi-Service-Anwendungen mit richtigen Abhängigkeiten zu konfigurieren
- Sicherheits-, Überwachungs- und Leistungsbest-Practices in echten Szenarien anzuwenden
- Bereitstellungen basierend auf praktischer Erfahrung zu optimieren und zu beheben

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

> **💡 Neu bei AZD?** Beginnen Sie mit Beispiel #1 (Flask API) - es dauert ~20 Minuten und vermittelt die Kernkonzepte.

### Für Anfänger
1. **[Container App - Python Flask API](../../../examples/container-app/simple-flask-api)** (Lokal) ⭐  
   Bereitstellung eines einfachen REST-API mit Scale-to-Zero  
   **Zeit:** 20-25 Minuten | **Kosten:** $0-5/Monat  
   **Sie lernen:** Grundlegender AZD-Workflow, Containerisierung, Health-Probes  
   **Erwartetes Ergebnis:** Funktionierende API-Endpunkt, der "Hello, World!" zurückgibt, mit Überwachung

2. **[Einfache Web-App - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** ⭐  
   Bereitstellung einer Node.js Express-Webanwendung mit MongoDB  
   **Zeit:** 25-35 Minuten | **Kosten:** $10-30/Monat  
   **Sie lernen:** Datenbankintegration, Umgebungsvariablen, Verbindungsstrings  
   **Erwartetes Ergebnis:** Todo-Listen-App mit Erstellen/Lesen/Aktualisieren/Löschen-Funktionalität

3. **[Statische Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** ⭐  
   Hosting einer React-Website mit Azure Static Web Apps  
   **Zeit:** 20-30 Minuten | **Kosten:** $0-10/Monat  
   **Sie lernen:** Statisches Hosting, serverlose Funktionen, CDN-Bereitstellung  
   **Erwartetes Ergebnis:** React-UI mit API-Backend, automatisches SSL, globales CDN

### Für Fortgeschrittene
4. **[Azure OpenAI Chat-Anwendung](../../../examples/azure-openai-chat)** (Lokal) ⭐⭐  
   Bereitstellung von GPT-4 mit Chat-Oberfläche und sicherem API-Schlüsselmanagement  
   **Zeit:** 35-45 Minuten | **Kosten:** $50-200/Monat  
   **Sie lernen:** Azure OpenAI-Bereitstellung, Key Vault-Integration, Token-Verfolgung  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit GPT-4 und Kostenüberwachung

5. **[Container App - Microservices](../../../examples/container-app/microservices)** (Lokal) ⭐⭐⭐⭐  
   Produktionsreife Multi-Service-Architektur  
   **Zeit:** 45-60 Minuten | **Kosten:** $50-150/Monat  
   **Sie lernen:** Dienstkommunikation, Nachrichtenwarteschlangen, verteiltes Tracing  
   **Erwartetes Ergebnis:** 2-Dienst-System (API-Gateway + Produktdienst) mit Überwachung

6. **[Datenbank-App - C# mit Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** ⭐⭐  
   Webanwendung mit C# API und Azure SQL-Datenbank  
   **Zeit:** 30-45 Minuten | **Kosten:** $20-80/Monat  
   **Sie lernen:** Entity Framework, Datenbankmigrationen, Verbindungssicherheit  
   **Erwartetes Ergebnis:** C# API mit Azure SQL-Backend, automatische Schema-Bereitstellung

7. **[Serverlose Funktion - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** ⭐⭐  
   Python Azure Functions mit HTTP-Triggers und Cosmos DB  
   **Zeit:** 30-40 Minuten | **Kosten:** $10-40/Monat  
   **Sie lernen:** Eventgesteuerte Architektur, serverloses Skalieren, NoSQL-Integration  
   **Erwartetes Ergebnis:** Funktions-App, die auf HTTP-Anfragen mit Cosmos DB-Speicherung reagiert

8. **[Microservices - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** ⭐⭐⭐  
   Multi-Service-Java-Anwendung mit Container Apps und API-Gateway  
   **Zeit:** 60-90 Minuten | **Kosten:** $80-200/Monat  
   **Sie lernen:** Spring Boot-Bereitstellung, Service-Mesh, Lastenausgleich  
   **Erwartetes Ergebnis:** Multi-Service-Java-System mit Dienstentdeckung und Routing

### Azure AI Foundry Vorlagen

1. **[Azure OpenAI Chat-App - Lokales Beispiel](../../../examples/azure-openai-chat)** ⭐⭐  
   Vollständige GPT-4-Bereitstellung mit Chat-Oberfläche  
   **Zeit:** 35-45 Minuten | **Kosten:** $50-200/Monat  
   **Erwartetes Ergebnis:** Funktionierende Chat-Anwendung mit Token-Verfolgung und Kostenüberwachung

2. **[Azure Search + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** ⭐⭐⭐  
   Intelligente Chat-Anwendung mit RAG-Architektur  
   **Zeit:** 60-90 Minuten | **Kosten:** $100-300/Monat  
   **Erwartetes Ergebnis:** RAG-gestützte Chat-Oberfläche mit Dokumentensuche und Zitaten

3. **[KI-Dokumentenverarbeitung](https://github.com/Azure-Samples/azure-ai-document-processing)** ⭐⭐  
   Dokumentenanalyse mit Azure KI-Diensten  
   **Zeit:** 40-60 Minuten | **Kosten:** $20-80/Monat  
   **Erwartetes Ergebnis:** API, die Text, Tabellen und Entitäten aus hochgeladenen Dokumenten extrahiert

4. **[Maschinenlern-Pipeline](https://github.com/Azure-Samples/mlops-v2)** ⭐⭐⭐⭐  
   MLOps-Workflow mit Azure Machine Learning  
   **Zeit:** 2-3 Stunden | **Kosten:** $150-500/Monat  
   **Erwartetes Ergebnis:** Automatisierte ML-Pipeline mit Training, Bereitstellung und Überwachung

### Szenarien aus der Praxis

#### **Retail Multi-Agent Lösung** 🆕
**[Vollständige Implementierungsanleitung](./retail-scenario.md)**

Eine umfassende, produktionsreife Multi-Agent-Kundenservice-Lösung, die die Bereitstellung von Enterprise-KI-Anwendungen mit AZD demonstriert. Dieses Szenario bietet:

- **Vollständige Architektur**: Multi-Agent-System mit spezialisierten Kundenservice- und Inventarverwaltungsagenten
- **Produktionsinfrastruktur**: Multi-Region Azure OpenAI-Bereitstellungen, AI-Suche, Container-Apps und umfassendes Monitoring  
- **Bereitstellungsfertige ARM-Vorlage**: Ein-Klick-Bereitstellung mit mehreren Konfigurationsmodi (Minimal/Standard/Premium)  
- **Erweiterte Funktionen**: Sicherheitsvalidierung durch Red Teaming, Agenten-Bewertungsframework, Kostenoptimierung und Fehlerbehebungsleitfäden  
- **Realer Geschäftskontext**: Anwendungsfall für den Einzelhandel-Kundensupport mit Datei-Uploads, Suchintegration und dynamischer Skalierung  

**Technologien**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API  

**Komplexität**: ⭐⭐⭐⭐ (Fortgeschritten - Bereit für den Unternehmenseinsatz)  

**Perfekt für**: KI-Entwickler, Lösungsarchitekten und Teams, die produktionsreife Multi-Agenten-Systeme entwickeln  

**Schnellstart**: Bereitstellung der kompletten Lösung in weniger als 30 Minuten mit der enthaltenen ARM-Vorlage über `./deploy.sh -g myResourceGroup`  

## 📋 Nutzungsanweisungen  

### Voraussetzungen  

Vor dem Ausführen eines Beispiels:  
- ✅ Azure-Abonnement mit Besitzer- oder Mitwirkendenzugriff  
- ✅ Azure Developer CLI installiert ([Installationsanleitung](../docs/getting-started/installation.md))  
- ✅ Docker Desktop läuft (für Container-Beispiele)  
- ✅ Entsprechende Azure-Kontingente (prüfen Sie die spezifischen Anforderungen der Beispiele)  

> **💰 Kostenwarnung:** Alle Beispiele erstellen echte Azure-Ressourcen, die Kosten verursachen. Siehe die einzelnen README-Dateien für Kostenschätzungen. Denken Sie daran, `azd down` auszuführen, wenn Sie fertig sind, um laufende Kosten zu vermeiden.  

### Beispiele lokal ausführen  

1. **Beispiel klonen oder kopieren**  
   ```bash
   # Navigieren Sie zum gewünschten Beispiel
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
   # Abrufen von Dienstendpunkten
   azd env get-values
   
   # Testen des Endpunkts (Beispiel)
   curl https://your-app-url.azurecontainer.io/health
   ```
  
   **Erwartete Erfolgsindikatoren:**  
   - ✅ `azd up` wird ohne Fehler abgeschlossen  
   - ✅ Dienst-Endpunkt gibt HTTP 200 zurück  
   - ✅ Azure-Portal zeigt den Status "Running"  
   - ✅ Application Insights empfängt Telemetriedaten  

> **⚠️ Probleme?** Siehe [Häufige Probleme](../docs/troubleshooting/common-issues.md) für Hilfe bei der Fehlerbehebung  

### Beispiele anpassen  

Jedes Beispiel enthält:  
- **README.md** - Detaillierte Anweisungen zur Einrichtung und Anpassung  
- **azure.yaml** - AZD-Konfiguration mit Kommentaren  
- **infra/** - Bicep-Vorlagen mit Parametererklärungen  
- **src/** - Beispielanwendungscode  
- **scripts/** - Hilfsskripte für häufige Aufgaben  

## 🎯 Lernziele  

### Beispielkategorien  

#### **Einfache Bereitstellungen**  
- Anwendungen mit einem Dienst  
- Einfache Infrastrukturmuster  
- Grundlegendes Konfigurationsmanagement  
- Kostenoptimierte Entwicklungsumgebungen  

#### **Fortgeschrittene Szenarien**  
- Architekturen mit mehreren Diensten  
- Komplexe Netzwerkkonfigurationen  
- Datenbank-Integrationsmuster  
- Sicherheits- und Compliance-Implementierungen  

#### **Produktionsreife Muster**  
- Hochverfügbarkeitskonfigurationen  
- Monitoring und Observability  
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
**Technologien**: Python Flask, Docker, Container Apps, Container Registry, Application Insights  
**Komplexität**: Anfänger  
**Konzepte**: Containerisierung, REST-API, Scale-to-Zero, Health-Probes, Monitoring  
**Ort**: [Lokales Beispiel](../../../examples/container-app/simple-flask-api)  

### Container-App - Microservices-Architektur  
**Technologien**: Python, Node.js, C#, Go, Service Bus, Cosmos DB, Azure SQL, Container Apps  
**Komplexität**: Fortgeschritten  
**Konzepte**: Multi-Service-Architektur, Dienstkommunikation, Nachrichtenwarteschlangen, verteiltes Tracing  
**Ort**: [Lokales Beispiel](../../../examples/container-app/microservices)  

### Datenbank-App - C# mit Azure SQL  
**Technologien**: C# ASP.NET Core, Azure SQL Database, App Service  
**Komplexität**: Mittel  
**Konzepte**: Entity Framework, Datenbankverbindungen, Web-API-Entwicklung  

### Serverless-Funktion - Python Azure Functions  
**Technologien**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Komplexität**: Mittel  
**Konzepte**: Ereignisgesteuerte Architektur, serverloses Computing, Full-Stack-Entwicklung  

### Microservices - Java Spring Boot  
**Technologien**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Komplexität**: Mittel  
**Konzepte**: Microservices-Kommunikation, verteilte Systeme, Unternehmensmuster  

### Azure AI Foundry Beispiele  

#### Azure OpenAI Chat App  
**Technologien**: Azure OpenAI, Cognitive Search, App Service  
**Komplexität**: Mittel  
**Konzepte**: RAG-Architektur, Vektorsuche, LLM-Integration  

#### KI-Dokumentenverarbeitung  
**Technologien**: Azure AI Document Intelligence, Storage, Functions  
**Komplexität**: Mittel  
**Konzepte**: Dokumentenanalyse, OCR, Datenauszug  

#### Machine Learning Pipeline  
**Technologien**: Azure ML, MLOps, Container Registry  
**Komplexität**: Fortgeschritten  
**Konzepte**: Modelltraining, Bereitstellungspipelines, Monitoring  

## 🛠 Konfigurationsbeispiele  

Das Verzeichnis `configurations/` enthält wiederverwendbare Komponenten:  

### Umgebungskonfigurationen  
- Einstellungen für Entwicklungsumgebungen  
- Konfigurationen für Staging-Umgebungen  
- Produktionsreife Konfigurationen  
- Multi-Region-Bereitstellungs-Setups  

### Bicep-Module  
- Wiederverwendbare Infrastrukturkomponenten  
- Häufige Ressourcenvorlagen  
- Sicherheitsgehärtete Vorlagen  
- Kostenoptimierte Konfigurationen  

### Hilfsskripte  
- Automatisierung der Umgebungseinrichtung  
- Datenbank-Migrationsskripte  
- Tools zur Bereitstellungsvalidierung  
- Kostenüberwachungswerkzeuge  

## 🔧 Anpassungsleitfaden  

### Beispiele an Ihre Anforderungen anpassen  

1. **Voraussetzungen überprüfen**  
   - Anforderungen an Azure-Dienste prüfen  
   - Abonnementlimits überprüfen  
   - Kostenimplikationen verstehen  

2. **Konfiguration anpassen**  
   - `azure.yaml`-Dienstdefinitionen aktualisieren  
   - Bicep-Vorlagen anpassen  
   - Umgebungsvariablen anpassen  

3. **Gründlich testen**  
   - Zuerst in der Entwicklungsumgebung bereitstellen  
   - Funktionalität validieren  
   - Skalierung und Leistung testen  

4. **Sicherheitsüberprüfung**  
   - Zugriffskontrollen überprüfen  
   - Geheimnismanagement implementieren  
   - Monitoring und Alarme aktivieren  

## 📊 Vergleichsmatrix  

| Beispiel | Dienste | Datenbank | Auth | Monitoring | Komplexität |  
|---------|----------|----------|------|------------|------------|  
| **Azure OpenAI Chat** (Lokal) | 2 | ❌ | Key Vault | Vollständig | ⭐⭐ |  
| **Python Flask API** (Lokal) | 1 | ❌ | Basic | Vollständig | ⭐ |  
| **Microservices** (Lokal) | 5+ | ✅ | Enterprise | Fortgeschritten | ⭐⭐⭐⭐ |  
| Node.js Express Todo | 2 | ✅ | Basic | Basic | ⭐ |  
| React SPA + Functions | 3 | ✅ | Basic | Vollständig | ⭐ |  
| Python Flask Container | 2 | ❌ | Basic | Vollständig | ⭐ |  
| C# Web API + SQL | 2 | ✅ | Vollständig | Vollständig | ⭐⭐ |  
| Python Functions + SPA | 3 | ✅ | Vollständig | Vollständig | ⭐⭐ |  
| Java Microservices | 5+ | ✅ | Vollständig | Vollständig | ⭐⭐ |  
| Azure OpenAI Chat | 3 | ✅ | Vollständig | Vollständig | ⭐⭐⭐ |  
| KI-Dokumentenverarbeitung | 2 | ❌ | Basic | Vollständig | ⭐⭐ |  
| ML-Pipeline | 4+ | ✅ | Vollständig | Vollständig | ⭐⭐⭐⭐ |  
| **Einzelhandel Multi-Agent** (Lokal) | **8+** | **✅** | **Enterprise** | **Fortgeschritten** | **⭐⭐⭐⭐** |  

## 🎓 Lernpfad  

### Empfohlene Reihenfolge  

1. **Mit einfacher Web-App beginnen**  
   - Grundlegende AZD-Konzepte lernen  
   - Bereitstellungsworkflow verstehen  
   - Umgebungshandhabung üben  

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
   - Ereignisgesteuerte Architektur verstehen  
   - Über Trigger und Bindungen lernen  
   - Mit APIs üben  

6. **Microservices erstellen**  
   - Dienstkommunikation lernen  
   - Verteilte Systeme verstehen  
   - Komplexe Bereitstellungen üben  

## 🔍 Das richtige Beispiel finden  

### Nach Technologie-Stack  
- **Container-Apps**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices  
- **Node.js**: Node.js Express Todo App, [Microservices API Gateway (Lokal)](../../../examples/container-app/microservices)  
- **Python**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices Product Service (Lokal)](../../../examples/container-app/microservices), Python Functions + SPA  
- **C#**: [Microservices Order Service (Lokal)](../../../examples/container-app/microservices), C# Web API + SQL Database, Azure OpenAI Chat App, ML-Pipeline  
- **Go**: [Microservices User Service (Lokal)](../../../examples/container-app/microservices)  
- **Java**: Java Spring Boot Microservices  
- **React**: React SPA + Functions  
- **Container**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices), Java Microservices  
- **Datenbanken**: [Microservices (Lokal)](../../../examples/container-app/microservices), Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB  
- **KI/ML**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, KI-Dokumentenverarbeitung, ML-Pipeline, **Einzelhandel Multi-Agent Lösung**  
- **Multi-Agent-Systeme**: **Einzelhandel Multi-Agent Lösung**  
- **OpenAI-Integration**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Einzelhandel Multi-Agent Lösung  
- **Unternehmensproduktion**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Einzelhandel Multi-Agent Lösung**  

### Nach Architektur-Muster  
- **Einfache REST-API**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api)  
- **Monolithisch**: Node.js Express Todo, C# Web API + SQL  
- **Statisch + Serverless**: React SPA + Functions, Python Functions + SPA  
- **Microservices**: [Produktions-Microservices (Lokal)](../../../examples/container-app/microservices), Java Spring Boot Microservices  
- **Containerisiert**: [Python Flask (Lokal)](../../../examples/container-app/simple-flask-api), [Microservices (Lokal)](../../../examples/container-app/microservices)  
- **KI-gestützt**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, Azure OpenAI Chat App, KI-Dokumentenverarbeitung, ML-Pipeline, **Einzelhandel Multi-Agent Lösung**  
- **Multi-Agent-Architektur**: **Einzelhandel Multi-Agent Lösung**  
- **Unternehmens-Multi-Service**: [Microservices (Lokal)](../../../examples/container-app/microservices), **Einzelhandel Multi-Agent Lösung**  

### Nach Komplexitätsstufe  
- **Anfänger**: [Python Flask API (Lokal)](../../../examples/container-app/simple-flask-api), Node.js Express Todo, React SPA + Functions  
- **Mittel**: **[Azure OpenAI Chat (Lokal)](../../../examples/azure-openai-chat)**, C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, KI-Dokumentenverarbeitung  
- **Fortgeschritten**: ML-Pipeline  
- **Unternehmensproduktion**: [Microservices (Lokal)](../../../examples/container-app/microservices) (Multi-Service mit Nachrichtenwarteschlangen), **Einzelhandel Multi-Agent Lösung** (Komplettes Multi-Agent-System mit ARM-Vorlagenbereitstellung)  

## 📚 Zusätzliche Ressourcen  

### Dokumentationslinks  
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)  
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)  
- [Bicep-Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  

### Community-Beispiele  
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)  
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)  
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)  
- [Todo App mit C# und Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App mit Python und MongoDB](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo-App mit Node.js und PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [React-Web-App mit C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions mit Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Best Practices  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Beispiele beitragen  

Haben Sie ein nützliches Beispiel, das Sie teilen möchten? Wir freuen uns über Beiträge!  

### Einreichungsrichtlinien  
1. Halten Sie sich an die bestehende Verzeichnisstruktur  
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

**Tipp**: Beginnen Sie mit dem einfachsten Beispiel, das zu Ihrem Technologiestack passt, und arbeiten Sie sich schrittweise zu komplexeren Szenarien vor. Jedes Beispiel baut auf den Konzepten der vorherigen auf!  

## 🚀 Bereit zum Start?  

### Ihr Lernpfad  

1. **Kompletter Anfänger?** → Beginnen Sie mit [Flask API](../../../examples/container-app/simple-flask-api) (⭐, 20 Minuten)  
2. **Grundkenntnisse in AZD?** → Probieren Sie [Microservices](../../../examples/container-app/microservices) (⭐⭐⭐⭐, 60 Minuten)  
3. **AI-Apps entwickeln?** → Starten Sie mit [Azure OpenAI Chat](../../../examples/azure-openai-chat) (⭐⭐, 35 Minuten) oder erkunden Sie [Retail Multi-Agent](retail-scenario.md) (⭐⭐⭐⭐, 2+ Stunden)  
4. **Benötigen Sie einen spezifischen Technologiestack?** → Nutzen Sie den Abschnitt [Das richtige Beispiel finden](../../../examples) oben  

### Nächste Schritte  

- ✅ Überprüfen Sie die [Voraussetzungen](../../../examples) oben  
- ✅ Wählen Sie ein Beispiel, das Ihrem Kenntnisstand entspricht (siehe [Komplexitätslegende](../../../examples))  
- ✅ Lesen Sie die README des Beispiels gründlich, bevor Sie es bereitstellen  
- ✅ Setzen Sie eine Erinnerung, um `azd down` nach dem Testen auszuführen  
- ✅ Teilen Sie Ihre Erfahrungen über GitHub Issues oder Discussions  

### Brauchen Sie Hilfe?  

- 📖 [FAQ](../resources/faq.md) - Häufig gestellte Fragen  
- 🐛 [Fehlerbehebungsleitfaden](../docs/troubleshooting/common-issues.md) - Probleme bei der Bereitstellung beheben  
- 💬 [GitHub Discussions](https://github.com/microsoft/AZD-for-beginners/discussions) - Fragen Sie die Community  
- 📚 [Lernleitfaden](../resources/study-guide.md) - Vertiefen Sie Ihr Wissen  

---  

**Navigation**  
- **📚 Kursübersicht**: [AZD für Anfänger](../README.md)  
- **📖 Lernmaterialien**: [Lernleitfaden](../resources/study-guide.md) | [Spickzettel](../resources/cheat-sheet.md) | [Glossar](../resources/glossary.md)  
- **🔧 Ressourcen**: [FAQ](../resources/faq.md) | [Fehlerbehebung](../docs/troubleshooting/common-issues.md)  

---  

*Letzte Aktualisierung: November 2025 | [Probleme melden](https://github.com/microsoft/AZD-for-beginners/issues) | [Beispiele beitragen](https://github.com/microsoft/AZD-for-beginners/blob/main/CONTRIBUTING.md)*  

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->