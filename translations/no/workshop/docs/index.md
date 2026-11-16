# AZD for AI-utviklere Workshop

> Kildeveiledning er gjennomgått mot AZD 1.37.2 den 4. november 2026. Skjermbilder er illustrerende; tjenestetilgjengelighet, portallabels og malstandarder kan endres.

> [!IMPORTANT]  
> **Denne workshopen er utstyrt med en workshop-veiledning som du kan forhåndsvise i din lokale nettleser. For å komme i gang, åpne repoet i GitHub Codespaces, en utviklercontainer, eller en lokal klone med MkDocs installert—vent deretter til du ser en aktiv VS Code-terminal og skriv inn:**  
> Fra rotmappen til kursrepoet, installer `requirements-dev.txt`, og kjør deretter `python -m mkdocs serve --config-file workshop/mkdocs.yml` i forgrunnen.
> **Du skal se en popup-dialog for å åpne forhåndsvisningssiden i en nettleser.**

Velkommen til den praktiske workshopen for å lære Azure Developer CLI (AZD) med fokus på distribusjon av AI-applikasjoner. Denne workshopen hjelper deg med å få en anvendt forståelse av AZD-maler i 3 trinn:

1. **Oppdagelse** - finn malen som passer for deg.
1. **Distribusjon** - distribuer og valider at det virker
1. **Tilpasning** - modifiser og iterer for å gjøre det til ditt!

Gjennom denne workshopen vil du også bli introdusert for kjerneutviklerverktøy og arbeidsflyter, som hjelper deg med å effektivisere hele utviklingsreisen din.

| | | 
|:---|:---|
| **📚 Kurs Hjem**| [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentasjon** | [Kom i gang med AI-maler](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-maler** | [Microsoft Foundry-maler](https://ai.azure.com/templates) |
|**🚀 Neste Steg** | [Ta utfordringen](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Workshop Oversikt

**Varighet:** 3-4 timer  
**Nivå:** Nybegynner til middels  
**Forutsetninger:** Kjennskap til Azure, AI-konsepter, VS Code og kommandolinjeverktøy.

Dette er en praktisk workshop hvor du lærer ved å gjøre. Når du har fullført øvelsene, anbefaler vi å gå gjennom AZD For Beginners-læreplanen for å fortsette læringen din innen sikkerhet og produktivitets beste praksiser.

| Tid| Modul  | Mål |
|:---|:---|:---|
| 15 min | Introduksjon | Sett scenen, forstå målene |
| 30 min | Velg AI-mal | Utforsk alternativer og velg startmal | 
| 30 min | Valider AI-mal | Distribuer standardløsning til Azure |
| 30 min | Dekonstruer AI-mal | Undersøk struktur og konfigurasjon |
| 30 min | Konfigurer AI-mal | Aktiver og prøv tilgjengelige funksjoner |
| 30 min | Tilpass AI-mal | Tilpass malen til dine behov |
| 30 min | Nedbygging av infrastruktur | Rydd opp og frigjør ressurser |
| 15 min | Oppsummering & Neste Steg | Læringsressurser, workshop-utfordring |
| | |

## Hva Du Vil Lære

Tenk på AZD-malen som en læringssandkasse for å utforske ulike funksjoner og verktøy for ende-til-ende utvikling på Microsoft Foundry. Ved slutten av denne workshopen bør du ha en intuitiv forståelse for ulike verktøy og konsepter i denne konteksten.

| Konsept  | Mål |
|:---|:---|
| **Azure Developer CLI** | Forstå verktøykommandoer og arbeidsflyter|
| **AZD-malene**| Forstå prosjektstruktur og konfigurasjon|
| **Azure AI-agent**| Tilrettelegg og distribuer Microsoft Foundry-prosjekt  |
| **Azure AI-søk**| Legg til rette for kontekstuell engineering med agenter |
| **Observasjon**| Utforsk sporing, overvåking og evalueringer |
| **Red Teaming**| Utforsk adversarial testing og mottiltak |
| | |

## Workshop-moduler

Klar til å komme i gang? Naviger gjennom workshop-modulene:

- [Modul 1: Velg AI-mal](instructions/1-Select-AI-Template.md)
- [Modul 2: Valider AI-mal](instructions/2-Validate-AI-Template.md) 
- [Modul 3: Dekonstruer AI-mal](instructions/3-Deconstruct-AI-Template.md)
- [Modul 4: Konfigurer AI-mal](instructions/4-Configure-AI-Template.md)
- [Modul 5: Tilpass AI-mal](instructions/5-Customize-AI-Template.md)
- [Modul 6: Nedbygging av infrastruktur](instructions/6-Teardown-Infrastructure.md)
- [Modul 7: Oppsummering & Neste Steg](instructions/7-Wrap-up.md)

## Har du tilbakemelding?

Legg ut en ticket på dette repoet (merk det med `Workshop`) eller bli med oss på [Discord](https://aka.ms/foundry/discord) og legg ut i vår `#get-help` kanal

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->