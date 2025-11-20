<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "1bc63a39d4cf8fc5cb5c7040344be859",
  "translation_date": "2025-11-19T22:38:22+00:00",
  "source_file": "changelog.md",
  "language_code": "de"
}
-->
# Änderungsprotokoll - AZD für Anfänger

## Einführung

Dieses Änderungsprotokoll dokumentiert alle bemerkenswerten Änderungen, Updates und Verbesserungen am AZD für Anfänger-Repository. Wir folgen den Prinzipien der semantischen Versionierung und führen dieses Protokoll, um den Nutzern zu helfen, die Unterschiede zwischen den Versionen zu verstehen.

## Lernziele

Durch die Überprüfung dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und Inhalte informiert bleiben
- Verbesserungen an bestehender Dokumentation nachvollziehen können
- Fehlerbehebungen und Korrekturen verfolgen, um Genauigkeit sicherzustellen
- Die Entwicklung der Lernmaterialien im Laufe der Zeit verfolgen

## Lernergebnisse

Nach der Überprüfung der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und Ressourcen für das Lernen zu identifizieren
- Verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernweg basierend auf den aktuellsten Materialien planen
- Feedback und Vorschläge für zukünftige Verbesserungen einbringen

## Versionshistorie

### [v3.8.0] - 19.11.2025

#### Erweiterte Dokumentation: Überwachung, Sicherheit und Multi-Agent-Muster
**Diese Version fügt umfassende A-Grade-Lektionen zur Integration von Application Insights, Authentifizierungsmustern und Multi-Agent-Koordination für Produktionsbereitstellungen hinzu.**

#### Hinzugefügt
- **📊 Application Insights Integration Lektion**: in `docs/pre-deployment/application-insights.md`:
  - AZD-fokussierte Bereitstellung mit automatischer Bereitstellung
  - Vollständige Bicep-Vorlagen für Application Insights + Log Analytics
  - Funktionierende Python-Anwendungen mit benutzerdefinierter Telemetrie (über 1.200 Zeilen)
  - Überwachungsmuster für KI/LLM (Azure OpenAI Token-/Kostenverfolgung)
  - 6 Mermaid-Diagramme (Architektur, verteiltes Tracing, Telemetriefluss)
  - 3 praktische Übungen (Warnungen, Dashboards, KI-Überwachung)
  - Kusto-Abfragebeispiele und Strategien zur Kostenoptimierung
  - Live-Metrik-Streaming und Echtzeit-Debugging
  - Lernzeit von 40-50 Minuten mit produktionsbereiten Mustern

- **🔐 Authentifizierungs- & Sicherheitsmuster Lektion**: in `docs/getting-started/authsecurity.md`:
  - 3 Authentifizierungsmuster (Verbindungszeichenfolgen, Key Vault, verwaltete Identität)
  - Vollständige Bicep-Infrastrukturvorlagen für sichere Bereitstellungen
  - Node.js-Anwendungscode mit Azure SDK-Integration
  - 3 vollständige Übungen (verwaltete Identität aktivieren, benutzerdefinierte Identität, Key Vault-Rotation)
  - Sicherheitsbest-Practices und RBAC-Konfigurationen
  - Fehlerbehebungsleitfaden und Kostenanalyse
  - Produktionsbereite passwortlose Authentifizierungsmuster

- **🤖 Multi-Agent-Koordinationsmuster Lektion**: in `docs/pre-deployment/coordination-patterns.md`:
  - 5 Koordinationsmuster (sequenziell, parallel, hierarchisch, ereignisgesteuert, Konsens)
  - Vollständige Orchestrator-Service-Implementierung (Python/Flask, über 1.500 Zeilen)
  - 3 spezialisierte Agentenimplementierungen (Research, Writer, Editor)
  - Service Bus-Integration für Nachrichtenwarteschlangen
  - Cosmos DB-Zustandsverwaltung für verteilte Systeme
  - 6 Mermaid-Diagramme, die Agenteninteraktionen zeigen
  - 3 fortgeschrittene Übungen (Timeout-Handling, Retry-Logik, Circuit Breaker)
  - Kostenübersicht ($240-565/Monat) mit Optimierungsstrategien
  - Application Insights-Integration für Überwachung

#### Verbesserungen
- **Kapitel Vorbereitungsbereitstellung**: Enthält jetzt umfassende Überwachungs- und Koordinationsmuster
- **Kapitel Erste Schritte**: Erweitert mit professionellen Authentifizierungsmustern
- **Produktionsbereitschaft**: Vollständige Abdeckung von Sicherheit bis Observierbarkeit
- **Kursübersicht**: Aktualisiert, um neue Lektionen in Kapitel 3 und 6 zu referenzieren

#### Änderungen
- **Lernfortschritt**: Bessere Integration von Sicherheit und Überwachung im gesamten Kurs
- **Dokumentationsqualität**: Konsistente A-Grade-Standards (95-97%) in neuen Lektionen
- **Produktionsmuster**: Vollständige End-to-End-Abdeckung für Unternehmensbereitstellungen

#### Verbesserte Bereiche
- **Entwicklererfahrung**: Klarer Weg von Entwicklung bis Produktionsüberwachung
- **Sicherheitsstandards**: Professionelle Muster für Authentifizierung und Geheimnisverwaltung
- **Observierbarkeit**: Vollständige Application Insights-Integration mit AZD
- **KI-Workloads**: Spezialisierte Überwachung für Azure OpenAI und Multi-Agent-Systeme

#### Validiert
- ✅ Alle Lektionen enthalten vollständigen funktionierenden Code (keine Snippets)
- ✅ Mermaid-Diagramme für visuelles Lernen (insgesamt 19 in 3 Lektionen)
- ✅ Praktische Übungen mit Verifizierungsschritten (insgesamt 9)
- ✅ Produktionsbereite Bicep-Vorlagen, bereitstellbar über `azd up`
- ✅ Kostenanalyse und Optimierungsstrategien
- ✅ Fehlerbehebungsleitfäden und Best-Practices
- ✅ Wissenscheckpunkte mit Verifizierungskommandos

#### Dokumentationsbewertungsergebnisse
- **docs/pre-deployment/application-insights.md**: - Umfassender Überwachungsleitfaden
- **docs/getting-started/authsecurity.md**: - Professionelle Sicherheitsmuster
- **docs/pre-deployment/coordination-patterns.md**: - Fortgeschrittene Multi-Agent-Architekturen
- **Gesamte neue Inhalte**: - Konsistente hochwertige Standards

#### Technische Umsetzung
- **Application Insights**: Log Analytics + benutzerdefinierte Telemetrie + verteiltes Tracing
- **Authentifizierung**: Verwaltete Identität + Key Vault + RBAC-Muster
- **Multi-Agent**: Service Bus + Cosmos DB + Container Apps + Orchestrierung
- **Überwachung**: Live-Metriken + Kusto-Abfragen + Warnungen + Dashboards
- **Kostenmanagement**: Sampling-Strategien, Aufbewahrungsrichtlinien, Budgetkontrollen

### [v3.7.0] - 19.11.2025

#### Verbesserungen der Dokumentationsqualität und neues Azure OpenAI-Beispiel
**Diese Version verbessert die Dokumentationsqualität im gesamten Repository und fügt ein vollständiges Azure OpenAI-Bereitstellungsbeispiel mit GPT-4-Chat-Interface hinzu.**

#### Hinzugefügt
- **🤖 Azure OpenAI Chat Beispiel**: Vollständige GPT-4-Bereitstellung mit funktionierender Implementierung in `examples/azure-openai-chat/`:
  - Vollständige Azure OpenAI-Infrastruktur (GPT-4-Modellbereitstellung)
  - Python-Befehlszeilen-Chat-Interface mit Gesprächsverlauf
  - Key Vault-Integration für sichere API-Schlüssel-Speicherung
  - Token-Nutzungsverfolgung und Kostenschätzung
  - Ratenbegrenzung und Fehlerbehandlung
  - Umfassendes README mit 35-45 Minuten Bereitstellungsleitfaden
  - 11 produktionsbereite Dateien (Bicep-Vorlagen, Python-App, Konfiguration)
- **📚 Dokumentationsübungen**: Hinzugefügte praktische Übungsaufgaben zum Konfigurationsleitfaden:
  - Übung 1: Multi-Umgebungs-Konfiguration (15 Minuten)
  - Übung 2: Geheimnisverwaltungsübung (10 Minuten)
  - Klare Erfolgskriterien und Verifizierungsschritte
- **✅ Bereitstellungsverifizierung**: Hinzugefügter Verifizierungsabschnitt zum Bereitstellungsleitfaden:
  - Gesundheitsprüfungsverfahren
  - Erfolgskriterien-Checkliste
  - Erwartete Ausgaben für alle Bereitstellungskommandos
  - Schnellreferenz zur Fehlerbehebung

#### Verbesserungen
- **examples/README.md**: Aktualisiert auf A-Grade-Qualität (93%):
  - Hinzugefügt azure-openai-chat zu allen relevanten Abschnitten
  - Lokale Beispielanzahl von 3 auf 4 aktualisiert
  - Hinzugefügt zur Tabelle der KI-Anwendungsbeispiele
  - In Quick Start für fortgeschrittene Nutzer integriert
  - Hinzugefügt zur Azure AI Foundry Templates-Sektion
  - Vergleichsmatrix und Technologie-Findungsabschnitte aktualisiert
- **Dokumentationsqualität**: Verbesserte B+ (87%) → A- (92%) im gesamten `docs`-Ordner:
  - Erwartete Ausgaben zu kritischen Kommando-Beispielen hinzugefügt
  - Verifizierungsschritte für Konfigurationsänderungen integriert
  - Praktisches Lernen durch Übungen verbessert

#### Änderungen
- **Lernfortschritt**: Bessere Integration von KI-Beispielen für fortgeschrittene Lernende
- **Dokumentationsstruktur**: Mehr umsetzbare Übungen mit klaren Ergebnissen
- **Verifizierungsprozess**: Explizite Erfolgskriterien zu wichtigen Workflows hinzugefügt

#### Verbesserte Bereiche
- **Entwicklererfahrung**: Azure OpenAI-Bereitstellung dauert jetzt 35-45 Minuten (vs. 60-90 für komplexe Alternativen)
- **Kostentransparenz**: Klare Kostenschätzungen ($50-200/Monat) für Azure OpenAI-Beispiel
- **Lernweg**: KI-Entwickler haben klaren Einstiegspunkt mit azure-openai-chat
- **Dokumentationsstandards**: Konsistente erwartete Ausgaben und Verifizierungsschritte

#### Validiert
- ✅ Azure OpenAI-Beispiel vollständig funktionsfähig mit `azd up`
- ✅ Alle 11 Implementierungsdateien syntaktisch korrekt
- ✅ README-Anweisungen entsprechen der tatsächlichen Bereitstellungserfahrung
- ✅ Dokumentationslinks an 8+ Stellen aktualisiert
- ✅ Beispiele-Index spiegelt genau 4 lokale Beispiele wider
- ✅ Keine doppelten externen Links in Tabellen
- ✅ Alle Navigationsreferenzen korrekt

#### Technische Umsetzung
- **Azure OpenAI-Architektur**: GPT-4 + Key Vault + Container Apps-Muster
- **Sicherheit**: Verwaltete Identität bereit, Geheimnisse im Key Vault
- **Überwachung**: Application Insights-Integration
- **Kostenmanagement**: Token-Verfolgung und Nutzungsoptimierung
- **Bereitstellung**: Einzelner `azd up`-Befehl für vollständige Einrichtung

### [v3.6.0] - 19.11.2025

#### Hauptupdate: Container-App-Bereitstellungsbeispiele
**Diese Version führt umfassende, produktionsbereite Container-Anwendungsbereitstellungsbeispiele mit Azure Developer CLI (AZD) ein, mit vollständiger Dokumentation und Integration in den Lernweg.**

#### Hinzugefügt
- **🚀 Container-App-Beispiele**: Neue lokale Beispiele in `examples/container-app/`:
  - [Master Guide](examples/container-app/README.md): Vollständiger Überblick über containerisierte Bereitstellungen, Quick Start, Produktion und fortgeschrittene Muster
  - [Simple Flask API](../../examples/container-app/simple-flask-api): Anfängerfreundliche REST-API mit Scale-to-Zero, Gesundheitsprüfungen, Überwachung und Fehlerbehebung
  - [Microservices Architektur](../../examples/container-app/microservices): Produktionsbereite Multi-Service-Bereitstellung (API Gateway, Produkt, Bestellung, Benutzer, Benachrichtigung), asynchrone Nachrichtenübermittlung, Service Bus, Cosmos DB, Azure SQL, verteiltes Tracing, Blue-Green/Canary-Bereitstellung
- **Best Practices**: Sicherheit, Überwachung, Kostenoptimierung und CI/CD-Leitfäden für containerisierte Workloads
- **Codebeispiele**: Vollständige `azure.yaml`, Bicep-Vorlagen und mehrsprachige Service-Implementierungen (Python, Node.js, C#, Go)
- **Tests & Fehlerbehebung**: End-to-End-Test-Szenarien, Überwachungskommandos, Fehlerbehebungsleitfäden

#### Änderungen
- **README.md**: Aktualisiert, um neue Container-App-Beispiele unter "Lokale Beispiele - Container-Anwendungen" zu präsentieren und zu verlinken
- **examples/README.md**: Aktualisiert, um Container-App-Beispiele hervorzuheben, Vergleichsmatrix-Einträge hinzuzufügen und Technologie-/Architekturreferenzen zu aktualisieren
- **Kursübersicht & Studienleitfaden**: Aktualisiert, um neue Container-App-Beispiele und Bereitstellungsmuster in relevanten Kapiteln zu referenzieren

#### Validiert
- ✅ Alle neuen Beispiele bereitstellbar mit `azd up` und folgen Best Practices
- ✅ Dokumentations-Querverweise und Navigation aktualisiert
- ✅ Beispiele decken Anfänger- bis Fortgeschrittenenszenarien ab, einschließlich Produktions-Microservices

#### Hinweise
- **Umfang**: Englische Dokumentation und Beispiele
- **Nächste Schritte**: Erweiterung mit zusätzlichen fortgeschrittenen Container-Mustern und CI/CD-Automatisierung in zukünftigen Versionen

### [v3.5.0] - 19.11.2025

#### Produktumbenennung: Microsoft Foundry
**Diese Version implementiert eine umfassende Produktnamensänderung von "Azure AI Foundry" zu "Microsoft Foundry" in der gesamten englischen Dokumentation, um die offizielle Umbenennung von Microsoft widerzuspiegeln.**

#### Änderungen
- **🔄 Produktnamen-Update**: Vollständige Umbenennung von "Azure AI Foundry" zu "Microsoft Foundry"
  - Alle Referenzen in englischer Dokumentation im `docs/`-Ordner aktualisiert
  - Ordner umbenannt: `docs/ai-foundry/` → `docs/microsoft-foundry/`
  - Datei umbenannt: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Insgesamt: 23 Inhaltsreferenzen in 7 Dokumentationsdateien aktualisiert

- **📁 Ordnerstrukturänderungen**:
  - `docs/ai-foundry/` umbenannt zu `docs/microsoft-foundry/`
  - Alle Querverweise aktualisiert, um neue Ordnerstruktur widerzuspiegeln
  - Navigationslinks in der gesamten Dokumentation validiert

- **📄 Dateiumbenennungen**:
  - `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
  - Alle internen Links aktualisiert, um neuen Dateinamen zu referenzieren

#### Aktualisierte Dateien
- **Kapitel-Dokumentation** (7 Dateien):
  - `docs/microsoft-foundry/ai-model-deployment.md` - 3 Navigationslink-Updates
  - `docs/microsoft-foundry/ai-workshop-lab.md` - 4 Produktnamen-Referenzen aktualisiert
  - `docs/microsoft-foundry/microsoft-foundry-integration.md` - Bereits Microsoft Foundry verwendet (aus vorherigen Updates)
  - `docs/microsoft-foundry/production-ai-practices.md` - 3 Referenzen aktualisiert (Übersicht, Community-Feedback, Dokumentation)
  - `docs/getting-started/azd-basics.md` - 4 Querverweis-Links aktualisiert
  - `docs/getting-started/first-project.md` - 2 Kapitel-Navigationslinks aktualisiert
  - `docs/getting-started/installation.md` - 2 Links zum nächsten Kapitel aktualisiert
  - `docs/troubleshooting/ai-troubleshooting.md` - 3 Referenzen aktualisiert (Navigation, Discord-Community)
  - `docs/troubleshooting/common-issues.md` - 1 Navigationslink aktualisiert
  - `docs/troubleshooting/debugging.md` - 1 Navigationslink aktualisiert

- **Kursstrukturdateien** (2 Dateien):
  - `README.md` - 17 Referenzen aktualisiert (Kursübersicht, Kapitelüberschriften, Templates-Sektion, Community-Einblicke)
  - `course-outline.md` - 14 Referenzen aktualisiert (Übersicht, Lernziele, Kapitelressourcen)

#### Validiert
- ✅ Keine verbleibenden "ai-foundry"-Ordnerpfad-Referenzen in englischen Dokumenten
- ✅ Keine verbleibenden "Azure AI Foundry"-Produktnamen-Referenzen in englischen Dokumenten
- ✅ Alle Navigationslinks funktionieren mit neuer Ordnerstruktur
- ✅ Datei- und Ordnerumbenennungen erfolgreich abgeschlossen
- ✅ Querverweise zwischen Kapiteln validiert

#### Hinweise
- **Umfang**: Änderungen nur in englischer Dokumentation im `docs/`-Ordner
- **Übersetzungen**: Übersetzungsordner (`translations/`) in dieser Version nicht aktualisiert
- **Workshop**: Workshop-Materialien (`workshop/`) in dieser Version nicht aktualisiert
- **Beispiele**: Beispieldateien können noch auf veraltete Benennungen verweisen (wird in einem zukünftigen Update behoben)
- **Externe Links**: Externe URLs und GitHub-Repository-Verweise bleiben unverändert

#### Migrationsleitfaden für Mitwirkende
Falls Sie lokale Branches oder Dokumentationen haben, die auf die alte Struktur verweisen:
1. Aktualisieren Sie Ordnerverweise: `docs/ai-foundry/` → `docs/microsoft-foundry/`
2. Aktualisieren Sie Dateiverweise: `azure-ai-foundry-integration.md` → `microsoft-foundry-integration.md`
3. Ersetzen Sie den Produktnamen: "Azure AI Foundry" → "Microsoft Foundry"
4. Überprüfen Sie, ob alle internen Dokumentationslinks weiterhin funktionieren

---

### [v3.4.0] - 2025-10-24

#### Vorschau auf Infrastruktur und Verbesserungen der Validierung
**Diese Version bietet umfassende Unterstützung für die neue Azure Developer CLI-Vorschaufunktion und verbessert die Benutzererfahrung in Workshops.**

#### Hinzugefügt
- **🧪 azd provision --preview Feature-Dokumentation**: Umfassende Abdeckung der neuen Infrastruktur-Vorschaufunktion
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration in den Bereitstellungsleitfaden mit Anwendungsfällen und Vorteilen
  - Integration von Vorabprüfungen für eine sicherere Bereitstellungsvalidierung
  - Aktualisierungen des Einstiegshandbuchs mit sicherheitsorientierten Bereitstellungspraktiken
- **🚧 Workshop-Status-Banner**: Professionelles HTML-Banner, das den Entwicklungsstatus des Workshops anzeigt
  - Gradientendesign mit Bauindikatoren für klare Benutzerkommunikation
  - Zeitstempel der letzten Aktualisierung für Transparenz
  - Mobilfreundliches Design für alle Gerätetypen

#### Verbesserungen
- **Infrastruktursicherheit**: Vorschaufunktionalität in die gesamte Bereitstellungsdokumentation integriert
- **Vorbereitungsvalidierung**: Automatisierte Skripte beinhalten jetzt Tests der Infrastrukturvorschau
- **Entwickler-Workflow**: Aktualisierte Befehlssequenzen, die die Vorschau als Best Practice einbeziehen
- **Workshop-Erfahrung**: Klare Erwartungen für Benutzer hinsichtlich des Entwicklungsstatus der Inhalte

#### Geändert
- **Best Practices für Bereitstellungen**: Vorschauorientierter Workflow wird jetzt als empfohlener Ansatz empfohlen
- **Dokumentationsfluss**: Infrastrukturvalidierung wurde früher im Lernprozess positioniert
- **Workshop-Präsentation**: Professionelle Statuskommunikation mit klarer Entwicklungszeitachse

#### Verbesserungen
- **Sicherheitsorientierter Ansatz**: Infrastrukturänderungen können jetzt vor der Bereitstellung validiert werden
- **Teamzusammenarbeit**: Vorschauergebnisse können zur Überprüfung und Genehmigung geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcenkosten vor der Bereitstellung
- **Risikominderung**: Reduzierte Bereitstellungsfehler durch vorherige Validierung

#### Technische Umsetzung
- **Integration in mehrere Dokumente**: Vorschaufunktion in 4 wichtigen Dateien dokumentiert
- **Befehlsmuster**: Konsistente Syntax und Beispiele in der gesamten Dokumentation
- **Best Practice-Integration**: Vorschau in Validierungs-Workflows und Skripte integriert
- **Visuelle Indikatoren**: Klare NEU-Markierungen für bessere Auffindbarkeit

#### Workshop-Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Gradientendesign
- **Benutzererfahrung**: Klare Entwicklungsstatusanzeige verhindert Verwirrung
- **Professionelle Präsentation**: Erhält die Glaubwürdigkeit des Repositories und setzt Erwartungen
- **Zeitliche Transparenz**: Zeitstempel der letzten Aktualisierung im Oktober 2025 für Verantwortlichkeit

### [v3.3.0] - 2025-09-24

#### Verbesserte Workshop-Materialien und interaktive Lernerfahrung
**Diese Version bietet umfassende Workshop-Materialien mit browserbasierten interaktiven Anleitungen und strukturierten Lernpfaden.**

#### Hinzugefügt
- **🎥 Interaktive Workshop-Anleitung**: Browserbasierte Workshop-Erfahrung mit MkDocs-Vorschaufunktion
- **📝 Strukturierte Workshop-Anweisungen**: 7-stufiger geführter Lernpfad von der Entdeckung bis zur Anpassung
  - 0-Einführung: Überblick und Einrichtung des Workshops
  - 1-AI-Template-Auswahl: Entdeckungs- und Auswahlprozess für Vorlagen
  - 2-AI-Template-Validierung: Bereitstellungs- und Validierungsverfahren
  - 3-AI-Template-Analyse: Verständnis der Vorlagenarchitektur
  - 4-AI-Template-Konfiguration: Konfiguration und Anpassung
  - 5-AI-Template-Anpassung: Erweiterte Modifikationen und Iterationen
  - 6-Infrastruktur-Abbau: Bereinigung und Ressourcenmanagement
  - 7-Abschluss: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Tools**: MkDocs-Konfiguration mit Material-Theme für eine verbesserte Lernerfahrung
- **🎯 Praktischer Lernpfad**: 3-Schritte-Methodik (Entdeckung → Bereitstellung → Anpassung)
- **📱 GitHub Codespaces-Integration**: Nahtlose Einrichtung der Entwicklungsumgebung

#### Verbesserungen
- **AI Workshop Lab**: Erweitert mit einer umfassenden 2-3-stündigen strukturierten Lernerfahrung
- **Workshop-Dokumentation**: Professionelle Präsentation mit Navigation und visuellen Hilfsmitteln
- **Lernfortschritt**: Klare Schritt-für-Schritt-Anleitung von der Vorlagenauswahl bis zur Produktionsbereitstellung
- **Entwicklererfahrung**: Integrierte Tools für optimierte Entwicklungs-Workflows

#### Verbesserungen
- **Barrierefreiheit**: Browserbasierte Oberfläche mit Such-, Kopier- und Theme-Umschaltfunktionen
- **Selbstgesteuertes Lernen**: Flexibler Workshop-Aufbau für unterschiedliche Lerngeschwindigkeiten
- **Praktische Anwendung**: Szenarien für die Bereitstellung von AI-Vorlagen in der realen Welt
- **Community-Integration**: Discord-Integration für Workshop-Support und Zusammenarbeit

#### Workshop-Funktionen
- **Integrierte Suche**: Schnelle Stichwort- und Lektionensuche
- **Codeblöcke kopieren**: Hover-to-Copy-Funktion für alle Codebeispiele
- **Theme-Umschaltung**: Unterstützung für Dunkel-/Hellmodus für unterschiedliche Vorlieben
- **Visuelle Assets**: Screenshots und Diagramme für besseres Verständnis
- **Hilfe-Integration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 2025-09-17

#### Umfassende Navigationsumstrukturierung und kapitelbasiertes Lernsystem
**Diese Version führt eine umfassende kapitelbasierte Lernstruktur mit verbesserter Navigation im gesamten Repository ein.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Umstrukturierung des gesamten Kurses in 8 progressive Lernkapitel
  - Kapitel 1: Grundlagen & Schnellstart (⭐ - 30-45 Minuten)
  - Kapitel 2: AI-First-Entwicklung (⭐⭐ - 1-2 Stunden)
  - Kapitel 3: Konfiguration & Authentifizierung (⭐⭐ - 45-60 Minuten)
  - Kapitel 4: Infrastruktur als Code & Bereitstellung (⭐⭐⭐ - 1-1,5 Stunden)
  - Kapitel 5: Multi-Agent-AI-Lösungen (⭐⭐⭐⭐ - 2-3 Stunden)
  - Kapitel 6: Vorbereitungsvalidierung & Planung (⭐⭐ - 1 Stunde)
  - Kapitel 7: Fehlerbehebung & Debugging (⭐⭐ - 1-1,5 Stunden)
  - Kapitel 8: Produktions- & Unternehmensmuster (⭐⭐⭐⭐ - 2-3 Stunden)
- **📚 Umfassendes Navigationssystem**: Konsistente Navigationsheader und -footer in der gesamten Dokumentation
- **🎯 Fortschrittsverfolgung**: Kursabschluss-Checkliste und Lernverifizierungssystem
- **🗺️ Lernpfad-Anleitung**: Klare Einstiegspunkte für unterschiedliche Erfahrungsstufen und Ziele
- **🔗 Querverweis-Navigation**: Verknüpfung verwandter Kapitel und Voraussetzungen

#### Verbesserungen
- **README-Struktur**: Umgewandelt in eine strukturierte Lernplattform mit kapitelbasierter Organisation
- **Dokumentationsnavigation**: Jede Seite enthält jetzt Kapitelkontext und Fortschrittsanleitung
- **Vorlagenorganisation**: Beispiele und Vorlagen den entsprechenden Lernkapiteln zugeordnet
- **Ressourcenintegration**: Spickzettel, FAQs und Studienleitfäden mit relevanten Kapiteln verknüpft
- **Workshop-Integration**: Praktische Übungen den Lernzielen mehrerer Kapitel zugeordnet

#### Geändert
- **Lernfortschritt**: Von linearer Dokumentation zu flexiblem kapitelbasiertem Lernen umgestellt
- **Konfigurationsplatzierung**: Konfigurationsleitfaden als Kapitel 3 für besseren Lernfluss neu positioniert
- **AI-Inhaltsintegration**: Bessere Integration von AI-spezifischen Inhalten im gesamten Lernprozess
- **Produktionsinhalte**: Erweiterte Muster für Unternehmensanwender in Kapitel 8 konsolidiert

#### Verbesserungen
- **Benutzererfahrung**: Klare Navigationspfade und Kapitel-Fortschrittsindikatoren
- **Barrierefreiheit**: Konsistente Navigationsmuster für einfachere Kursdurchquerung
- **Professionelle Präsentation**: Universitätsähnliche Kursstruktur, geeignet für akademische und berufliche Schulungen
- **Lerneffizienz**: Reduzierte Zeit zur Auffindung relevanter Inhalte durch verbesserte Organisation

#### Technische Umsetzung
- **Navigationsheader**: Standardisierte Kapitelnavigation in über 40 Dokumentationsdateien
- **Footer-Navigation**: Konsistente Fortschrittsanleitung und Kapitelabschlussindikatoren
- **Querverlinkung**: Umfassendes internes Verlinkungssystem, das verwandte Konzepte verbindet
- **Kapitelzuordnung**: Vorlagen und Beispiele klar mit Lernzielen verknüpft

#### Studienleitfaden-Verbesserung
- **📚 Umfassende Lernziele**: Studienleitfaden neu strukturiert, um mit dem 8-Kapitel-System übereinzustimmen
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Abschluss-Checklisten
- **❓ Bewertungsfragen**: Wissensvalidierungsfragen für jedes Kapitel mit professionellen Ergebnissen
- **🛠️ Praktische Übungen**: Praktische Aktivitäten mit realen Bereitstellungsszenarien und Fehlerbehebung
- **📊 Fähigkeitsfortschritt**: Klare Entwicklung von grundlegenden Konzepten zu Unternehmensmustern mit Fokus auf Karriereentwicklung
- **🎓 Zertifizierungsrahmen**: Ergebnisse für berufliche Entwicklung und Anerkennung in der Community
- **⏱️ Zeitmanagement**: Strukturierter 10-Wochen-Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 2025-09-17

#### Verbesserte Multi-Agent-AI-Lösungen
**Diese Version verbessert die Multi-Agent-Retail-Lösung mit besseren Agentennamen und verbesserter Dokumentation.**

#### Geändert
- **Multi-Agent-Terminologie**: "Cora agent" durch "Customer agent" in der gesamten Multi-Agent-Retail-Lösung ersetzt, um ein besseres Verständnis zu gewährleisten
- **Agentenarchitektur**: Alle Dokumentationen, ARM-Vorlagen und Codebeispiele mit konsistenter "Customer agent"-Benennung aktualisiert
- **Konfigurationsbeispiele**: Modernisierte Agentenkonfigurationsmuster mit aktualisierten Benennungen
- **Dokumentationskonsistenz**: Sicherstellung, dass alle Verweise professionelle, beschreibende Agentennamen verwenden

#### Verbesserungen
- **ARM-Vorlagenpaket**: Retail-multiagent-arm-template mit Customer-Agent-Verweisen aktualisiert
- **Architekturdiagramme**: Mermaid-Diagramme mit aktualisierten Agentennamen erneuert
- **Codebeispiele**: Python-Klassen und Implementierungsbeispiele verwenden jetzt die Bezeichnung CustomerAgent
- **Umgebungsvariablen**: Alle Bereitstellungsskripte auf CUSTOMER_AGENT_NAME-Konventionen aktualisiert

#### Verbesserungen
- **Entwicklererfahrung**: Klarere Agentenrollen und Verantwortlichkeiten in der Dokumentation
- **Produktionsreife**: Bessere Ausrichtung an Unternehmensbenennungskonventionen
- **Lernmaterialien**: Intuitivere Agentennamen für Bildungszwecke
- **Vorlagenbenutzbarkeit**: Vereinfachtes Verständnis der Agentenfunktionen und Bereitstellungsmuster

#### Technische Details
- Aktualisierte Mermaid-Architekturdiagramme mit CustomerAgent-Verweisen
- Ersetzte CoraAgent-Klassennamen durch CustomerAgent in Python-Beispielen
- ARM-Template-JSON-Konfigurationen auf "customer"-Agententyp umgestellt
- Umgebungsvariablen von CORA_AGENT_* auf CUSTOMER_AGENT_* Muster geändert
- Alle Bereitstellungsbefehle und Containerkonfigurationen aktualisiert

### [v3.0.0] - 2025-09-12

#### Wichtige Änderungen - Fokus auf AI-Entwickler und Azure AI Foundry-Integration
**Diese Version transformiert das Repository in eine umfassende AI-fokussierte Lernressource mit Azure AI Foundry-Integration.**

#### Hinzugefügt
- **🤖 AI-First-Lernpfad**: Vollständige Umstrukturierung mit Priorisierung von AI-Entwicklern und -Ingenieuren
- **Azure AI Foundry-Integrationsleitfaden**: Umfassende Dokumentation zur Verbindung von AZD mit Azure AI Foundry-Diensten
- **AI-Modell-Bereitstellungsmuster**: Detaillierter Leitfaden zu Modellauswahl, Konfiguration und Produktionsbereitstellungsstrategien
- **AI Workshop Lab**: 2-3-stündiger praktischer Workshop zur Umwandlung von AI-Anwendungen in AZD-bereitstellbare Lösungen
- **Best Practices für Produktions-AI**: Unternehmensreife Muster für Skalierung, Überwachung und Sicherung von AI-Workloads
- **AI-spezifischer Fehlerbehebungsleitfaden**: Umfassende Fehlerbehebung für Azure OpenAI, Cognitive Services und AI-Bereitstellungsprobleme
- **AI-Vorlagengalerie**: Ausgewählte Sammlung von Azure AI Foundry-Vorlagen mit Komplexitätsbewertungen
- **Workshop-Materialien**: Vollständige Workshop-Struktur mit praktischen Übungen und Referenzmaterialien

#### Verbesserungen
- **README-Struktur**: AI-Entwicklerfokus mit 45 % Community-Interesse-Daten aus dem Azure AI Foundry Discord
- **Lernpfade**: Dedizierter AI-Entwicklerpfad neben traditionellen Pfaden für Studenten und DevOps-Ingenieure
- **Vorlagenempfehlungen**: Vorgestellte AI-Vorlagen einschließlich azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community-Integration**: Verbesserter Discord-Community-Support mit AI-spezifischen Kanälen und Diskussionen

#### Sicherheits- & Produktionsfokus
- **Muster für verwaltete Identitäten**: AI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Kostenoptimierung**: Token-Nutzungsverfolgung und Budgetkontrollen für AI-Workloads
- **Multi-Region-Bereitstellung**: Strategien für die globale Bereitstellung von AI-Anwendungen
- **Leistungsüberwachung**: AI-spezifische Metriken und Integration von Application Insights

#### Dokumentationsqualität
- **Linearer Kursaufbau**: Logische Progression von Anfänger- zu fortgeschrittenen AI-Bereitstellungsmustern
- **Validierte URLs**: Alle externen Repository-Links überprüft und zugänglich
- **Vollständige Referenz**: Alle internen Dokumentationslinks validiert und funktional
- **Produktionsreife**: Unternehmensmuster für reale Bereitstellungen mit Beispielen

### [v2.0.0] - 2025-09-09

#### Wichtige Änderungen - Repository-Umstrukturierung und professionelle Verbesserung
**Diese Version stellt eine bedeutende Überarbeitung der Repository-Struktur und der Inhaltspräsentation dar.**

#### Hinzugefügt
- **Strukturiertes Lernframework**: Alle Dokumentationsseiten enthalten jetzt Abschnitte zu Einführung, Lernzielen und Lernergebnissen
- **Navigationssystem**: Vorherige/Nächste-Lektionslinks in der gesamten Dokumentation für geführte Lernfortschritte hinzugefügt
- **Studienleitfaden**: Umfassender study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professionelle Präsentation**: Alle Emoji-Symbole entfernt für verbesserte Barrierefreiheit und professionelles Erscheinungsbild
- **Verbesserte Inhaltsstruktur**: Verbesserte Organisation und Ablauf der Lernmaterialien

#### Geändert
- **Dokumentationsformat**: Alle Dokumentationen mit einheitlicher, lernfokussierter Struktur standardisiert
- **Navigationsfluss**: Logische Progression durch alle Lernmaterialien implementiert
- **Inhaltspräsentation**: Dekorative Elemente entfernt zugunsten einer klaren, professionellen Formatierung
- **Linkstruktur**: Alle internen Links aktualisiert, um das neue Navigationssystem zu unterstützen

#### Verbesserungen
- **Barrierefreiheit**: Abhängigkeit von Emojis entfernt für bessere Kompatibilität mit Screenreadern
- **Professionelles Erscheinungsbild**: Saubere, akademische Präsentation, geeignet für Unternehmensschulungen
- **Lernerfahrung**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Inhaltsorganisation**: Bessere logische Abfolge und Verbindung zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Erstveröffentlichung - Umfassendes AZD-Lernrepository

#### Hinzugefügt
- **Kernstruktur der Dokumentation**
  - Vollständige Einführungsleitfäden
  - Umfassende Dokumentation zu Bereitstellung und Provisionierung
  - Detaillierte Ressourcen zur Fehlerbehebung und Debugging-Leitfäden
  - Tools und Verfahren zur Validierung vor der Bereitstellung

- **Einführungsmodul**
  - AZD-Grundlagen: Kernkonzepte und Terminologie
  - Installationsanleitung: Plattform-spezifische Setup-Anweisungen
  - Konfigurationsanleitung: Einrichtung der Umgebung und Authentifizierung
  - Erstes Projekt-Tutorial: Schritt-für-Schritt praktisches Lernen

- **Bereitstellungs- und Provisionierungsmodul**
  - Bereitstellungsanleitung: Vollständige Workflow-Dokumentation
  - Provisionierungsanleitung: Infrastruktur als Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Architektur-Muster für Multi-Service-Anwendungen

- **Validierungsmodul vor der Bereitstellung**
  - Kapazitätsplanung: Validierung der Azure-Ressourcenverfügbarkeit
  - SKU-Auswahl: Umfassende Anleitung zu Service-Tiers
  - Pre-Flight-Checks: Automatisierte Validierungsskripte (PowerShell und Bash)
  - Tools zur Kostenschätzung und Budgetplanung

- **Fehlerbehebungsmodul**
  - Häufige Probleme: Häufig auftretende Probleme und Lösungen
  - Debugging-Leitfaden: Systematische Fehlerbehebungsmethoden
  - Fortgeschrittene Diagnosetechniken und Tools
  - Leistungsüberwachung und Optimierung

- **Ressourcen und Referenzen**
  - Befehlsübersicht: Schnelle Referenz für wesentliche Befehle
  - Glossar: Umfassende Definitionen von Begriffen und Akronymen
  - FAQ: Detaillierte Antworten auf häufige Fragen
  - Links zu externen Ressourcen und Community-Verbindungen

- **Beispiele und Vorlagen**
  - Beispiel für eine einfache Webanwendung
  - Vorlage für die Bereitstellung einer statischen Website
  - Konfiguration für Containeranwendungen
  - Datenbank-Integrationsmuster
  - Beispiele für Microservices-Architekturen
  - Implementierungen von serverlosen Funktionen

#### Funktionen
- **Plattformübergreifende Unterstützung**: Installations- und Konfigurationsanleitungen für Windows, macOS und Linux
- **Verschiedene Fähigkeitsstufen**: Inhalte für Studenten bis hin zu professionellen Entwicklern
- **Praktischer Fokus**: Praktische Beispiele und reale Szenarien
- **Umfassende Abdeckung**: Von grundlegenden Konzepten bis hin zu fortgeschrittenen Unternehmensmustern
- **Sicherheitsorientierter Ansatz**: Sicherheitsbest Practices durchgehend integriert
- **Kostenoptimierung**: Anleitung für kosteneffiziente Bereitstellungen und Ressourcenmanagement

#### Dokumentationsqualität
- **Detaillierte Codebeispiele**: Praktische, getestete Codebeispiele
- **Schritt-für-Schritt-Anleitungen**: Klare, umsetzbare Anweisungen
- **Umfassende Fehlerbehandlung**: Fehlerbehebung für häufige Probleme
- **Integration von Best Practices**: Industriestandards und Empfehlungen
- **Versionskompatibilität**: Aktuell mit den neuesten Azure-Diensten und AZD-Funktionen

## Geplante zukünftige Erweiterungen

### Version 3.1.0 (Geplant)
#### Erweiterung der KI-Plattform
- **Multi-Modell-Unterstützung**: Integrationsmuster für Hugging Face, Azure Machine Learning und benutzerdefinierte Modelle
- **KI-Agenten-Frameworks**: Vorlagen für LangChain-, Semantic Kernel- und AutoGen-Bereitstellungen
- **Fortgeschrittene RAG-Muster**: Optionen für Vektordatenbanken jenseits von Azure AI Search (Pinecone, Weaviate usw.)
- **KI-Überwachung**: Verbesserte Überwachung der Modellleistung, Token-Nutzung und Antwortqualität

#### Entwicklererfahrung
- **VS Code-Erweiterung**: Integrierte AZD + AI Foundry Entwicklungsumgebung
- **GitHub Copilot-Integration**: KI-unterstützte AZD-Vorlagengenerierung
- **Interaktive Tutorials**: Praktische Codierungsübungen mit automatisierter Validierung für KI-Szenarien
- **Videoinhalte**: Ergänzende Video-Tutorials für visuelle Lerner mit Fokus auf KI-Bereitstellungen

### Version 4.0.0 (Geplant)
#### Unternehmens-KI-Muster
- **Governance-Framework**: Governance, Compliance und Audit-Trails für KI-Modelle
- **Multi-Tenant-KI**: Muster für die Bereitstellung isolierter KI-Dienste für mehrere Kunden
- **Edge-KI-Bereitstellung**: Integration mit Azure IoT Edge und Container-Instanzen
- **Hybrid-Cloud-KI**: Multi-Cloud- und hybride Bereitstellungsmuster für KI-Workloads

#### Erweiterte Funktionen
- **Automatisierung von KI-Pipelines**: MLOps-Integration mit Azure Machine Learning-Pipelines
- **Erweiterte Sicherheit**: Zero-Trust-Muster, private Endpunkte und erweiterter Bedrohungsschutz
- **Leistungsoptimierung**: Fortgeschrittene Abstimmungs- und Skalierungsstrategien für KI-Anwendungen mit hohem Durchsatz
- **Globale Verteilung**: Muster für Content-Delivery und Edge-Caching für KI-Anwendungen

### Version 3.0.0 (Geplant) - Ersetzt durch aktuelle Veröffentlichung
#### Vorgeschlagene Ergänzungen - Jetzt in v3.0.0 implementiert
- ✅ **KI-fokussierte Inhalte**: Umfassende Integration der Azure AI Foundry (Abgeschlossen)
- ✅ **Interaktive Tutorials**: Praktisches KI-Workshop-Labor (Abgeschlossen)
- ✅ **Erweitertes Sicherheitsmodul**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Leistungsoptimierung**: Abstimmungsstrategien für KI-Workloads (Abgeschlossen)

### Version 2.1.0 (Geplant) - Teilweise in v3.0.0 implementiert
#### Kleine Verbesserungen - Einige im aktuellen Release abgeschlossen
- ✅ **Zusätzliche Beispiele**: KI-fokussierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Erweiterte FAQ**: KI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool-Integration**: Erweiterte Leitfäden zur Integration von IDEs und Editoren
- ✅ **Erweiterte Überwachung**: KI-spezifische Überwachungs- und Alarmierungsmuster (Abgeschlossen)

#### Noch für zukünftige Veröffentlichungen geplant
- **Mobilfreundliche Dokumentation**: Responsives Design für mobiles Lernen
- **Offline-Zugriff**: Herunterladbare Dokumentationspakete
- **Erweiterte IDE-Integration**: VS Code-Erweiterung für AZD + KI-Workflows
- **Community-Dashboard**: Echtzeit-Community-Metriken und Beitragsverfolgung

## Beitrag zum Changelog

### Änderungen melden
Beim Beitrag zu diesem Repository stellen Sie bitte sicher, dass Changelog-Einträge Folgendes enthalten:

1. **Versionsnummer**: Nach semantischer Versionierung (major.minor.patch)
2. **Datum**: Veröffentlichungs- oder Aktualisierungsdatum im Format JJJJ-MM-TT
3. **Kategorie**: Hinzugefügt, Geändert, Veraltet, Entfernt, Behoben, Sicherheit
4. **Klare Beschreibung**: Präzise Beschreibung der Änderungen
5. **Auswirkungsbewertung**: Wie sich Änderungen auf bestehende Benutzer auswirken

### Änderungskategorien

#### Hinzugefügt
- Neue Funktionen, Dokumentationsabschnitte oder Fähigkeiten
- Neue Beispiele, Vorlagen oder Lernressourcen
- Zusätzliche Tools, Skripte oder Utilities

#### Geändert
- Änderungen an bestehender Funktionalität oder Dokumentation
- Aktualisierungen zur Verbesserung von Klarheit oder Genauigkeit
- Umstrukturierung von Inhalten oder Organisation

#### Veraltet
- Funktionen oder Ansätze, die auslaufen
- Dokumentationsabschnitte, die entfernt werden sollen
- Methoden, die bessere Alternativen haben

#### Entfernt
- Funktionen, Dokumentationen oder Beispiele, die nicht mehr relevant sind
- Veraltete Informationen oder veraltete Ansätze
- Redundante oder konsolidierte Inhalte

#### Behoben
- Korrekturen von Fehlern in Dokumentation oder Code
- Lösung von gemeldeten Problemen oder Fehlern
- Verbesserungen der Genauigkeit oder Funktionalität

#### Sicherheit
- Sicherheitsbezogene Verbesserungen oder Korrekturen
- Aktualisierungen zu Sicherheitsbest Practices
- Behebung von Sicherheitslücken

### Richtlinien zur semantischen Versionierung

#### Hauptversion (X.0.0)
- Änderungen, die Benutzeraktionen erfordern
- Bedeutende Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik verändern

#### Nebenversion (X.Y.0)
- Neue Funktionen oder Inhaltszusätze
- Verbesserungen, die die Rückwärtskompatibilität beibehalten
- Zusätzliche Beispiele, Tools oder Ressourcen

#### Patch-Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleine Verbesserungen an bestehenden Inhalten
- Klarstellungen und kleine Erweiterungen

## Community-Feedback und Vorschläge

Wir ermutigen aktiv Community-Feedback, um diese Lernressource zu verbessern:

### So geben Sie Feedback
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Themen willkommen)
- **Discord-Diskussionen**: Ideen teilen und mit der Azure AI Foundry-Community interagieren
- **Pull Requests**: Direkte Verbesserungen zu Inhalten beitragen, insbesondere KI-Vorlagen und Leitfäden
- **Azure AI Foundry Discord**: Teilnahme am #Azure-Kanal für AZD + KI-Diskussionen
- **Community-Foren**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback-Kategorien
- **KI-Inhaltsgenauigkeit**: Korrekturen zu Informationen über KI-Dienstintegration und Bereitstellung
- **Lernerfahrung**: Vorschläge für einen verbesserten Lernfluss für KI-Entwickler
- **Fehlende KI-Inhalte**: Anfragen für zusätzliche KI-Vorlagen, Muster oder Beispiele
- **Barrierefreiheit**: Verbesserungen für unterschiedliche Lernbedürfnisse
- **KI-Tool-Integration**: Vorschläge für eine bessere Integration von KI-Entwicklungs-Workflows
- **Produktions-KI-Muster**: Anfragen für Unternehmens-KI-Bereitstellungsmuster

### Antwortverpflichtung
- **Antwort auf Probleme**: Innerhalb von 48 Stunden für gemeldete Probleme
- **Feature-Anfragen**: Bewertung innerhalb einer Woche
- **Community-Beiträge**: Überprüfung innerhalb einer Woche
- **Sicherheitsprobleme**: Sofortige Priorität mit beschleunigter Antwort

## Wartungsplan

### Regelmäßige Updates
- **Monatliche Überprüfungen**: Inhaltsgenauigkeit und Linkvalidierung
- **Vierteljährliche Updates**: Große Inhaltszusätze und Verbesserungen
- **Halbjährliche Überprüfungen**: Umfassende Umstrukturierung und Erweiterung
- **Jährliche Veröffentlichungen**: Hauptversion-Updates mit bedeutenden Verbesserungen

### Überwachung und Qualitätssicherung
- **Automatisierte Tests**: Regelmäßige Validierung von Codebeispielen und Links
- **Integration von Community-Feedback**: Regelmäßige Einbindung von Benutzer-Vorschlägen
- **Technologie-Updates**: Ausrichtung an den neuesten Azure-Diensten und AZD-Veröffentlichungen
- **Barrierefreiheitsprüfungen**: Regelmäßige Überprüfung auf inklusive Designprinzipien

## Versionsunterstützungsrichtlinie

### Unterstützung der aktuellen Version
- **Neueste Hauptversion**: Volle Unterstützung mit regelmäßigen Updates
- **Vorherige Hauptversion**: Sicherheitsupdates und kritische Korrekturen für 12 Monate
- **Legacy-Versionen**: Nur Community-Unterstützung, keine offiziellen Updates

### Migrationsanleitung
Wenn Hauptversionen veröffentlicht werden, bieten wir:
- **Migrationsleitfäden**: Schritt-für-Schritt-Übergangsanweisungen
- **Kompatibilitätsnotizen**: Details zu Änderungen, die bestehende Funktionen betreffen
- **Tool-Unterstützung**: Skripte oder Utilities zur Unterstützung der Migration
- **Community-Unterstützung**: Dedizierte Foren für Migrationsfragen

---

**Navigation**
- **Vorherige Lektion**: [Studienleitfaden](resources/study-guide.md)
- **Nächste Lektion**: Zurück zur [Haupt-README](README.md)

**Bleiben Sie auf dem Laufenden**: Beobachten Sie dieses Repository, um Benachrichtigungen über neue Veröffentlichungen und wichtige Updates zu den Lernmaterialien zu erhalten.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->