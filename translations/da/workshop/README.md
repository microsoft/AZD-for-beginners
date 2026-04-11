<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD for AI-udviklere Workshop
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>En praktisk workshop til at bygge AI-applikationer med Azure Developer CLI.</strong><br>
      Gennemfør 7 moduler for at mestre AZD-skabeloner og AI-udrulningsarbejdsgange.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Senest opdateret: marts 2026
      </span>
    </div>
  </div>
</div>

# AZD for AI-udviklere Workshop

Velkommen til den praktiske workshop for at lære Azure Developer CLI (AZD) med fokus på udrulning af AI-applikationer. Denne workshop hjælper dig med at få en anvendt forståelse af AZD-skabeloner i 3 trin:

1. **Opdagelse** - find den skabelon, der passer til dig.
1. **Udrulning** - udrul og verificer, at det virker
1. **Tilpasning** - rediger og iterer for at gøre det til dit!

I løbet af denne workshop vil du også blive introduceret til centrale udviklerværktøjer og arbejdsprocesser, for at hjælpe dig med at strømline din ende-til-ende udviklingsrejse.

<br/>

## Guide i browser

Workshop-lektionerne er i Markdown. Du kan navigere dem direkte i GitHub - eller starte en browserbaseret forhåndsvisning som vist i skærmbilledet nedenfor.

![Workshop](../../../translated_images/da/workshop.75906f133e6f8ba0.webp)

For at bruge denne mulighed - fork repositoryet til din profil, og start GitHub Codespaces. Når VS Code-terminalen er aktiv, skriv denne kommando:

This browser preview works in GitHub Codespaces, dev containers, or a local clone with Python and MkDocs installed.

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

In a few seconds, you will see a pop-up dialog. Select the option to `Åbn i browser`. The web-based guide will now open in a new browser tab. Some benefits of this preview:

1. **Indbygget søgning** - find nøgleord eller lektioner hurtigt.
1. **Kopi-ikon** - hold musen over kodeblokke for at se denne mulighed
1. **Temaomskifter** - skift mellem mørkt og lyst tema
1. **Få hjælp** - klik på Discord-ikonet i sidefoden for at deltage!

<br/>

## Oversigt over workshoppen

**Varighed:** 3-4 timer  
**Niveau:** Begynder til mellem  
**Forudsætninger:** Kendskab til Azure, AI-koncepter, VS Code & kommandolinjeværktøjer.

Dette er en praktisk workshop, hvor du lærer ved at gøre. Når du har gennemført øvelserne, anbefaler vi at gennemgå AZD for begyndere-pensum for at fortsætte din læringsrejse inden for sikkerhed og produktivitets bedste praksis.

| Tid| Modul  | Mål |
|:---|:---|:---|
| 15 mins | [Introduktion](docs/instructions/0-Introduction.md) | Sæt scenen, forstå målene |
| 30 mins | [Vælg AI-skabelon](docs/instructions/1-Select-AI-Template.md) | Undersøg muligheder og vælg starter | 
| 30 mins | [Valider AI-skabelon](docs/instructions/2-Validate-AI-Template.md) | Udrul standardløsning til Azure |
| 30 mins | [Dekonstruer AI-skabelon](docs/instructions/3-Deconstruct-AI-Template.md) | Undersøg struktur og konfiguration |
| 30 mins | [Konfigurer AI-skabelon](docs/instructions/4-Configure-AI-Template.md) | Aktivér og prøv tilgængelige funktioner |
| 30 mins | [Tilpas AI-skabelon](docs/instructions/5-Customize-AI-Template.md) | Tilpas skabelonen til dine behov |
| 30 mins | [Nedtag infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) | Ryd op og frigiv ressourcer |
| 15 mins | [Opsummering & næste skridt](docs/instructions/7-Wrap-up.md) | Læringsressourcer, Workshop-udfordring |

<br/>

## Hvad du vil lære

Se AZD-skabelonen som en lærings-sandbox til at udforske forskellige kapabiliteter og værktøjer for end-to-end udvikling på Microsoft Foundry. Ved afslutningen af denne workshop bør du have en intuitiv fornemmelse for forskellige værktøjer og koncepter i denne kontekst.

| Koncept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Forstå værktøjets kommandoer og arbejdsgange|
| **AZD-skabeloner**| Forstå projektstruktur og konfiguration|
| **Azure AI Agent**| Provisioner & udrul Microsoft Foundry-projekt  |
| **Azure AI Search**| Aktivér kontekst-engineering med agenter |
| **Observabilitet**| Undersøg tracing, overvågning og evalueringer |
| **Red Teaming**| Undersøg adversarial testning og afbødninger |

<br/>

## Workshopstruktur

Workshoppen er struktureret, så den tager dig på en rejse fra skabelonsøgning, til udrulning, dekonstruering og tilpasning - ved hjælp af den officielle [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) startskabelon som basis.

### [Modul 1: Vælg AI-skabelon](docs/instructions/1-Select-AI-Template.md) (30 min)

- Hvad er AI-skabeloner?
- Hvor kan jeg finde AI-skabeloner?
- Hvordan kommer jeg i gang med at bygge AI-agenter?
- **Lab**: Hurtigstart i Codespaces eller en dev container

### [Modul 2: Valider AI-skabelon](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Hvad er AI-skabelonarkitekturen?
- Hvad er AZD-udviklingsarbejdsgangen?
- Hvordan kan jeg få hjælp til AZD-udvikling?
- **Lab**: Udrul og valider AI Agents-skabelon

### [Modul 3: Dekonstruer AI-skabelon](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Undersøg dit miljø i `.azure/` 
- Undersøg din ressourceopsætning i `infra/` 
- Undersøg din AZD-konfiguration i `azure.yaml`s
- **Lab**: Ændr miljøvariabler & genudrul

### [Modul 4: Konfigurer AI-skabelon](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Udforsk: Retrieval Augmented Generation
- Udforsk: Agent-evaluering & Red Teaming
- Udforsk: Tracing & overvågning
- **Lab**: Udforsk AI-agent + observabilitet 

### [Modul 5: Tilpas AI-skabelon](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definér: PRD med scenariekrav
- Konfigurer: Miljøvariabler for AZD
- Implementér: Lifecycle Hooks for ekstra opgaver
- **Lab**: Tilpas skabelon til mit scenarie

### [Modul 6: Nedtag infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Opsummering: Hvad er AZD-skabeloner?
- Opsummering: Hvorfor bruge Azure Developer CLI?
- Næste skridt: Prøv en anden skabelon!
- **Lab**: Deprovisionér infrastruktur & ryd op

<br/>

## Workshop-udfordring

Vil du udfordre dig selv til at gøre mere? Her er nogle projektforslag - eller del dine idéer med os!!

| Projekt | Beskrivelse |
|:---|:---|
|1. **Dekonstruer en kompleks AI-skabelon** | Brug arbejdsflowet og værktøjerne, vi skitserede, og se om du kan udrulle, validere, og tilpasse en anden AI-løsningsskabelon. _Hvad lærte du?_|
|2. **Tilpas til dit scenarie**  | Prøv at skrive en PRD (Product Requirements Document) for et andet scenarie. Brug derefter GitHub Copilot i dit skabelonrepo i Agent Model - og bed det om at generere en tilpasningsarbejdsgang for dig. _Hvad lærte du? Hvordan kunne du forbedre disse forslag?_|
| | |

## Har du feedback?

1. Opret en issue i dette repo - tag den `Workshop` for bekvemmelighed.
1. Deltag i Microsoft Foundry Discord - forbind dig med dine kolleger!


| | | 
|:---|:---|
| **📚 Kursusforside**| [AZD for begyndere](../README.md)|
| **📖 Dokumentation** | [Kom godt i gang med AI-skabeloner](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-skabeloner** | [Microsoft Foundry-skabeloner](https://ai.azure.com/templates) |
|**🚀 Næste skridt** | [Begynd workshoppen](#oversigt-over-workshoppen) |
| | |

<br/>

---

**Navigation:** [Hovedkursus](../README.md) | [Introduktion](docs/instructions/0-Introduction.md) | [Modul 1: Vælg skabelon](docs/instructions/1-Select-AI-Template.md)

**Klar til at begynde at bygge AI-applikationer med AZD?**

[Begynd workshop: Introduktion →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument i dets originalsprog bør betragtes som den autoritative kilde. For kritiske oplysninger anbefales en professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->