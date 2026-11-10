# Bidra til AZD For Nybegynnere

Takk for din interesse for å bidra til kurset AZD For Nybegynnere! Dette dokumentet gir retningslinjer og informasjon for bidragsytere.

## Hvordan bidra

### Rapportere problemer

Hvis du finner feil, mangler eller har forslag til forbedringer:

1. **Sjekk eksisterende problemer**: Søk i [eksisterende problemer](https://github.com/microsoft/azd-for-beginners/issues) for å unngå duplikater
2. **Opprett et nytt problem**: Bruk riktig mal for problemrapport
3. **Gi detaljer**: Inkluder trinn for å gjenskape, forventet atferd, og skjermbilder hvis relevant

### Foreslå endringer

1. **Lag en fork av depotet**: Opprett din egen fork av prosjektet
2. **Opprett en gren**: Lag en funksjonsgren for endringene dine
3. **Gjennomfør endringer**: Følg våre koding- og dokumentasjonsstandarder
4. **Test endringene dine**: Verifiser at alle lenker fungerer og innhold vises korrekt
5. **Send inn en pull request**: Gi en klar beskrivelse av endringene dine

### Typer bidrag

Vi ønsker velkommen følgende typer bidrag:

#### Innholdsforbedringer
- Fiks skrivefeil, grammatikk og formateringsproblemer
- Forbedre klarhet i eksisterende dokumentasjon
- Oppdater utdatert informasjon
- Legg til manglende forklaringer eller kontekst

#### Nye eksempler
- Legg til reelle distribusjonsscenarier
- Lag nye AZD-maler for vanlige bruksområder
- Gi ekstra kodeeksempler og øvelser

#### Oversettelsesstøtte
- Hjelp til med å vedlikeholde eksisterende oversettelser
- Forbedre oversettelseskvalitet
- Legg til oversettelser for nytt innhold

#### Feilmeldinger
- Rapporter ødelagte lenker eller feilaktige kodeeksempler
- Identifiser inkonsistenser i dokumentasjonen
- Merk tilgjengelighetsproblemer

## Retningslinjer for bidrag

### Dokumentasjonsstandarder

- Bruk klart, nybegynnervennlig språk
- Inkluder læringsmål og resultater
- Gi steg-for-steg instruksjoner med forventede resultater
- Legg til navigasjonslenker til relatert innhold
- Bruk konsekvent formatering og markdown-stil

### Kodeeksempler

- Sørg for at alle kodeeksempler er testet og fungerer
- Inkluder kommentarer som forklarer viktige konsepter
- Følg Azure og AZD beste praksis
- Gi forventet utdata der det er relevant

### Valider engelsk dokumentasjon

Fra depotets rot, installer eksisterende utviklingskrav og kjør:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Den offline lenkekontrollen sjekker engelske Markdown/HTML-stier, overskrifter, eksplisitte ankere og tomme lenkeplasser. Den ekskluderer generert `translations/` og `translated_images/`, inkludert lenker til disse katalogene. Den henter ikke eksterne nettsider eller validerer Azure-distribusjoner. Bruk `--json <report-path>` for å eksportere feil og den eksterne URL-inventaren for separat nettverkssjekk. Verifiser nåværende upstream-kommandoer og eksempel-forutsetninger når du endrer tekniske instruksjoner; skill mellom testede applikasjoner og designtegninger.

### Commit-meldinger

Bruk klare, beskrivende commit-meldinger:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Atferdskodeks

Vennligst les og følg vår [Atferdskodeks](CODE_OF_CONDUCT.md) for å opprettholde et inkluderende og imøtekommende fellesskap.

## Få hjelp

- **Spørsmål**: Søk eller åpne et [GitHub-problem](https://github.com/microsoft/AZD-for-beginners/issues)
- **Fellesskap**: Bli med i [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentasjon**: Gå gjennom [Azure Developer CLI-dokumentasjonen](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Lisens

Ved å bidra til dette depotet godtar du at dine bidrag vil bli lisensiert under [MIT-lisensen](../../LICENSE).

---

Takk for at du hjelper til med å gjøre AZD For Nybegynnere til en bedre læringsressurs for fellesskapet!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->