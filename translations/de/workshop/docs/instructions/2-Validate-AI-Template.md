<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7816c6ec50c694c331e7c6092371be4d",
  "translation_date": "2025-09-24T10:59:01+00:00",
  "source_file": "workshop/docs/instructions/2-Validate-AI-Template.md",
  "language_code": "de"
}
-->
# 2. Validieren einer Vorlage

!!! tip "AM ENDE DIESES MODULS WERDEN SIE IN DER LAGE SEIN"

    - [ ] Die Architektur der KI-Lösung analysieren
    - [ ] Den AZD-Bereitstellungsworkflow verstehen
    - [ ] GitHub Copilot nutzen, um Hilfe bei der Verwendung von AZD zu erhalten
    - [ ] **Lab 2:** Die Vorlage für KI-Agenten bereitstellen und validieren

---

## 1. Einführung

Die [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) oder `azd` ist ein Open-Source-Befehlszeilentool, das den Entwicklerworkflow beim Erstellen und Bereitstellen von Anwendungen in Azure vereinfacht.

[AZD-Vorlagen](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sind standardisierte Repositories, die Beispielanwendungscode, _Infrastructure as Code_-Assets und `azd`-Konfigurationsdateien für eine kohärente Lösungsarchitektur enthalten. Die Bereitstellung der Infrastruktur wird so einfach wie ein `azd provision`-Befehl – während `azd up` es ermöglicht, die Infrastruktur **und** Ihre Anwendung in einem Schritt bereitzustellen!

Dadurch kann der Entwicklungsprozess Ihrer Anwendung so einfach sein wie das Finden der richtigen _AZD-Startervorlage_, die Ihren Anforderungen an Anwendung und Infrastruktur am nächsten kommt – und dann das Repository an Ihre Szenarioanforderungen anzupassen.

Bevor wir beginnen, stellen wir sicher, dass die Azure Developer CLI installiert ist.

1. Öffnen Sie ein VS Code-Terminal und geben Sie diesen Befehl ein:

      ```bash title="" linenums="0"
      azd version
      ```

1. Sie sollten etwas Ähnliches sehen!

      ```bash title="" linenums="0"
      azd version 1.19.0 (commit b3d68cea969b2bfbaa7b7fa289424428edb93e97)
      ```

**Sie sind jetzt bereit, eine Vorlage mit azd auszuwählen und bereitzustellen**

---

## 2. Auswahl einer Vorlage

Die Azure AI Foundry-Plattform bietet eine [Reihe empfohlener AZD-Vorlagen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started), die beliebte Lösungsszenarien wie _Multi-Agent-Workflow-Automatisierung_ und _Multi-Modale Inhaltsverarbeitung_ abdecken. Sie können diese Vorlagen auch entdecken, indem Sie das Azure AI Foundry-Portal besuchen.

1. Besuchen Sie [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Melden Sie sich im Azure AI Foundry-Portal an, wenn Sie dazu aufgefordert werden – Sie sehen etwas Ähnliches.

![Pick](../../../../../translated_images/de/01-pick-template.60d2d5fff5ebc374.png)

Die **Basic**-Optionen sind Ihre Startervorlagen:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat), die eine einfache Chat-Anwendung _mit Ihren Daten_ in Azure Container Apps bereitstellt. Verwenden Sie dies, um ein grundlegendes KI-Chatbot-Szenario zu erkunden.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents), die ebenfalls einen Standard-KI-Agenten (mit dem Azure AI Agent Service) bereitstellt. Verwenden Sie dies, um sich mit agentenbasierten KI-Lösungen vertraut zu machen, die Tools und Modelle einbeziehen.

Besuchen Sie den zweiten Link in einem neuen Browser-Tab (oder klicken Sie auf `Open in GitHub` für die zugehörige Karte). Sie sollten das Repository für diese AZD-Vorlage sehen. Nehmen Sie sich eine Minute Zeit, um die README-Datei zu erkunden. Die Anwendungsarchitektur sieht so aus:

![Arch](../../../../../translated_images/de/architecture.8cec470ec15c65c7.png)

---

## 3. Aktivierung der Vorlage

Lassen Sie uns versuchen, diese Vorlage bereitzustellen und sicherzustellen, dass sie gültig ist. Wir folgen den Richtlinien im Abschnitt [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Klicken Sie auf [diesen Link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) – bestätigen Sie die Standardaktion `Create codespace`
1. Dies öffnet einen neuen Browser-Tab – warten Sie, bis die GitHub Codespaces-Sitzung vollständig geladen ist
1. Öffnen Sie das VS Code-Terminal in Codespaces – geben Sie den folgenden Befehl ein:

   ```bash title="" linenums="0"
   azd up
   ```

Führen Sie die Workflow-Schritte aus, die dadurch ausgelöst werden:

1. Sie werden aufgefordert, sich bei Azure anzumelden – folgen Sie den Anweisungen zur Authentifizierung
1. Geben Sie einen eindeutigen Umgebungsnamen ein – z. B. habe ich `nitya-mshack-azd` verwendet
1. Dies erstellt einen `.azure/`-Ordner – Sie sehen einen Unterordner mit dem Umgebungsnamen
1. Sie werden aufgefordert, einen Abonnementnamen auszuwählen – wählen Sie den Standard aus
1. Sie werden nach einem Standort gefragt – verwenden Sie `East US 2`

Nun warten Sie, bis die Bereitstellung abgeschlossen ist. **Dies dauert 10-15 Minuten**

1. Wenn dies abgeschlossen ist, zeigt Ihre Konsole eine SUCCESS-Meldung wie diese an:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ihr Azure-Portal enthält jetzt eine bereitgestellte Ressourcengruppe mit diesem Umgebungsnamen:

      ![Infra](../../../../../translated_images/de/02-provisioned-infra.46c706b14f56e0bf.png)

1. **Sie sind jetzt bereit, die bereitgestellte Infrastruktur und Anwendung zu validieren**.

---

## 4. Validierung der Vorlage

1. Besuchen Sie die Seite [Ressourcengruppen](https://portal.azure.com/#browse/resourcegroups) im Azure-Portal – melden Sie sich an, wenn Sie dazu aufgefordert werden
1. Klicken Sie auf die RG für Ihren Umgebungsnamen – Sie sehen die oben gezeigte Seite

      - Klicken Sie auf die Azure Container Apps-Ressource
      - Klicken Sie auf die Anwendungs-URL im Abschnitt _Essentials_ (oben rechts)

1. Sie sollten eine gehostete Anwendungs-Frontend-UI wie diese sehen:

   ![App](../../../../../translated_images/de/03-test-application.471910da12c3038e.png)

1. Versuchen Sie, ein paar [Beispielfragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) zu stellen:

      1. Fragen Sie: ```What is the capital of France?``` 
      1. Fragen Sie: ```What's the best tent under $200 for two people, and what features does it include?```

1. Sie sollten Antworten erhalten, die ähnlich wie unten gezeigt sind. _Aber wie funktioniert das?_ 

      ![App](../../../../../translated_images/de/03-test-question.521c1e863cbaddb6.png)

---

## 5. Validierung des Agenten

Die Azure Container App stellt einen Endpunkt bereit, der mit dem KI-Agenten verbunden ist, der im Azure AI Foundry-Projekt für diese Vorlage bereitgestellt wurde. Schauen wir uns an, was das bedeutet.

1. Kehren Sie zur _Übersicht_-Seite Ihres Ressourcengruppen im Azure-Portal zurück

1. Klicken Sie auf die Ressource `Azure AI Foundry` in dieser Liste

1. Sie sollten dies sehen. Klicken Sie auf die Schaltfläche `Go to Azure AI Foundry Portal`. 
   ![Foundry](../../../../../translated_images/de/04-view-foundry-project.fb94ca41803f28f3.png)

1. Sie sollten die Foundry-Projektseite für Ihre KI-Anwendung sehen
   ![Project](../../../../../translated_images/de/05-visit-foundry-portal.d734e98135892d7e.png)

1. Klicken Sie auf `Agents` – Sie sehen den Standard-Agenten, der in Ihrem Projekt bereitgestellt wurde
   ![Agents](../../../../../translated_images/de/06-visit-agents.bccb263f77b00a09.png)

1. Wählen Sie ihn aus – und Sie sehen die Details des Agenten. Beachten Sie Folgendes:

      - Der Agent verwendet standardmäßig File Search (immer)
      - Die `Knowledge` des Agenten zeigt an, dass 32 Dateien hochgeladen wurden (für die Dateisuche)
      ![Agents](../../../../../translated_images/de/07-view-agent-details.0e049f37f61eae62.png)

1. Suchen Sie nach der Option `Data+indexes` im linken Menü und klicken Sie für Details. 

      - Sie sollten die 32 hochgeladenen Datenfiles für das Wissen sehen.
      - Diese entsprechen den 12 Kundenfiles und 20 Produktfiles unter `src/files` 
      ![Data](../../../../../translated_images/de/08-visit-data-indexes.5a4cc1686fa0d19a.png)

**Sie haben die Funktion des Agenten validiert!** 

1. Die Antworten des Agenten basieren auf dem Wissen in diesen Dateien. 
1. Sie können jetzt Fragen zu diesen Daten stellen und fundierte Antworten erhalten.
1. Beispiel: `customer_info_10.json` beschreibt die 3 Käufe von "Amanda Perez"

Öffnen Sie den Browser-Tab mit dem Container-App-Endpunkt erneut und fragen Sie: `What products does Amanda Perez own?`. Sie sollten etwas Ähnliches sehen:

![Data](../../../../../translated_images/de/09-ask-in-aca.4102297fc465a4d5.png)

---

## 6. Agenten-Spielplatz

Lassen Sie uns ein besseres Verständnis für die Fähigkeiten von Azure AI Foundry entwickeln, indem wir den Agenten im Agenten-Spielplatz ausprobieren. 

1. Kehren Sie zur Seite `Agents` in Azure AI Foundry zurück – wählen Sie den Standard-Agenten aus
1. Klicken Sie auf die Option `Try in Playground` – Sie sollten eine Spielplatz-UI wie diese erhalten
1. Stellen Sie dieselbe Frage: `What products does Amanda Perez own?`

    ![Data](../../../../../translated_images/de/09-ask-in-playground.a1b93794f78fa676.png)

Sie erhalten dieselbe (oder ähnliche) Antwort – aber Sie erhalten auch zusätzliche Informationen, die Ihnen helfen können, die Qualität, Kosten und Leistung Ihrer agentenbasierten Anwendung zu verstehen. Zum Beispiel:

1. Beachten Sie, dass die Antwort Datenfiles zitiert, die verwendet wurden, um die Antwort zu "fundieren"
1. Fahren Sie mit der Maus über eines dieser File-Labels – stimmen die Daten mit Ihrer Anfrage und der angezeigten Antwort überein?

Sie sehen auch eine _Statistik_-Zeile unter der Antwort. 

1. Fahren Sie mit der Maus über eine Metrik – z. B. Sicherheit. Sie sehen etwas wie dies
1. Entspricht die bewertete Einstufung Ihrer Intuition für das Sicherheitsniveau der Antwort?

      ![Data](../../../../../translated_images/de/10-view-run-info-meter.6cdb89a0eea5531f.png)

---x

## 7. Eingebaute Beobachtbarkeit

Beobachtbarkeit bedeutet, Ihre Anwendung so zu instrumentieren, dass Daten generiert werden, die verwendet werden können, um ihre Funktionsweise zu verstehen, zu debuggen und zu optimieren. Um ein Gefühl dafür zu bekommen:

1. Klicken Sie auf die Schaltfläche `View Run Info` – Sie sollten diese Ansicht sehen. Dies ist ein Beispiel für [Agenten-Tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in Aktion. _Sie können diese Ansicht auch erhalten, indem Sie im Hauptmenü auf Thread Logs klicken_.

   - Verschaffen Sie sich einen Überblick über die Ausführungsschritte und die vom Agenten verwendeten Tools
   - Verstehen Sie die Gesamtanzahl der Tokens (vs. der verwendeten Output-Tokens) für die Antwort
   - Verstehen Sie die Latenz und wo Zeit bei der Ausführung verbracht wird

      ![Agent](../../../../../translated_images/de/10-view-run-info.b20ebd75fef6a1cc.png)

1. Klicken Sie auf die Registerkarte `Metadata`, um zusätzliche Attribute für die Ausführung zu sehen, die nützliche Kontextinformationen für die spätere Fehlerbehebung liefern können.   

      ![Agent](../../../../../translated_images/de/11-view-run-info-metadata.7966986122c7c2df.png)

1. Klicken Sie auf die Registerkarte `Evaluations`, um automatische Bewertungen der Agentenantwort zu sehen. Dazu gehören Sicherheitsbewertungen (z. B. Selbstverletzung) und agentenspezifische Bewertungen (z. B. Intent-Auflösung, Aufgabenbefolgung).

      ![Agent](../../../../../translated_images/de/12-view-run-info-evaluations.ef25e4577d70efeb.png)

1. Zuletzt klicken Sie auf die Registerkarte `Monitoring` im Seitenmenü.

      - Wählen Sie die Registerkarte `Resource usage` auf der angezeigten Seite aus – und sehen Sie sich die Metriken an.
      - Verfolgen Sie die Nutzung der Anwendung in Bezug auf Kosten (Tokens) und Last (Anfragen).
      - Verfolgen Sie die Latenz der Anwendung bis zum ersten Byte (Eingabeverarbeitung) und bis zum letzten Byte (Ausgabe).

      ![Agent](../../../../../translated_images/de/13-monitoring-resources.5148015f7311807f.png)

---

## 8. Umgebungsvariablen

Bisher haben wir die Bereitstellung im Browser durchlaufen – und validiert, dass unsere Infrastruktur bereitgestellt ist und die Anwendung funktioniert. Um jedoch _code-first_ mit der Anwendung zu arbeiten, müssen wir unsere lokale Entwicklungsumgebung mit den relevanten Variablen konfigurieren, die erforderlich sind, um mit diesen Ressourcen zu arbeiten. Die Verwendung von `azd` macht dies einfach.

1. Die Azure Developer CLI [verwendet Umgebungsvariablen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), um Konfigurationseinstellungen für die Anwendungsbereitstellungen zu speichern und zu verwalten.

1. Umgebungsvariablen werden in `.azure/<env-name>/.env` gespeichert – dies beschränkt sie auf die Umgebung `env-name`, die während der Bereitstellung verwendet wurde, und hilft Ihnen, Umgebungen zwischen verschiedenen Bereitstellungszielen im selben Repository zu isolieren.

1. Umgebungsvariablen werden automatisch von dem `azd`-Befehl geladen, wann immer er einen bestimmten Befehl ausführt (z. B. `azd up`). Beachten Sie, dass `azd` keine _OS-Level_-Umgebungsvariablen (z. B. im Shell gesetzt) automatisch liest – verwenden Sie stattdessen `azd set env` und `azd get env`, um Informationen innerhalb von Skripten zu übertragen.

Probieren wir ein paar Befehle aus:

1. Holen Sie sich alle für `azd` in dieser Umgebung gesetzten Umgebungsvariablen:

      ```bash title="" linenums="0"
      azd env get-values
      ```
      
      Sie sehen etwas wie:

      ```bash title="" linenums="0"
      AZURE_AI_AGENT_DEPLOYMENT_NAME="gpt-4o-mini"
      AZURE_AI_AGENT_NAME="agent-template-assistant"
      AZURE_AI_EMBED_DEPLOYMENT_NAME="text-embedding-3-small"
      AZURE_AI_EMBED_DIMENSIONS=100
      ...
      ```

1. Holen Sie sich einen spezifischen Wert – z. B. möchte ich wissen, ob wir den Wert `AZURE_AI_AGENT_MODEL_NAME` gesetzt haben

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Sie sehen etwas wie dies – es wurde standardmäßig nicht gesetzt!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Setzen Sie eine neue Umgebungsvariable für `azd`. Hier aktualisieren wir den Agentenmodellnamen. _Hinweis: Alle vorgenommenen Änderungen werden sofort in der Datei `.azure/<env-name>/.env` reflektiert.

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Jetzt sollten wir feststellen, dass der Wert gesetzt ist:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Beachten Sie, dass einige Ressourcen persistent sind (z. B. Modellbereitstellungen) und mehr als nur ein `azd up` erfordern, um die erneute Bereitstellung zu erzwingen. Versuchen wir, die ursprüngliche Bereitstellung zu entfernen und mit geänderten Umgebungsvariablen erneut bereitzustellen.

1. **Aktualisieren** Wenn Sie zuvor Infrastruktur mit einer azd-Vorlage bereitgestellt haben – können Sie den Zustand Ihrer lokalen Umgebungsvariablen basierend auf dem aktuellen Zustand Ihrer Azure-Bereitstellung mit diesem Befehl _aktualisieren_:
      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dies ist eine leistungsstarke Methode, um Umgebungsvariablen zwischen zwei oder mehr lokalen Entwicklungsumgebungen zu synchronisieren (z. B. ein Team mit mehreren Entwicklern) – wobei die bereitgestellte Infrastruktur als Grundlage für den Zustand der Umgebungsvariablen dient. Teammitglieder müssen einfach die Variablen _aktualisieren_, um wieder synchron zu sein.

---

## 9. Herzlichen Glückwunsch 🏆

Du hast gerade einen vollständigen Workflow abgeschlossen, bei dem du:

- [X] Das AZD-Template ausgewählt hast, das du verwenden möchtest
- [X] Das Template mit GitHub Codespaces gestartet hast
- [X] Das Template bereitgestellt und überprüft hast, dass es funktioniert

---

