<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:52:50+00:00",
  "source_file": "workshop/README.md",
  "language_code": "da"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop Under Konstruktion 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Dette workshop er i øjeblikket under aktiv udvikling.</strong><br>
      Indholdet kan være ufuldstændigt eller under ændring. Kom snart tilbage for opdateringer!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Sidst opdateret: Oktober 2025
      </span>
    </div>
  </div>
</div>

# AZD for AI-udviklere Workshop

Velkommen til den praktiske workshop for at lære Azure Developer CLI (AZD) med fokus på implementering af AI-applikationer. Denne workshop hjælper dig med at få en praktisk forståelse af AZD-skabeloner i 3 trin:

1. **Opdagelse** - find den skabelon, der passer til dig.
1. **Implementering** - implementer og valider, at det fungerer.
1. **Tilpasning** - modificer og tilpas, så det passer til dine behov!

I løbet af workshoppen vil du også blive introduceret til kerneværktøjer og arbejdsgange for udviklere, som kan hjælpe dig med at optimere din end-to-end udviklingsrejse.

<br/>

## Browser-baseret guide

Workshop-lektionerne er i Markdown. Du kan navigere direkte i GitHub - eller starte en browser-baseret forhåndsvisning som vist på skærmbilledet nedenfor.

![Workshop](../../../translated_images/da/workshop.75906f133e6f8ba0.png)

For at bruge denne mulighed - fork repository til din profil, og start GitHub Codespaces. Når VS Code-terminalen er aktiv, skal du skrive denne kommando:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Efter få sekunder vil du se en pop-up dialog. Vælg muligheden `Åbn i browser`. Den webbaserede guide åbnes nu i en ny browserfane. Nogle fordele ved denne forhåndsvisning:

1. **Indbygget søgning** - find nøgleord eller lektioner hurtigt.
1. **Kopier-ikon** - hold musen over kodeblokke for at se denne mulighed.
1. **Tema-skift** - skift mellem mørke og lyse temaer.
1. **Få hjælp** - klik på Discord-ikonet i bunden for at deltage!

<br/>

## Workshop Oversigt

**Varighed:** 3-4 timer  
**Niveau:** Begynder til mellemniveau  
**Forudsætninger:** Kendskab til Azure, AI-koncepter, VS Code & kommandolinjeværktøjer.

Dette er en praktisk workshop, hvor du lærer ved at gøre. Når du har gennemført øvelserne, anbefaler vi, at du gennemgår AZD For Beginners-kurset for at fortsætte din læringsrejse inden for sikkerhed og produktivitets bedste praksis.

| Tid| Modul  | Mål |
|:---|:---|:---|
| 15 min | [Introduktion](docs/instructions/0-Introduction.md) | Sæt scenen, forstå målene |
| 30 min | [Vælg AI-skabelon](docs/instructions/1-Select-AI-Template.md) | Udforsk muligheder og vælg en startskabelon | 
| 30 min | [Valider AI-skabelon](docs/instructions/2-Validate-AI-Template.md) | Implementer standardløsning til Azure |
| 30 min | [Dekonstruer AI-skabelon](docs/instructions/3-Deconstruct-AI-Template.md) | Udforsk struktur og konfiguration |
| 30 min | [Konfigurer AI-skabelon](docs/instructions/4-Configure-AI-Template.md) | Aktivér og prøv tilgængelige funktioner |
| 30 min | [Tilpas AI-skabelon](docs/instructions/5-Customize-AI-Template.md) | Tilpas skabelonen til dine behov |
| 30 min | [Nedtag Infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) | Ryd op og frigør ressourcer |
| 15 min | [Afslutning & Næste Skridt](docs/instructions/7-Wrap-up.md) | Læringsressourcer, Workshop-udfordring |

<br/>

## Hvad du vil lære

Tænk på AZD-skabelonen som en læringsplatform til at udforske forskellige funktioner og værktøjer til end-to-end udvikling på Azure AI Foundry. Ved afslutningen af workshoppen bør du have en intuitiv forståelse af forskellige værktøjer og koncepter i denne sammenhæng.

| Koncept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Forstå værktøjets kommandoer og arbejdsgange |
| **AZD-skabeloner**| Forstå projektstruktur og konfiguration |
| **Azure AI Agent**| Klargør og implementer Azure AI Foundry-projekt |
| **Azure AI Search**| Aktiver kontekstteknik med agenter |
| **Observabilitet**| Udforsk tracing, overvågning og evalueringer |
| **Red Teaming**| Udforsk modstandstest og afhjælpninger |

<br/>

## Workshop Struktur

Workshoppen er struktureret til at tage dig på en rejse fra skabelonopdagelse, til implementering, dekonstruering og tilpasning - med den officielle [Kom i gang med AI-agenter](https://github.com/Azure-Samples/get-started-with-ai-agents) startskabelon som grundlag.

### [Modul 1: Vælg AI-skabelon](docs/instructions/1-Select-AI-Template.md) (30 min)

- Hvad er AI-skabeloner?
- Hvor kan jeg finde AI-skabeloner?
- Hvordan kan jeg komme i gang med at bygge AI-agenter?
- **Lab**: Hurtigstart med GitHub Codespaces

### [Modul 2: Valider AI-skabelon](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Hvad er AI-skabelonens arkitektur?
- Hvad er AZD-udviklingsarbejdsgangen?
- Hvordan kan jeg få hjælp med AZD-udvikling?
- **Lab**: Implementer & valider AI-agents skabelon

### [Modul 3: Dekonstruer AI-skabelon](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Udforsk dit miljø i `.azure/` 
- Udforsk din ressourceopsætning i `infra/` 
- Udforsk din AZD-konfiguration i `azure.yaml`s
- **Lab**: Modificer miljøvariabler & genimplementer

### [Modul 4: Konfigurer AI-skabelon](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Udforsk: Retrieval Augmented Generation
- Udforsk: Agent Evaluering & Red Teaming
- Udforsk: Tracing & Overvågning
- **Lab**: Udforsk AI Agent + Observabilitet 

### [Modul 5: Tilpas AI-skabelon](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definer: PRD med scenariekrav
- Konfigurer: Miljøvariabler for AZD
- Implementer: Lifecycle Hooks for ekstra opgaver
- **Lab**: Tilpas skabelon til mit scenarie

### [Modul 6: Nedtag Infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Opsummering: Hvad er AZD-skabeloner?
- Opsummering: Hvorfor bruge Azure Developer CLI?
- Næste skridt: Prøv en anden skabelon!
- **Lab**: Afvikling af infrastruktur & oprydning

<br/>

## Workshop Udfordring

Vil du udfordre dig selv til at gøre mere? Her er nogle projektforslag - eller del dine ideer med os!!

| Projekt | Beskrivelse |
|:---|:---|
|1. **Dekonstruer en kompleks AI-skabelon** | Brug den arbejdsgang og de værktøjer, vi har skitseret, og se, om du kan implementere, validere og tilpasse en anden AI-løsningsskabelon. _Hvad lærte du?_|
|2. **Tilpas med dit eget scenarie**  | Prøv at skrive en PRD (Produktkravsdokument) for et andet scenarie. Brug derefter GitHub Copilot i din skabelon-repo i Agent Model - og bed den om at generere en tilpasningsarbejdsgang for dig. _Hvad lærte du? Hvordan kunne du forbedre disse forslag?_|
| | |

## Har du feedback?

1. Opret en issue på dette repo - tag det med `Workshop` for nemheds skyld.
1. Deltag i Azure AI Foundry Discord - forbind med dine kolleger!


| | | 
|:---|:---|
| **📚 Kursushjemmeside**| [AZD For Beginners](../README.md)|
| **📖 Dokumentation** | [Kom i gang med AI-skabeloner](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-skabeloner** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Næste Skridt** | [Tag Udfordringen](../../../workshop) |
| | |

<br/>

---

**Forrige:** [AI Fejlfindingsguide](../docs/troubleshooting/ai-troubleshooting.md) | **Næste:** Begynd med [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**Klar til at begynde at bygge AI-applikationer med AZD?**

[Start Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi er ikke ansvarlige for eventuelle misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.