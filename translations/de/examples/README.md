# Beispiele — Englische Quelle und Azure-Beispiele

Dies sind Lernbeispiele, keine produktionszertifizierten Anwendungen. Lesen Sie jeweils
die Voraussetzungen, Einschränkungen, Kosten und Bereinigungsanweisungen des Beispiels, bevor
Sie Befehle ausführen. Die Azure-Verfügbarkeit und Kontingente müssen in Ihrem Abonnement überprüft werden.

- [Kursstartseite](../README.md)
- [Installation](../docs/chapter-01-foundation/installation.md)
- [Fehlerbehebung](../docs/chapter-07-troubleshooting/common-issues.md)

## Was lokal tatsächlich vorhanden ist

Es gibt **vier Anwendungsbeispiele** und **ein Infrastruktur-Grundgerüst**:

| Beispiel | Lokale Umsetzung | Lernfokus | Niveau |
|---|---|---|---|
| [Einfache Flask-API](../../../examples/container-app/simple-flask-api) | Flask CRUD API, Dockerfile, Bicep, `azure.yaml` | Container-Bereitstellung, Probes, Logs | Anfänger |
| [Zwei-Service Microservices](../../../examples/container-app/microservices) | Node.js-Gateway und schreibgeschützter Python-Produktservice, Dockerfiles, Bicep, `azure.yaml` | Interne HTTPS-Kommunikation, unabhängige Skalierung | Mittelstufe |
| [Datenbank-App](../../../examples/database-app) | Flask Lese-API, Azure SQL, App Service, Bicep, `azure.yaml` | SQL-Konnektivität, Initialisierung, Logs | Mittelstufe |
| [Azure OpenAI Chat](../../../examples/azure-openai-chat) | Lokales Python CLI, Azure OpenAI und Key Vault Bicep, Infrastruktur-only `azure.yaml` | Modellbereitstellung, Chat-Verlauf, Token-Schätzungen | Mittelstufe |
| [Retail-Infrastruktur](../../../examples/retail-multiagent-arm-template) | ARM-Template, Parameter, Bash-Bereitsscript; **nur Hallo-Welt-Container** | Infrastruktur für eine zukünftige Multi-Agenten-Anwendung | Fortgeschritten |

Das [Retail-Szenario](retail-scenario.md) ist ein **Architektur-Blueprint**, keine
vollständige Multi-Agenten-Implementierung. Kein Retail-Agenten-Code, Chat-Frontend, Router-
API, Suchdaten-Pipeline, Bewertungs-CLI, automatische Failover-Funktion oder produktive
Härtung ist enthalten. Diese müssen separat entworfen, gebaut und getestet werden.

Die [Microservices-Übersicht](microservices/README.md) verweist auf das ausführbare
Zwei-Service-Beispiel; es ist kein weiterer Bereitstellungsordner.

## Empfohlener Lernpfad

1. Stellen Sie die Flask API bereit und überprüfen Sie `/health` und CRUD-Operationen.
2. Stellen Sie die Datenbank-App bereit und überprüfen Sie deren fünf vorbefüllte Produkte.
3. Stellen Sie das Zwei-Service-Beispiel bereit und überprüfen Sie Gateway-zu-Produkt-Anfragen.
4. Stellen Sie die Chat-Ressourcen bereit und führen Sie die interaktive CLI **lokal** aus.
5. Studieren Sie den Retail-Blueprint nach Abschluss der funktionierenden Beispiele.

Planen Sie ungefähr 30–60 Minuten pro Anwendungsbeispiel inklusive Voraussetzungen und
Überprüfung ein. Die Retail-Implementierung ist ein separates Entwicklungsprojekt, kein
30-Minuten-Workshop. Das Lesen der Architektur dauert etwa 2–3 Stunden; Implementierung
und Produktionsreife können wesentlich länger dauern als die beispielhaften
80–120 Entwicklungsstunden im Leitfaden.

## Schnellstart

Vom Repository-Stamm aus für das erste Container-Beispiel:

```bash
cd examples/container-app/simple-flask-api
azd auth login
azd env new flask-demo
azd up
API_URL=$(azd env get-value API_ENDPOINT)
curl --fail-with-body "${API_URL}/health"
```

Erwartet: HTTP 200 und JSON mit `"status": "healthy"`.
Docker muss für den lokalen Container-Build ausgeführt werden.

Für Chat folgen Sie dem [Chat README](azure-openai-chat/README.md): verwenden Sie
`azd provision`, laden Sie den API-Schlüssel aus Key Vault in die aktuelle Shell, installieren Sie
`src/requirements.txt` und führen Sie `python src/chat.py` aus. Es gibt keinen gehosteten Chat-Dienst.

Für Retail verwenden Sie die [ARM-Anleitung](retail-multiagent-arm-template/README.md).
Diese hat kein `azure.yaml` und wird **nicht** durch `azd up`/`azd down` bereitgestellt oder entfernt.

## Kosten und Beschränkungen

- Alle Bereitstellungen erstellen kostenpflichtige Azure-Ressourcen. Scale-to-zero gilt nur für
  App-Compute; es eliminiert keine Kosten für Registry, Datenbank, Speicher, Suche oder Logs.
- Die genauen Preise hängen von Region, Währung, Traffic, Modell/SKU und Aufbewahrung ab.
  Verwenden Sie den [Azure-Preiskalkulator](https://azure.microsoft.com/pricing/calculator/)
  vor der Bereitstellung und legen Sie ein Budget in Azure Cost Management fest.
- Flask CRUD-Daten befinden sich im Speicher, standardmäßig auf einen Worker und höchstens eine Replik begrenzt.
  Sie gehen bei Neustart oder Scale-to-zero verloren. Dies ist kein dauerhafter Speicher.
- Der Produkt-Microservice stellt nur GET-Endpunkte bereit. Kein Bestellservice, Benutzer-
  service, Datenbank, Service Bus, C# oder Go-Implementierung ist enthalten.
- Application Insights-Ressourcen instrumentieren nicht automatisch jede Anwendung.
  Prüfen Sie jede Beispielanwendung auf tatsächlich gesendete Telemetriedaten.
- Beispiele implementieren keine Anwendungs-Authentifizierung. Fügen Sie Identität, Autorisierung,
  dauerhaften Speicher, Netzwerkkontrollen, Tests und Betriebsverfahren vor der Produktion hinzu.

## Externe Azure-Beispiele — separat klonen

Diese Links verweisen auf separate Repositories, **nicht lokale Beispiele**.
Ihre Betreuer sind für Einrichtungsanweisungen, Implementierung, Abhängigkeiten und Kosten verantwortlich.

| Beispiel | Fokus |
|---|---|
| [Node.js + MongoDB todo](https://github.com/Azure-Samples/todo-nodejs-mongo) | Node.js-Anwendung mit Datenbank |
| [C# + SQL todo](https://github.com/Azure-Samples/todo-csharp-sql) | C# und Azure SQL |
| [Static Web Apps + Functions](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) | Statisches Frontend mit C#-Funktionen und SQL |
| [Python Functions + MongoDB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) | Python Serverless-Anwendung |
| [Container Apps Store API](https://github.com/Azure-Samples/container-apps-store-api-microservice) | Containerisierter Store-Backend |
| [KI-Chat-Schnellstart](https://github.com/Azure-Samples/get-started-with-ai-chat) | KI-Chat-Anwendung |
| [KI-Agenten Schnellstart](https://github.com/Azure-Samples/get-started-with-ai-agents) | Agentenanwendung |
| [Suche + OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG mit Suche und Zitaten |
| [Contoso Chat](https://github.com/Azure-Samples/contoso-chat) | Conversational AI Beispiel |
| [Java auf Container Apps](https://github.com/Azure-Samples/java-on-aca) | Java-Microservices |

Entdecken Sie weitere Projekte in der [AZD-Vorlagen-Galerie](https://azure.github.io/awesome-azd/).
Gehen Sie nicht davon aus, dass ein externes Projekt `azd` unterstützt, ohne das aktuelle README zu prüfen.

## Repository-Struktur

```text
examples/
├── azure-openai-chat/               # Local CLI + model infrastructure
├── container-app/
│   ├── simple-flask-api/            # Single Flask API
│   └── microservices/               # Gateway + read-only product service
├── database-app/                    # Flask + Azure SQL on App Service
├── microservices/README.md          # Navigation to the canonical example
├── retail-multiagent-arm-template/  # Infrastructure scaffold only
└── retail-scenario.md               # Architecture blueprint
```

Es gibt kein gemeinsames `configurations/`, `scripts/` oder Testverzeichnis, wie in
diesem Index versprochen. Tatsächliche Dateien und optionale Erweiterungsideen sind in jedem Leitfaden angegeben.

## Bereinigung

Führen Sie bei den vier AZD-Beispielen dies **vom ausgewählten Beispielverzeichnis aus** aus:

```bash
azd down
```

Prüfen Sie die Lösch-Abfrage. Für Retail löschen Sie nur die dedizierte Ressourcengruppe,
die Sie mit den Anweisungen im ARM-Leitfaden erstellt haben. Prüfen Sie nach der Bereinigung Azure Cost Management;
Abrechnungsdaten können später eintreffen.

## Mitwirken

Fügen Sie Quellcode, Infrastruktur, Bereitstellungskonfiguration, umsetzbare Einrichtungs- und
Verifikationsschritte, Beschränkungen und Bereinigungsanweisungen zu jedem Anwendungs-
beispiel hinzu. Kennzeichnen Sie ausschließlich architekturbezogene Materialien und unvollständige Ausschnitte explizit.
Beanspruchen Sie keine Produktionsreife ohne Bereitstellungs-, Funktions- und Betriebstests.

[FAQ](../resources/faq.md) · [Studienleitfaden](../resources/study-guide.md) ·
[Problem melden](https://github.com/microsoft/AZD-for-beginners/issues)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->