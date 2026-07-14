# 2. Eine Vorlage validieren

> Validiert mit `azd 1.27.1` im Juli 2026.

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Die KI-Lösungsarchitektur zu analysieren
    - [ ] Den AZD-Bereitstellungsworkflow zu verstehen
    - [ ] GitHub Copilot zu nutzen, um Hilfe bei der Verwendung von AZD zu erhalten
    - [ ] **Lab 2:** Die Vorlage für KI-Agenten bereitstellen und validieren

---


## 1. Einführung

Der [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) oder `azd` ist ein Open-Source-Befehlszeilentool, das den Entwickler-Workflow beim Erstellen und Bereitstellen von Anwendungen in Azure vereinfacht.

[AZD-Vorlagen](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sind standardisierte Repositories, die Beispielanwendungscode, _Infrastructure-as-Code_-Assets und `azd`-Konfigurationsdateien für eine zusammenhängende Lösungsarchitektur enthalten. Die Bereitstellung der Infrastruktur wird so einfach wie ein `azd provision`-Befehl – während `azd up` es ermöglicht, Infrastruktur bereitzustellen **und** Ihre Anwendung auf einmal zu deployen!

Dadurch kann der Einstieg in Ihren Anwendungsentwicklungsprozess so einfach sein, wie die passende _AZD Starter Vorlage_ zu finden, die Ihren Anwendungs- und Infrastrukturanforderungen am nächsten kommt – und dann das Repository an Ihr Szenario anzupassen.

Bevor wir beginnen, stellen wir sicher, dass Sie die Azure Developer CLI installiert haben.

1. Öffnen Sie ein VS Code Terminal und geben Sie diesen Befehl ein:

      ```bash title="" linenums="0"
      azd version
      ```

1. Sie sollten so etwas sehen!

      ```bash title="" linenums="0"
      azd version 1.27.1 (commit <current-build>)
      ```

**Sie sind jetzt bereit, mit azd eine Vorlage auszuwählen und bereitzustellen**

---

## 2. Vorlagenauswahl

Die Microsoft Foundry-Plattform bietet einen [Satz empfohlener AZD-Vorlagen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), die beliebte Lösungsszenarien wie _Multi-Agent-Workflow-Automatisierung_ und _multimodale Inhaltsverarbeitung_ abdecken. Diese Vorlagen finden Sie auch im Microsoft Foundry-Portal.

1. Besuchen Sie [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Melden Sie sich im Microsoft Foundry-Portal an, wenn Sie dazu aufgefordert werden – Sie sehen etwas wie das Folgende.

![Pick](../../../../../translated_images/de/01-pick-template.60d2d5fff5ebc374.webp)


Die **Basic**-Optionen sind Ihre Starter-Vorlagen:

1. [ ] [Beginnen Sie mit AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), das eine einfache Chat-Anwendung _mit Ihren Daten_ in Azure Container Apps bereitstellt. Verwenden Sie dies, um ein einfaches KI-Chatbot-Szenario zu erkunden.
1. [X] [Beginnen Sie mit AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), das ebenfalls einen Standard-KI-Agenten (mit den Foundry Agents) bereitstellt. Verwenden Sie dies, um sich mit agentenbasierten KI-Lösungen mit Tools und Modellen vertraut zu machen.

Besuchen Sie den zweiten Link in einem neuen Browser-Tab (oder klicken Sie auf `Open in GitHub` bei der zugehörigen Karte). Sie sollten das Repository für diese AZD-Vorlage sehen. Nehmen Sie sich eine Minute, um das README zu erkunden. Die Anwendungsarchitektur sieht so aus:

![Arch](../../../../../translated_images/de/architecture.8cec470ec15c65c7.webp)

---

## 3. Aktivierung der Vorlage

Versuchen wir, diese Vorlage bereitzustellen und sicherzustellen, dass sie gültig ist. Wir folgen dabei den Richtlinien im Abschnitt [Erste Schritte](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Wählen Sie eine Arbeitsumgebung für das Vorlagen-Repository:

      - **GitHub Codespaces**: Klicken Sie auf [diesen Link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) und bestätigen Sie `Create codespace`
      - **Lokales Klonen oder Dev Container**: Klonen Sie `Azure-Samples/get-started-with-ai-agents` und öffnen Sie es in VS Code

1. Warten Sie, bis das VS Code-Terminal bereit ist, und geben Sie dann den folgenden Befehl ein:

   ```bash title="" linenums="0"
   azd up
   ```

Schließen Sie die Workflow-Schritte ab, die dadurch ausgelöst werden:

1. Sie werden zur Anmeldung bei Azure aufgefordert – folgen Sie den Anweisungen zur Authentifizierung
1. Geben Sie einen eindeutigen Umgebungsnamen für sich ein – z. B. habe ich `nitya-mshack-azd` verwendet
1. Dadurch wird ein `.azure/`-Ordner erstellt – Sie sehen einen Unterordner mit dem Umgebungsnamen
1. Sie werden aufgefordert, einen Abonnementnamen auszuwählen – wählen Sie den Standard aus
1. Sie werden nach einem Standort gefragt – verwenden Sie `East US 2`

Jetzt warten Sie, bis die Bereitstellung abgeschlossen ist. **Das dauert 10-15 Minuten**

1. Wenn beendet, zeigt Ihre Konsole eine SUCCESS-Meldung wie diese:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ihr Azure-Portal enthält jetzt eine bereitgestellte Ressourcengruppe mit diesem Umgebungsnamen:

      ![Infra](../../../../../translated_images/de/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sie sind nun bereit, die bereitgestellte Infrastruktur und Anwendung zu validieren**.

---

## 4. Validierung der Vorlage

1. Besuchen Sie die Seite Azure Portal [Resource Groups](https://portal.azure.com/#browse/resourcegroups) – melden Sie sich an, wenn Sie dazu aufgefordert werden
1. Klicken Sie auf die RG für Ihren Umgebungsnamen – Sie sehen die oben gezeigte Seite

      - Klicken Sie auf die Ressource Azure Container Apps
      - Klicken Sie auf die Anwendungs-URL im Abschnitt _Wesentliches_ (oben rechts)

1. Sie sollten eine gehostete Front-End-Benutzeroberfläche der Anwendung sehen wie diese:

   ![App](../../../../../translated_images/de/03-test-application.471910da12c3038e.webp)

1. Versuchen Sie, ein paar [Beispielfragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) zu stellen

      1. Frage: ```Was ist die Hauptstadt von Frankreich?``` 
      1. Frage: ```Was ist das beste Zelt unter 200 $ für zwei Personen und welche Eigenschaften hat es?```

1. Sie sollten Antworten erhalten, die denen unten ähneln. _Aber wie funktioniert das?_

      ![App](../../../../../translated_images/de/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentenvalidierung

Die Azure Container App stellt einen Endpunkt bereit, der mit dem im Microsoft Foundry-Projekt für diese Vorlage bereitgestellten KI-Agenten verbunden ist. Schauen wir uns an, was das bedeutet.

1. Kehren Sie zur Azure Portal _Übersichtsseite_ für Ihre Ressourcengruppe zurück

1. Klicken Sie auf die Ressource `Microsoft Foundry` in dieser Liste

1. Sie sollten dies sehen. Klicken Sie auf die Schaltfläche `Gehe zum Microsoft Foundry Portal`.
   ![Foundry](../../../../../translated_images/de/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Sie sollten die Foundry-Projektseite für Ihre KI-Anwendung sehen
   ![Project](../../../../../translated_images/de/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klicken Sie auf `Agents` – Sie sehen den Standard-Agenten, der in Ihrem Projekt bereitgestellt wurde
   ![Agents](../../../../../translated_images/de/06-visit-agents.bccb263f77b00a09.webp)

1. Wählen Sie ihn aus – Sie sehen die Agentendetails. Beachten Sie Folgendes:

      - Der Agent verwendet standardmäßig File Search (immer)
      - Der Agent `Knowledge` zeigt an, dass 32 Dateien hochgeladen wurden (für die Dateisuche)
      ![Agents](../../../../../translated_images/de/07-view-agent-details.0e049f37f61eae62.webp)

1. Suchen Sie im linken Menü die Option `Data+indexes` und klicken Sie für Details.

      - Sie sollten die 32 für Wissen hochgeladenen Datendateien sehen.
      - Diese entsprechen den 12 Kundendateien und 20 Produktdateien unter `src/files`
      ![Data](../../../../../translated_images/de/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Sie haben den Betrieb des Agenten validiert!**

1. Die Agentenantworten basieren auf dem Wissen in diesen Dateien.
1. Sie können nun Fragen zu diesen Daten stellen und fundierte Antworten erhalten.
1. Beispiel: `customer_info_10.json` beschreibt die 3 Einkäufe von "Amanda Perez"

Besuchen Sie den Browsertab mit dem Container-App-Endpunkt erneut und fragen Sie: `Welche Produkte besitzt Amanda Perez?`. Sie sollten so etwas sehen:

![Data](../../../../../translated_images/de/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agenten-Spielplatz

Lassen Sie uns ein besseres Verständnis für die Möglichkeiten von Microsoft Foundry gewinnen, indem wir den Agenten im Agenten-Spielplatz ausprobieren.

1. Kehren Sie zur Seite `Agents` in Microsoft Foundry zurück – wählen Sie den Standard-Agenten aus
1. Klicken Sie auf die Option `Im Spielplatz ausprobieren` – Sie sollten eine Spielplatz-Benutzeroberfläche wie diese erhalten
1. Stellen Sie die gleiche Frage: `Welche Produkte besitzt Amanda Perez?`

    ![Data](../../../../../translated_images/de/09-ask-in-playground.a1b93794f78fa676.webp)

Sie erhalten die gleiche (oder eine ähnliche) Antwort – aber auch zusätzliche Informationen, mit denen Sie die Qualität, Kosten und Leistung Ihrer agentenbasierten App verstehen können. Zum Beispiel:

1. Beachten Sie, dass die Antwort die Datenquellen zitiert, die zur „Fundierung“ der Antwort verwendet wurden
1. Bewegen Sie den Mauszeiger über eines dieser Dateietiketten – stimmen die Daten mit Ihrer Anfrage und der angezeigten Antwort überein?

Sie sehen auch eine _Statistik_-Zeile unter der Antwort.

1. Bewegen Sie den Mauszeiger über eine beliebige Metrik – z. B. Safety (Sicherheit). Sie sehen so etwas:
1. Entspricht die bewertete Einstufung Ihrer Intuition bezüglich des Sicherheitsniveaus der Antwort?

      ![Data](../../../../../translated_images/de/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Eingebaute Beobachtbarkeit

Beobachtbarkeit bedeutet, Ihre Anwendung zu instrumentieren, um Daten zu generieren, die verwendet werden können, um ihre Abläufe zu verstehen, zu debuggen und zu optimieren. Um einen Eindruck davon zu bekommen:

1. Klicken Sie auf die Schaltfläche `Run Info anzeigen` – Sie sollten diese Ansicht sehen. Dies ist ein Beispiel für [Agent-Tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in Aktion. _Diese Ansicht erhalten Sie auch, wenn Sie im Hauptmenü auf Thread Logs klicken_.

   - Machen Sie sich mit den ausgeführten Schritten und vom Agenten verwendeten Werkzeugen vertraut
   - Verstehen Sie die Gesamtanzahl der Tokens (im Vergleich zur Nutzung von Ausgabetokens) für die Antwort
   - Verstehen Sie die Latenzzeit und wo Zeit in der Ausführung verbracht wird

      ![Agent](../../../../../translated_images/de/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klicken Sie auf den Tab `Metadaten`, um zusätzliche Attribute zum Lauf zu sehen, die später für das Debuggen nützlich sein können.

      ![Agent](../../../../../translated_images/de/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klicken Sie auf den Tab `Bewertungen`, um automatische Bewertungen der Agentenantwort zu sehen. Diese umfassen Sicherheitsevaluierungen (z. B. Selbstverletzung) und agentspezifische Bewertungen (z. B. Absichtserkennung, Aufgabenbefolgung).

      ![Agent](../../../../../translated_images/de/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Nicht zuletzt klicken Sie im Sidebar-Menü auf den Tab `Monitoring`.

      - Wählen Sie den Tab `Ressourcennutzung` auf der angezeigten Seite – und sehen Sie sich die Metriken an.
      - Verfolgen Sie die Anwendungsnutzung in Bezug auf Kosten (Tokens) und Last (Anfragen).
      - Verfolgen Sie die Anwendungs-Latenz bis zum ersten Byte (Eingabeverarbeitung) und letzten Byte (Ausgabe).

      ![Agent](../../../../../translated_images/de/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Umgebungsvariablen

Bisher haben wir die Bereitstellung im Browser durchgeführt – und validiert, dass unsere Infrastruktur bereitgestellt wurde und die Anwendung betriebsbereit ist. Um jedoch _code-first_ mit der Anwendung zu arbeiten, müssen wir unsere lokale Entwicklungsumgebung mit den relevanten Variablen konfigurieren, die zum Arbeiten mit diesen Ressourcen erforderlich sind. Die Verwendung von `azd` macht das einfach.

1. Die Azure Developer CLI [verwendet Umgebungsvariablen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), um Konfigurationseinstellungen für die Anwendungsbereitstellungen zu speichern und zu verwalten.

1. Umgebungsvariablen werden in `.azure/<env-name>/.env` gespeichert – dadurch werden sie auf die während der Bereitstellung verwendete Umgebung `env-name` eingegrenzt und helfen, Umgebungen zwischen verschiedenen Bereitstellungszielen im selben Repo zu isolieren.

1. Umgebungsvariablen werden von dem `azd`-Befehl automatisch geladen, wenn ein bestimmter Befehl ausgeführt wird (z. B. `azd up`). Beachten Sie, dass `azd` nicht automatisch _Betriebssystemebene_-Umgebungsvariablen (z. B. im Shell gesetzt) liest – verwenden Sie stattdessen `azd set env` und `azd get env`, um Informationen in Skripten zu übertragen.


Probieren wir ein paar Befehle aus:

1. Holen Sie sich alle für `azd` in dieser Umgebung gesetzten Umgebungsvariablen:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Sie sehen so etwas wie:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Holen Sie sich einen spezifischen Wert – z. B. möchte ich wissen, ob der Wert `AZURE_AI_AGENT_MODEL_NAME` gesetzt ist

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Sie sehen so etwas – er war standardmäßig nicht gesetzt!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Setzen Sie eine neue Umgebungsvariable für `azd`. Hier aktualisieren wir den Namen des Agentenmodells. _Hinweis: Alle Änderungen werden sofort in der Datei `.azure/<env-name>/.env` reflektiert._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nun sollten wir sehen, dass der Wert gesetzt ist:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Beachten Sie, dass einige Ressourcen persistent sind (z. B. Modellbereitstellungen) und daher mehr als nur ein `azd up` benötigen, um eine erneute Bereitstellung zu erzwingen. Versuchen wir, die ursprüngliche Bereitstellung abzubauen und mit geänderten Umgebungsvariablen neu bereitzustellen.

1. **Aktualisieren** Wenn Sie zuvor Infrastruktur mit einer azd-Vorlage bereitgestellt haben – können Sie den Zustand Ihrer lokalen Umgebungsvariablen anhand des aktuellen Zustands Ihrer Azure-Bereitstellung mit folgendem Befehl _aktualisieren_:

      ```bash title="" linenums="0"
      azd env refresh
      ```


      Dies ist eine leistungsstarke Methode, um Umgebungsvariablen über zwei oder mehr lokale Entwicklungsumgebungen hinweg zu _synchronisieren_ (z. B. ein Team mit mehreren Entwicklern) – wodurch die bereitgestellte Infrastruktur als verlässliche Quelle für den Zustand der Umgebungsvariablen dient. Teammitglieder müssen die Variablen einfach nur _aktualisieren_, um wieder synchron zu sein.

---

## 9. Herzlichen Glückwunsch 🏆

Sie haben gerade einen End-to-End-Workflow abgeschlossen, bei dem Sie:

- [X] Das gewünschte AZD-Template ausgewählt haben
- [X] Das Template in einer unterstützten Entwicklungsumgebung geöffnet haben
- [X] Das Template bereitgestellt und validiert haben, dass es funktioniert

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->