<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD for AI Developers Workshop
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>En praktisk workshop for å bygge AI-applikasjoner med Azure Developer CLI.</strong><br>
      Fullfør 7 moduler for å mestre AZD-maler og AI-distribusjons-arbeidsflyter.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Sist oppdatert: februar 2026
      </span>
    </div>
  </div>
</div>

# AZD for AI Developers Workshop

Velkommen til den praktiske workshopen for å lære Azure Developer CLI (AZD) med fokus på distribusjon av AI-applikasjoner. Denne workshopen hjelper deg å få en anvendt forståelse av AZD-maler i 3 steg:

1. **Oppdagelse** - finn malen som passer for deg.
1. **Distribusjon** - distribuer og valider at det fungerer
1. **Tilpasning** - modifiser og iterer for å gjøre det til ditt eget!

I løpet av denne workshopen vil du også bli introdusert for kjerneverktøy og arbeidsflyter for utviklere, for å hjelpe deg å effektivisere din ende-til-ende utviklingsreise.

<br/>

## Nettleserbasert guide

Workshop-leksjonene er i Markdown. Du kan navigere dem direkte i GitHub - eller starte en nettleserbasert forhåndsvisning som vist i skjermbildet nedenfor.

![Workshop](../../../translated_images/no/workshop.75906f133e6f8ba0.webp)

For å bruke dette alternativet - forkk repositoriet til din profil, og start GitHub Codespaces. Når VS Code-terminalen er aktiv, skriv denne kommandoen:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Om noen sekunder vil du se en pop-up-dialog. Velg alternativet `Åpne i nettleser`. Den nettbaserte guiden vil nå åpnes i en ny nettleserfane. Noen fordeler med denne forhåndsvisningen:

1. **Innebygd søk** - finn nøkkelord eller leksjoner raskt.
1. **Kopier-ikon** - hold musepekeren over kodeblokker for å se dette alternativet
1. **Tema-bryter** - bytt mellom mørkt og lyst tema
1. **Få hjelp** - klikk Discord-ikonet i bunnteksten for å bli med!

<br/>

## Workshop oversikt

**Varighet:** 3-4 timer  
**Nivå:** Nybegynner til middels  
**Forutsetninger:** Kjennskap til Azure, AI-konsepter, VS Code og kommandolinjeverktøy.

Dette er en praktisk workshop hvor du lærer ved å gjøre. Når du har fullført øvelsene, anbefaler vi at du gjennomgår AZD For Beginners-kurset for å fortsette læringsreisen innen sikkerhet og produktivitets beste praksis.

| Tid | Modul  | Mål |
|:---|:---|:---|
| 15 min | [Introduksjon](docs/instructions/0-Introduction.md) | Sett scenen, forstå målene |
| 30 min | [Velg AI-mal](docs/instructions/1-Select-AI-Template.md) | Utforsk alternativer og velg startpakke | 
| 30 min | [Valider AI-mal](docs/instructions/2-Validate-AI-Template.md) | Distribuer standardløsning til Azure |
| 30 min | [Bryt ned AI-mal](docs/instructions/3-Deconstruct-AI-Template.md) | Utforsk struktur og konfigurasjon |
| 30 min | [Konfigurer AI-mal](docs/instructions/4-Configure-AI-Template.md) | Aktiver og prøv tilgjengelige funksjoner |
| 30 min | [Tilpass AI-mal](docs/instructions/5-Customize-AI-Template.md) | Tilpass malen til dine behov |
| 30 min | [Nedrigging av infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) | Rydd opp og frigjør ressurser |
| 15 min | [Avslutning & neste steg](docs/instructions/7-Wrap-up.md) | Læringsressurser, workshop-utfordring |

<br/>

## Hva du vil lære

Tenk på AZD-malen som en læringssandbox for å utforske ulike muligheter og verktøy for ende-til-ende utvikling på Microsoft Foundry. Ved slutten av denne workshopen bør du ha en intuitiv forståelse av ulike verktøy og konsepter i denne konteksten.

| Konsept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Forstå kommandolinjeverktøy og arbeidsflyter|
| **AZD-maler**| Forstå prosjektstruktur og konfigurasjon |
| **Azure AI Agent**| Provisioner og distribuer Microsoft Foundry-prosjekt |
| **Azure AI Search**| Aktiver kontekst-ingeniørarbeid med agenter |
| **Observability**| Utforsk sporing, overvåking og evalueringer |
| **Red Teaming**| Undersøk motstandstesting og mottiltak |

<br/>

## Workshopstruktur

Workshopen er strukturert for å ta deg på en reise fra maloppdagelse, til distribusjon, nedbryting og tilpasning - ved å bruke den offisielle [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) startmalen som basis.

### [Modul 1: Velg AI-mal](docs/instructions/1-Select-AI-Template.md) (30 min)

- Hva er AI-maler?
- Hvor kan jeg finne AI-maler?
- Hvordan kan jeg komme i gang med å bygge AI-agenter?
- **Lab**: Rask start med GitHub Codespaces

### [Modul 2: Valider AI-mal](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Hva er AI-malens arkitektur?
- Hva er AZD utviklingsarbeidsflyt?
- Hvordan kan jeg få hjelp med AZD utvikling?
- **Lab**: Distribuer & valider AI Agents-mal

### [Modul 3: Bryt ned AI-mal](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Utforsk miljøet ditt i `.azure/` 
- Utforsk ressursoppsettet ditt i `infra/` 
- Utforsk AZD-konfigurasjonen din i `azure.yaml`-filene
- **Lab**: Endre miljøvariabler & distribuer på nytt

### [Modul 4: Konfigurer AI-mal](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Utforsk: Retrieval Augmented Generation
- Utforsk: Agentevaluering & Red Teaming
- Utforsk: Sporing & Overvåking
- **Lab**: Utforsk AI Agent + Observability 

### [Modul 5: Tilpass AI-mal](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definer: PRD med scenariokrav
- Konfigurer: miljøvariabler for AZD
- Implementer: Lifecycle Hooks for ekstra oppgaver
- **Lab**: Tilpass mal for mitt scenario

### [Modul 6: Nedrigging av infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Sammendrag: Hva er AZD-maler?
- Sammendrag: Hvorfor bruke Azure Developer CLI?
- Neste steg: Prøv en annen mal!
- **Lab**: Avprovisjoner infrastruktur & rydding

<br/>

## Workshop-utfordring

Vil du utfordre deg selv til å gjøre mer? Her er noen prosjektforslag - eller del dine ideer med oss!!

| Prosjekt | Beskrivelse |
|:---|:---|
|1. **Bryt ned en kompleks AI-mal** | Bruk arbeidsflyten og verktøyene vi beskrev og se om du kan distribuere, validere og tilpasse en annen AI-løsningsmal. _Hva lærte du?_|
|2. **Tilpass med ditt scenario**  | Prøv å skrive en PRD (Product Requirements Document) for et annet scenario. Bruk deretter GitHub Copilot i malrepoet ditt i Agent-modellen - og be den generere en tilpasningsarbeidsflyt for deg. _Hva lærte du? Hvordan kunne du forbedre disse forslagene?_|
| | |

## Har du tilbakemeldinger?

1. Legg inn en issue på dette repoet - merk den `Workshop` for enkelthetens skyld.
1. Bli med i Microsoft Foundry Discord - kontakt med dine kolleger!


| | | 
|:---|:---|
| **📚 Kurs Hjem**| [AZD For Beginners](../README.md)|
| **📖 Dokumentasjon** | [Kom i gang med AI-maler](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-maler** | [Microsoft Foundry-maler](https://ai.azure.com/templates) |
|**🚀 Neste steg** | [Start Workshop](../../../workshop) |
| | |

<br/>

---

**Navigasjon:** [Hovedkurs](../README.md) | [Introduksjon](docs/instructions/0-Introduction.md) | [Modul 1: Velg mal](docs/instructions/1-Select-AI-Template.md)

**Klar til å begynne å bygge AI-applikasjoner med AZD?**

[Start Workshop: Introduksjon →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi påtar oss ikke ansvar for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->