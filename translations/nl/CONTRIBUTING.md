# Bijdragen aan AZD For Beginners

Dank u voor uw interesse in het bijdragen aan de cursus AZD For Beginners! Dit document biedt richtlijnen en informatie voor bijdragers.

## Hoe bij te dragen

### Problemen melden

Als u fouten, bugs of suggesties voor verbeteringen vindt:

1. **Controleer bestaande problemen**: Zoek in [bestaande issues](https://github.com/microsoft/azd-for-beginners/issues) om duplicaten te voorkomen
2. **Maak een nieuw issue aan**: Gebruik de juiste issue-sjabloon
3. **Geef details**: Voeg stappen toe om het probleem te reproduceren, verwacht gedrag, en screenshots indien van toepassing

### Wijzigingen voorstellen

1. **Fork de repository**: Maak een eigen fork van het project
2. **Maak een branch aan**: Maak een feature-branch voor uw wijzigingen
3. **Breng wijzigingen aan**: Volg onze codeer- en documentatiestandaarden
4. **Test uw wijzigingen**: Controleer of alle links werken en inhoud correct wordt weergegeven
5. **Dien een pull request in**: Geef een duidelijke omschrijving van uw wijzigingen

### Soorten bijdragen

We verwelkomen de volgende soorten bijdragen:

#### Inhoudsverbeteringen
- Corrigeer typfouten, grammatica en opmaakproblemen
- Verbeter de helderheid van bestaande documentatie
- Werk verouderde informatie bij
- Voeg ontbrekende uitleg of context toe

#### Nieuwe voorbeelden
- Voeg praktijkgerichte implementatiescenario's toe
- Maak nieuwe AZD-sjablonen voor veelvoorkomende gebruikssituaties
- Bied extra codevoorbeelden en oefeningen

#### Ondersteuning vertalingen
- Help bij het onderhouden van bestaande vertalingen
- Verbeter de kwaliteit van vertalingen
- Voeg vertalingen toe voor nieuwe inhoud

#### Bugrapportages
- Meld kapotte links of onjuiste codevoorbeelden
- Identificeer inconsistenties in documentatie
- Markeer toegankelijkheidsproblemen

## Bijdragende richtlijnen

### Documentatiestandaarden

- Gebruik heldere, voor beginners geschikte taal
- Voeg leerdoelen en resultaten toe
- Bied stapsgewijze instructies met verwachte uitkomsten
- Voeg navigatielinks toe naar gerelateerde inhoud
- Gebruik consistente opmaak en markdownstijl

### Codevoorbeelden

- Zorg dat alle codevoorbeelden getest en werkend zijn
- Voeg opmerkingen toe die kernconcepten uitleggen
- Volg Azure- en AZD-best practices
- Geef waar van toepassing de verwachte uitvoer weer

### Controleer Engelse documentatie

Vanaf de root van de repository, installeer de bestaande ontwikkelvereisten en voer uit:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

De offline linkchecker controleert Engelse Markdown/HTML-paden, koppen, expliciete ankers en lege link placeholders. Hij sluit gegenereerde `translations/` en `translated_images/` uit, inclusief links naar die mappen. Hij haalt geen externe websites op en valideert geen Azure-implementaties. Gebruik `--json <report-path>` om fouten en de externe URL-inventaris te exporteren voor een aparte netwerkcontrole. Verifieer huidige upstream-commando’s en voorbeeldvereisten bij het wijzigen van technische instructies; onderscheid geteste applicaties van ontwerpblauwdrukken.

### Commitberichten

Gebruik heldere, beschrijvende commitberichten:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Gedragscode

Lees en volg onze [Gedragscode](CODE_OF_CONDUCT.md) om een gastvrije en inclusieve gemeenschap te behouden.

## Hulp krijgen

- **Vragen**: Zoek of open een [GitHub issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Gemeenschap**: Word lid van de [Azure Discord](https://discord.gg/microsoft-azure)
- **Documentatie**: Bekijk de [Azure Developer CLI docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licentie

Door bij te dragen aan deze repository gaat u ermee akkoord dat uw bijdragen worden gelicenseerd onder de [MIT License](../../LICENSE).

---

Bedankt dat u helpt om AZD For Beginners een betere leerbron voor de gemeenschap te maken!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI vertaaldienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u er rekening mee te houden dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->