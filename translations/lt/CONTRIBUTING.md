# Indėlis į AZD Pradedantiesiems

Dėkojame, kad domitės prisidėti prie AZD Pradedantiesiems kurso! Šiame dokumente pateikiamos gairės ir informacija prisidėjantiems.

## Kaip prisidėti

### Problemos pranešimas

Jei randate klaidų, klaidų ar turite pasiūlymų patobulinimams:

1. **Patikrinkite esamas problemas**: Ieškokite [esamų problemų](https://github.com/microsoft/azd-for-beginners/issues), kad išvengtumėte pasikartojimų
2. **Sukurkite naują problemą**: Naudokite tinkamą problemos šabloną
3. **Pateikite detales**: Įtraukite veiksmus, kaip ją atkurti, numatomą elgesį ir ekrano kopijas, jei taikoma

### Siūlymų pateikimas

1. **Padalinkite repozitoriją (fork)**: Sukurkite savo projekto padalinį
2. **Sukurkite šaką**: Sukurkite funkcijos šaką savo pakeitimams
3. **Atlikite pakeitimus**: Laikykitės mūsų kodavimo ir dokumentavimo standartų
4. **Išbandykite pakeitimus**: Patikrinkite, ar veikia visi saitai ir turinys rodomas teisingai
5. **Pateikite pull užklausą**: Pateikite aiškų savo pakeitimų aprašymą

### Indėlio tipai

Mes laukiame tokių indėlių:

#### Turinys patobulinimai
- Taisyti klaidas, gramatiką ir formatavimo problemas
- Pagerinti esamos dokumentacijos aiškumą
- Atnaujinti pasenusią informaciją
- Pridėti trūkstamus paaiškinimus arba kontekstą

#### Nauji pavyzdžiai
- Pridėti tikroviškas diegimo situacijas
- Kurti naujus AZD šablonus dažniausiai pasitaikantiems atvejams
- Pateikti papildomų kodo pavyzdžių ir pratimų

#### Vertimo palaikymas
- Padėti prižiūrėti esamus vertimus
- Pagerinti vertimo kokybę
- Pridėti vertimus naujam turiniui

#### Klaidų ataskaitos
- Pranešti apie neveikiančius saitus ar neteisingus kodo pavyzdžius
- Nustatyti dokumentacijos neatitikimus
- Pažymėti prieinamumo problemas

## Indėlio gairės

### Dokumentacijos standartai

- Naudokite aiškią, pradedantiesiems draugišką kalbą
- Įtraukite mokymosi tikslus ir rezultatus
- Pateikite žingsnis po žingsnio instrukcijas su numatytu rezultatu
- Pridėkite navigacijos saitus į susijusį turinį
- Naudokite nuoseklų formatavimą ir markdown stilių

### Kodo pavyzdžiai

- Įsitikinkite, kad visi kodo pavyzdžiai yra išbandyti ir veikia
- Įtraukite komentarus, paaiškinančius pagrindines sąvokas
- Laikykitės Azure ir AZD geriausių praktikų
- Pateikite numatomą rezultatą, jei taikoma

### Patvirtinkite Anglų dokumentaciją

Iš repozitorijos šaknies įdiekite esamus kūrimo reikalavimus ir paleiskite:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Neprisijungęs saito tikrintuvas tikrina anglų kalbos Markdown/HTML kelius, antraštes, aiškius ankerius ir tuščius saito vietos laikiklius. Jis pašalina sugeneruotas `translations/` ir `translated_images/`, taip pat nuorodas šiuose kataloguose. Nepatvirtina išorinių svetainių ar Azure diegimų. Naudokite `--json <report-path>`, kad eksportuotumėte klaidas ir išorinį URL inventorių atskiram tinklo patikrinimui. Keisdami technines instrukcijas patikrinkite dabartines aukštesnės grandies komandas ir pavyzdinių išankstinių sąlygų reikalavimus; atskirkite išbandytas programas nuo dizaino brėžinių.

### Komitų žinutės

Naudokite aiškias, aprašomas komitų žinutes:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Elgesio kodeksas

Prašome perskaityti ir laikytis mūsų [Elgesio kodekso](CODE_OF_CONDUCT.md), kad išlaikytume draugišką ir įtraukią bendruomenę.

## Pagalbos gavimas

- **Klausimai**: Ieškokite arba atidarykite [GitHub problemą](https://github.com/microsoft/AZD-for-beginners/issues)
- **Bendruomenė**: Prisijunkite prie [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentacija**: Peržiūrėkite [Azure Developer CLI dokumentaciją](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licencija

Prisidėdami prie šios repozitorijos sutinkate, kad jūsų indėliai bus licencijuojami pagal [MIT licenciją](../../LICENSE).

---

Dėkojame, kad padedate padaryti AZD Pradedantiesiems geresne mokymosi priemone bendruomenei!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->