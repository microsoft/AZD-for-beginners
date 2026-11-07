# Usein Kysytyt Kysymykset (UKK)

**Apua luvun mukaan**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **🚆 Asennusongelmat**: [Luku 1: Asennus & Asetukset](../docs/chapter-01-foundation/installation.md)
- **🤖 AI-kysymykset**: [Luku 2: AI-Ensimmäinen Kehitys](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Vianetsintä**: [Luku 7: Vianetsintä & Virheenkorjaus](../docs/chapter-07-troubleshooting/common-issues.md)

## Johdanto

Tämä kattava UKK tarjoaa vastauksia yleisimpiin kysymyksiin Azure Developer CLI:stä (azd) ja Azure-julkaisuista. Löydä nopeita ratkaisuja yleisiin ongelmiin, ymmärrä parhaat käytännöt ja saa selvyyttä azd-käsitteisiin ja työskentelytapoihin.

## Oppimistavoitteet

Käymällä tämän UKK:n läpi sinä:
- Löydät nopeasti vastauksia yleisiin Azure Developer CLI -kysymyksiin ja ongelmiin
- Ymmärrät keskeiset käsitteet ja terminologian käytännön kysymys-vastaus -muodossa
- Pääset käsiksi vianetsintäratkaisuihin yleisissä ongelmatilanteissa ja virheskenaarioissa
- Opit parhaat käytännöt kysytyimpien optimointikysymysten kautta
- Tutustut edistyneisiin ominaisuuksiin ja kyvykkyyksiin asiantuntijatason kysymysten avulla
- Saat tehokkaan viitteen kustannus-, turvallisuus- ja julkaisustrategioista

## Oppimistulokset

Käyttämällä tätä UKK:ta säännöllisesti pystyt:
- Ratkaisemaan yleisimpiä Azure Developer CLI -ongelmia itsenäisesti annettujen ratkaisujen avulla
- Tekemään tietoon perustuvia päätöksiä julkaisutavoista ja konfiguraatioista
- Ymmärtämään azd:n ja muiden Azure-työkalujen ja -palveluiden välisen suhteen
- Soveltamaan parhaita käytäntöjä yhteisön kokemuksen ja asiantuntijoiden suositusten pohjalta
- Vianetsimään tehokkaasti todennus-, julkaisu- ja konfiguraatio-ongelmia
- Optimoimaan kustannuksia ja suorituskykyä UKK:n antamien näkemyksien ja suositusten avulla

## Sisällysluettelo

- [Aloittaminen](#getting-started)
- [Todennus & Käyttöoikeus](#authentication--access)
- [Mallipohjat & Projektit](#templates--projects)
- [Julkaisu & Infrastruktuuri](#deployment--infrastructure)
- [Konfiguraatio & Ympäristöt](#configuration--environments)
- [Vianetsintä](#troubleshooting)
- [Kustannukset & Laskutus](#cost--billing)
- [Parhaat Käytännöt](#best-practices)
- [Edistyneet Aiheet](#advanced-topics)

---

## Aloittaminen

### K: Mikä on Azure Developer CLI (azd)?
**V**: Azure Developer CLI (azd) on kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovelluksesi siirtymistä paikallisesta kehitysympäristöstä Azureen. Se tarjoaa parhaat käytännöt mallipohjien kautta ja auttaa koko julkaisuprosessissa.

### K: Miten azd eroaa Azure CLI:stä?
**V**: 
- **Azure CLI**: Monipuolinen työkalu Azure-resurssien hallintaan
- **azd**: Kehittäjäkeskeinen työkalu sovellusten julkaisutyöskentelyihin
- azd:llä on oma todennus- ja julkaisutyöskentelynsä; Azure CLI on erillinen, täydentävä työkalu
- azd sisältää mallipohjat, ympäristöjen hallinnan ja julkaisun automatisoinnin

### K: Tarvitsenko Azure CLI:n asennettuna käyttääkseni azd:tä?
**V**: Ei ydintyöskentelyyn AZD:n kanssa. Todennu `azd auth login`. Asenna Azure CLI erikseen, kun mallipohjan koukku tai harjoitus suorittaa nimenomaisesti `az` -komentoja.

### K: Mitä ohjelmointikieliä azd tukee?
**V**: azd ei ole sidottu mihinkään kieliin. Se toimii:
- Node.js/JavaScript/TypeScriptin kanssa
- Pythonin kanssa
- .NET/C# kanssa
- Javan kanssa
- Gon kanssa
- PHP:n kanssa
- Staattisten verkkosivustojen kanssa
- Säilöttyjen sovellusten kanssa

### K: Voinko käyttää azd:tä olemassa olevien projektien kanssa?
**V**: Kyllä! Voit joko:
1. Käyttää `azd init` lisätäksesi azd-konfiguraation olemassa oleviin projekteihin
2. Mukauttaa nykyisiä projekteja vastaamaan azd-mallipohjarakennetta
3. Luoda omia mallipohjia olemassa olevan arkkitehtuurisi pohjalta

---

## Todennus & Käyttöoikeus

### K: Miten todennan Azuren kanssa azd:llä?
**V**: Käytä `azd auth login`, joka avaa selaimen Azuren todennusta varten. CI/CD-tilanteissa käytä palvelutunnuksia tai hallittuja identiteettejä.

### K: Voinko käyttää azd:tä useiden Azure-tilausten kanssa?
**V**: Kyllä. Käytä `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` määrittääksesi, mitä tilausta kukin ympäristö käyttää.

### K: Mitä käyttöoikeuksia tarvitsen azd:llä julkaisuun?
**V**: Tyypillisesti tarvitset:
- **Osallistujan** rooli resurssiryhmässä tai tilauksessa
- **Käyttöoikeuksien hallinnan** rooli, jos julkaiset resursseja, jotka vaativat roolimäärityksiä
- Tarkemmat oikeudet vaihtelevat mallipohjan ja julkaistavien resurssien mukaan

### K: Voinko käyttää azd:tä CI/CD-putkissa?
**V**: Totta kai! azd on suunniteltu CI/CD-integraatiota varten. Käytä palvelutunnuksia todennukseen ja aseta ympäristömuuttujat konfiguraatiota varten.

### K: Miten käsittelen todennusta GitHub Actions -työnkuluissa?
**V**: Suosi työkuorma-identiteetin federaatiota (OIDC), joka on määritelty `azd pipeline config`. Luotu työnkulku asentaa AZD:n ja todentaa AZD:n suoraan federoidun identiteetin avulla. Pelkkä `azure/login` -askel ei luo AZD-kirjautumista. Kirjautumisen sisältävä askel olemassa olevassa työssä on:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Tee valmistelu tai julkaisu kirjautumisen jälkeen, käyttäen tarkoitettua AZD-ympäristöä, tilausta ja sijaintia. Identiteetin federointi-sertifikaatin on luotettava työnkulun arkistoa/viitettä tai GitHub-ympäristöä, ja sen Azure-roolien on sallittava pyydetyt toiminnot.

---

## Mallipohjat & Projektit

### K: Mistä löydän azd-mallipohjia?
**V**: 
- Viralliset ja yhteisön mallipohjat: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Yhteisön mallipohjat: GitHub-haulla "azd-template"
- Selaa saatavilla olevia mallipohjia käyttämällä `azd template list`

### K: Miten teen oman mallipohjan?
**V**: 
1. Aloita olemassa olevasta mallipohjarakenteesta
2. Muokkaa `azure.yaml`-, infrastruktuuri- ja sovelluskooditiedostoja
3. Testaa huolellisesti `azd up` avulla
4. Julkaise GitHubissa asianmukaisilla tageilla

### K: Voinko käyttää azd:tä ilman mallipohjaa?
**V**: Kyllä, käytä `azd init` olemassa olevassa projektissa luodaksesi tarvittavat konfiguraatiotiedostot. Sinun täytyy manuaalisesti konfiguroida `azure.yaml` ja infrastruktuuritiedostot.

### K: Mikä on ero virallisten ja yhteisön mallipohjien välillä?
**V**: 
- **Viralliset mallipohjat**: Microsoftin ylläpitämiä, säännöllisesti päivitettyjä, kattava dokumentaatio
- **Yhteisön mallipohjat**: Kehittäjien luomia, voivat olla erikoistuneita käyttötapauksia, laatu ja ylläpito vaihtelee

### K: Miten päivitän mallipohjan projektissani?
**V**: Mallipohjat eivät päivity automaattisesti. Voit:
1. Verrata ja yhdistää muutokset lähdemallipohjaan manuaalisesti
2. Aloittaa alusta `azd init` käyttäen päivitettyä mallipohjaa
3. Poimia valikoidusti parannuksia päivitetystä mallipohjasta

---

## Julkaisu & Infrastruktuuri

### K: Mitä Azure-palveluita azd voi julkaista?
**V**: azd voi julkaista mitä tahansa Azure-palvelua Bicep/ARM-mallien kautta, mukaan lukien:
- Sovelluspalvelut, Säilösovellukset, Toiminnot
- Tietokannat (SQL, PostgreSQL, Cosmos DB)
- Tallennus, Key Vault, Sovelluksen tiedonkeruu
- Verkkoratkaisut, turvallisuus ja valvontaresurssit

### K: Voinko julkaista useisiin alueisiin?
**V**: Kyllä, konfiguroi useita alueita Bicep-malleissasi ja aseta sijaintiparametri oikein kullekin ympäristölle.

### K: Miten käsittelen tietokannan skeeman migraatiot?
**V**: Käytä julkaisukoukkuja `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### K: Voinko julkaista pelkän infrastruktuurin ilman sovelluksia?
**V**: Kyllä, käytä `azd provision` julkaistaksesi vain mallipohjassa määritellyt infrastruktuurikomponentit.

### K: Miten julkaisen olemassa oleville Azure-resursseille?
**V**: Kyllä, kun mallipohja tukee sitä. Viittaa olemassa oleviin resursseihin käyttäen Bicep:n `existing` -määrittelyjä tai mallipohjan dokumentoituja olemassa olevan resurssin parametreja ja kartoita sovelluspalvelut niiden tarkoitettuihin kohteisiin. Tämä ei tuo omistajuutta eikä automaattisesti luo puuttuvia käyttöoikeuksia. Tarkista mallipohja ennen julkaisua.

### K: Voinko käyttää Terraformia Bicep:n sijaan?
**A**: Kyllä. AZD tukee Terraformia sekä Bicepiä. Valitse Terraform-pohjainen malli tai konfiguroi `infra.provider: terraform` tiedostossa `azure.yaml` sopivilla Terraform-tiedostoilla ja tila/backend-asetuksilla. Katso [Terraform-työnkulku](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguraatio & Ympäristöt

### K: Miten hallitsen eri ympäristöjä (dev, staging, prod)?
**A**: Luo erilliset ympäristöt `azd env new <environment-name>` avulla ja määritä jokaiselle eri asetukset:
```bash
azd env new development
azd env new staging  
azd env new production
```

### K: Missä ympäristökonfiguraatiot sijaitsevat?
**A**: Projektihakemiston `.azure` kansiossa. Jokaisella ympäristöllä on oma kansionsa konfiguraatiotiedostoineen.

### K: Miten määritän ympäristökohtaisen konfiguraation?
**A**: Käytä `azd env set` ympäristömuuttujien määrittämiseen:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### K: Voinko jakaa ympäristökonfiguraatioita tiimin jäsenten kesken?
**A**: `.azure` kansio sisältää arkaluontoista tietoa eikä sitä tule sitoa versionhallintaan. Sen sijaan:
1. Dokumentoi vaaditut ympäristömuuttujat
2. Käytä käyttöönotto-skriptejä ympäristöjen perustamiseen
3. Käytä Azure Key Vaultia arkaluontoisten konfiguraatioiden hallintaan

### K: Miten ylikirjoitan mallin oletusasetukset?
**A**: Aseta mallin parametreihin vastaavat ympäristömuuttujat:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Vain malli käyttää muuttujat vaikuttavat käyttöönottoon. Edellä `SKU_NAME` on esimerkki mukautetusta syötteestä, ei universaali AZD-asetus.

---

## Vianmääritys

### K: Miksi `azd up` epäonnistuu?
**A**: Yleisiä syitä:
1. **Todennusongelmat**: Suorita `azd auth login`
2. **Riittämättömät käyttöoikeudet**: Tarkista Azure-roolisi
3. **Resurssien nimiristiriidat**: Tarkista ristiriitainen resurssi ja mallin nimeämissyötteet; luo tarvittaessa erillinen ympäristö `azd env new` avulla
4. **Kiintiö-/kapasiteettiongelmat**: Tarkista alueellinen saatavuus
5. **Mallivirheet**: Vahvista Bicep-mallit

### K: Miten debuggaan käyttöönotto-epäonnistumiset?
**A**: 
1. Käytä `azd deploy --debug` tarkka-ajoa varten
2. Tarkista Azuren portaalin käyttöönottohistoria
3. Tarkastele Aktiviteettilokia Azure-portaalissa
4. Käytä `azd show` nykyisen ympäristötilan näyttämiseen

### K: Miksi ympäristömuuttujat eivät toimi?
**A**: Tarkista:
1. Muuttujien nimet vastaavat täsmälleen mallin parametreja
2. Arvot on oikein lainausmerkitty jos ne sisältävät välilyöntejä
3. Oikea ympäristö on valittu: `azd env select <environment>`
4. Muuttujat on asetettu oikeaan ympäristöön

### K: Miten puhdistan epäonnistuneet käyttöönotot?
**A**: 
```bash
azd down
```
 Tarkista valittu ympäristö ja poiston vahvistus ensin. Tämä poistaa provisionoidut Azure-resurssit, ei paikallista `.azure` ympäristökonfiguraatiota. `--purge` pyytää lisäksi pysyvää poistoa tuetuista pehmeästi poistetusta resursseista ja sen suoritus voi estyä säilytys- tai poistoturvan takia; se ei ole tavallinen palautustoimenpide.

### K: Miksi sovellukseni ei ole saavutettavissa käyttöönoton jälkeen?
**A**: Tarkista:
1. Käyttöönotto on suoritettu onnistuneesti
2. Sovellus on käynnissä (tarkista lokit Azure-portaalista)
3. Verkon suojausryhmät sallivat liikenteen
4. DNS-/omien domainien asetukset ovat oikein

---

## Kustannukset & Laskutus

### K: Kuinka paljon azd-käyttöönotot maksavat?
**A**: Kustannukset riippuvat:
- Käytetyistä Azure-palveluista
- Valituista palvelutasoista/SKUista
- Alueellisista hinnoittelueroista
- Käyttömalleista

Käytä arvioihin [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) -työkalua.

### K: Miten hallitsen kustannuksia azd-käyttöönotossa?
**A**: 
1. Käytä alemman tason SKUja kehitysympäristöissä
2. Aseta Azure-budjetit ja hälytykset
3. Käytä `azd down` poistaaksesi resurssit tarpeen mukaan
4. Valitse sopivat alueet (hinnat vaihtelevat sijainnin mukaan)
5. Käytä Azure Cost Management -työkaluja

### K: Onko azd-malleille tarjolla ilmaisia tasoja?
**A**: Joillakin palveluilla on ilmaisia SKUja tai kuukausittaisia myönnytyksiä, jotka riippuvat kelpoisuudesta, hosting-suunnitelmasta, alueesta ja tilausrajoista. Nämä eivät tee koko mallista ilmaista: tietokannat, haku, verkko, rekisteri, telemetria ja mallin päättely voivat aiheuttaa kustannuksia erikseen. Tarkista [Azure ilmaiset palvelut](https://azure.microsoft.com/free/) ja nykyiset hinnat kaikille resursseille ennen käyttöönottoa.

### K: Miten arvioin kustannuksia ennen käyttöönottoa?
**A**: 
1. Tarkista mallin `main.bicep` nähdäksesi luotavat resurssit
2. Käytä Azure Pricing Calculatoria tiettyjen SKUjen kanssa
3. Ota käyttöön ensin kehitysympäristössä seurataksesi todellisia kustannuksia
4. Käytä Azure Cost Managementia yksityiskohtaiseen kustannusanalyysiin

---

## Parhaat käytännöt

### K: Mitkä ovat parhaat käytännöt azd-projektin rakenteelle?
**A**: 
1. Pidä sovelluskoodi erillään infrastruktuurista
2. Käytä merkityksellisiä palvelunimiä `azure.yaml` -tiedostoissa
3. Toteuta asianmukainen virheenkäsittely build-skripteissä
4. Käytä ympäristökohtaisia konfiguraatioita
5. Sisällytä kattava dokumentaatio

### K: Miten järjestän useita palveluita azd:ssä?
**A**: Käytä suositeltua rakennetta:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### K: Pitäisikö minun sitoa `.azure` kansio versionhallintaan?
**A**: **Ei!** Kansiosta `.azure` löytyy arkaluonteista tietoa. Lisää se tiedostoon `.gitignore`:
```gitignore
.azure/
```

### K: Kuinka käsittelen salaisuuksia ja arkaluontoisia asetuksia?
**V**: 
1. Käytä Azure Key Vaultia salaisuuksien hallintaan
2. Viittaa Key Vaultin salaisuuksiin sovelluksen asetuksissa
3. Älä koskaan tallenna salaisuuksia versionhallintaan
4. Käytä hallittuja tunnuksia palveluiden väliseen tunnistautumiseen

### K: Mikä on suositeltu tapa CI/CD:n kanssa azd:llä?
**V**: 
1. Käytä erillisiä ympäristöjä kuhunkin vaiheeseen (kehitys/välivaihe/tuotanto)
2. Toteuta automaattiset testit ennen käyttöönottoa
3. Käytä palveluperheen tunnuksia tunnistautumiseen
4. Tallenna arkaluontoiset asetukset putkien salaisuuksiin/muuttujiin
5. Toteuta hyväksymisportit tuotantokäyttöönotolle

---

## Edistyneet aiheet

### K: Voinko laajentaa azd:tä mukautetulla toiminnallisuudella?
**V**: Kyllä, käyttämällä käyttöönoton koukkuja `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### K: Kuinka integroin azd:n olemassa oleviin DevOps-prosesseihin?
**V**: 
1. Käytä azd-komentoja olemassa olevissa putkiskripteissä
2. Standardisoi azd-mallit tiimien kesken
3. Integroi olemassa olevaan valvontaan ja hälytyksiin
4. Käytä azd:n JSON-tulostetta putkien integraatioon

### K: Voinko käyttää azd:tä Azure DevOpsin kanssa?
**V**: Kyllä, azd toimii minkä tahansa CI/CD-järjestelmän kanssa. Luo Azure DevOps -putkia, jotka käyttävät azd-komentoja.

### K: Kuinka voin osallistua azd:n kehitykseen tai luoda yhteisömalleja?
**V**: 
1. **azd-työkalu**: Osallistu [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mallit**: Seuraa [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentaatio**: Osallistu dokumentaatioon [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### K: Mikä on azd:n tiekartta?
**V**: Katso [virallinen tiekartta](https://github.com/Azure/azure-dev/projects) suunnitelluista ominaisuuksista ja parannuksista.

### K: Kuinka siirryn muista käyttöönoton työkaluista azd:hen?
**V**: 
1. Analysoi nykyinen käyttöönoton arkkitehtuuri
2. Luo vastaavat Bicep-mallit
3. Konfiguroi `azure.yaml` vastaamaan nykyisiä palveluita
4. Testaa perusteellisesti kehitysympäristössä
5. Siirrä ympäristöt asteittain

---

## Onko sinulla vielä kysyttävää?

### **Etsi ensin**
- Tarkista [virallinen dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Etsi [GitHub-ongelmista](https://github.com/Azure/azure-dev/issues) samanlaisia ongelmia

### **Hanki apua**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Yhteisön tuki
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Teknisiä kysymyksiä
- [Azure Discord](https://discord.gg/azure) - Reaaliaikainen keskustelu yhteisön kanssa

### **Ilmoita ongelmista**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Virheraportit ja ominaisuuspyynnöt
- Sisällytä oleelliset lokit, virheilmoitukset ja toistovaiheet

### **Opiskele lisää**
- [Azure Developer CLI dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Tekninen ohjeistus tarkistettu: 4. marraskuuta 2026. Pilvipalveluiden saatavuus ja hinnoittelu tulee tarkistaa tilauksesi ja alueesi mukaan.*

---

**Navigointi**
- **Edellinen oppitunti**: [Sanasto](glossary.md)
- **Seuraava oppitunti**: [Opas](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->