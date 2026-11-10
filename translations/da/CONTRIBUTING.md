# Bidrag til AZD For Beginners

Tak for din interesse i at bidrage til AZD For Beginners-kurset! Dette dokument indeholder retningslinjer og information til bidragydere.

## Sådan bidrager du

### Rapportering af problemer

Hvis du finder fejl, problemer eller har forslag til forbedringer:

1. **Tjek eksisterende problemer**: Søg i [eksisterende problemer](https://github.com/microsoft/azd-for-beginners/issues) for at undgå dubletter
2. **Opret et nyt problem**: Brug den relevante problem-skabelon
3. **Giv oplysninger**: Inkluder trin til reproduktion, forventet adfærd og skærmbilleder, hvis relevant

### Forslag til ændringer

1. **Fork projektet**: Opret din egen fork af projektet
2. **Opret en gren**: Opret en feature-gren til dine ændringer
3. **Foretag ændringer**: Følg vores kode- og dokumentationsstandarder
4. **Test dine ændringer**: Bekræft at alle links fungerer, og indhold vises korrekt
5. **Send en pull-anmodning**: Giv en klar beskrivelse af dine ændringer

### Typer af bidrag

Vi byder følgende typer af bidrag velkommen:

#### Forbedringer af indhold
- Ret stavefejl, grammatik og formateringsfejl
- Forbedr klarheden i eksisterende dokumentation
- Opdater forældet information
- Tilføj manglende forklaringer eller kontekst

#### Nye eksempler
- Tilføj virkelige implementeringsscenarier
- Opret nye AZD-skabeloner til almindelige brugstilfælde
- Giv flere kodeeksempler og øvelser

#### Oversættelsesstøtte
- Hjælp med at vedligeholde eksisterende oversættelser
- Forbedr oversættelseskvaliteten
- Tilføj oversættelser for nyt indhold

#### Fejlrapporter
- Rapportér brudte links eller ukorrekte kodeeksempler
- Identificer uoverensstemmelser i dokumentationen
- Marker tilgængelighedsproblemer

## Retningslinjer for bidrag

### Dokumentationsstandarder

- Brug klart og begyndervenligt sprog
- Inkluder læringsmål og resultater
- Giv trin-for-trin instruktioner med forventede resultater
- Tilføj navigationslinks til relateret indhold
- Brug konsekvent formatering og markdown-stil

### Kodeeksempler

- Sørg for at alle kodeeksempler er testede og fungerer
- Inkluder kommentarer der forklarer nøglekoncepter
- Følg Azure og AZD bedste praksis
- Giv forventet output hvor det er relevant

### Validér engelsk dokumentation

Fra rodmappen i repository, installér de eksisterende udviklingskrav og kør:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline link-checkeren kontrollerer engelske Markdown/HTML-stier, overskrifter, eksplicitte ankre og tomme linkpladsholdere. Den udelukker genererede `translations/` og `translated_images/`, inklusive links til disse mapper. Den henter ikke eksterne hjemmesider eller validér Azure-implementeringer. Brug `--json <report-path>` til at eksportere fejl og den eksterne URL-oversigt til en separat netværkskontrol. Bekræft aktuelle upstream-kommandoer og eksempel-forudsætninger ved ændring af tekniske instruktioner; skel mellem testede applikationer og designskitser.

### Commit-beskeder

Brug klare, beskrivende commit-beskeder:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Adfærdskodeks

Læs og følg venligst vores [Adfærdskodeks](CODE_OF_CONDUCT.md) for at opretholde et venligt og inkluderende fællesskab.

## Få hjælp

- **Spørgsmål**: Søg eller opret en [GitHub-issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Fællesskab**: Deltag i [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentation**: Gennemse [Azure Developer CLI docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licens

Ved at bidrage til dette repository accepterer du, at dine bidrag licenseres under [MIT-licensen](../../LICENSE).

---

Tak for at hjælpe med at gøre AZD For Beginners til en bedre læringsressource for fællesskabet!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi bestræber os på nøjagtighed, skal du være opmærksom på, at automatiserede oversættelser kan indeholde fejl eller unøjagtigheder. Det originale dokument på dets oprindelige sprog bør betragtes som den autoritative kilde. For kritisk information anbefales professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der opstår som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->