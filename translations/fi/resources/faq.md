# Usein kysytyt kysymykset (FAQ)

**Apua luvun mukaan**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../README.md)
- **🚆 Asennusongelmat**: [Luku 1: Asennus ja käyttöönotto](../docs/getting-started/installation.md)
- **🤖 AI-kysymykset**: [Luku 2: AI-ensimmäinen kehitys](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Vianetsintä**: [Luku 7: Vianetsintä ja virheenkorjaus](../docs/troubleshooting/common-issues.md)

## Johdanto

Tämä kattava FAQ tarjoaa vastauksia yleisimpiin Azure Developer CLI:hin (azd) ja Azure-julkaisuun liittyviin kysymyksiin. Löydä nopeasti ratkaisuja yleisiin ongelmiin, ymmärrä parhaat käytännöt ja saa selvennystä azd-käsitteisiin ja työnkulkuihin.

## Oppimistavoitteet

Käymällä läpi tämän FAQ:n, sinä:
- Saat nopeasti vastauksia yleisiin Azure Developer CLI -kysymyksiin ja ongelmiin
- Ymmärrät keskeiset käsitteet ja terminologian käytännön kysymys–vastaus -muodossa
- Pääset käsiksi vianetsintäratkaisuihin toistuviin ongelmiin ja virhetilanteisiin
- Opit parhaat käytännöt kysytyimpien optimointia koskevien kysymysten kautta
- Löydät edistyneitä ominaisuuksia ja mahdollisuuksia asiantuntijatason kysymyksistä
- Saat tehokkaan viitteen kustannuksiin, turvallisuuteen ja julkaisuarkkitehtuuriin liittyen

## Oppimistulokset

Kun viittaat tähän FAQ:iin säännöllisesti, osaat:
- Ratkaista yleisiä Azure Developer CLI -ongelmia itsenäisesti saatavilla olevien ratkaisujen avulla
- Tehdä perusteltuja päätöksiä julkaisustrategioista ja konfiguraatioista
- Ymmärtää azd:n ja muiden Azure-työkalujen sekä -palveluiden välisen suhteen
- Soveltaa parhaisiin käytäntöihin perustuvia suosituksia yhteisön kokemuksen ja asiantuntijoiden ehdotusten mukaisesti
- Vianetsintää todennukseen, julkaisuun ja konfigurointiongelmiin tehokkaasti
- Optimoida kustannuksia ja suorituskykyä FAQ:n näkemyksillä ja suosituksilla

## Sisällysluettelo

- [Aloittaminen](../../../resources)
- [Todennus ja käyttöoikeudet](../../../resources)
- [Mallit ja projektit](../../../resources)
- [Julkaisu ja infrastruktuuri](../../../resources)
- [Konfigurointi ja ympäristöt](../../../resources)
- [Vianetsintä](../../../resources)
- [Kustannukset ja laskutus](../../../resources)
- [Parhaat käytännöt](../../../resources)
- [Edistyneet aiheet](../../../resources)

---

## Aloittaminen

### K: Mikä on Azure Developer CLI (azd)?
**V**: Azure Developer CLI (azd) on kehittäjälähtöinen komentorivityökalu, joka nopeuttaa sovelluksesi siirtymistä paikallisesta kehitysympäristöstä Azureen. Se tarjoaa parhaat käytännöt mallejen kautta ja auttaa koko julkaisuelinkaaressa.

### K: Kuinka azd eroaa Azure CLI:stä?
**V**: 
- **Azure CLI**: Yleiskäyttöinen työkalu Azure-resurssien hallintaan
- **azd**: Kehittäjille suunnattu työkalu sovellusjulkaisutöihin
- azd käyttää sisäisesti Azure CLI:tä mutta tarjoaa korkeamman tason abstraktioita yleisiin kehitystilanteisiin
- azd sisältää malleja, ympäristöhallinnan ja julkaisun automaation

### K: Tarvitseeko minulla Azure CLI asennettuna käyttääksekseni azd:ta?
**V**: Kyllä, azd vaatii Azure CLI:n todennukseen ja joihinkin toimintoihin. Asenna ensin Azure CLI ja sitten azd.

### K: Mitä ohjelmointikieliä azd tukee?
**V**: azd on kieli-agnostinen. Se toimii muun muassa:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Staattiset verkkosivustot
- Kontitetut sovellukset

### K: Voinko käyttää azd:ta olemassa olevien projektien kanssa?
**V**: Kyllä! Voit joko:
1. Käyttää `azd init` lisätäksesi azd-konfiguraation olemassa olevaan projektiin
2. Mukauttaa olemassa olevia projekteja vastaamaan azd-mallin rakennetta
3. Luoda mukautettuja malleja olemassa olevan arkkitehtuurisi pohjalta

---

## Todennus ja käyttöoikeudet

### K: Kuinka todennan Azuren kanssa käyttäen azd:ta?
**V**: Käytä `azd auth login`, joka avaa selaimen Azure-todennusta varten. CI/CD-tilanteissa käytä palveluperiaatteita (service principals) tai hallittuja identiteettejä.

### K: Voinko käyttää azd:ta useiden Azure-tilausten kanssa?
**V**: Kyllä. Käytä `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` määrittääksesi, mitä tilausta kukin ympäristö käyttää.

### K: Mitä oikeuksia tarvitsen julkaistakseni azd:lla?
**V**: Tyypillisesti tarvitset:
- **Contributor**-roolin resurssiryhmälle tai tilaukselle
- **User Access Administrator** -roolin, jos julkaistavat resurssit vaativat roolimäärityksiä
- Tarkat oikeudet vaihtelevat mallin ja julkaistavien resurssien mukaan

### K: Voinko käyttää azd:ta CI/CD-putkissa?
**V**: Ehdottomasti! azd on suunniteltu CI/CD-integraatiota varten. Käytä palveluperiaatteita todennukseen ja aseta ympäristömuuttujat konfiguraatiota varten.

### K: Kuinka käsittelen todennusta GitHub Actions -putkissa?
**V**: Käytä Azure Login -actionia palveluperiaatteiden tunnistetiedoilla:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Mallit ja projektit

### K: Mistä löydän azd-malleja?
**V**: 
- Viralliset mallit: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Yhteisön mallit: Etsi GitHubista "azd-template"
- Käytä `azd template list` selataksesi saatavilla olevia malleja

### K: Kuinka luon mukautetun mallin?
**V**: 
1. Aloita olemassa olevasta mallin rakenteesta
2. Muokkaa `azure.yaml`-tiedostoa, infrastruktuuritiedostoja ja sovelluskoodia
3. Testaa perusteellisesti `azd up` -komennolla
4. Julkaise GitHubiin sopivilla tageilla

### K: Voinko käyttää azd:ta ilman mallia?
**V**: Kyllä, käytä `azd init` olemassa olevassa projektissa luodaksesi tarvittavat konfiguraatiotiedostot. Sinun täytyy konfiguroida `azure.yaml` ja infrastruktuuritiedostot manuaalisesti.

### K: Mikä ero on virallisilla ja yhteisön malleilla?
**V**: 
- **Viralliset mallit**: Microsoftin ylläpitämiä, säännöllisesti päivitettyjä, kattava dokumentaatio
- **Yhteisön mallit**: Kehittäjien luomia, voivat olla erikoistuneita käyttötapauksia varten, laatu ja ylläpito vaihtelevat

### K: Kuinka päivitän mallin projektissani?
**V**: Mallit eivät päivity automaattisesti. Voit:
1. Verrata ja yhdistää muutokset manuaalisesti lähdemallista
2. Aloittaa alusta `azd init` käyttämällä päivitettyä mallia
3. Valita tietyt parannukset uudesta mallista

---

## Julkaisu ja infrastruktuuri

### K: Mitä Azure-palveluja azd voi julkaista?
**V**: azd voi julkaista mitä tahansa Azure-palvelua Bicep/ARM-mallien kautta, mukaan lukien:
- App Services, Container Apps, Functions
- Tietokannat (SQL, PostgreSQL, Cosmos DB)
- Tallennus, Key Vault, Application Insights
- Verkkopalvelut, turvallisuus ja valvontaresurssit

### K: Voinko julkaista useisiin alueisiin?
**V**: Kyllä, konfiguroi useita alueita Bicep-malleihisi ja aseta location-parametri sopivasti kullekin ympäristölle.

### K: Kuinka käsittelen tietokannan skeeman migraatiot?
**V**: Käytä deployment-hookkeja `azure.yaml`-tiedostossa:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Voinko julkaista vain infrastruktuurin ilman sovelluksia?
**V**: Kyllä, käytä `azd provision` julkaistaksesi vain infrastruktuurikomponentit, jotka on määritelty malleissasi.

### K: Kuinka julkaisen olemassa oleviin Azure-resursseihin?
**V**: Tämä on monimutkaista eikä suoraan tuettu. Voit:
1. Tuoda olemassa olevat resurssit Bicep-malleihisi
2. Käyttää olemassa olevia resurssiviitteitä malleissa
3. Muokata malleja luomaan resurssit ehdollisesti tai viittaamaan niihin

### K: Voinko käyttää Terraformia Bicepin sijaan?
**V**: Tällä hetkellä azd tukee ensisijaisesti Bicep/ARM-malleja. Terraform-tukea ei ole virallisesti saatavilla, vaikka yhteisöratkaisuja saattaa olla.

---

## Konfigurointi ja ympäristöt

### K: Kuinka hallinnoin eri ympäristöjä (dev, staging, prod)?
**V**: Luo erilliset ympäristöt komennolla `azd env new <environment-name>` ja konfiguroi eri asetukset kullekin:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Missä ympäristökonfiguraatiot säilytetään?
**V**: `.azure`-kansiossa projektihakemistossasi. Jokaisella ympäristöllä on oma kansionsa konfiguraatiotiedostoineen.

### K: Kuinka asetan ympäristökohtaisia asetuksia?
**V**: Käytä `azd env set` asettaaksesi ympäristömuuttujia:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Voinko jakaa ympäristökonfiguraatioita tiimin jäsenten kesken?
**V**: `.azure`-kansio sisältää arkaluonteista tietoa eikä sitä tulisi sitoa versionhallintaan. Sen sijaan:
1. Dokumentoi vaaditut ympäristömuuttujat
2. Käytä julkaisu skriptejä ympäristöjen pystyttämiseen
3. Käytä Azure Key Vaultia arkaluonteisille konfiguraatioille

### K: Kuinka yliajan mallin oletusarvot?
**V**: Aseta ympäristömuuttujia, jotka vastaavat mallin parametreja:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Vianetsintä

### K: Miksi `azd up` epäonnistuu?
**V**: Yleisiä syitä:
1. **Todennusongelmat**: Suorita `azd auth login`
2. **Riittämättömät oikeudet**: Tarkista Azure-roolimäärityksesi
3. **Resurssien nimeämiskonfliktit**: Vaihda AZURE_ENV_NAME
4. **Kiintiö-/kapasiteettirajoitukset**: Tarkista alueellinen saatavuus
5. **Mallivirheet**: Vahvista Bicep-mallit

### K: Kuinka virheiden julkaisua vianetsit?
**V**: 
1. Käytä `azd deploy --debug` saadaksesi yksityiskohtaisen lokin
2. Tarkista Azure-portaalin julkaisut Historia
3. Tarkista Activity Log Azure-portaalissa
4. Käytä `azd show` näyttääksesi nykyisen ympäristön tilan

### K: Miksi ympäristömuuttujani eivät toimi?
**V**: Tarkista:
1. Muuttujien nimet vastaavat täsmälleen mallin parametreja
2. Arvot on lainattu oikein, jos ne sisältävät välilyöntejä
3. Ympäristö on valittu: `azd env select <environment>`
4. Muuttujat on asetettu oikeassa ympäristössä

### K: Kuinka puhdistan epäonnistuneet julkaisut?
**V**: 
```bash
azd down --force --purge
```
Tämä poistaa kaikki resurssit ja ympäristöasetukset.

### K: Miksi sovellukseeni ei pääse julkaisun jälkeen?
**V**: Tarkista:
1. Julkaisu valmistui onnistuneesti
2. Sovellus on käynnissä (tarkista lokit Azure-portaalissa)
3. Verkkoa suojaavat ryhmät sallivat liikenteen
4. DNS/omien domainien asetukset ovat oikein

---

## Kustannukset ja laskutus

### K: Kuinka paljon azd-julkaisut maksavat?
**V**: Kustannukset riippuvat:
- Julkaistuista Azure-palveluista
- Valituista palvelutasokkaista/SKUista
- Alueellisista hintavaihteluista
- Käyttökuvioista

Käytä [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) arvioihin.

### K: Kuinka hallitsen kustannuksia azd-julkaisuissa?
**V**: 
1. Käytä alempia SKU-tasoja kehitysympäristöissä
2. Ota käyttöön Azure-budjetit ja hälytykset
3. Käytä `azd down` poistaaksesi resurssit kun niitä ei tarvita
4. Valitse sopivat alueet (hinnat vaihtelevat sijainnin mukaan)
5. Hyödynnä Azure Cost Management -työkaluja

### K: Onko azd-malleille saatavilla ilmaisia tasoja?
**V**: Monet Azure-palvelut tarjoavat ilmaisia tasoja:
- App Service: Ilmainen taso saatavilla
- Azure Functions: 1M ilmaista suoritusta/kuukausi
- Cosmos DB: Ilmainen taso, 400 RU/s
- Application Insights: Ensimmäiset 5GB/kk ilmaiseksi

Konfiguroi mallit käyttämään ilmaisia tasoja siellä missä mahdollista.

### K: Kuinka arvioin kustannuksia ennen julkaisua?
**V**: 
1. Tarkista mallin `main.bicep` nähdäksesi mitä resursseja luodaan
2. Käytä Azure Pricing Calculatoria tiettyjen SKU:jen kanssa
3. Julkaise ensin kehitysympäristöön seuratakseen todellisia kustannuksia
4. Käytä Azure Cost Managementia yksityiskohtaiseen kustannusanalyysiin

---

## Parhaat käytännöt

### K: Mitkä ovat parhaat käytännöt azd-projektin rakenteelle?
**V**: 
1. Pidä sovelluskoodi erillään infrastruktuurista
2. Käytä merkityksellisiä palvelunimiä `azure.yaml`-tiedostossa
3. Toteuta asianmukainen virheenkäsittely build-skripteihin
4. Käytä ympäristökohtaisia konfiguraatioita
5. Sisällytä kattava dokumentaatio

### K: Kuinka järjestän useita palveluita azd:ssa?
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

### K: Pitäisikö minun versionhallita `.azure`-kansiota?
**V**: **Ei!** `.azure`-kansio sisältää arkaluonteista tietoa. Lisää se `.gitignore`-tiedostoon:
```gitignore
.azure/
```

### K: Kuinka käsittelen salaisuuksia ja arkaluonteista konfiguraatiota?
**V**: 
1. Käytä Azure Key Vaultia salaisuuksille
2. Viittaa Key Vault -salaisuuksiin sovelluskonfiguraatiossa
3. Älä koskaan tallenna salaisuuksia versionhallintaan
4. Käytä hallittuja identiteettejä palveluiden väliseen todennukseen

### K: Mikä on suositeltu lähestymistapa CI/CD:lle azd:n kanssa?
**V**: 
1. Käytä erillisiä ympäristöjä kullekin vaiheelle (dev/staging/prod)
2. Toteuta automaattiset testit ennen julkaisua
3. Käytä palveluperiaatteita todennukseen
4. Säilytä arkaluonteinen konfiguraatio putkirakenteen salaisuuksissa/muuttujissa
5. Ota käyttöön hyväksyntäportit tuotantojulkaisuja varten

---

## Edistyneet aiheet

### K: Voinko laajentaa azd:ta mukautetulla toiminnallisuudella?
**V**: Kyllä, deployment-hookkien kautta `azure.yaml`-tiedostossa:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### K: Kuinka integroidun azd:hen olemassa olevissa DevOps-prosesseissa?
**V**: 
1. Käytä azd-komentoja olemassa olevissa putkiscripteissä
2. Standardisoi azd-mallien käyttö tiimien välillä
3. Integroi olemassa oleva valvonta ja hälytys
4. Käytä azd:n JSON-ulostuloa putkiston integraatiossa

### K: Voinko käyttää azd:ta Azure DevOpsin kanssa?
**V**: Kyllä, azd toimii minkä tahansa CI/CD-järjestelmän kanssa. Luo Azure DevOps -putket, jotka käyttävät azd-komentoja.

### K: Kuinka voin osallistua azd:n kehitykseen tai luoda yhteisön malleja?
1. **azd-työkalu**: Osallistu projektiin [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Templates**: Create templates following the [template guidelines](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentaatio**: Osallistu dokumentaatioon kohteessa [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### K: Mikä on azd:n tiekartta?
**V**: Katso [virallinen tiekartta](https://github.com/Azure/azure-dev/projects) suunnitelluista ominaisuuksista ja parannuksista.

### K: Miten siirryn muista käyttöönoton työkaluista azd:iin?
**V**: 
1. Analysoi nykyinen käyttöönottoarkkitehtuuri
2. Luo vastaavat Bicep-mallit
3. Määritä `azure.yaml` vastaamaan nykyisiä palveluita
4. Testaa huolellisesti kehitysympäristössä
5. Siirrä ympäristöjä asteittain

---

## Onko sinulla vielä kysymyksiä?

### **Etsi ensin**
- Tarkista [virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Etsi [GitHub issues](https://github.com/Azure/azure-dev/issues) vastaavia ongelmia

### **Hanki apua**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Yhteisötuki
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniset kysymykset
- [Azure Discord](https://discord.gg/azure) - Reaaliaikainen yhteisön keskustelu

### **Ilmoita ongelmista**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Virheraportit ja ominaisuuspyynnöt
- Liitä mukaan asiaankuuluvat lokit, virheilmoitukset ja toistettavat vaiheet

### **Lisätietoja**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tätä UKK:ta päivitetään säännöllisesti. Viimeksi päivitetty: 9. syyskuuta 2025*

---

**Navigaatio**
- **Edellinen oppitunti**: [Sanasto](glossary.md)
- **Seuraava oppitunti**: [Opas](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää virallisena lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mahdollisista väärinymmärryksistä tai virheellisistä tulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->