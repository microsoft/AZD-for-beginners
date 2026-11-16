# Bidra till AZD För Nybörjare

Tack för ditt intresse att bidra till kursen AZD För Nybörjare! Detta dokument ger riktlinjer och information för bidragsgivare.

## Hur man Bidrar

### Rapportera Problem

Om du hittar buggar, fel eller har förslag på förbättringar:

1. **Kontrollera Befintliga Problem**: Sök bland [befintliga problem](https://github.com/microsoft/azd-for-beginners/issues) för att undvika dubbletter
2. **Skapa ett Nytt Problem**: Använd rätt mall för problemet
3. **Ge Information**: Inkludera steg för att återskapa, förväntat beteende och skärmdumpar om tillämpligt

### Föreslå Ändringar

1. **Forka Repositoriet**: Skapa en egen fork av projektet
2. **Skapa en Gren**: Skapa en feature-gren för dina ändringar
3. **Gör Ändringar**: Följ våra kodnings- och dokumentationsstandarder
4. **Testa Dina Ändringar**: Verifiera att alla länkar fungerar och att innehållet renderas korrekt
5. **Skicka en Pull-begäran**: Ge en tydlig beskrivning av dina ändringar

### Bidragstyper

Vi välkomnar följande typer av bidrag:

#### Förbättringar av Innehåll
- Rätta stavfel, grammatik och formateringsfel
- Förbättra tydligheten i befintlig dokumentation
- Uppdatera utdaterad information
- Lägg till saknade förklaringar eller kontext

#### Nya Exempel
- Lägg till verkliga distributionsscenarier
- Skapa nya AZD-mallar för vanliga användningsfall
- Ge fler kodexempel och övningar

#### Översättningsstöd
- Hjälp till att underhålla befintliga översättningar
- Förbättra översättningskvaliteten
- Lägg till översättningar för nytt innehåll

#### Felrapporteringar
- Rapportera trasiga länkar eller felaktiga kodexempel
- Identifiera inkonsekvenser i dokumentationen
- Markera tillgänglighetsproblem

## Riktlinjer för Bidrag

### Dokumentationsstandarder

- Använd tydligt och nybörjarvänligt språk
- Inkludera lärandemål och resultat
- Ge steg-för-steg instruktioner med förväntade resultat
- Lägg till navigeringslänkar till relaterat innehåll
- Använd konsekvent formatering och markdown-stil

### Kodexempel

- Se till att alla kodexempel är testade och fungerar
- Inkludera kommentarer som förklarar viktiga koncept
- Följ Azure och AZD:s bästa praxis
- Ge förväntad output där det är tillämpligt

### Validera Engelsk Dokumentation

Från repositoriets rot, installera befintliga utvecklingskrav och kör:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline-länkgranskaren kontrollerar engelska Markdown/HTML-sökvägar, rubriker, explicita ankare och tomma länkplatshållare. Den exkluderar genererade `translations/` och `translated_images/`, inklusive länkar till dessa kataloger. Den hämtar inte externa webbplatser eller validerar Azure-distributioner. Använd `--json <report-path>` för att exportera fel och den externa URL-inventeringen för en separat nätverkskontroll. Verifiera aktuella upstream-kommandon och exempelkrav vid ändring av tekniska instruktioner; skilj på testade applikationer och designritningar.

### Commit-meddelanden

Använd tydliga, beskrivande commit-meddelanden:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Uppförandekod

Läs och följ vår [Code of Conduct](CODE_OF_CONDUCT.md) för att upprätthålla en välkomnande och inkluderande gemenskap.

## Få Hjälp

- **Frågor**: Sök eller öppna ett [GitHub-issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Gemenskap**: Gå med i [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentation**: Granska [Azure Developer CLI-dokumentationen](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licens

Genom att bidra till detta repository godkänner du att dina bidrag licensieras under [MIT-licensen](../../LICENSE).

---

Tack för att du hjälper till att göra AZD För Nybörjare till en bättre lärresurs för gemenskapen!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->