# 2. Vorlage validieren

> Validiert gegen `azd 1.23.12` im März 2026.

!!! tip "BY THE END OF THIS MODULE YOU WILL BE ABLE TO"

    - [ ] Analysieren Sie die KI-Lösungsarchitektur
    - [ ] Verstehen Sie den AZD-Bereitstellungsworkflow
    - [ ] Verwenden Sie GitHub Copilot, um Hilfe bei der Nutzung von AZD zu erhalten
    - [ ] **Lab 2:** Bereitstellen & Validieren der AI Agents-Vorlage

---


## 1. Einführung

Die [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) oder `azd` ist ein Open-Source-Kommandozeilentool, das den Entwickler-Workflow beim Erstellen und Bereitstellen von Anwendungen in Azure vereinfacht. 

[AZD Templates](https://learn.microsoft.com/azure/developer/azure-developer-cli/azd-templates) sind standardisierte Repositorys, die Beispielanwendungscode, _Infrastructure-as-Code_-Assets und `azd`-Konfigurationsdateien für eine kohärente Lösungsarchitektur enthalten. Die Bereitstellung der Infrastruktur wird so einfach wie ein `azd provision`-Befehl – während `azd up` Ihnen erlaubt, Infrastruktur bereitzustellen **und** Ihre Anwendung in einem Schritt zu deployen!

Daher kann das Starten Ihres Anwendungsentwicklungsprozesses so einfach sein, wie die passende _AZD Starter-Vorlage_ zu finden, die Ihren Anwendungs- und Infrastruktur-Anforderungen am nächsten kommt – und das Repository dann an Ihre Szenariobedingungen anzupassen.

Bevor wir beginnen, stellen Sie sicher, dass die Azure Developer CLI installiert ist.

1. Öffnen Sie ein VS Code-Terminal und geben Sie diesen Befehl ein:

      ```bash title="" linenums="0"
      azd version
      ```

1. Sie sollten etwas Ähnliches sehen!

      ```bash title="" linenums="0"
      azd version 1.23.12 (commit <current-build>)
      ```

**Sie sind jetzt bereit, eine Vorlage mit azd auszuwählen und bereitzustellen**

---

## 2. Vorlagenauswahl

Die Microsoft Foundry-Plattform wird mit einer [Auswahl empfohlener AZD-Vorlagen](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started) geliefert, die beliebte Lösungsszenarien wie _Multi-Agent Workflow Automation_ und _Multimodale Inhaltsverarbeitung_ abdecken. Sie können diese Vorlagen auch über das Microsoft Foundry-Portal entdecken.

1. Besuchen Sie [https://ai.azure.com/templates](https://ai.azure.com/templates)
1. Melden Sie sich im Microsoft Foundry-Portal an, wenn Sie dazu aufgefordert werden – Sie sehen etwas Ähnliches.

![Vorlage auswählen](../../../../../translated_images/de/01-pick-template.60d2d5fff5ebc374.webp)


Die **Basic**-Optionen sind Ihre Starter-Vorlagen:

1. [ ] [Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat) die eine einfache Chat-Anwendung _mit Ihren Daten_ zu Azure Container Apps bereitstellt. Verwenden Sie diese, um ein einfaches KI-Chatbot-Szenario zu erkunden.
1. [X] [Get Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) die ebenfalls einen standardmäßigen AI Agent (mit den Foundry Agents) bereitstellt. Nutzen Sie dies, um sich mit agentischen KI-Lösungen vertraut zu machen, die Tools und Modelle einbinden.

Öffnen Sie den zweiten Link in einem neuen Browser-Tab (oder klicken Sie auf `Open in GitHub` für die zugehörige Karte). Sie sollten das Repository für diese AZD-Vorlage sehen. Nehmen Sie sich eine Minute Zeit, um die README zu erkunden. Die Anwendungsarchitektur sieht so aus:

![Architektur](../../../../../translated_images/de/architecture.8cec470ec15c65c7.webp)

---

## 3. Vorlage aktivieren

Lassen Sie uns versuchen, diese Vorlage bereitzustellen und sicherzustellen, dass sie gültig ist. Wir folgen den Richtlinien im Abschnitt [Getting Started](https://github.com/Azure-Samples/get-started-with-ai-agents?tab=readme-ov-file#getting-started).

1. Wählen Sie eine Arbeitsumgebung für das Vorlagen-Repository:

      - **GitHub Codespaces**: Klicken Sie auf [diesen Link](https://github.com/codespaces/new/Azure-Samples/get-started-with-ai-agents) und bestätigen Sie `Create codespace`
      - **Lokales Klonen oder Dev Container**: Klonen Sie `Azure-Samples/get-started-with-ai-agents` und öffnen Sie es in VS Code

1. Warten Sie, bis das VS Code-Terminal bereit ist, und geben Sie dann den folgenden Befehl ein:

   ```bash title="" linenums="0"
   azd up
   ```

Führen Sie die Workflow-Schritte aus, die dadurch ausgelöst werden:

1. Sie werden aufgefordert, sich bei Azure anzumelden – folgen Sie den Anweisungen zur Authentifizierung
1. Geben Sie einen eindeutigen Umgebungsnamen für sich ein – z. B. habe ich `nitya-mshack-azd` verwendet
1. Dadurch wird ein `.azure/`-Ordner erstellt – Sie sehen einen Unterordner mit dem Umgebungsnamen
1. Sie werden aufgefordert, einen Abonnementnamen auszuwählen – wählen Sie das Standardabonnement
1. Sie werden nach einem Standort gefragt – verwenden Sie `East US 2`

Warten Sie nun, bis die Bereitstellung abgeschlossen ist. **Dies dauert 10–15 Minuten**

1. Nach Abschluss zeigt Ihre Konsole eine SUCCESS-Meldung wie diese:
      ```bash title="" linenums="0"
      SUCCESS: Your up workflow to provision and deploy to Azure completed in 10 minutes 17 seconds.
      ```
1. Ihr Azure-Portal verfügt nun über eine bereitgestellte Ressourcengruppe mit diesem Umgebungsnamen:

      ![Infrastruktur](../../../../../translated_images/de/02-provisioned-infra.46c706b14f56e0bf.webp)

1. **Sie sind jetzt bereit, die bereitgestellte Infrastruktur und Anwendung zu validieren**.

---

## 4. Vorlagenvalidierung

1. Besuchen Sie die Azure-Portal-Seite [Resource Groups](https://portal.azure.com/#browse/resourcegroups) - melden Sie sich an, wenn Sie dazu aufgefordert werden
1. Klicken Sie auf die RG für Ihren Umgebungsnamen - Sie sehen die oben gezeigte Seite

      - Klicken Sie auf die Azure Container Apps-Ressource
      - Klicken Sie auf die Application Url im Bereich _Essentials_ (oben rechts)

1. Sie sollten eine gehostete Anwendungs-Frontend-Oberfläche wie diese sehen:

   ![Anwendung](../../../../../translated_images/de/03-test-application.471910da12c3038e.webp)

1. Versuchen Sie, ein paar [Beispielfragen](https://github.com/Azure-Samples/get-started-with-ai-agents/blob/main/docs/sample_questions.md) zu stellen

      1. Stellen Sie die Frage: ```What is the capital of France?``` 
      1. Stellen Sie die Frage: ```What's the best tent under $200 for two people, and what features does it include?```

1. Sie sollten Antworten erhalten, die denen unten ähneln. _Aber wie funktioniert das?_ 

      ![Antwort](../../../../../translated_images/de/03-test-question.521c1e863cbaddb6.webp)

---

## 5. Agentenvalidierung

Die Azure Container App stellt einen Endpunkt bereit, der sich mit dem AI Agent verbindet, der im Microsoft Foundry-Projekt für diese Vorlage bereitgestellt wurde. Werfen wir einen Blick darauf, was das bedeutet.

1. Kehren Sie zur Azure-Portal-Übersichtsseite für Ihre Ressourcengruppe zurück

1. Klicken Sie auf die `Microsoft Foundry`-Ressource in dieser Liste

1. Sie sollten dies sehen. Klicken Sie auf die Schaltfläche `Go to Microsoft Foundry Portal`. 
   ![Foundry-Portal](../../../../../translated_images/de/04-view-foundry-project.fb94ca41803f28f3.webp)

1. Sie sollten die Foundry-Projektseite für Ihre KI-Anwendung sehen
   ![Projekt](../../../../../translated_images/de/05-visit-foundry-portal.d734e98135892d7e.webp)

1. Klicken Sie auf `Agents` - Sie sehen den standardmäßig in Ihrem Projekt bereitgestellten Agenten
   ![Agenten](../../../../../translated_images/de/06-visit-agents.bccb263f77b00a09.webp)

1. Wählen Sie ihn aus – und Sie sehen die Agentendetails. Beachten Sie Folgendes:

      - Der Agent verwendet standardmäßig (immer) File Search
      - Der `Knowledge`-Bereich des Agents zeigt an, dass 32 Dateien hochgeladen wurden (für File Search)
      ![Agentendetails](../../../../../translated_images/de/07-view-agent-details.0e049f37f61eae62.webp)

1. Suchen Sie in der linken Menüleiste die Option `Data+indexes` und klicken Sie für Details. 

      - Sie sollten die 32 hochgeladenen Datendateien für Knowledge sehen.
      - Diese entsprechen den 12 Kunden-Dateien und 20 Produkt-Dateien unter `src/files` 
      ![Daten](../../../../../translated_images/de/08-visit-data-indexes.5a4cc1686fa0d19a.webp)

**Sie haben die Agentenfunktion validiert!** 

1. Die Antworten des Agents basieren auf dem Wissen in diesen Dateien. 
1. Sie können jetzt Fragen zu diesen Daten stellen und erhalten fundierte Antworten.
1. Beispiel: `customer_info_10.json` beschreibt die 3 Käufe von "Amanda Perez"

Rufen Sie den Browser-Tab mit dem Container App-Endpunkt auf und fragen Sie: `What products does Amanda Perez own?`. Sie sollten so etwas sehen:

![Daten](../../../../../translated_images/de/09-ask-in-aca.4102297fc465a4d5.webp)

---

## 6. Agenten-Playground

Lassen Sie uns ein besseres Gefühl für die Fähigkeiten von Microsoft Foundry entwickeln, indem wir den Agenten im Agents Playground ausprobieren. 

1. Kehren Sie zur Seite `Agents` in Microsoft Foundry zurück - wählen Sie den Standardagenten aus
1. Klicken Sie auf die Option `Try in Playground` - Sie sollten eine Playground-Oberfläche wie diese erhalten
1. Stellen Sie dieselbe Frage: `What products does Amanda Perez own?`

    ![Daten](../../../../../translated_images/de/09-ask-in-playground.a1b93794f78fa676.webp)

Sie erhalten dieselbe (oder eine ähnliche) Antwort – aber Sie erhalten auch zusätzliche Informationen, mit denen Sie die Qualität, die Kosten und die Leistung Ihrer agentischen App besser verstehen können. Zum Beispiel:

1. Beachten Sie, dass die Antwort die Datendateien nennt, die verwendet wurden, um die Antwort zu "grounden"
1. Fahren Sie mit der Maus über eines dieser Dateilabels – stimmen die Daten mit Ihrer Anfrage und der angezeigten Antwort überein?

Sie sehen auch eine _stats_-Zeile unterhalb der Antwort. 

1. Fahren Sie mit der Maus über eine beliebige Metrik – z. B. Safety. Sie sehen so etwas
1. Entspricht die bewertete Einstufung Ihrer Einschätzung des Sicherheitsniveaus der Antwort?

      ![Daten](../../../../../translated_images/de/10-view-run-info-meter.6cdb89a0eea5531f.webp)

---

## 7. Eingebaute Beobachtbarkeit

Beobachtbarkeit bedeutet, Ihre Anwendung so zu instrumentieren, dass Daten erzeugt werden, die verwendet werden können, um ihren Betrieb zu verstehen, zu debuggen und zu optimieren. Um einen Eindruck davon zu bekommen:

1. Klicken Sie auf die Schaltfläche `View Run Info` - Sie sollten diese Ansicht sehen. Dies ist ein Beispiel für [Agent tracing](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/trace-agents-sdk#view-trace-results-in-the-azure-ai-foundry-agents-playground) in Aktion. _Sie können diese Ansicht auch erhalten, indem Sie Thread Logs im Top-Level-Menü anklicken_.

   - Verschaffen Sie sich einen Eindruck von den Ausführungsschritten und den vom Agenten eingesetzten Tools
   - Verstehen Sie die Gesamtanzahl der Tokens (im Vergleich zur Nutzung von Ausgabe-Tokens) für die Antwort
   - Verstehen Sie die Latenz und wo die Zeit während der Ausführung verbracht wird

      ![Agentenlauf](../../../../../translated_images/de/10-view-run-info.b20ebd75fef6a1cc.webp)

1. Klicken Sie auf die Registerkarte `Metadata`, um zusätzliche Attribute für den Lauf zu sehen, die später nützlichen Kontext zur Fehlerbehebung liefern können.   

      ![Agent-Metadaten](../../../../../translated_images/de/11-view-run-info-metadata.7966986122c7c2df.webp)


1. Klicken Sie auf die Registerkarte `Evaluations`, um automatische Bewertungen der Agentenantwort zu sehen. Diese umfassen Sicherheitsbewertungen (z. B. Selbstverletzung) und agentenspezifische Bewertungen (z. B. Intent-Auflösung, Aufgabeneinhaltung).

      ![Bewertungen](../../../../../translated_images/de/12-view-run-info-evaluations.ef25e4577d70efeb.webp)

1. Zu guter Letzt klicken Sie in der Seitenleiste auf die Registerkarte `Monitoring`.

      - Wählen Sie die Registerkarte `Resource usage` auf der angezeigten Seite aus – und betrachten Sie die Metriken.
      - Verfolgen Sie die Anwendungsnutzung in Bezug auf Kosten (Tokens) und Auslastung (Anfragen).
      - Verfolgen Sie die Anwendungs-Latenz bis zum ersten Byte (Eingabeverarbeitung) und letzten Byte (Ausgabe).

      ![Monitoring-Ressourcen](../../../../../translated_images/de/13-monitoring-resources.5148015f7311807f.webp)

---

## 8. Umgebungsvariablen

Bisher haben wir die Bereitstellung im Browser durchlaufen – und validiert, dass unsere Infrastruktur bereitgestellt ist und die Anwendung funktioniert. Um jedoch mit dem Anwendungscode „code-first“ zu arbeiten, müssen wir unsere lokale Entwicklungsumgebung mit den relevanten Variablen konfigurieren, die zum Arbeiten mit diesen Ressourcen erforderlich sind. Mit `azd` ist das einfach.

1. Die Azure Developer CLI [verwendet Umgebungsvariablen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/manage-environment-variables?tabs=bash), um Konfigurationseinstellungen für die Anwendungsbereitstellungen zu speichern und zu verwalten.

1. Umgebungsvariablen werden in `.azure/<env-name>/.env` gespeichert – dadurch werden sie auf die während der Bereitstellung verwendete `env-name`-Umgebung beschränkt und helfen Ihnen, Umgebungen zwischen verschiedenen Bereitstellungszielen im selben Repo zu isolieren.

1. Umgebungsvariablen werden automatisch vom `azd`-Befehl geladen, wann immer er einen bestimmten Befehl ausführt (z. B. `azd up`). Beachten Sie, dass `azd` nicht automatisch _OS-Level_-Umgebungsvariablen (z. B. in der Shell gesetzt) liest – verwenden Sie stattdessen `azd set env` und `azd get env`, um Informationen innerhalb von Skripten zu übertragen.


Probieren wir ein paar Befehle aus:

1. Rufen Sie alle für `azd` in dieser Umgebung gesetzten Umgebungsvariablen ab:

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

1. Rufen Sie einen bestimmten Wert ab – z. B. möchte ich wissen, ob wir den Wert `AZURE_AI_AGENT_MODEL_NAME` gesetzt haben

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```
      
      Sie sehen so etwas – er wurde standardmäßig nicht gesetzt!

      ```bash title="" linenums="0"
      ERROR: key 'AZURE_AI_AGENT_MODEL_NAME' not found in the environment values
      ```

1. Legen Sie eine neue Umgebungsvariable für `azd` fest. Hier aktualisieren wir den Agent-Modellnamen. _Hinweis: Alle vorgenommenen Änderungen werden sofort in der Datei `.azure/<env-name>/.env` widergespiegelt._

      ```bash title="" linenums="0"
      azd env set AZURE_AI_AGENT_MODEL_NAME gpt-4.1
      azd env set AZURE_AI_AGENT_MODEL_VERSION 2025-04-14
      azd env set AZURE_AI_AGENT_DEPLOYMENT_CAPACITY 150
      ```

      Jetzt sollten wir feststellen, dass der Wert gesetzt ist:

      ```bash title="" linenums="0"
      azd env get-value AZURE_AI_AGENT_MODEL_NAME 
      ```

1. Beachten Sie, dass einige Ressourcen persistent sind (z. B. Modellbereitstellungen) und mehr als nur ein `azd up` erfordern, um eine erneute Bereitstellung zu erzwingen. Versuchen wir, die ursprüngliche Bereitstellung abzubauen und mit geänderten Umgebungsvariablen erneut bereitzustellen.

1. **Refresh** Wenn Sie zuvor Infrastruktur mit einer azd-Vorlage bereitgestellt haben – können Sie den Zustand Ihrer lokalen Umgebungsvariablen basierend auf dem aktuellen Zustand Ihrer Azure-Bereitstellung mit diesem Befehl _refreshen_:

      ```bash title="" linenums="0"
      azd env refresh
      ```

      Dies ist eine leistungsstarke Methode, um Umgebungsvariablen über zwei oder mehr lokale Entwicklungsumgebungen hinweg zu _synchronisieren_ (z. B. ein Team mit mehreren Entwicklern) - und ermöglicht es der bereitgestellten Infrastruktur, als verlässliche Quelle für den Zustand der Umgebungsvariablen zu dienen. Teammitglieder müssen die Variablen einfach _aktualisieren_, um wieder synchron zu sein.

---

## 9. Herzlichen Glückwunsch 🏆

Sie haben gerade einen End-to-End-Workflow abgeschlossen, bei dem Sie:

- [X] Die AZD-Vorlage ausgewählt, die Sie verwenden möchten
- [X] Die Vorlage in einer unterstützten Entwicklungsumgebung geöffnet
- [X] Die Vorlage bereitgestellt und überprüft, dass sie funktioniert

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Haftungsausschluss**:
Dieses Dokument wurde mit dem KI-Übersetzungsdienst [Co-op Translator](https://github.com/Azure/co-op-translator) übersetzt. Obwohl wir uns um Genauigkeit bemühen, beachten Sie bitte, dass automatisierte Übersetzungen Fehler oder Ungenauigkeiten enthalten können. Das Originaldokument in seiner Originalsprache ist als maßgebliche Quelle zu betrachten. Bei kritischen Informationen wird eine professionelle menschliche Übersetzung empfohlen. Wir haften nicht für Missverständnisse oder Fehlinterpretationen, die sich aus der Verwendung dieser Übersetzung ergeben.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->