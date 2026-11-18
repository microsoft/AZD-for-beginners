# 5. Eine Vorlage anpassen

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Distinguish configuration changes from application implementation
    - [ ] Plan a grounded retrieval customization
    - [ ] Enable and inspect tracing without unnecessarily capturing sensitive content
    - [ ] Locate and run the sample's current evaluation and red-teaming tests
    - [ ] **Lab 5:** Build a customization and validation plan

---

## 5.1 Eine Ausgangsbasis schaffen

Verwenden Sie das initialisierte [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) Repository aus den vorherigen Modulen. Notieren Sie die Vorlagenrevision, AZD-Version, ausgewählte Umgebung, Modellbereitstellung und Beispielarbeitsfragen, bevor Sie Änderungen vornehmen.

Die Vorlage implementiert eine agentengestützte Chat-Anwendung. Sie wird **nicht** automatisch zu einem Zwei-Agenten-Einzelhandelssystem, nur weil Umgebungsvariablen gesetzt oder zusätzliche Anweisungsdateien gespeichert werden. Zusätzliche Agenten, Werkzeug-Handler, Routing, Autorisierung und Datenzugriff erfordern Anwendungscode.

Überprüfen Sie die aktuell bereitgestellten Agentenanweisungen und Werkzeuge in Foundry. Testen Sie eine faktische Frage, eine Abruffrage und eine Frage, die die Beispieldaten nicht beantworten können. Verifizieren Sie Zitationen anhand der tatsächlichen Quelldokumente, anstatt eine flüssige Antwort als korrekt anzunehmen.

## 5.2 Wissensabruf anpassen

Die Vorlage unterstützt dateibasierten Abruf und optionale Azure AI Search-Integration. Folgen Sie dem [aktuellen AI Search-Leitfaden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/ai_search.md) für Indexierung und Werkzeugkonfiguration.

```bash
# Infrastructure settings; these can add charges
azd env set USE_AZURE_AI_SEARCH_SERVICE true
azd provision --preview
azd up
```

Das Aktivieren des Dienstes ist nur ein Teil des Abrufs. Bevor Sie Ihre eigenen Daten hochladen:

1. Stellen Sie sicher, dass Sie die Berechtigung zur Nutzung der Dokumente haben und entfernen Sie sensible Informationen.
2. Wählen Sie ein in Ihrer Region unterstütztes Embedding-Modell und setzen Sie seine kompatible Version, Bereitstellungstyp und Vektor-Dimensionen.
3. Erstellen/befüllen Sie den Index mit dem im Beispiel dokumentierten Prozess.
4. Konfigurieren Sie das Abruf-Werkzeug des Agenten, um diesen Index zu verwenden.
5. Testen Sie Abruf, Zitationen, Autorisierung und Verhalten, wenn kein relevantes Dokument vorhanden ist.

Wechseln Sie nicht von `text-embedding-3-small` zu einem anderen Embedding-Modell, ohne Dimensionen zu prüfen und bei Bedarf Vektoren neu zu erstellen/indexieren. Ein Name wie `retail-products` ist kein implementierter Katalog oder eine Zugriffskontrollrichtlinie.

## 5.3 Tracing und Überwachung

Folgen Sie dem [Observability-Leitfaden des Beispiels](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#tracing-and-monitoring). Vergewissern Sie sich, dass die erforderliche Application Insights-Ressource und Verbindung bereits existieren; wenn Sie Infrastruktur-Einstellungen ändern, verwenden Sie `azd up`.

```bash
azd env set ENABLE_AZURE_MONITOR_TRACING true
azd up
```

Senden Sie eine Testanfrage und prüfen Sie dann die Anwendungsprotokolle der Container-App sowie die Tracing-Ansicht des Agenten in Foundry. Überprüfen Sie Latenz, Werkzeugaufrufe, Fehler und die Korrelation zwischen Anfrage und Trace. Gehen Sie nicht davon aus, dass Telemetrie verbunden ist, nur weil die Bereitstellung erfolgreich war.

Lassen Sie `OTEL_INSTRUMENTATION_GENAI_CAPTURE_MESSAGE_CONTENT` deaktiviert, es sei denn, Sie haben ausdrücklich Zustimmung, Schwärzung, Aufbewahrung und Zugriffskontrollen überprüft. Traces können sensible Werkzeugargumente oder Dokumentinhalte enthalten, selbst wenn normale Anwendungsprotokolle harmlos erscheinen.

## 5.4 Agentenbewertung

Der Bewertungseinstiegspunkt des Beispiels ist jetzt [`tests/test_evaluation.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_evaluation.py), nicht ein `evals/` Verzeichnis. Verwenden Sie vom Beispielstamm aus eine Python-Umgebung, die den dokumentierten Anforderungen entspricht:

```bash
python -m pip install -r src/requirements.txt
pytest tests/test_evaluation.py -s
```

Vor dem Ausführen vervollständigen Sie die [Bewertungsvoraussetzungen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md). Die Tests laden die Konfiguration aus der ausgewählten `.azure/<environment>/.env`; bestätigen Sie, dass die beabsichtigte Umgebung ausgewählt ist. Wichtige Eingaben sind:

- `AZURE_EXISTING_AIPROJECT_ENDPOINT`
- `AZURE_EXISTING_AGENT_ID`, im vom aktuellen Beispiel benötigten Format (die geprüfte Version verwendet `agent_name:agent_version`)
- `AZURE_AI_AGENT_DEPLOYMENT_NAME`, verwendet als Bewertungsmodell-Bereitstellung

Untersuchen Sie die Tests, um Auswahl des Bewertungsgeräts, Schwellenwerte, erforderliche Rollen und Modellkosten zu verstehen. Ein abgeschlossener Durchlauf ist nicht automatisch ein bestandener Qualitätstest; prüfen Sie Punktzahlen, fehlgeschlagene/fehlerhafte Fälle und die verlinkten Foundry-Ergebnisse.

### Separate AZD-Bewertungserweiterung

Der obige Python-Test ist ein **beispielspezifischer Workflow**. Die optionale `azure.ai.evaluations` Erweiterung ist ein anderer Workflow, mit einer eigenen `evals/azure.eval.yaml` Konfiguration. Sie wird separat installiert und ist nicht im allgemein verfügbaren `microsoft.foundry` 1.0 Paket enthalten:

```bash
azd extension install azure.ai.evaluations
azd ai eval --help
```

Für eine vollständige Erweiterungseinrichtung siehe [Bewertungsworkflows und Migration](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-08-production/production-ai-practices.md). Seit Agents-Erweiterung Beta.22 verwenden Sie nicht die entfernten `azd ai agent eval` Befehle. Die Installation der Bewertungserweiterung konvertiert nicht die Python-Tests des Beispiels und erstellt nicht automatisch eine Bewertungskonfiguration.

Für eine separate **GA gehostete-Agenten-Übung** verwenden Sie einen leeren Ordner außerhalb des Workshop-Beispiels und folgen dem [Foundry local-to-cloud Walkthrough](https://github.com/microsoft/AZD-for-beginners/blob/main/docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Es verwendet AZD 1.37.0+, das `microsoft.foundry` Paket, Python 3.13+ und aktuelles uv. Sie werden `azure.yaml` prüfen, lokal mit Agent Inspector testen, Quellcode für einen entfernten Foundry-Build bereitstellen sowie einen Datensatz und eine Rubrik erstellen/prüfen, bevor Sie `azd ai eval init --name quality` konfigurieren. Ersetzen Sie nicht die Tests dieses Beispiels und nehmen Sie nicht an, dass die Installation des Pakets dessen Hosting-Modell ändert.

## 5.5 KI Red Teaming und kontinuierliche Bewertung

Das aktuelle Beispiel bietet [`tests/test_red_teaming.py`](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/tests/test_red_teaming.py). Vervollständigen Sie seine Voraussetzungen und überprüfen Sie das beabsichtigte Ziel und die Kosten vor dem Ausführen:

```bash
pytest tests/test_red_teaming.py -s
```

Verwenden Sie eine autorisierte Testbereitstellung und synthetische Daten. Überprüfen Sie die erzeugten Angriffe und Ergebnisse; dieser Scan bestätigt nicht, dass eine Anwendung sicher oder konform ist.

Der [Observability-Leitfaden](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/observability.md#continuous-evaluation) beschreibt ebenfalls die kontinuierliche Bewertung, die beim Container-Start konfiguriert wird. Sie bewertet echte Benutzerinteraktionen, nicht generierten Testverkehr, und die Evaluator-Unterstützung variiert je nach Region. Keine Interaktionen bedeuten keine Bewertungseinträge. Verifizieren Sie die installierte Beispielversion und Evaluatorkonfiguration, anstatt anzunehmen, jede Bereitstellung habe dieselben Standardwerte.

Authentifizierung ist getrennt von der Bewertung. Folgen Sie der dokumentierten Identitäts-/Zugriffseinrichtung des Beispiels. Es gibt keinen dokumentierten „Basic Auth Fallback“, auf den man zum Schutz eines öffentlichen Endpunkts zurückgreifen kann.

## 5.6 Designübung: Einzelhandelsanpassung

!!! warning "Designübung, keine abgeschlossene Bereitstellung"

    The workshop does not provide a complete Shopper/Loyalty multi-agent implementation. Do not claim that additional agents, models, catalogs, or policies exist until you have implemented and verified them.

Erstellen Sie einen kurzen Plan mit den Themen:

| Bereich | Entscheidung und zu sammelnde Belege |
|--------|-------------------------------------|
| Agentenverantwortlichkeiten | Beginnen Sie mit einem Agenten oder rechtfertigen Sie separate Shopper- und Loyalty-Agenten sowie Routing-Logik |
| Daten | Definieren Sie einen synthetischen Katalog-/Belohnungsdatensatz und die Zuständigkeit für Updates |
| Werkzeuge | Implementieren Sie zuerst schreibgeschützte Handler; spezifizieren Sie Autorisierung und Validierung für Schreibvorgänge |
| Modelle | Wählen Sie verfügbare Kombinationen aus Modell/Version/SKU und prüfen Sie Kontingente; vermeiden Sie Bereitstellung ungenutzter Modelle |
| Abruf | Definieren Sie Indexierung, Einbettungsdimensionen, Zitationen und Dokumentzugriffskontrollen |
| Bewertung | Fügen Sie erwartete Antwort-, nicht unterstützte Frage-, Werkzeugnutzungs- und Sicherheitsfälle mit expliziten Schwellenwerten hinzu |
| Betrieb | Definieren Sie Telemetrie, Latenz-/Fehlerbudgets, Kostenlimits und Zuständigkeit für Aufräumarbeiten |

Das Speichern von `custom-agents/shopper-agent-instructions.md` bewirkt nicht, dass die Vorlage es lädt. Finden Sie den Anwendungscode, der den Agenten erstellt/aktualisiert, verbinden Sie dort Ihre überprüften Anweisungen und prüfen Sie die resultierende Agentenversion vor dem Testen. Anweisungen können keinen Zugriff auf Daten oder Werkzeuge gewähren, die Sie nicht implementiert haben.

Wenden Sie immer nur eine Änderung gleichzeitig an, stellen Sie die betroffenen Komponenten neu bereit und führen Sie Ihre Ausgangsfragen und Bewertungen erneut aus. Behalten Sie eine funktionierende Version zum Vergleichen. Zur Architektur-Inspiration siehe den [Einzelhandels-Blueprint](https://github.com/microsoft/AZD-for-beginners/blob/main/examples/retail-scenario.md), der ebenfalls keine vollständige Einzelhandelsanwendung ist.

!!! quote "AM ENDE DIESES LABORS SOLLTEN SIE FOLGENDES HABEN"

    - [ ] A documented customization scope and cost/region checks
    - [ ] Evidence that retrieval and tracing work for your selected environment
    - [ ] Reviewed evaluation/red-teaming results, or a clear explanation of unmet prerequisites
    - [ ] A list of missing implementation work rather than a claim of automatic production readiness

Fahren Sie fort mit [Infrastruktur abbauen](6-Teardown-Infrastructure.md).

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->