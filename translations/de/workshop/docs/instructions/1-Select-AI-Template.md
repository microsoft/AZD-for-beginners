<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-09-24T10:53:53+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "de"
}
-->
# 1. Wähle eine Vorlage aus

!!! tip "AM ENDE DIESES MODULS WIRST DU IN DER LAGE SEIN:"

    - [ ] Beschreiben, was AZD-Vorlagen sind
    - [ ] AZD-Vorlagen für KI entdecken und nutzen
    - [ ] Mit der AI Agents-Vorlage starten
    - [ ] **Lab 1:** AZD Quickstart mit GitHub Codespaces

---

## 1. Eine Bauherren-Analogie

Eine moderne, unternehmensbereite KI-Anwendung _von Grund auf_ zu entwickeln, kann überwältigend sein. Es ist ein bisschen so, als würdest du dein neues Zuhause selbst Stein für Stein bauen. Ja, es ist möglich! Aber es ist nicht der effektivste Weg, um das gewünschte Ergebnis zu erzielen!

Stattdessen beginnen wir oft mit einem bestehenden _Entwurfsplan_ und arbeiten mit einem Architekten zusammen, um ihn an unsere persönlichen Anforderungen anzupassen. Genau diesen Ansatz solltest du auch beim Erstellen intelligenter Anwendungen verfolgen. Finde zunächst eine gute Design-Architektur, die zu deinem Problem passt. Arbeite dann mit einem Lösungsarchitekten zusammen, um die Lösung für dein spezifisches Szenario anzupassen und zu entwickeln.

Aber wo finden wir diese Entwurfspläne? Und wie finden wir einen Architekten, der bereit ist, uns beizubringen, wie wir diese Pläne selbst anpassen und bereitstellen können? In diesem Workshop beantworten wir diese Fragen, indem wir dir drei Technologien vorstellen:

1. [Azure Developer CLI](https://aka.ms/azd) - ein Open-Source-Tool, das den Weg vom lokalen Entwickeln (Build) zur Cloud-Bereitstellung (Ship) beschleunigt.
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - standardisierte Open-Source-Repositories mit Beispielcode, Infrastruktur und Konfigurationsdateien für die Bereitstellung einer KI-Lösungsarchitektur.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - ein Codierungsagent, der auf Azure-Wissen basiert und uns dabei hilft, den Code zu navigieren und Änderungen vorzunehmen – mit natürlicher Sprache.

Mit diesen Tools können wir nun die richtige Vorlage _finden_, sie _bereitstellen_, um zu überprüfen, ob sie funktioniert, und sie _anpassen_, um sie an unsere spezifischen Szenarien anzupassen. Lass uns eintauchen und lernen, wie diese funktionieren.

---

## 2. Azure Developer CLI

Die [Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (oder `azd`) ist ein Open-Source-Befehlszeilentool, das deinen Weg von der Entwicklung bis zur Cloud-Bereitstellung mit einer Reihe von entwicklerfreundlichen Befehlen beschleunigen kann, die konsistent in deiner IDE (Entwicklung) und CI/CD (DevOps)-Umgebung funktionieren.

Mit `azd` kann deine Bereitstellungsreise so einfach sein wie:

- `azd init` - Initialisiert ein neues KI-Projekt basierend auf einer bestehenden AZD-Vorlage.
- `azd up` - Stellt Infrastruktur bereit und deployt deine Anwendung in einem Schritt.
- `azd monitor` - Echtzeitüberwachung und Diagnosen für deine bereitgestellte Anwendung.
- `azd pipeline config` - Einrichtung von CI/CD-Pipelines zur Automatisierung der Bereitstellung in Azure.

**🎯 | ÜBUNG**: <br/> Erkunde das `azd`-Befehlszeilentool in deiner GitHub Codespaces-Umgebung. Beginne mit diesem Befehl, um zu sehen, was das Tool kann:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/de/azd-flow.19ea67c2f81eaa66.png)

---

## 3. Die AZD-Vorlage

Damit `azd` dies erreichen kann, muss es wissen, welche Infrastruktur bereitgestellt werden soll, welche Konfigurationseinstellungen angewendet werden sollen und welche Anwendung bereitgestellt werden soll. Hier kommen [AZD-Vorlagen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) ins Spiel.

AZD-Vorlagen sind Open-Source-Repositories, die Beispielcode mit Infrastruktur- und Konfigurationsdateien kombinieren, die für die Bereitstellung der Lösungsarchitektur erforderlich sind. 
Durch die Verwendung eines _Infrastructure-as-Code_ (IaC)-Ansatzes ermöglichen sie es, Ressourcendefinitionen und Konfigurationseinstellungen der Vorlage versionskontrolliert zu verwalten (genau wie den Quellcode der Anwendung) – und schaffen so wiederverwendbare und konsistente Workflows für die Nutzer des Projekts.

Wenn du eine AZD-Vorlage für _dein_ Szenario erstellst oder wiederverwendest, solltest du dir folgende Fragen stellen:

1. Was baust du? → Gibt es eine Vorlage mit Startcode für dieses Szenario?
1. Wie ist deine Lösung aufgebaut? → Gibt es eine Vorlage mit den erforderlichen Ressourcen?
1. Wie wird deine Lösung bereitgestellt? → Denke an `azd deploy` mit Pre-/Post-Processing-Hooks!
1. Wie kannst du sie weiter optimieren? → Denke an integrierte Überwachung und Automatisierungspipelines!

**🎯 | ÜBUNG**: <br/> 
Besuche die [Awesome AZD](https://azure.github.io/awesome-azd/) Galerie und nutze die Filter, um die über 250 verfügbaren Vorlagen zu erkunden. Sieh nach, ob du eine findest, die zu _deinen_ Szenarioanforderungen passt.

![Code](../../../../../translated_images/de/azd-code-to-cloud.2d9503d69d3400da.png)

---

## 4. KI-App-Vorlagen

---

