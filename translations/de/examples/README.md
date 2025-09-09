<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-09T17:33:51+00:00",
  "source_file": "examples/README.md",
  "language_code": "de"
}
-->
# Beispiele - Praktische AZD-Vorlagen und Konfigurationen

## Einführung

Dieses Verzeichnis enthält praktische Beispiele, Vorlagen und reale Szenarien, die Ihnen helfen, Azure Developer CLI durch praktische Übungen zu erlernen. Jedes Beispiel bietet vollständigen funktionierenden Code, Infrastrukturvorlagen und detaillierte Anleitungen für verschiedene Anwendungsarchitekturen und Bereitstellungsmuster.

## Lernziele

Durch die Bearbeitung dieser Beispiele werden Sie:
- Azure Developer CLI-Workflows mit realistischen Anwendungsszenarien üben
- Verschiedene Anwendungsarchitekturen und deren azd-Implementierungen verstehen
- Muster für Infrastructure as Code für verschiedene Azure-Dienste meistern
- Strategien für Konfigurationsmanagement und umgebungsspezifische Bereitstellungen anwenden
- Überwachungs-, Sicherheits- und Skalierungsmuster in praktischen Kontexten implementieren
- Erfahrungen mit der Fehlersuche und dem Debuggen von echten Bereitstellungsszenarien sammeln

## Lernergebnisse

Nach Abschluss dieser Beispiele werden Sie in der Lage sein:
- Verschiedene Anwendungstypen sicher mit Azure Developer CLI bereitzustellen
- Die bereitgestellten Vorlagen an Ihre eigenen Anforderungen anzupassen
- Eigene Infrastrukturmuster mit Bicep zu entwerfen und umzusetzen
- Komplexe Multi-Service-Anwendungen mit den richtigen Abhängigkeiten zu konfigurieren
- Sicherheits-, Überwachungs- und Leistungsbest-Practices in realen Szenarien anzuwenden
- Bereitstellungen basierend auf praktischen Erfahrungen zu optimieren und Fehler zu beheben

## Verzeichnisstruktur

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Schnellstart-Beispiele

### Für Anfänger
1. **[Einfache Web-App](../../../examples/simple-web-app)** - Bereitstellung einer grundlegenden Node.js-Webanwendung
2. **[Statische Website](../../../examples/static-website)** - Hosting einer statischen Website auf Azure Storage
3. **[Container-App](../../../examples/container-app)** - Bereitstellung einer containerisierten Anwendung

### Für fortgeschrittene Nutzer
4. **[Datenbank-App](../../../examples/database-app)** - Webanwendung mit PostgreSQL-Datenbank
5. **[Serverless-Funktion](../../../examples/serverless-function)** - Azure Functions mit HTTP-Triggers
6. **[Microservices](../../../examples/microservices)** - Multi-Service-Anwendung mit API-Gateway

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
- **README.md** - Detaillierte Anweisungen zur Einrichtung und Anpassung
- **azure.yaml** - AZD-Konfiguration mit Kommentaren
- **infra/** - Bicep-Vorlagen mit Parametererklärungen
- **src/** - Beispielanwendungscode
- **scripts/** - Hilfsskripte für häufige Aufgaben

## 🎯 Lernziele

### Beispielkategorien

#### **Grundlegende Bereitstellungen**
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

### Einfache Web-App
**Technologien**: Node.js, App Service, Application Insights  
**Komplexität**: Anfänger  
**Konzepte**: Grundlegende Bereitstellung, Umgebungsvariablen, Gesundheitschecks

### Statische Website
**Technologien**: HTML/CSS/JS, Storage Account, CDN  
**Komplexität**: Anfänger  
**Konzepte**: Statisches Hosting, CDN-Integration, benutzerdefinierte Domains

### Container-App
**Technologien**: Docker, Container Apps, Container Registry  
**Komplexität**: Fortgeschritten  
**Konzepte**: Containerisierung, Skalierung, Ingress-Konfiguration

### Datenbank-App
**Technologien**: Python Flask, PostgreSQL, App Service  
**Komplexität**: Fortgeschritten  
**Konzepte**: Datenbankverbindungen, Geheimnisverwaltung, Migrationen

### Serverless-Funktion
**Technologien**: Azure Functions, Cosmos DB, API Management  
**Komplexität**: Fortgeschritten  
**Konzepte**: Eventgesteuerte Architektur, Bindings, API-Management

### Microservices
**Technologien**: Mehrere Dienste, Service Bus, API Gateway  
**Komplexität**: Fortgeschritten  
**Konzepte**: Dienstkommunikation, Nachrichtenwarteschlangen, Lastverteilung

## 🛠 Konfigurationsbeispiele

Das Verzeichnis `configurations/` enthält wiederverwendbare Komponenten:

### Umgebungskonfigurationen
- Einstellungen für Entwicklungsumgebungen
- Konfigurationen für Staging-Umgebungen
- Produktionsreife Konfigurationen
- Multi-Region-Bereitstellungen

### Bicep-Module
- Wiederverwendbare Infrastrukturkomponenten
- Häufige Ressourcenmuster
- Sicherheitsgehärtete Vorlagen
- Kostenoptimierte Konfigurationen

### Hilfsskripte
- Automatisierung der Umgebungs-Einrichtung
- Datenbank-Migrationsskripte
- Validierungstools für Bereitstellungen
- Kostenüberwachungswerkzeuge

## 🔧 Anpassungsleitfaden

### Beispiele an Ihre Anforderungen anpassen

1. **Voraussetzungen prüfen**
   - Anforderungen an Azure-Dienste überprüfen
   - Abonnementlimits verifizieren
   - Kostenimplikationen verstehen

2. **Konfiguration ändern**
   - `azure.yaml`-Dienstdefinitionen aktualisieren
   - Bicep-Vorlagen anpassen
   - Umgebungsvariablen anpassen

3. **Gründlich testen**
   - Zuerst in der Entwicklungsumgebung bereitstellen
   - Funktionalität validieren
   - Skalierung und Leistung testen

4. **Sicherheitsüberprüfung**
   - Zugriffssteuerungen überprüfen
   - Geheimnisverwaltung implementieren
   - Überwachung und Alarmierung aktivieren

## 📊 Vergleichsmatrix

| Beispiel | Dienste | Datenbank | Auth | Überwachung | Komplexität |
|----------|---------|-----------|------|-------------|-------------|
| Einfache Web-App | 1 | ❌ | Basis | Basis | ⭐ |
| Statische Website | 1 | ❌ | ❌ | Basis | ⭐ |
| Container-App | 1 | ❌ | Basis | Vollständig | ⭐⭐ |
| Datenbank-App | 2 | ✅ | Vollständig | Vollständig | ⭐⭐⭐ |
| Serverless-Funktion | 3 | ✅ | Vollständig | Vollständig | ⭐⭐⭐ |
| Microservices | 5+ | ✅ | Vollständig | Vollständig | ⭐⭐⭐⭐ |

## 🎓 Lernpfad

### Empfohlene Reihenfolge

1. **Mit einfacher Web-App beginnen**
   - Grundlegende AZD-Konzepte lernen
   - Bereitstellungsworkflow verstehen
   - Umgebungsmanagement üben

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
   - Geheimnisverwaltung üben

5. **Serverless erkunden**
   - Eventgesteuerte Architektur verstehen
   - Triggers und Bindings lernen
   - Mit APIs üben

6. **Microservices erstellen**
   - Dienstkommunikation lernen
   - Verteilte Systeme verstehen
   - Komplexe Bereitstellungen üben

## 🔍 Das richtige Beispiel finden

### Nach Technologie-Stack
- **Node.js**: Einfache Web-App, Microservices
- **Python**: Datenbank-App, Serverless-Funktion
- **Statische Seiten**: Statische Website
- **Container**: Container-App, Microservices
- **Datenbanken**: Datenbank-App, Serverless-Funktion

### Nach Architektur-Muster
- **Monolithisch**: Einfache Web-App, Datenbank-App
- **Statisch**: Statische Website
- **Microservices**: Microservices-Beispiel
- **Serverless**: Serverless-Funktion
- **Hybrid**: Container-App

### Nach Komplexitätsstufe
- **Anfänger**: Einfache Web-App, Statische Website
- **Fortgeschritten**: Container-App, Datenbank-App, Serverless-Funktion  
- **Experte**: Microservices

## 📚 Zusätzliche Ressourcen

### Dokumentationslinks
- [AZD-Vorlagenspezifikation](https://aka.ms/azd/templates)
- [Bicep-Dokumentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Community-Beispiele
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD Templates Gallery](https://azure.github.io/awesome-azd/)

### Best Practices
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Beispiele beitragen

Haben Sie ein nützliches Beispiel, das Sie teilen möchten? Wir freuen uns über Beiträge!

### Einreichungsrichtlinien
1. Halten Sie sich an die etablierte Verzeichnisstruktur
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

**Tipp**: Beginnen Sie mit dem einfachsten Beispiel, das zu Ihrem Technologie-Stack passt, und arbeiten Sie sich schrittweise zu komplexeren Szenarien vor. Jedes Beispiel baut auf den Konzepten des vorherigen auf!

**Nächste Schritte**: 
- Wählen Sie ein Beispiel, das Ihrem Kenntnisstand entspricht
- Folgen Sie den Einrichtungshinweisen im README des Beispiels
- Experimentieren Sie mit Anpassungen
- Teilen Sie Ihre Erkenntnisse mit der Community

---

**Navigation**
- **Vorherige Lektion**: [Lernleitfaden](../resources/study-guide.md)
- **Zurück zu**: [Haupt-README](../README.md)

---

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.