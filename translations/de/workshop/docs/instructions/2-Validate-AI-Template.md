# 2. Vorlage validieren

> Validiert gegen `azd 1.25.6` im Juni 2026.

!!! tip "AM ENDE DIESES MODULS WERDEN SIE FOLGENDES KÖNNEN"

    - [ ] Die KI-Lösungsarchitektur analysieren
    - [ ] Den AZD-Bereitstellungsworkflow verstehen
    - [ ] GitHub Copilot zur Unterstützung bei der AZD-Nutzung verwenden
    - [ ] **Lab 2:** Bereitstellen & Validieren der AI Agents-Vorlage

---


## 1. Einführung

Die [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) oder `azd` ist ein Open-Source-Kommandozeilentool, das den Entwickler-Workflow beim Erstellen und Bereitstellen von Anwendungen in Azure vereinfacht. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sind standardisierte Repositories, die Beispielanwendungscode, _Infrastruktur-als-Code_-Assets und `azd`-Konfigurationsdateien für eine kohärente Lösungsarchitektur enthalten. Die Bereitstellung der Infrastruktur wird so einfach wie ein `azd provision`-Befehl – während `azd up` es Ihnen ermöglicht, Infrastruktur bereitzustellen **und** Ihre Anwendung auf einmal zu deployen!

Als Ergebnis kann der Einstieg in Ihre Anwendungsentwicklung so einfach sein, die passende _AZD Starter-Vorlage_ zu finden, die Ihren Anwendungs- und Infrastrukturanforderungen am nächsten kommt – und das Repository dann so anzupassen, dass es Ihren Szenariobedürfnissen entspricht.

Bevor wir beginnen, stellen Sie sicher, dass Sie die Azure Developer CLI installiert haben.

1. Öffnen Sie ein VS Code-Terminal und geben Sie diesen Befehl ein:

      ```bash title="" linenums="0"
      azd version
      ```

1. Sie sollten so etwas sehen!

      ```bash title="" linenums="0"
      azd version 1.25.6 (commit <current-build>)
      ```

**Sie sind jetzt bereit, eine Vorlage mit azd auszuwählen und bereitzustellen**

---

## 2. Vorlagenauswahl

Die Microsoft Foundry-Plattform wird mit einer [Auswahl empfohlener AZD-Vorlagen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) geliefert, die beliebte Lösungsszenarien wie _Multi-Agent-Workflow-Automation_ und _Multi-modale Inhaltsverarbeitung_ abdecken. Sie können diese Vorlagen auch über das Microsoft Foundry-Portal entdecken.

1. Besuchen Sie [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Melden Sie sich beim Microsoft Foundry-Portal an, wenn Sie dazu aufgefordert werden – Sie sehen etwas Ähnliches.

![Auswahl](../../../../../translated_images/de/01-pick-template.60d2d5fff5ebc374.webp)


Die **Basic**-Optionen sind Ihre Starter-Vorlagen:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) die eine einfache Chat-Anwendung _mit Ihren Daten_ zu Azure Container Apps bereitstellt. Verwenden Sie diese, um ein grundlegendes KI-Chatbot-Szenario zu erkunden.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) die ebenfalls einen Standard-AI-Agenten (mit den Foundry Agents) bereitstellt. Verwenden Sie diese, um sich mit agentischen KI-Lösungen vertraut zu machen, die Tools und Modelle einbeziehen.

Öffnen Sie den zweiten Link in einem neuen Browser-Tab (oder klicken Sie auf `Open in GitHub` für die zugehörige Karte). Sie sollten das Repository für diese AZD-Vorlage sehen. Nehmen Sie sich eine Minute, um die README zu erkunden. Die Anwendungsarchitektur sieht folgendermaßen aus:

![Architektur](../../../../../translated_images/de/architecture.8cec470ec15c65c7.webp)

---

## 3. Vorlagenaktivierung

Versuchen wir, diese Vorlage bereitzustellen und sicherzustellen, dass sie gültig ist. Wir folgen den Richtlinien im Abschnitt [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Wählen Sie eine Arbeitsumgebung für das Vorlagen-Repository:

      - **GitHub Codespaces**: Klicken Sie auf [diesen Link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) und bestätigen Sie `Create codespace`
      - **Lokales Klonen oder Dev-Container**: Klonen Sie `Azure-Samples/get-started-with-ai-agents` und öffnen Sie es in VS Code

1. Warten Sie, bis das VS Code-Terminal bereit ist, und geben Sie dann den folgenden Befehl ein:

   ```bash title="" linenums="0"
   azd up
   ```

Führen Sie die Workflow-Schritte aus, die dadurch ausgelöst werden:

1. Sie werden aufgefordert, sich bei Azure anzumelden – folgen Sie den Anweisungen zur Authentifizierung
1. Geben Sie einen eindeutigen Namen für die Umgebung ein – z. B. habe ich `nitya-mshack-azd` verwendet
1. Dadurch wird ein `.azure/`-Ordner erstellt – Sie sehen einen Unterordner mit dem Umgebungsnamen
1. Sie werden aufgefordert, einen Abonnementnamen auszuwählen – wählen Sie das Standardabonnement
1. Sie werden nach einem Standort gefragt – verwenden Sie `East US 2`

Warten Sie nun, bis die Bereitstellung abgeschlossen ist. **Dies dauert 10–15 Minuten**

1. Wenn die Bereitstellung abgeschlossen ist, zeigt Ihre Konsole eine SUCCESS-Nachricht wie diese an:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ihr Azure-Portal verfügt jetzt über eine bereitgestellte Ressourcengruppe mit diesem Umgebungsnamen:

      ![Infrastruktur](../../../../../translated_images/de/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sie sind jetzt bereit, die bereitgestellte Infrastruktur und Anwendung zu validieren**.

---

## 4. Vorlagenvalidierung

1. Rufen Sie die Azure-Portal-Seite [Resource Groups](https://portal.azure.com/#browse/resourcegroups) auf – melden Sie sich bei Aufforderung an
1. Klicken Sie auf die RG für Ihren Umgebungsnamen – Sie sehen die oben gezeigte Seite

      - Klicken Sie auf die Azure Container Apps-Ressource
      - Klicken Sie auf die Application Url im Abschnitt _Essentials_ (oben rechts)

1. Sie sollten eine gehostete Frontend-Benutzeroberfläche der Anwendung wie diese sehen:

   ![Anwendung](../../../../../translated_images/de/03-test-application.471910da12c3038e.webp)

1. Versuchen Sie, ein paar [Beispielfragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) zu stellen

      1. Stellen Sie die Frage: ```What is the capital of France?``` 
      1. Stellen Sie die Frage: ```What's the best tent under $200 for two people, and what features does it include?```

1. Sie sollten Antworten ähnlich wie unten gezeigt erhalten. _Aber wie funktioniert das?_ 

      ![Anwendung](../../../../../translated_images/de/03-test-question.521c1e863cbaddb6.webp)

---

## 5.  Agentenvalidierung

Die Azure Container App stellt einen Endpunkt bereit, der sich mit dem im Microsoft Foundry-Projekt für diese Vorlage bereitgestellten AI-Agenten verbindet. Sehen wir uns an, was das bedeutet.

1. Kehren Sie zur Azure-Portal-_Übersicht_-Seite Ihrer Ressourcengruppe zurück

1. Klicken Sie in dieser Liste auf die Ressource `Microsoft Foundry`

1. Sie sollten dies sehen. Klicken Sie auf die Schaltfläche `Go to Microsoft Foundry Portal`. 
   ![Foundry](../../../../../translated_images/de/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Sie sollten die Foundry-Projektseite für Ihre KI-Anwendung sehen
   ![Projekt](../../../../../translated_images/de/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klicken Sie auf `Agents` – Sie sehen den standardmäßig in Ihrem Projekt bereitgestellten Agenten
   ![Agenten](../../../../../translated_images/de/06-visit-agents.bccb263f77b00a09.webp)

1. Wählen Sie ihn aus – und Sie sehen die Agentendetails. Beachten Sie Folgendes:

      - Der Agent verwendet standardmäßig File Search (immer)
      - Bei `Knowledge` des Agenten wird angezeigt, dass 32 Dateien hochgeladen wurden (für File Search)
      ![Agentendetails](../../../../../translated_images/de/07-view-agent-details.0e049f37f61eae62.webp)

1. Suchen Sie im linken Menü die Option `Data+indexes` und klicken Sie für Details. 

      - Sie sollten die 32 Datendateien sehen, die für Knowledge hochgeladen wurden.
      - Diese entsprechen den 12 Kunden-Dateien und 20 Produktdateien unter `src/files` 
      ![Daten](../../../../../translated_images/de/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Sie haben die Agentenfunktion validiert!** 

1. Die Antworten des Agenten basieren auf dem Wissen in diesen Dateien. 
1. Sie können nun Fragen zu diesen Daten stellen und erhalten fundierte Antworten.
1. Beispiel: `customer_info_10.json` beschreibt die 3 Einkäufe von "Amanda Perez"

Öffnen Sie den Browser-Tab mit dem Container-App-Endpunkt erneut und fragen Sie: `What products does Amanda Perez own?`. Sie sollten etwas in dieser Art sehen:

![Daten](../../../../../translated_images/de/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agenten-Playground

Lassen Sie uns ein wenig mehr Intuition für die Fähigkeiten von Microsoft Foundry aufbauen, indem wir den Agenten im Agents Playground ausprobieren. 

1. Kehren Sie zur Seite `Agents` in Microsoft Foundry zurück – wählen Sie den Standardagenten aus
1. Klicken Sie auf die Option `Try in Playground` – Sie sollten eine Playground-Benutzeroberfläche wie diese erhalten
1. Stellen Sie dieselbe Frage: `What products does Amanda Perez own?`

    ![Daten](../../../../../translated_images/de/09-ask-in-playground.a1b93794f78fa676.webp)

Sie erhalten dieselbe (oder eine ähnliche) Antwort – zusätzlich erhalten Sie Informationen, mit denen Sie die Qualität, Kosten und Leistung Ihrer agentischen App verstehen können. Zum Beispiel:

1. Beachten Sie, dass die Antwort die Datendateien aufführt, die zur 'Fundierung' der Antwort verwendet wurden
1. Fahren Sie mit der Maus über eines dieser Dateilabels – stimmen die Daten mit Ihrer Abfrage und der angezeigten Antwort überein?

Sie sehen außerdem eine _Stats_-Zeile unterhalb der Antwort. 

1. Fahren Sie mit der Maus über eine Metrik – z. B. Sicherheit. Sie sehen so etwas
1. Entspricht die bewertete Einstufung Ihrer Intuition bezüglich des Sicherheitsniveaus der Antwort?

      ![Daten](../../../../../translated_images/de/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Eingebaute Beobachtbarkeit

Beobachtbarkeit bedeutet, Ihre Anwendung so zu instrumentieren, dass Daten erzeugt werden, die verwendet werden können, um den Betrieb zu verstehen, zu debuggen und zu optimieren. Um dies zu veranschaulichen:

1. Klicken Sie auf die Schaltfläche `View Run Info` – Sie sollten diese Ansicht sehen. Dies ist ein Beispiel für [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in Aktion. _Sie können diese Ansicht auch erhalten, indem Sie im Hauptmenü auf Thread Logs klicken_.

   - Verschaffen Sie sich einen Überblick über die Ausführungsschritte und die vom Agenten eingesetzten Tools
   - Verstehen Sie die Gesamtanzahl der Tokens (gegenüber der Nutzung der Ausgabe-Tokens) für die Antwort
   - Verstehen Sie die Latenz und wo die Zeit in der Ausführung verbracht wird

      ![Agent](../../../../../translated_images/de/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klicken Sie auf die Registerkarte `Metadata`, um zusätzliche Attribute für den Lauf zu sehen, die nützlichen Kontext für die spätere Fehlersuche liefern können.   

      ![Agent](../../../../../translated_images/de/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klicken Sie auf die Registerkarte `Evaluations`, um automatische Bewertungen der Agentenantwort zu sehen. Diese umfassen Sicherheitsbewertungen (z. B. Selbstverletzung) und agentenspezifische Bewertungen (z. B. Intent-Auflösung, Einhaltung der Aufgabe).

      ![Agent](../../../../../translated_images/de/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Zuletzt klicken Sie auf die Registerkarte `Monitoring` im Seitenmenü.

      - Wählen Sie die Registerkarte `Resource usage` auf der angezeigten Seite aus – und sehen Sie sich die Metriken an.
      - Verfolgen Sie die Anwendungsauslastung in Bezug auf Kosten (Tokens) und Last (Requests).
      - Verfolgen Sie die Anwendungslatenz bis zum ersten Byte (Eingabeverarbeitung) und letzten Byte (Ausgabe).

      ![Agent](../../../../../translated_images/de/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Umgebungsvariablen

Bisher haben wir die Bereitstellung im Browser durchlaufen und bestätigt, dass unsere Infrastruktur bereitgestellt ist und die Anwendung einsatzbereit ist. Um jedoch code-first mit der Anwendung zu arbeiten, müssen wir unsere lokale Entwicklungsumgebung mit den relevanten Variablen konfigurieren, die zum Arbeiten mit diesen Ressourcen erforderlich sind. Mit `azd` ist das einfach.

1. Die Azure Developer CLI [verwendet Umgebungsvariablen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash) zum Speichern und Verwalten von Konfigurationseinstellungen für die Anwendungsbereitstellungen.

1. Umgebungsvariablen werden in `.azure/<env-name>/.env` gespeichert - dadurch werden sie auf die während der Bereitstellung verwendete `env-name`-Umgebung beschränkt und helfen Ihnen, Umgebungen zwischen verschiedenen Bereitstellungszielen im selben Repo zu isolieren.

1. Umgebungsvariablen werden automatisch vom `azd`-Befehl geladen, wenn er einen bestimmten Befehl ausführt (z. B. `azd up`). Beachten Sie, dass `azd` nicht automatisch _OS-level_-Umgebungsvariablen (z. B. in der Shell gesetzte) liest - verwenden Sie stattdessen `azd set env` und `azd get env`, um Informationen in Skripten zu übertragen.


Probieren wir ein paar Befehle aus:

1. Alle für `azd` in dieser Umgebung gesetzten Umgebungsvariablen abrufen:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Sie sehen so etwas:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4.1-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Einen bestimmten Wert abrufen - z. B. möchte ich wissen, ob wir den Wert `AZURE_AI_AGENT_MODEL_NAME` gesetzt haben

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Sie sehen so etwas – es wurde standardmäßig nicht gesetzt!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Legen Sie eine neue Umgebungsvariable für `azd` fest. Hier aktualisieren wir den Agenten-Modellnamen. _Hinweis: Änderungen werden sofort in der Datei `.azure/<env-name>/.env` übernommen.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Nun sollten wir feststellen, dass der Wert gesetzt ist:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Beachten Sie, dass einige Ressourcen persistent sind (z. B. Modellbereitstellungen) und mehr als nur ein `azd up` erfordern, um eine erneute Bereitstellung zu erzwingen. Versuchen wir, die ursprüngliche Bereitstellung zu entfernen und mit geänderten Umgebungsvariablen erneut bereitzustellen.

1. **Refresh** If you had previously deployed infrastructure using an azd template - you can _refresh_ the state of your local environment variables based on the current state of your Azure deployment using this command:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dies ist eine leistungsstarke Möglichkeit, Umgebungsvariablen zwischen zwei oder mehr lokalen Entwicklungsumgebungen zu _synchronisieren_ (z. B. Team mit mehreren Entwicklern) - wodurch die bereitgestellte Infrastruktur als die Quelle der Wahrheit für den Zustand der Umgebungsvariablen dient. Teammitglieder müssen einfach die Variablen _aktualisieren_, um wieder synchron zu sein.

---

## 9. Herzlichen Glückwunsch 🏆

Sie haben gerade einen End-to-End-Workflow abgeschlossen, bei dem Sie:

- [X] Das AZD-Template ausgewählt, das Sie verwenden möchten
- [X] Das Template in einer unterstützten Entwicklungsumgebung geöffnet
- [X] Das Template bereitgestellt und überprüft, dass es funktioniert

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Ursprungssprache gilt als maßgebliche Quelle. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir übernehmen keine Haftung für Missverständnisse oder Fehlinterpretationen, die aus der Verwendung dieser Übersetzung entstehen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->