<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-09-24T21:30:16+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "da"
}
-->
# 1. Vælg en skabelon

!!! tip "VED SLUTNINGEN AF DETTE MODUL VIL DU KUNNE"

    - [ ] Beskrive, hvad AZD-skabeloner er
    - [ ] Opdage og bruge AZD-skabeloner til AI
    - [ ] Komme i gang med AI Agents-skabelonen
    - [ ] **Lab 1:** AZD Quickstart med GitHub Codespaces

---

## 1. En analogi med byggeri

At bygge en moderne AI-applikation, der er klar til erhvervslivet, _fra bunden_ kan virke overvældende. Det er lidt som at bygge dit nye hjem helt selv, mursten for mursten. Ja, det kan lade sig gøre! Men det er ikke den mest effektive måde at opnå det ønskede resultat på!

I stedet starter vi ofte med en eksisterende _designtegning_ og arbejder med en arkitekt for at tilpasse den til vores personlige behov. Og det er præcis den tilgang, du bør tage, når du bygger intelligente applikationer. Først skal du finde en god designarkitektur, der passer til dit problemområde. Derefter skal du arbejde med en løsningsarkitekt for at tilpasse og udvikle løsningen til din specifikke situation.

Men hvor kan vi finde disse designtegninger? Og hvordan finder vi en arkitekt, der er villig til at lære os, hvordan vi tilpasser og implementerer disse tegninger selv? I denne workshop besvarer vi disse spørgsmål ved at introducere dig til tre teknologier:

1. [Azure Developer CLI](https://aka.ms/azd) - et open-source værktøj, der accelererer udviklerens vej fra lokal udvikling (build) til cloud-implementering (ship).
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - standardiserede open-source repositories, der indeholder eksempler på kode, infrastruktur og konfigurationsfiler til implementering af en AI-løsningsarkitektur.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - en kodningsagent med viden om Azure, der kan guide os i at navigere i kodebasen og foretage ændringer - ved hjælp af naturligt sprog.

Med disse værktøjer i hånden kan vi nu _finde_ den rette skabelon, _implementere_ den for at validere, at den fungerer, og _tilpasse_ den til vores specifikke scenarier. Lad os dykke ned og lære, hvordan disse fungerer.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (eller `azd`) er et open-source kommandolinjeværktøj, der kan fremskynde din rejse fra kode til cloud med en række udviklervenlige kommandoer, der fungerer konsekvent på tværs af din IDE (udvikling) og CI/CD (devops) miljøer.

Med `azd` kan din implementeringsrejse være så enkel som:

- `azd init` - Initialiserer et nyt AI-projekt fra en eksisterende AZD-skabelon.
- `azd up` - Opretter infrastruktur og implementerer din applikation i ét trin.
- `azd monitor` - Få realtidsmonitorering og diagnostik for din implementerede applikation.
- `azd pipeline config` - Opsæt CI/CD-pipelines for at automatisere implementering til Azure.

**🎯 | ØVELSE**: <br/> Udforsk `azd` kommandolinjeværktøjet i dit GitHub Codespaces-miljø nu. Start med at skrive denne kommando for at se, hvad værktøjet kan gøre:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/da/azd-flow.19ea67c2f81eaa66.png)

---

## 3. AZD-skabelonen

For at `azd` kan opnå dette, skal det vide, hvilken infrastruktur der skal oprettes, hvilke konfigurationsindstillinger der skal håndhæves, og hvilken applikation der skal implementeres. Det er her [AZD-skabeloner](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp) kommer ind i billedet.

AZD-skabeloner er open-source repositories, der kombinerer eksempler på kode med infrastruktur- og konfigurationsfiler, der er nødvendige for at implementere løsningsarkitekturen. Ved at bruge en _Infrastructure-as-Code_ (IaC) tilgang gør de det muligt at versionskontrollere skabelonressourcedefinitioner og konfigurationsindstillinger (ligesom kildekoden til appen) - hvilket skaber genanvendelige og konsistente arbejdsgange på tværs af brugere af det projekt.

Når du opretter eller genbruger en AZD-skabelon til _din_ situation, bør du overveje disse spørgsmål:

1. Hvad bygger du? → Er der en skabelon, der har startkode til det scenarie?
1. Hvordan er din løsning arkitekteret? → Er der en skabelon, der har de nødvendige ressourcer?
1. Hvordan implementeres din løsning? → Tænk `azd deploy` med pre/post-processing hooks!
1. Hvordan kan du optimere den yderligere? → Tænk indbygget monitorering og automatiseringspipelines!

**🎯 | ØVELSE**: <br/> 
Besøg [Awesome AZD](https://azure.github.io/awesome-azd/) galleriet og brug filtrene til at udforske de 250+ skabeloner, der i øjeblikket er tilgængelige. Se, om du kan finde en, der passer til _dine_ scenariekrav.

![Code](../../../../../translated_images/da/azd-code-to-cloud.2d9503d69d3400da.png)

---

## 4. AI App-skabeloner

---

