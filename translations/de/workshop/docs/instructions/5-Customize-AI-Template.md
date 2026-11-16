# 5. Eine Vorlage anpassen

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Eine Basislinie festlegen

Verwenden Sie das initialisierte Repository [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) aus den vorherigen Modulen. Notieren Sie die Vorlagenrevision, AZD-Version, die ausgewählte Umgebung, das Modell-Deployment und die Beispiel-Fragen, bevor Sie Änderungen vornehmen.

Das Beispiel implementiert eine agentenunterstützte Chat-Anwendung. Es wird **nicht** automatisch zu einem Zwei-Agenten-Einzelhandelssystem, nur weil Umgebungsvariablen gesetzt oder zusätzliche Anweisungsdateien gespeichert werden. Zusätzliche Agenten, Werkzeug-Handler, Routing, Autorisierung und Datenzugriff erfordern Anwendungscode.

Untersuchen Sie die aktuell bereitgestellten Agentenanweisungen und Werkzeuge in Foundry. Testen Sie eine faktische Frage, eine Abruffrage und eine Frage, die die Beispieldaten nicht beantworten können. Überprüfen Sie Zitate anhand der tatsächlichen Quell-Dokumente, anstatt davon auszugehen, dass eine flüssige Antwort korrekt ist.

## 5.2 Wissensabruf anpassen

Die Vorlage unterstützt Dateibasierten Abruf und eine optionale Azure AI Search-Integration. Folgen Sie dem [aktuellen AI Search-Leitfaden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) für Indexierung und Werkzeugkonfiguration.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Das Aktivieren des Dienstes ist nur ein Teil des Abrufs. Bevor Sie Ihre eigenen Daten hochladen:

1. Bestätigen Sie, dass Sie die Erlaubnis zur Nutzung der Dokumente haben und entfernen Sie sensible Informationen.
2. Wählen Sie ein in Ihrer Region unterstütztes Embedding-Modell und stellen Sie dessen kompatible Version, Bereitstellungstyp und Vektor-Dimensionen ein.
3. Erstellen/füllen Sie den Index mit dem dokumentierten Prozess des Beispiels.
4. Konfigurieren Sie das Retrieval-Werkzeug des Agenten zur Nutzung dieses Indexes.
5. Testen Sie Abruf, Zitate, Autorisierung und Verhalten, wenn kein relevantes Dokument vorhanden ist.

Wechseln Sie nicht von `text-embedding-3-small` zu einem anderen Embedding-Modell, ohne die Dimensionen zu überprüfen und die Vektoren gegebenenfalls neu zu erstellen/indexieren. Ein Name wie `retail-products` ist kein implementiertes Katalog- oder Zugriffskontrollschema.

## 5.3 Nachverfolgung und Überwachung

Folgen Sie dem [Observability-Leitfaden des Beispiels](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Stellen Sie sicher, dass die erforderliche Application Insights-Ressource und Verbindung bereits existieren; wenn Sie Infrastruktur-Einstellungen ändern, verwenden Sie `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Senden Sie eine Testanfrage, und überprüfen Sie dann die Anwendungsprotokolle der Container-App sowie die Agenten-Trace-Ansicht in Foundry. Prüfen Sie Latenz, Werkzeugaufrufe, Fehler und Korrelation zwischen Anfrage und Trace. Nehmen Sie nicht an, dass Telemetrie verbunden ist, nur weil das Deployment erfolgreich war.

Lassen Sie `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` deaktiviert, außer Sie haben ausdrücklich Einwilligungen, Schwärzungen, Aufbewahrung und Zugriffskontrollen überprüft. Traces können sensible Werkzeugargumente oder Dokumentinhalte enthalten, selbst wenn gewöhnliche Anwendungsprotokolle harmlos wirken.

## 5.4 Agentenbewertung

Der Evaluationseinstiegspunkt des Beispiels ist nun [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nicht ein `evals/`-Verzeichnis. Verwenden Sie vom Beispiel-Stamm aus eine Python-Umgebung, die dessen dokumentierte Anforderungen erfüllt:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Vor Ausführung vervollständigen Sie die [Evaluierungsvoraussetzungen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Die Tests laden Konfigurationen aus der ausgewählten `.azure/<environment>/.env`; bestätigen Sie, dass die gewünschte Umgebung ausgewählt ist. Wichtige Eingaben sind:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, im vom aktuellen Beispiel geforderten Format (die geprüfte Version verwendet `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, verwendet als Richter-Modell-Deployment

Prüfen Sie die Tests, um die Auswahl des Evaluators, Schwellenwerte, erforderliche Rollen und Modellkosten zu verstehen. Ein abgeschlossener Lauf ist nicht automatisch eine bestandene Qualitätsprüfung; analysieren Sie Scores, fehlgeschlagene/fehlerhafte Fälle und die verlinkten Foundry-Ergebnisse.

### Separate AZD-Bewertungserweiterung

Der obige Python-Test ist ein **beispielspezifischer Arbeitsablauf**. Die optionale `azure.ai.evaluations`-Erweiterung ist ein anderer Workflow mit eigener `evals/azure.eval.yaml`-Konfiguration:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Für eine vollständige Erweiterungskonfiguration siehe [Evaluierungs-Workflows und Migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Seit Agents-Erweiterung beta.22 keine Verwendung der entfernten `azd ai agent eval`-Befehle. Die Installation der Bewertungserweiterung konvertiert nicht automatische die Python-Tests des Beispiels oder erstellt eine Bewertungskonfiguration.

## 5.5 AI Red Teaming und kontinuierliche Bewertung

Das aktuelle Beispiel stellt [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py) bereit. Vervollständigen Sie dessen Voraussetzungen und prüfen Sie Ziel und Kosten vor Ausführung:

```bash
pytest tests/test_red_teaming.py -s
```

Verwenden Sie ein autorisiertes Test-Deployment und synthetische Daten. Prüfen Sie die generierten Angriffe und Ergebnisse; dieser Scan bestätigt nicht, dass eine Anwendung sicher oder konform ist.

Der [Observability-Leitfaden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) beschreibt zudem eine kontinuierliche Bewertung, die beim Start des Containers konfiguriert wird. Sie bewertet reale Nutzerinteraktionen, nicht generierten Testtraffic, und Evaluator-Unterstützung variiert je nach Region. Keine Interaktionen bedeuten keine Bewertungseinträge. Prüfen Sie die installierte Beispielversion und Evaluatorkonfiguration, statt anzunehmen, jede Bereitstellung habe dieselben Standardeinstellungen.

Authentifizierung ist von der Bewertung getrennt. Folgen Sie der dokumentierten Identitäts-/Zugriffskonfiguration des Beispiels. Es gibt keine dokumentierte „Basic Auth-Fallback“-Option zum Schutz eines öffentlichen Endpunkts.

## 5.6 Designübung: Einzelhandelsanpassung

!!! warning "Designübung, keine abgeschlossene Bereitstellung"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Erstellen Sie einen kurzen Plan, der Folgendes behandelt:

| Bereich | Entscheidung und zu sammelnde Nachweise |
|------|----------------------------------|
| Agentenverantwortlichkeiten | Starten Sie mit einem Agenten oder begründen Sie separate Shopper- und Loyalty-Agenten sowie Routing-Logik |
| Daten | Definieren Sie einen synthetischen Katalog-/Belohnungsdatensatz und Zuständigkeit für Updates |
| Werkzeuge | Implementieren Sie zunächst schreibgeschützte Handler; spezifizieren Sie Autorisierung und Validierung für alle Schreibvorgänge |
| Modelle | Wählen Sie verfügbare Modell-/Version-/SKU-Kombinationen aus und prüfen Sie das Kontingent; vermeiden Sie die Bereitstellung ungenutzter Modelle |
| Abruf | Definieren Sie Indexierung, Einbettungsdimensionen, Zitate und Dokumentzugriffssteuerungen |
| Bewertung | Fügen Sie erwartete Antworten, nicht unterstützte Fragen, Werkzeugnutzung und Sicherheitsfälle mit expliziten Schwellenwerten hinzu |
| Betrieb | Definieren Sie Telemetrie, Latenz-/Fehlerbudgets, Kostengrenzen und Zuständigkeit für Bereinigung |

Das Speichern von `custom-agents/shopper-agent-instructions.md` bewirkt nicht, dass das Beispiel es lädt. Finden Sie den Anwendungscode, der den Agenten erstellt/aktualisiert, binden Sie dort Ihre geprüften Anweisungen ein, und verifizieren Sie die resultierende Agentenversion vor Tests. Anweisungen können keinen Zugriff auf Daten oder Werkzeuge gewähren, die Sie nicht implementiert haben.

Führen Sie jeweils nur eine Änderung durch, stellen Sie die betroffenen Komponenten neu bereit und wiederholen Sie Ihre Basisfragen und Bewertungen. Bewahren Sie eine funktionierende Revision zum Vergleich auf. Für Architektur-Inspiration siehe das [Retail Blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), das ebenfalls keine vollständige Einzelhandelsanwendung ist.

!!! quote "AM ENDE DIESES LABS SOLLTEN SIE HABEN"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Fahren Sie mit [Infrastruktur abbauen](6-Teardown-Infrastructure.md) fort.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->