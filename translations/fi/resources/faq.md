<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T22:38:25+00:00",
  "source_file": "resources/faq.md",
  "language_code": "fi"
}
-->
# Usein kysytyt kysymykset (FAQ)

## Johdanto

Tämä kattava FAQ tarjoaa vastauksia yleisimpiin kysymyksiin Azure Developer CLI:stä (azd) ja Azure-järjestelmien käyttöönotosta. Löydä nopeita ratkaisuja yleisiin ongelmiin, ymmärrä parhaat käytännöt ja selkeytä azd:n käsitteitä ja työnkulkuja.

## Oppimistavoitteet

Tämän FAQ:n avulla voit:
- Löytää nopeita vastauksia yleisiin Azure Developer CLI -kysymyksiin ja ongelmiin
- Ymmärtää keskeisiä käsitteitä ja terminologiaa käytännön kysymys-vastaus-muodossa
- Saada ratkaisuja vianetsintään yleisissä ongelmissa ja virhetilanteissa
- Oppia parhaita käytäntöjä optimointiin liittyvistä kysymyksistä
- Tutustua edistyneisiin ominaisuuksiin ja toimintoihin asiantuntijatason kysymysten kautta
- Viitata kustannuksiin, turvallisuuteen ja käyttöönoton strategioihin tehokkaasti

## Oppimistulokset

Säännöllisesti viittaamalla tähän FAQ:hen pystyt:
- Ratkaisemaan yleisiä Azure Developer CLI -ongelmia itsenäisesti annettujen ratkaisujen avulla
- Tekemään tietoisia päätöksiä käyttöönoton strategioista ja konfiguraatioista
- Ymmärtämään azd:n ja muiden Azure-työkalujen ja -palveluiden välisen suhteen
- Soveltamaan parhaita käytäntöjä yhteisön kokemusten ja asiantuntijoiden suositusten perusteella
- Vianetsimään tehokkaasti autentikointiin, käyttöönottoon ja konfiguraatioon liittyviä ongelmia
- Optimoimaan kustannuksia ja suorituskykyä FAQ:n tarjoamien oivallusten ja suositusten avulla

## Sisällysluettelo

- [Aloittaminen](../../../resources)
- [Autentikointi ja pääsy](../../../resources)
- [Pohjat ja projektit](../../../resources)
- [Käyttöönotto ja infrastruktuuri](../../../resources)
- [Konfiguraatio ja ympäristöt](../../../resources)
- [Vianetsintä](../../../resources)
- [Kustannukset ja laskutus](../../../resources)
- [Parhaat käytännöt](../../../resources)
- [Edistyneet aiheet](../../../resources)

---

## Aloittaminen

### K: Mikä on Azure Developer CLI (azd)?
**V**: Azure Developer CLI (azd) on kehittäjille suunnattu komentorivityökalu, joka nopeuttaa sovelluksen siirtämistä paikallisesta kehitysympäristöstä Azureen. Se tarjoaa parhaita käytäntöjä pohjien avulla ja auttaa koko käyttöönoton elinkaaren hallinnassa.

### K: Miten azd eroaa Azure CLI:stä?
**V**: 
- **Azure CLI**: Yleiskäyttöinen työkalu Azure-resurssien hallintaan
- **azd**: Kehittäjille suunnattu työkalu sovellusten käyttöönoton työnkulkuihin
- azd käyttää Azure CLI:tä sisäisesti, mutta tarjoaa korkeampia abstraktiotasoja yleisiin kehitysskenaarioihin
- azd sisältää pohjia, ympäristönhallintaa ja käyttöönoton automaatiota

### K: Tarvitsenko Azure CLI:n asennettuna käyttääkseni azd:tä?
**V**: Kyllä, azd vaatii Azure CLI:n autentikointiin ja joihinkin toimintoihin. Asenna ensin Azure CLI ja sen jälkeen azd.

### K: Mitä ohjelmointikieliä azd tukee?
**V**: azd on kieliriippumaton. Se toimii seuraavien kanssa:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Staattiset verkkosivustot
- Konttipohjaiset sovellukset

### K: Voinko käyttää azd:tä olemassa olevien projektien kanssa?
**V**: Kyllä! Voit joko:
1. Käyttää `azd init` -komentoa lisätäksesi azd-konfiguraation olemassa oleviin projekteihin
2. Mukauttaa olemassa olevat projektit vastaamaan azd-pohjan rakennetta
3. Luoda mukautettuja pohjia nykyisen arkkitehtuurisi pohjalta

---

## Autentikointi ja pääsy

### K: Miten autentikoidun Azureen azd:n avulla?
**V**: Käytä `azd auth login`, joka avaa selaimen Azure-autentikointia varten. CI/CD-skenaarioissa käytä palveluperiaatteita tai hallittuja identiteettejä.

### K: Voinko käyttää azd:tä useiden Azure-tilausten kanssa?
**V**: Kyllä. Käytä `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` määrittääksesi, mitä tilausta käytetään kullekin ympäristölle.

### K: Mitä oikeuksia tarvitsen käyttöönottoon azd:n avulla?
**V**: Tyypillisesti tarvitset:
- **Contributor**-roolin resurssiryhmään tai tilaukseen
- **User Access Administrator**, jos otat käyttöön resursseja, jotka vaativat roolien määrittämistä
- Tarkat oikeudet vaihtelevat pohjan ja käyttöönotettavien resurssien mukaan

### K: Voinko käyttää azd:tä CI/CD-putkissa?
**V**: Ehdottomasti! azd on suunniteltu CI/CD-integraatiota varten. Käytä palveluperiaatteita autentikointiin ja aseta ympäristömuuttujat konfiguraatiota varten.

### K: Miten käsittelen autentikointia GitHub Actionsissa?
**V**: Käytä Azure Login -toimintoa palveluperiaatteen tunnistetietojen kanssa:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Pohjat ja projektit

### K: Mistä löydän azd-pohjia?
**V**: 
- Viralliset pohjat: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Yhteisön pohjat: GitHub-haku "azd-template"
- Käytä `azd template list` selataksesi saatavilla olevia pohjia

### K: Miten luon mukautetun pohjan?
**V**: 
1. Aloita olemassa olevan pohjan rakenteesta
2. Muokkaa `azure.yaml`-, infrastruktuuritiedostoja ja sovelluskoodia
3. Testaa huolellisesti `azd up` -komennolla
4. Julkaise GitHubiin sopivilla tunnisteilla

### K: Voinko käyttää azd:tä ilman pohjaa?
**V**: Kyllä, käytä `azd init` olemassa olevassa projektissa luodaksesi tarvittavat konfiguraatiotiedostot. Sinun täytyy manuaalisesti konfiguroida `azure.yaml` ja infrastruktuuritiedostot.

### K: Mikä ero on virallisilla ja yhteisön pohjilla?
**V**: 
- **Viralliset pohjat**: Microsoftin ylläpitämiä, säännöllisesti päivitettyjä, kattava dokumentaatio
- **Yhteisön pohjat**: Kehittäjien luomia, voivat sisältää erikoistuneita käyttötapauksia, vaihteleva laatu ja ylläpito

### K: Miten päivitän pohjan projektissani?
**V**: Pohjia ei päivitetä automaattisesti. Voit:
1. Manuaalisesti verrata ja yhdistää muutokset lähdepohjasta
2. Aloittaa alusta `azd init` -komennolla käyttäen päivitettyä pohjaa
3. Valikoida tiettyjä parannuksia päivitetystä pohjasta

---

## Käyttöönotto ja infrastruktuuri

### K: Mitä Azure-palveluita azd voi ottaa käyttöön?
**V**: azd voi ottaa käyttöön mitä tahansa Azure-palvelua Bicep/ARM-pohjien kautta, mukaan lukien:
- App Services, Container Apps, Functions
- Tietokannat (SQL, PostgreSQL, Cosmos DB)
- Tallennus, Key Vault, Application Insights
- Verkko-, turvallisuus- ja valvontaresurssit

### K: Voinko ottaa käyttöön useissa alueissa?
**V**: Kyllä, konfiguroi useita alueita Bicep-pohjissasi ja aseta sijaintiparametri sopivasti kullekin ympäristölle.

### K: Miten käsittelen tietokannan skeemamuutoksia?
**V**: Käytä käyttöönottohakuja `azure.yaml`-tiedostossa:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Voinko ottaa käyttöön vain infrastruktuurin ilman sovelluksia?
**V**: Kyllä, käytä `azd provision` ottaaksesi käyttöön vain pohjissa määritetyt infrastruktuurikomponentit.

### K: Miten otan käyttöön olemassa olevia Azure-resursseja?
**V**: Tämä on monimutkaista eikä suoraan tuettua. Voit:
1. Tuoda olemassa olevat resurssit Bicep-pohjiisi
2. Käyttää olemassa olevia resurssiviittauksia pohjissa
3. Muokata pohjia luomaan tai viittaamaan resursseihin ehdollisesti

### K: Voinko käyttää Terraformia Bicepin sijaan?
**V**: Tällä hetkellä azd tukee ensisijaisesti Bicep/ARM-pohjia. Terraform-tuki ei ole virallisesti saatavilla, vaikka yhteisön ratkaisuja saattaa olla olemassa.

---

## Konfiguraatio ja ympäristöt

### K: Miten hallitsen eri ympäristöjä (kehitys, testaus, tuotanto)?
**V**: Luo erilliset ympäristöt `azd env new <environment-name>` -komennolla ja konfiguroi eri asetukset kullekin:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Missä ympäristökonfiguraatiot tallennetaan?
**V**: `.azure`-kansiossa projektisi hakemistossa. Jokaisella ympäristöllä on oma kansio konfiguraatiotiedostoineen.

### K: Miten asetan ympäristökohtaisen konfiguraation?
**V**: Käytä `azd env set` -komentoa ympäristömuuttujien konfigurointiin:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Voinko jakaa ympäristökonfiguraatiot tiimin jäsenten kesken?
**V**: `.azure`-kansio sisältää arkaluontoista tietoa eikä sitä pitäisi lisätä versionhallintaan. Sen sijaan:
1. Dokumentoi tarvittavat ympäristömuuttujat
2. Käytä käyttöönotto-skriptejä ympäristöjen asettamiseen
3. Käytä Azure Key Vaultia arkaluontoiseen konfiguraatioon

### K: Miten ohitan pohjan oletusasetukset?
**V**: Aseta ympäristömuuttujat, jotka vastaavat pohjan parametreja:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Vianetsintä

### K: Miksi `azd up` epäonnistuu?
**V**: Yleisiä syitä:
1. **Autentikointiongelmat**: Suorita `azd auth login`
2. **Riittämättömät oikeudet**: Tarkista Azure-roolimäärittelyt
3. **Resurssien nimeämiskonfliktit**: Vaihda AZURE_ENV_NAME
4. **Kiintiö-/kapasiteettiongelmat**: Tarkista alueellinen saatavuus
5. **Pohjavirheet**: Vahvista Bicep-pohjat

### K: Miten debuggaan käyttöönoton epäonnistumisia?
**V**: 
1. Käytä `azd deploy --debug` saadaksesi yksityiskohtaisen tulosteen
2. Tarkista Azure-portaalin käyttöönottohistoria
3. Tarkista Aktiviteettiloki Azure-portaalissa
4. Käytä `azd show` näyttääksesi nykyisen ympäristön tilan

### K: Miksi ympäristömuuttujani eivät toimi?
**V**: Tarkista:
1. Muuttujien nimet vastaavat pohjan parametreja täsmälleen
2. Arvot on lainausmerkitty, jos ne sisältävät välilyöntejä
3. Ympäristö on valittu: `azd env select <environment>`
4. Muuttujat on asetettu oikeaan ympäristöön

### K: Miten siivoan epäonnistuneet käyttöönotot?
**V**: 
```bash
azd down --force --purge
```
Tämä poistaa kaikki resurssit ja ympäristökonfiguraation.

### K: Miksi sovellukseni ei ole käytettävissä käyttöönoton jälkeen?
**V**: Tarkista:
1. Käyttöönotto onnistui
2. Sovellus on käynnissä (tarkista lokit Azure-portaalissa)
3. Verkkoturvaryhmät sallivat liikenteen
4. DNS/mukautetut verkkotunnukset on konfiguroitu oikein

---

## Kustannukset ja laskutus

### K: Kuinka paljon azd-käyttöönotot maksavat?
**V**: Kustannukset riippuvat:
- Käyttöönotetuista Azure-palveluista
- Palvelutasojen/SKU:iden valinnasta
- Alueellisista hintavaihteluista
- Käyttötottumuksista

Käytä [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) arvioiden tekemiseen.

### K: Miten hallitsen kustannuksia azd-käyttöönotossa?
**V**: 
1. Käytä alempia SKU-tasoja kehitysympäristöissä
2. Aseta Azure-budjetit ja hälytykset
3. Käytä `azd down` poistaaksesi resurssit, kun niitä ei tarvita
4. Valitse sopivat alueet (kustannukset vaihtelevat sijainnin mukaan)
5. Käytä Azure Cost Management -työkaluja

### K: Onko azd-pohjille ilmaisia tasoja?
**V**: Monet Azure-palvelut tarjoavat ilmaisia tasoja:
- App Service: Ilmainen taso saatavilla
- Azure Functions: 1M ilmaista suoritusta/kuukausi
- Cosmos DB: Ilmainen taso 400 RU/s
- Application Insights: Ensimmäiset 5GB/kuukausi ilmaiseksi

Konfiguroi pohjat käyttämään ilmaisia tasoja, jos mahdollista.

### K: Miten arvioin kustannuksia ennen käyttöönottoa?
**V**: 
1. Tarkista pohjan `main.bicep` nähdäksesi, mitä resursseja luodaan
2. Käytä Azure Pricing Calculatoria tiettyjen SKU:iden kanssa
3. Ota käyttöön kehitysympäristössä ensin seuratakseen todellisia kustannuksia
4. Käytä Azure Cost Managementia yksityiskohtaiseen kustannusanalyysiin

---

## Parhaat käytännöt

### K: Mitkä ovat parhaat käytännöt azd-projektirakenteelle?
**V**: 
1. Pidä sovelluskoodi erillään infrastruktuurista
2. Käytä merkityksellisiä palvelunimiä `azure.yaml`-tiedostossa
3. Toteuta asianmukainen virheenkäsittely rakennusskripteissä
4. Käytä ympäristökohtaisia konfiguraatioita
5. Sisällytä kattava dokumentaatio

### K: Miten järjestän useita palveluita azd:ssä?
**V**: Käytä suositeltua rakennetta:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### K: Pitäisikö `.azure`-kansio lisätä versionhallintaan?
**V**: **Ei!** `.azure`-kansio sisältää arkaluontoista tietoa. Lisää se `.gitignore`-tiedostoon:
```gitignore
.azure/
```

### K: Miten käsittelen salaisuuksia ja arkaluontoista konfiguraatiota?
**V**: 
1. Käytä Azure Key Vaultia salaisuuksiin
2. Viittaa Key Vault -salaisuuksiin sovelluksen konfiguraatiossa
3. Älä koskaan lisää salaisuuksia versionhallintaan
4. Käytä hallittuja identiteettejä palveluiden väliseen autentikointiin

### K: Mikä on suositeltu lähestymistapa CI/CD:hen azd:n kanssa?
**V**: 
1. Käytä erillisiä ympäristöjä kullekin vaiheelle (kehitys/testaus/tuotanto)
2. Toteuta automatisoitu testaus ennen käyttöönottoa
3. Käytä palveluperiaatteita autentikointiin
4. Tallenna arkaluontoinen konfiguraatio putken salaisuuksiin/muuttujiin
5. Toteuta hyväksyntäportit tuotantokäyttöönottoihin

---

## Edistyneet aiheet

### K: Voinko laajentaa azd:tä mukautetulla toiminnallisuudella?
**V**: Kyllä, käyttöönottohakujen kautta `azure.yaml`-tiedostossa:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### K: Miten integroin azd:n olemassa oleviin DevOps-prosesseihin?
**V**: 
1. Käytä azd-komentoja olemassa olevissa putkiskripteissä
2. Standardisoi azd-pohjat tiimien välillä
3. Integroi olemassa olevaan valvontaan ja hälyty
1. Analysoi nykyinen käyttöönottoarkkitehtuuri  
2. Luo vastaavat Bicep-mallit  
3. Määritä `azure.yaml` vastaamaan nykyisiä palveluita  
4. Testaa perusteellisesti kehitysympäristössä  
5. Siirrä ympäristöt asteittain  

---

## Onko vielä kysyttävää?

### **Etsi ensin**
- Tarkista [virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Etsi [GitHub-ongelmista](https://github.com/Azure/azure-dev/issues) samankaltaisia ongelmia  

### **Hanki apua**
- [GitHub-keskustelut](https://github.com/Azure/azure-dev/discussions) - Yhteisön tuki  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Teknisiä kysymyksiä  
- [Azure Discord](https://discord.gg/azure) - Yhteisön reaaliaikainen chat  

### **Ilmoita ongelmista**
- [GitHub-ongelmat](https://github.com/Azure/azure-dev/issues/new) - Virheilmoitukset ja ominaisuuspyynnöt  
- Sisällytä asiaankuuluvat lokit, virheilmoitukset ja toistettavat vaiheet  

### **Lisätietoja**
- [Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Tätä FAQ:ta päivitetään säännöllisesti. Viimeksi päivitetty: 9. syyskuuta 2025*  

---

**Navigointi**  
- **Edellinen osio**: [Sanasto](glossary.md)  
- **Seuraava osio**: [Opas](study-guide.md)  

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.