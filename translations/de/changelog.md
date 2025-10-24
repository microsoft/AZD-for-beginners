<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ae2cfa632f02df516d4e7cdddbb4a8b5",
  "translation_date": "2025-10-24T16:28:21+00:00",
  "source_file": "changelog.md",
  "language_code": "de"
}
-->
# Änderungsprotokoll - AZD für Anfänger

## Einführung

Dieses Änderungsprotokoll dokumentiert alle bemerkenswerten Änderungen, Aktualisierungen und Verbesserungen des AZD für Anfänger Repositorys. Wir folgen den Prinzipien der semantischen Versionierung und führen dieses Protokoll, um den Nutzern zu helfen, die Änderungen zwischen den Versionen nachzuvollziehen.

## Lernziele

Durch die Überprüfung dieses Änderungsprotokolls werden Sie:
- Über neue Funktionen und Inhaltszusätze informiert bleiben
- Verbesserungen an bestehender Dokumentation verstehen
- Fehlerbehebungen und Korrekturen nachverfolgen, um Genauigkeit sicherzustellen
- Die Entwicklung der Lernmaterialien im Laufe der Zeit verfolgen

## Lernergebnisse

Nach der Überprüfung der Einträge im Änderungsprotokoll werden Sie in der Lage sein:
- Neue Inhalte und Ressourcen für das Lernen zu identifizieren
- Verstehen, welche Abschnitte aktualisiert oder verbessert wurden
- Ihren Lernweg basierend auf den aktuellsten Materialien planen
- Feedback und Vorschläge für zukünftige Verbesserungen einbringen

## Versionshistorie

### [v3.4.0] - 24.10.2025

#### Verbesserungen bei Infrastrukturvorschau und Validierung
**Diese Version bietet umfassende Unterstützung für die neue Vorschaufunktion des Azure Developer CLI und verbessert die Benutzererfahrung in Workshops.**

#### Hinzugefügt
- **🧪 Dokumentation zur Funktion "azd provision --preview"**: Umfassende Abdeckung der neuen Infrastrukturvorschaufunktion
  - Befehlsreferenz und Anwendungsbeispiele im Spickzettel
  - Detaillierte Integration in den Bereitstellungsleitfaden mit Anwendungsfällen und Vorteilen
  - Integration von Vorabprüfungen für sicherere Bereitstellungsvalidierung
  - Aktualisierungen des Leitfadens für den Einstieg mit sicherheitsorientierten Bereitstellungspraktiken
- **🚧 Workshop-Statusbanner**: Professionelles HTML-Banner, das den Entwicklungsstatus des Workshops anzeigt
  - Gradientendesign mit Bauindikatoren für klare Benutzerkommunikation
  - Letztes Aktualisierungsdatum für Transparenz
  - Mobilfreundliches Design für alle Gerätetypen

#### Verbesserungen
- **Infrastruktursicherheit**: Vorschaufunktionalität in der gesamten Bereitstellungsdokumentation integriert
- **Vorbereitungsvalidierung**: Automatisierte Skripte beinhalten jetzt Tests der Infrastrukturvorschau
- **Entwickler-Workflow**: Aktualisierte Befehlssequenzen, die die Vorschau als Best Practice einschließen
- **Workshop-Erfahrung**: Klare Erwartungen für Benutzer hinsichtlich des Entwicklungsstatus der Inhalte

#### Änderungen
- **Bereitstellungs-Best-Practices**: Vorschau-basierter Workflow wird jetzt als empfohlener Ansatz empfohlen
- **Dokumentationsfluss**: Infrastrukturvalidierung früher im Lernprozess positioniert
- **Workshop-Präsentation**: Professionelle Statuskommunikation mit klarer Entwicklungszeitlinie

#### Verbesserungen
- **Sicherheitsorientierter Ansatz**: Infrastrukturänderungen können jetzt vor der Bereitstellung validiert werden
- **Teamzusammenarbeit**: Vorschauergebnisse können zur Überprüfung und Genehmigung geteilt werden
- **Kostenbewusstsein**: Besseres Verständnis der Ressourcenkosten vor der Bereitstellung
- **Risikominderung**: Reduzierte Bereitstellungsfehler durch vorherige Validierung

#### Technische Umsetzung
- **Integration in mehrere Dokumente**: Vorschaufunktion in 4 wichtigen Dateien dokumentiert
- **Befehlsmuster**: Konsistente Syntax und Beispiele in der gesamten Dokumentation
- **Best-Practice-Integration**: Vorschau in Validierungs-Workflows und Skripte integriert
- **Visuelle Indikatoren**: Klare NEU-Markierungen für bessere Auffindbarkeit

#### Workshop-Infrastruktur
- **Statuskommunikation**: Professionelles HTML-Banner mit Gradientendesign
- **Benutzererfahrung**: Klare Entwicklungsstatusanzeige verhindert Verwirrung
- **Professionelle Präsentation**: Erhält die Glaubwürdigkeit des Repositorys und setzt Erwartungen
- **Zeitlinientransparenz**: Letztes Aktualisierungsdatum Oktober 2025 für Verantwortlichkeit

### [v3.3.0] - 24.09.2025

#### Verbesserte Workshop-Materialien und interaktive Lernerfahrung
**Diese Version bietet umfassende Workshop-Materialien mit browserbasierten interaktiven Leitfäden und strukturierten Lernpfaden.**

#### Hinzugefügt
- **🎥 Interaktiver Workshop-Leitfaden**: Browserbasierte Workshop-Erfahrung mit MkDocs-Vorschaufunktion
- **📝 Strukturierte Workshop-Anweisungen**: 7-Schritte-Lernpfad von Entdeckung bis Anpassung
  - 0-Einführung: Workshop-Übersicht und Einrichtung
  - 1-Auswahl-AI-Template: Prozess der Vorlagenauswahl und -entdeckung
  - 2-Validierung-AI-Template: Bereitstellungs- und Validierungsverfahren
  - 3-Analyse-AI-Template: Verständnis der Vorlagenarchitektur
  - 4-Konfiguration-AI-Template: Konfiguration und Anpassung
  - 5-Anpassung-AI-Template: Erweiterte Modifikationen und Iterationen
  - 6-Abbau-Infrastruktur: Bereinigung und Ressourcenmanagement
  - 7-Abschluss: Zusammenfassung und nächste Schritte
- **🛠️ Workshop-Tools**: MkDocs-Konfiguration mit Material-Theme für verbesserte Lernerfahrung
- **🎯 Praktischer Lernpfad**: 3-Schritte-Methodik (Entdeckung → Bereitstellung → Anpassung)
- **📱 GitHub Codespaces-Integration**: Nahtlose Einrichtung der Entwicklungsumgebung

#### Verbesserungen
- **AI Workshop Lab**: Erweiterung mit umfassender 2-3 Stunden strukturierter Lernerfahrung
- **Workshop-Dokumentation**: Professionelle Präsentation mit Navigation und visuellen Hilfsmitteln
- **Lernfortschritt**: Klare Schritt-für-Schritt-Anleitung von der Vorlagenauswahl bis zur Produktionsbereitstellung
- **Entwicklererfahrung**: Integrierte Tools für optimierte Entwicklungs-Workflows

#### Verbesserungen
- **Barrierefreiheit**: Browserbasierte Oberfläche mit Such-, Kopierfunktion und Theme-Umschaltung
- **Selbstgesteuertes Lernen**: Flexibler Workshop-Aufbau für unterschiedliche Lerngeschwindigkeiten
- **Praktische Anwendung**: Szenarien zur Bereitstellung von KI-Vorlagen aus der Praxis
- **Community-Integration**: Discord-Integration für Workshop-Support und Zusammenarbeit

#### Workshop-Funktionen
- **Eingebaute Suche**: Schnelle Stichwort- und Lektionenfindung
- **Codeblöcke kopieren**: Hover-to-Copy-Funktion für alle Codebeispiele
- **Theme-Umschaltung**: Unterstützung für Dunkel-/Hellmodus je nach Vorlieben
- **Visuelle Elemente**: Screenshots und Diagramme für besseres Verständnis
- **Hilfe-Integration**: Direkter Discord-Zugang für Community-Support

### [v3.2.0] - 17.09.2025

#### Umfassende Navigationsumstrukturierung und kapitelbasiertes Lernsystem
**Diese Version führt ein kapitelbasiertes Lernsystem mit verbesserter Navigation im gesamten Repository ein.**

#### Hinzugefügt
- **📚 Kapitelbasiertes Lernsystem**: Umstrukturierung des gesamten Kurses in 8 progressive Lernkapitel
  - Kapitel 1: Grundlagen & Schnellstart (⭐ - 30-45 Minuten)
  - Kapitel 2: KI-First-Entwicklung (⭐⭐ - 1-2 Stunden)
  - Kapitel 3: Konfiguration & Authentifizierung (⭐⭐ - 45-60 Minuten)
  - Kapitel 4: Infrastruktur als Code & Bereitstellung (⭐⭐⭐ - 1-1,5 Stunden)
  - Kapitel 5: Multi-Agent-KI-Lösungen (⭐⭐⭐⭐ - 2-3 Stunden)
  - Kapitel 6: Validierung & Planung vor der Bereitstellung (⭐⭐ - 1 Stunde)
  - Kapitel 7: Fehlerbehebung & Debugging (⭐⭐ - 1-1,5 Stunden)
  - Kapitel 8: Produktions- & Unternehmensmuster (⭐⭐⭐⭐ - 2-3 Stunden)
- **📚 Umfassendes Navigationssystem**: Konsistente Navigationsheader und -footer in der gesamten Dokumentation
- **🎯 Fortschrittsverfolgung**: Kursabschluss-Checkliste und Lernverifizierungssystem
- **🗺️ Lernpfad-Leitfaden**: Klare Einstiegspunkte für unterschiedliche Erfahrungsstufen und Ziele
- **🔗 Querverweis-Navigation**: Verknüpfung verwandter Kapitel und Voraussetzungen

#### Verbesserungen
- **README-Struktur**: Umgewandelt in eine strukturierte Lernplattform mit kapitelbasierter Organisation
- **Dokumentationsnavigation**: Jede Seite enthält jetzt Kapitelkontext und Fortschrittsanleitung
- **Vorlagenorganisation**: Beispiele und Vorlagen den entsprechenden Lernkapiteln zugeordnet
- **Ressourcenintegration**: Spickzettel, FAQs und Lernhilfen mit relevanten Kapiteln verknüpft
- **Workshop-Integration**: Praktische Labs den Lernzielen mehrerer Kapitel zugeordnet

#### Änderungen
- **Lernfortschritt**: Von linearer Dokumentation zu flexiblem kapitelbasiertem Lernen gewechselt
- **Konfigurationsplatzierung**: Konfigurationsleitfaden als Kapitel 3 für besseren Lernfluss neu positioniert
- **KI-Inhaltsintegration**: Bessere Integration von KI-spezifischen Inhalten im gesamten Lernprozess
- **Produktionsinhalte**: Fortgeschrittene Muster in Kapitel 8 für Unternehmenslerner konsolidiert

#### Verbesserungen
- **Benutzererfahrung**: Klare Navigationspfade und Kapitel-Fortschrittsindikatoren
- **Barrierefreiheit**: Konsistente Navigationsmuster für einfachere Kursdurchquerung
- **Professionelle Präsentation**: Universitätsähnliche Kursstruktur geeignet für akademische und berufliche Schulungen
- **Lerneffizienz**: Reduzierte Zeit zur Auffindung relevanter Inhalte durch verbesserte Organisation

#### Technische Umsetzung
- **Navigationsheader**: Standardisierte Kapitelnavigation in über 40 Dokumentationsdateien
- **Footer-Navigation**: Konsistente Fortschrittsanleitung und Kapitelabschlussindikatoren
- **Querverlinkung**: Umfassendes internes Verlinkungssystem, das verwandte Konzepte verbindet
- **Kapitelzuordnung**: Vorlagen und Beispiele klar mit Lernzielen verknüpft

#### Verbesserung des Studienleitfadens
- **📚 Umfassende Lernziele**: Studienleitfaden neu strukturiert, um mit dem 8-Kapitel-System übereinzustimmen
- **🎯 Kapitelbasierte Bewertung**: Jedes Kapitel enthält spezifische Lernziele und praktische Übungen
- **📋 Fortschrittsverfolgung**: Wöchentlicher Lernplan mit messbaren Ergebnissen und Abschluss-Checklisten
- **❓ Bewertungsfragen**: Wissensvalidierungsfragen für jedes Kapitel mit professionellen Ergebnissen
- **🛠️ Praktische Übungen**: Praktische Aktivitäten mit realen Bereitstellungsszenarien und Fehlerbehebung
- **📊 Fähigkeitsfortschritt**: Klare Weiterentwicklung von Grundkonzepten zu Unternehmensmustern mit Fokus auf Karriereentwicklung
- **🎓 Zertifizierungsrahmen**: Ergebnisse der beruflichen Entwicklung und Anerkennung durch die Community
- **⏱️ Zeitmanagement**: Strukturierter 10-Wochen-Lernplan mit Meilensteinvalidierung

### [v3.1.0] - 17.09.2025

#### Verbesserte Multi-Agent-KI-Lösungen
**Diese Version verbessert die Multi-Agent-Retail-Lösung mit besserer Agentenbenennung und verbesserter Dokumentation.**

#### Änderungen
- **Multi-Agent-Terminologie**: Ersetzung von "Cora-Agent" durch "Kunden-Agent" in der gesamten Multi-Agent-Retail-Lösung für bessere Verständlichkeit
- **Agentenarchitektur**: Aktualisierung aller Dokumentationen, ARM-Vorlagen und Codebeispiele mit konsistenter "Kunden-Agent"-Benennung
- **Konfigurationsbeispiele**: Modernisierte Agenten-Konfigurationsmuster mit aktualisierten Benennungskonventionen
- **Dokumentationskonsistenz**: Sicherstellung, dass alle Verweise professionelle, beschreibende Agentennamen verwenden

#### Verbesserungen
- **ARM-Vorlagenpaket**: Aktualisierung der retail-multiagent-arm-template mit Kunden-Agent-Verweisen
- **Architekturdiagramme**: Aktualisierung der Mermaid-Diagramme mit neuen Agentennamen
- **Codebeispiele**: Python-Klassen und Implementierungsbeispiele verwenden jetzt die Benennung CustomerAgent
- **Umgebungsvariablen**: Aktualisierung aller Bereitstellungsskripte auf CUSTOMER_AGENT_NAME-Konventionen

#### Verbesserungen
- **Entwicklererfahrung**: Klarere Rollen und Verantwortlichkeiten der Agenten in der Dokumentation
- **Produktionsbereitschaft**: Bessere Ausrichtung an Unternehmensbenennungskonventionen
- **Lernmaterialien**: Intuitivere Agentenbenennung für Bildungszwecke
- **Vorlagenverwendbarkeit**: Vereinfachtes Verständnis der Agentenfunktionen und Bereitstellungsmuster

#### Technische Details
- Aktualisierte Mermaid-Architekturdiagramme mit CustomerAgent-Verweisen
- Ersetzung von CoraAgent-Klassennamen durch CustomerAgent in Python-Beispielen
- Modifizierte ARM-Template-JSON-Konfigurationen zur Verwendung des Agententyps "customer"
- Aktualisierung der Umgebungsvariablen von CORA_AGENT_* auf CUSTOMER_AGENT_* Muster
- Überarbeitung aller Bereitstellungsbefehle und Containerkonfigurationen

### [v3.0.0] - 12.09.2025

#### Große Änderungen - Fokus auf KI-Entwicklung und Integration von Azure AI Foundry
**Diese Version verwandelt das Repository in eine umfassende Lernressource für KI-Entwickler mit Integration von Azure AI Foundry.**

#### Hinzugefügt
- **🤖 KI-First-Lernpfad**: Vollständige Umstrukturierung mit Priorisierung von KI-Entwicklern und Ingenieuren
- **Azure AI Foundry-Integrationsleitfaden**: Umfassende Dokumentation zur Verbindung von AZD mit Azure AI Foundry-Diensten
- **KI-Modell-Bereitstellungsmuster**: Detaillierter Leitfaden zu Modellauswahl, Konfiguration und Produktionsbereitstellungsstrategien
- **KI-Workshop-Labor**: 2-3 Stunden praktischer Workshop zur Umwandlung von KI-Anwendungen in AZD-bereitstellbare Lösungen
- **Best Practices für Produktions-KI**: Unternehmensgerechte Muster für Skalierung, Überwachung und Sicherung von KI-Workloads
- **KI-spezifischer Fehlerbehebungsleitfaden**: Umfassende Fehlerbehebung für Azure OpenAI, Cognitive Services und KI-Bereitstellungsprobleme
- **KI-Vorlagengalerie**: Ausgewählte Sammlung von Azure AI Foundry-Vorlagen mit Komplexitätsbewertungen
- **Workshop-Materialien**: Vollständige Workshop-Struktur mit praktischen Labs und Referenzmaterialien

#### Verbesserungen
- **README-Struktur**: Fokus auf KI-Entwickler mit 45% Community-Interesse laut Azure AI Foundry Discord
- **Lernpfade**: Dedizierter Lernweg für KI-Entwickler neben traditionellen Pfaden für Studenten und DevOps-Ingenieure
- **Vorlagenempfehlungen**: Vorgestellte KI-Vorlagen, darunter azure-search-openai-demo, contoso-chat und openai-chat-app-quickstart
- **Community-Integration**: Verbesserter Discord-Community-Support mit KI-spezifischen Kanälen und Diskussionen

#### Sicherheit & Produktionsfokus
- **Muster für verwaltete Identitäten**: KI-spezifische Authentifizierungs- und Sicherheitskonfigurationen
- **Kostenoptimierung**: Token-Nutzungsverfolgung und Budgetkontrollen für KI-Workloads
- **Bereitstellung in mehreren Regionen**: Strategien für globale KI-Anwendungsbereitstellung
- **Leistungsüberwachung**: KI-spezifische Metriken und Integration von Application Insights

#### Dokumentationsqualität
- **Linearer Kursaufbau**: Logische Progression von Anfänger- bis fortgeschrittenen KI-Bereitstellungsmustern
- **Validierte URLs**: Alle externen Repository-Links überprüft und zugänglich
- **Vollständige Referenz**: Alle internen Dokumentationslinks validiert und funktionsfähig
- **Produktionsbereit**: Unternehmensbereitschaftsmuster mit praxisnahen Beispielen

### [v2.0.0] - 09.09.2025

#### Große Änderungen - Repository-Umstrukturierung und professionelle Verbesserung
**Diese Version stellt eine bedeutende Überarbeitung der Repository-Struktur und der Inhaltspräsentation dar.**

#### Hinzugefügt
- **Strukturiertes Lernframework**: Alle Dokumentationsseiten enthalten jetzt Abschnitte zu Einführung, Lernzielen und Lernergebnissen
- **Navigationssystem**: Hinzufügen von Links zu vorherigen/nächsten Lektionen in der gesamten Dokumentation für geführten Lernfortschritt
- **Studienleitfaden**: Umfassender study-guide.md mit Lernzielen, Übungsaufgaben und Bewertungsmaterialien
- **Professionelle Präsentation**: Entfernung aller Emoji-Symbole für verbesserte Barrierefreiheit und professionelles Erscheinungsbild
- **Verbesserte Inhaltsstruktur**: Verbesserte Organisation und Ablauf der Lernmaterialien

#### Änderungen
- **Dokumentationsformat**: Standardisierung aller Dokumentationen mit einer konsistenten, lernorientierten Struktur
- **Navigationsfluss**: Logische Abfolge durch alle Lernmaterialien implementiert
- **Inhaltspräsentation**: Dekorative Elemente entfernt zugunsten einer klaren, professionellen Formatierung
- **Linkstruktur**: Alle internen Links aktualisiert, um das neue Navigationssystem zu unterstützen

#### Verbesserungen
- **Barrierefreiheit**: Entfernung von Emoji-Abhängigkeiten für bessere Kompatibilität mit Screenreadern
- **Professionelles Erscheinungsbild**: Saubere, akademische Präsentation, geeignet für Unternehmensschulungen
- **Lernerfahrung**: Strukturierter Ansatz mit klaren Zielen und Ergebnissen für jede Lektion
- **Inhaltsorganisation**: Bessere logische Abfolge und Verbindung zwischen verwandten Themen

### [v1.0.0] - 2025-09-09

#### Erstveröffentlichung - Umfassendes AZD-Lernrepository

#### Hinzugefügt
- **Kernstruktur der Dokumentation**
  - Vollständige Einführungsleitfaden-Serie
  - Umfassende Dokumentation zu Bereitstellung und Provisionierung
  - Detaillierte Ressourcen zur Fehlerbehebung und Debugging-Leitfäden
  - Tools und Verfahren zur Validierung vor der Bereitstellung

- **Einführungsmodul**
  - AZD-Grundlagen: Kernkonzepte und Terminologie
  - Installationsleitfaden: Plattform-spezifische Setup-Anweisungen
  - Konfigurationsleitfaden: Einrichtung der Umgebung und Authentifizierung
  - Erste Projektanleitung: Schritt-für-Schritt praktisches Lernen

- **Bereitstellungs- und Provisionierungsmodul**
  - Bereitstellungsleitfaden: Vollständige Workflow-Dokumentation
  - Provisionierungsleitfaden: Infrastruktur als Code mit Bicep
  - Best Practices für Produktionsbereitstellungen
  - Muster für Multi-Service-Architekturen

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
  - Befehlsübersicht: Schnelle Referenz für wichtige Befehle
  - Glossar: Umfassende Definitionen von Begriffen und Akronymen
  - FAQ: Detaillierte Antworten auf häufige Fragen
  - Links zu externen Ressourcen und Community-Verbindungen

- **Beispiele und Vorlagen**
  - Beispiel für eine einfache Webanwendung
  - Vorlage für die Bereitstellung einer statischen Website
  - Konfiguration für Containeranwendungen
  - Muster für Datenbankintegration
  - Beispiele für Microservices-Architekturen
  - Implementierungen von serverlosen Funktionen

#### Funktionen
- **Plattformübergreifende Unterstützung**: Installations- und Konfigurationsleitfäden für Windows, macOS und Linux
- **Verschiedene Fähigkeitsstufen**: Inhalte für Anfänger bis hin zu professionellen Entwicklern
- **Praktischer Fokus**: Praktische Beispiele und reale Szenarien
- **Umfassende Abdeckung**: Von grundlegenden Konzepten bis hin zu fortgeschrittenen Unternehmensmustern
- **Sicherheitsorientierter Ansatz**: Sicherheitsbestimmungen durchgehend integriert
- **Kostenoptimierung**: Anleitung für kosteneffiziente Bereitstellungen und Ressourcenmanagement

#### Dokumentationsqualität
- **Detaillierte Codebeispiele**: Praktische, getestete Codebeispiele
- **Schritt-für-Schritt-Anleitungen**: Klare, umsetzbare Anweisungen
- **Umfassende Fehlerbehandlung**: Fehlerbehebung für häufige Probleme
- **Integration von Best Practices**: Industriestandards und Empfehlungen
- **Versionskompatibilität**: Aktuell mit den neuesten Azure-Diensten und AZD-Funktionen

## Geplante zukünftige Verbesserungen

### Version 3.1.0 (Geplant)
#### Erweiterung der KI-Plattform
- **Unterstützung mehrerer Modelle**: Integrationsmuster für Hugging Face, Azure Machine Learning und benutzerdefinierte Modelle
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
- **Governance-Framework**: Governance, Compliance und Prüfpfade für KI-Modelle
- **Multi-Tenant-KI**: Muster für die Bereitstellung mehrerer Kunden mit isolierten KI-Diensten
- **Edge-KI-Bereitstellung**: Integration mit Azure IoT Edge und Container-Instanzen
- **Hybrid-Cloud-KI**: Multi-Cloud- und hybride Bereitstellungsmuster für KI-Workloads

#### Erweiterte Funktionen
- **Automatisierung von KI-Pipelines**: MLOps-Integration mit Azure Machine Learning-Pipelines
- **Erweiterte Sicherheit**: Zero-Trust-Muster, private Endpunkte und erweiterter Bedrohungsschutz
- **Leistungsoptimierung**: Fortgeschrittene Abstimmungs- und Skalierungsstrategien für hochfrequente KI-Anwendungen
- **Globale Verteilung**: Muster für die Inhaltsbereitstellung und Edge-Caching für KI-Anwendungen

### Version 3.0.0 (Geplant) - Ersetzt durch aktuelle Veröffentlichung
#### Vorgeschlagene Ergänzungen - Jetzt in v3.0.0 implementiert
- ✅ **KI-fokussierte Inhalte**: Umfassende Integration der Azure AI Foundry (Abgeschlossen)
- ✅ **Interaktive Tutorials**: Praktische KI-Workshop-Labore (Abgeschlossen)
- ✅ **Erweiterte Sicherheitsmodule**: KI-spezifische Sicherheitsmuster (Abgeschlossen)
- ✅ **Leistungsoptimierung**: Abstimmungsstrategien für KI-Workloads (Abgeschlossen)

### Version 2.1.0 (Geplant) - Teilweise in v3.0.0 implementiert
#### Kleinere Verbesserungen - Teilweise in der aktuellen Veröffentlichung abgeschlossen
- ✅ **Zusätzliche Beispiele**: KI-fokussierte Bereitstellungsszenarien (Abgeschlossen)
- ✅ **Erweiterte FAQ**: KI-spezifische Fragen und Fehlerbehebung (Abgeschlossen)
- **Tool-Integration**: Erweiterte Leitfäden zur Integration von IDEs und Editoren
- ✅ **Erweiterte Überwachung**: KI-spezifische Muster für Überwachung und Warnungen (Abgeschlossen)

#### Noch für zukünftige Veröffentlichungen geplant
- **Mobilfreundliche Dokumentation**: Responsives Design für mobiles Lernen
- **Offline-Zugriff**: Herunterladbare Dokumentationspakete
- **Erweiterte IDE-Integration**: VS Code-Erweiterung für AZD + KI-Workflows
- **Community-Dashboard**: Echtzeit-Metriken und Beitragsverfolgung der Community

## Beitrag zum Changelog

### Änderungen melden
Wenn Sie zu diesem Repository beitragen, stellen Sie bitte sicher, dass die Changelog-Einträge Folgendes enthalten:

1. **Versionsnummer**: Nach semantischer Versionierung (major.minor.patch)
2. **Datum**: Veröffentlichungs- oder Aktualisierungsdatum im Format JJJJ-MM-TT
3. **Kategorie**: Hinzugefügt, Geändert, Veraltet, Entfernt, Behoben, Sicherheit
4. **Klare Beschreibung**: Präzise Beschreibung der Änderungen
5. **Auswirkungsbewertung**: Wie sich die Änderungen auf bestehende Benutzer auswirken

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
- Behebung gemeldeter Probleme oder Fehler
- Verbesserungen der Genauigkeit oder Funktionalität

#### Sicherheit
- Sicherheitsbezogene Verbesserungen oder Korrekturen
- Aktualisierungen der Sicherheitsbestimmungen
- Behebung von Sicherheitslücken

### Richtlinien zur semantischen Versionierung

#### Hauptversion (X.0.0)
- Änderungen, die Benutzeraktionen erfordern
- Bedeutende Umstrukturierung von Inhalten oder Organisation
- Änderungen, die den grundlegenden Ansatz oder die Methodik verändern

#### Nebenversion (X.Y.0)
- Neue Funktionen oder Inhaltszusätze
- Verbesserungen, die die Abwärtskompatibilität beibehalten
- Zusätzliche Beispiele, Tools oder Ressourcen

#### Patch-Version (X.Y.Z)
- Fehlerbehebungen und Korrekturen
- Kleine Verbesserungen an bestehenden Inhalten
- Klarstellungen und kleine Erweiterungen

## Feedback und Vorschläge aus der Community

Wir ermutigen die Community aktiv, Feedback zu geben, um diese Lernressource zu verbessern:

### Wie man Feedback gibt
- **GitHub Issues**: Probleme melden oder Verbesserungen vorschlagen (KI-spezifische Themen willkommen)
- **Discord-Diskussionen**: Ideen teilen und mit der Azure AI Foundry-Community interagieren
- **Pull Requests**: Direkte Verbesserungen zu Inhalten beitragen, insbesondere KI-Vorlagen und Leitfäden
- **Azure AI Foundry Discord**: Teilnahme am #Azure-Kanal für AZD + KI-Diskussionen
- **Community-Foren**: Teilnahme an breiteren Azure-Entwicklerdiskussionen

### Feedback-Kategorien
- **Genauigkeit der KI-Inhalte**: Korrekturen zu Informationen über KI-Dienstintegration und -bereitstellung
- **Lernerfahrung**: Vorschläge zur Verbesserung des Lernflusses für KI-Entwickler
- **Fehlende KI-Inhalte**: Anfragen für zusätzliche KI-Vorlagen, Muster oder Beispiele
- **Barrierefreiheit**: Verbesserungen für unterschiedliche Lernbedürfnisse
- **Integration von KI-Tools**: Vorschläge für eine bessere Integration von KI-Entwicklungs-Workflows
- **Produktions-KI-Muster**: Anfragen für Unternehmens-KI-Bereitstellungsmuster

### Verpflichtung zur Rückmeldung
- **Antwort auf Probleme**: Innerhalb von 48 Stunden bei gemeldeten Problemen
- **Funktionsanfragen**: Bewertung innerhalb einer Woche
- **Community-Beiträge**: Überprüfung innerhalb einer Woche
- **Sicherheitsprobleme**: Sofortige Priorität mit beschleunigter Antwort

## Wartungsplan

### Regelmäßige Updates
- **Monatliche Überprüfungen**: Inhaltsgenauigkeit und Linkvalidierung
- **Vierteljährliche Updates**: Wichtige Inhaltszusätze und Verbesserungen
- **Halbjährliche Überprüfungen**: Umfassende Umstrukturierung und Erweiterung
- **Jährliche Veröffentlichungen**: Hauptversion-Updates mit bedeutenden Verbesserungen

### Überwachung und Qualitätssicherung
- **Automatisierte Tests**: Regelmäßige Validierung von Codebeispielen und Links
- **Integration von Community-Feedback**: Regelmäßige Einbindung von Benutzeranregungen
- **Technologie-Updates**: Anpassung an die neuesten Azure-Dienste und AZD-Versionen
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

**Haftungsausschluss**:  
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner ursprünglichen Sprache sollte als maßgebliche Quelle betrachtet werden. Für kritische Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die sich aus der Nutzung dieser Übersetzung ergeben.