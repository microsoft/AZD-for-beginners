# Osallistuminen AZD For Beginners -kurssiin

Kiitos kiinnostuksestasi osallistua AZD For Beginners -kurssiin! Tämä asiakirja tarjoaa ohjeita ja tietoa osallistujille.

## Miten osallistua

### Ongelmien raportointi

Jos löydät bugeja, virheitä tai sinulla on parannusehdotuksia:

1. **Tarkista olemassa olevat ongelmat**: Hae [olemassa olevista ongelmista](https://github.com/microsoft/azd-for-beginners/issues) välttääksesi päällekkäisyyksiä
2. **Luo uusi ongelma**: Käytä sopivaa ongelmalomaketta
3. **Anna yksityiskohdat**: Sisällytä toistettavat vaiheet, odotettu käytös ja näytönkuvat tarvittaessa

### Muutosten ehdottaminen

1. **Forkkaa repositorio**: Luo oma fork-projektista
2. **Luo haara**: Luo ominaisuushaara muutoksillesi
3. **Tee muutokset**: Noudata koodi- ja dokumentaatiostandardejamme
4. **Testaa muutokset**: Varmista, että kaikki linkit toimivat ja sisältö renderöityy oikein
5. **Lähetä pull request**: Anna selkeä kuvaus tekemistäsi muutoksista

### Osallistumisen tyypit

Otamme vastaan seuraavan tyyppisiä osallistumisia:

#### Sisällön parannukset
- Korjaa kirjoitusvirheitä, kielioppi- ja muotoiluvirheitä
- Paranna olemassa olevan dokumentaation selkeyttä
- Päivitä vanhentunut tieto
- Lisää puuttuvia selityksiä tai kontekstia

#### Uudet esimerkit
- Lisää todellisia käyttöönottoscenaarioita
- Luo uusia AZD-malleja yleisiin käyttötapauksiin
- Tarjoa lisää koodiesimerkkejä ja harjoituksia

#### Käännöstuki
- Auta ylläpitämään olemassa olevia käännöksiä
- Paranna käännösten laatua
- Lisää käännöksiä uuteen sisältöön

#### Bugiraportit
- Raportoi rikkinäisiä linkkejä tai virheellisiä koodiesimerkkejä
- Tunnista dokumentaation epäjohdonmukaisuuksia
- Ilmoita saavutettavuusongelmista

## Osallistumisohjeet

### Dokumentaation standardit

- Käytä selkeää, aloittelijaystävällistä kieltä
- Sisällytä oppimistavoitteet ja -tulokset
- Tarjoa vaiheittaiset ohjeet odotetuin tuloksin
- Lisää navigointilinkit liittyvään sisältöön
- Käytä yhtenäistä muotoilua ja Markdown-tyyliä

### Koodiesimerkit

- Varmista, että kaikki koodiesimerkit on testattu ja ne toimivat
- Sisällytä kommentteja, jotka selittävät keskeiset käsitteet
- Noudata Azuren ja AZD:n parhaita käytäntöjä
- Tarjoa odotettu tulos, kun se on sovellettavissa

### Vahvista englanninkielinen dokumentaatio

Repositorion juuresta, asenna olemassa olevat kehitysvaatimukset ja suorita:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline-linkintarkistaja tarkistaa englanninkieliset Markdown/HTML-polut, otsikot, eksplisiittiset ankkurit ja tyhjät linkkipaikat. Se sulkee pois generoidut `translations/` ja `translated_images/`, mukaan lukien linkit näihin hakemistoihin. Se ei hae ulkoisia verkkosivustoja eikä tarkista Azure-käyttöönottoja. Käytä `--json <report-path>` vianmääritykseen ja ulkoisen URL-inventaarion vientiin erillistä verkon tarkistusta varten. Vahvista nykyiset upstream-komennot ja esimerkkien esivaatimukset kun muutat teknisiä ohjeita; erottele testatut sovellukset suunnittelukaavioista.

### Commit-viestit

Käytä selkeitä, kuvaavia commit-viestejä:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Käyttäytymissäännöt

Lue ja noudata ystävällistä ja osallistavaa yhteisöä ylläpitävää [käyttäytymissääntöämme](CODE_OF_CONDUCT.md).

## Apuun pääsy

- **Kysymykset**: Hae tai avaa uusi [GitHub-issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Yhteisö**: Liity [Azure Discord -yhteisöön](https://discord.gg/microsoft-azure)
- **Dokumentaatio**: Tutustu [Azure Developer CLI -dokumentaatioon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Lisenssi

Osallistumalla tähän repositorioon hyväksyt, että panoksesi lisensoidaan [MIT-lisenssillä](../../LICENSE).

---

Kiitos, että autat tekemään AZD For Beginners -materiaalista paremman oppimisresurssin yhteisölle!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->