<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:54:01+00:00",
  "source_file": "workshop/README.md",
  "language_code": "no"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Workshop Under Construction 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Dette workshopet er for øyeblikket under aktiv utvikling.</strong><br>
      Innholdet kan være ufullstendig eller endres. Kom snart tilbake for oppdateringer!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Sist oppdatert: oktober 2025
      </span>
    </div>
  </div>
</div>

# AZD for AI-utviklere Workshop

Velkommen til et praktisk workshop for å lære Azure Developer CLI (AZD) med fokus på distribusjon av AI-applikasjoner. Dette workshopet hjelper deg med å få en praktisk forståelse av AZD-maler i tre steg:

1. **Utforskning** - finn den malen som passer for deg.
1. **Distribusjon** - distribuer og valider at det fungerer.
1. **Tilpasning** - modifiser og iterer for å gjøre det til ditt eget!

I løpet av workshopet vil du også bli introdusert for kjerneverktøy og arbeidsflyter for utviklere, som hjelper deg med å effektivisere hele utviklingsprosessen.

<br/>

## Nettleserbasert veiledning

Workshop-leksjonene er i Markdown. Du kan navigere dem direkte på GitHub - eller starte en nettleserbasert forhåndsvisning som vist på skjermbildet nedenfor.

![Workshop](../../../translated_images/workshop.75906f133e6f8ba0.no.png)

For å bruke dette alternativet - fork repoen til din profil, og start GitHub Codespaces. Når VS Code-terminalen er aktiv, skriv inn denne kommandoen:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

I løpet av noen sekunder vil du se en pop-up dialog. Velg alternativet `Åpne i nettleser`. Den nettbaserte veiledningen åpnes nå i en ny nettleserfane. Noen fordeler med denne forhåndsvisningen:

1. **Innebygd søk** - finn nøkkelord eller leksjoner raskt.
1. **Kopier-ikon** - hold musepekeren over kodeblokker for å se dette alternativet.
1. **Tema-bryter** - bytt mellom mørke og lyse temaer.
1. **Få hjelp** - klikk på Discord-ikonet i bunnteksten for å bli med!

<br/>

## Workshop Oversikt

**Varighet:** 3-4 timer  
**Nivå:** Nybegynner til middels  
**Forutsetninger:** Kjennskap til Azure, AI-konsepter, VS Code og kommandolinjeverktøy.

Dette er et praktisk workshop hvor du lærer ved å gjøre. Når du har fullført øvelsene, anbefaler vi å gjennomgå AZD For Beginners-kurset for å fortsette læringsreisen din innen sikkerhet og produktivitetspraksis.

| Tid| Modul  | Mål |
|:---|:---|:---|
| 15 min | [Introduksjon](docs/instructions/0-Introduction.md) | Sett scenen, forstå målene |
| 30 min | [Velg AI-mal](docs/instructions/1-Select-AI-Template.md) | Utforsk alternativer og velg en startmal | 
| 30 min | [Valider AI-mal](docs/instructions/2-Validate-AI-Template.md) | Distribuer standardløsning til Azure |
| 30 min | [Dekonstruer AI-mal](docs/instructions/3-Deconstruct-AI-Template.md) | Utforsk struktur og konfigurasjon |
| 30 min | [Konfigurer AI-mal](docs/instructions/4-Configure-AI-Template.md) | Aktiver og prøv tilgjengelige funksjoner |
| 30 min | [Tilpass AI-mal](docs/instructions/5-Customize-AI-Template.md) | Tilpass malen til dine behov |
| 30 min | [Fjern infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) | Rydd opp og frigjør ressurser |
| 15 min | [Oppsummering og neste steg](docs/instructions/7-Wrap-up.md) | Læringsressurser, Workshop-utfordring |

<br/>

## Hva du vil lære

Tenk på AZD-malen som en læringsplattform for å utforske ulike funksjoner og verktøy for ende-til-ende utvikling på Azure AI Foundry. Ved slutten av workshopet bør du ha en intuitiv forståelse for ulike verktøy og konsepter i denne sammenhengen.

| Konsept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Forstå verktøykommandoer og arbeidsflyter |
| **AZD-maler**| Forstå prosjektstruktur og konfigurasjon |
| **Azure AI Agent**| Klargjør og distribuer Azure AI Foundry-prosjekt |
| **Azure AI Search**| Aktiver kontekstutvikling med agenter |
| **Observability**| Utforsk sporing, overvåking og evalueringer |
| **Red Teaming**| Utforsk testing og mottiltak mot trusler |

<br/>

## Workshop-struktur

Workshopet er strukturert for å ta deg med på en reise fra malutforskning, til distribusjon, dekonstruering og tilpasning - med den offisielle [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) startmalen som basis.

### [Modul 1: Velg AI-mal](docs/instructions/1-Select-AI-Template.md) (30 min)

- Hva er AI-maler?
- Hvor kan jeg finne AI-maler?
- Hvordan kan jeg komme i gang med å bygge AI-agenter?
- **Lab**: Hurtigstart med GitHub Codespaces

### [Modul 2: Valider AI-mal](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Hva er AI-malens arkitektur?
- Hva er AZD utviklingsarbeidsflyt?
- Hvordan kan jeg få hjelp med AZD-utvikling?
- **Lab**: Distribuer og valider AI-agenter-malen

### [Modul 3: Dekonstruer AI-mal](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Utforsk miljøet ditt i `.azure/` 
- Utforsk ressursoppsettet ditt i `infra/` 
- Utforsk AZD-konfigurasjonen din i `azure.yaml`s
- **Lab**: Modifiser miljøvariabler og distribuer på nytt

### [Modul 4: Konfigurer AI-mal](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Utforsk: Retrieval Augmented Generation
- Utforsk: Agent Evaluering & Red Teaming
- Utforsk: Sporing & Overvåking
- **Lab**: Utforsk AI-agent + Observability 

### [Modul 5: Tilpass AI-mal](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definer: PRD med scenario-krav
- Konfigurer: Miljøvariabler for AZD
- Implementer: Livssyklus-hooks for ekstra oppgaver
- **Lab**: Tilpass malen til mitt scenario

### [Modul 6: Fjern infrastruktur](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Oppsummering: Hva er AZD-maler?
- Oppsummering: Hvorfor bruke Azure Developer CLI?
- Neste steg: Prøv en annen mal!
- **Lab**: Fjern infrastruktur og rydd opp

<br/>

## Workshop-utfordring

Vil du utfordre deg selv til å gjøre mer? Her er noen prosjektforslag - eller del dine ideer med oss!!

| Prosjekt | Beskrivelse |
|:---|:---|
|1. **Dekonstruer en kompleks AI-mal** | Bruk arbeidsflyten og verktøyene vi har skissert og se om du kan distribuere, validere og tilpasse en annen AI-løsningsmal. _Hva lærte du?_|
|2. **Tilpass med ditt scenario**  | Prøv å skrive en PRD (Produktkravdokument) for et annet scenario. Deretter bruker du GitHub Copilot i malrepoet ditt i Agent-modus - og ber det generere en tilpasningsarbeidsflyt for deg. _Hva lærte du? Hvordan kan du forbedre disse forslagene?_|
| | |

## Har du tilbakemeldinger?

1. Legg inn en issue på denne repoen - tag den med `Workshop` for enkelhet.
1. Bli med i Azure AI Foundry Discord - koble deg til andre deltakere!


| | | 
|:---|:---|
| **📚 Kursoversikt**| [AZD For Beginners](../README.md)|
| **📖 Dokumentasjon** | [Kom i gang med AI-maler](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-maler** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Neste steg** | [Ta utfordringen](../../../workshop) |
| | |

<br/>

---

**Forrige:** [AI Feilsøkingsveiledning](../docs/troubleshooting/ai-troubleshooting.md) | **Neste:** Start med [Lab 1: AZD Grunnleggende](../../../workshop/lab-1-azd-basics)

**Klar til å begynne å bygge AI-applikasjoner med AZD?**

[Start Lab 1: AZD Grunnleggende →](./lab-1-azd-basics/README.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.