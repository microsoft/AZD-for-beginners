<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "ee6549c72fe4271931326578e2379243",
  "translation_date": "2025-09-18T06:42:03+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "fi"
}
-->
# Opas opiskeluun - Kattavat oppimistavoitteet

**Oppimispolun navigointi**
- **📚 Kurssin kotisivu**: [AZD For Beginners](../README.md)
- **📖 Aloita oppiminen**: [Luku 1: Perusteet ja pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: [Kurssin suorittaminen](../README.md#-course-completion--certification)

## Johdanto

Tämä kattava opas tarjoaa jäsennellyt oppimistavoitteet, keskeiset käsitteet, harjoitustehtävät ja arviointimateriaalit, jotka auttavat sinua hallitsemaan Azure Developer CLI:n (azd). Käytä tätä opasta edistymisesi seuraamiseen ja varmista, että olet käynyt läpi kaikki olennaiset aiheet.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan kaikki Azure Developer CLI:n perus- ja edistyneet käsitteet
- Kehittämään käytännön taitoja Azure-sovellusten käyttöönotossa ja hallinnassa
- Rakentamaan varmuutta vianetsinnässä ja käyttöönoton optimoinnissa
- Ymmärtämään tuotantovalmiiden käyttöönottojen käytäntöjä ja turvallisuusnäkökohtia

## Oppimistulokset

Kun olet suorittanut kaikki tämän oppaan osiot, pystyt:
- Suunnittelemaan, ottamaan käyttöön ja hallitsemaan kokonaisia sovellusarkkitehtuureja azd:n avulla
- Toteuttamaan kattavia valvonta-, turvallisuus- ja kustannusoptimointistrategioita
- Ratkaisemaan itsenäisesti monimutkaisia käyttöönotto-ongelmia
- Luomaan mukautettuja malleja ja osallistumaan azd-yhteisöön

## 8-luvun oppimisrakenne

### Luku 1: Perusteet ja pika-aloitus (Viikko 1)
**Kesto**: 30-45 minuuttia | **Vaikeustaso**: ⭐

#### Oppimistavoitteet
- Ymmärrä Azure Developer CLI:n keskeiset käsitteet ja terminologia
- Asenna ja konfiguroi AZD onnistuneesti kehitysalustallesi
- Ota ensimmäinen sovellus käyttöön olemassa olevan mallin avulla
- Navigoi AZD:n komentorajapinnassa tehokkaasti

#### Keskeiset käsitteet
- AZD-projektin rakenne ja komponentit (azure.yaml, infra/, src/)
- Mallipohjaiset käyttöönoton työnkulut
- Ympäristön konfiguroinnin perusteet
- Resurssiryhmän ja tilauksen hallinta

#### Käytännön harjoitukset
1. **Asennuksen tarkistus**: Asenna AZD ja tarkista `azd version` -komennolla
2. **Ensimmäinen käyttöönotto**: Ota todo-nodejs-mongo-malli käyttöön onnistuneesti
3. **Ympäristön asennus**: Konfiguroi ensimmäiset ympäristömuuttujasi
4. **Resurssien tutkiminen**: Navigoi käyttöön otettuja resursseja Azure-portaalissa

#### Arviointikysymykset
- Mitkä ovat AZD-projektin keskeiset komponentit?
- Kuinka alustat uuden projektin mallista?
- Mikä ero on `azd up`- ja `azd deploy`-komentojen välillä?
- Kuinka hallitset useita ympäristöjä AZD:n avulla?

---

### Luku 2: AI-ensimmäinen kehitys (Viikko 2)
**Kesto**: 1-2 tuntia | **Vaikeustaso**: ⭐⭐

#### Oppimistavoitteet
- Integroi Azure AI Foundry -palvelut AZD:n työnkulkuihin
- Ota käyttöön ja konfiguroi tekoälypohjaisia sovelluksia
- Ymmärrä RAG (Retrieval-Augmented Generation) -toteutusmallit
- Hallitse tekoälymallien käyttöönottoa ja skaalausta

#### Keskeiset käsitteet
- Azure OpenAI -palvelun integrointi ja API-hallinta
- AI-hakukonfigurointi ja vektorihakemisto
- Mallien käyttöönoton strategiat ja kapasiteettisuunnittelu
- Tekoälysovellusten valvonta ja suorituskyvyn optimointi

#### Käytännön harjoitukset
1. **AI-chatin käyttöönotto**: Ota azure-search-openai-demo-malli käyttöön
2. **RAG-toteutus**: Konfiguroi dokumenttien indeksointi ja haku
3. **Mallien konfigurointi**: Aseta useita tekoälymalleja eri tarkoituksiin
4. **AI-valvonta**: Toteuta Application Insights tekoälytyökuormille

#### Arviointikysymykset
- Kuinka konfiguroit Azure OpenAI -palvelut AZD-mallissa?
- Mitkä ovat RAG-arkkitehtuurin keskeiset komponentit?
- Kuinka hallitset tekoälymallien kapasiteettia ja skaalausta?
- Mitkä valvontamittarit ovat tärkeitä tekoälysovelluksille?

---

### Luku 3: Konfigurointi ja autentikointi (Viikko 3)
**Kesto**: 45-60 minuuttia | **Vaikeustaso**: ⭐⭐

#### Oppimistavoitteet
- Hallitse ympäristön konfigurointi- ja hallintastrategiat
- Toteuta turvalliset autentikointimallit ja hallittu identiteetti
- Järjestä resurssit asianmukaisilla nimeämiskäytännöillä
- Konfiguroi monen ympäristön käyttöönotot (kehitys, testaus, tuotanto)

#### Keskeiset käsitteet
- Ympäristöhierarkia ja konfiguroinnin etusijajärjestys
- Hallittu identiteetti ja palveluperiaatteiden autentikointi
- Key Vault -integraatio salaisuuksien hallintaan
- Ympäristökohtainen parametrien hallinta

#### Käytännön harjoitukset
1. **Monen ympäristön asennus**: Konfiguroi kehitys-, testaus- ja tuotantoympäristöt
2. **Turvallisuuskonfigurointi**: Toteuta hallittu identiteettiautentikointi
3. **Salaisuuksien hallinta**: Integroi Azure Key Vault arkaluontoisten tietojen hallintaan
4. **Parametrien hallinta**: Luo ympäristökohtaiset konfiguraatiot

#### Arviointikysymykset
- Kuinka konfiguroit eri ympäristöt AZD:ssä?
- Mitkä ovat hallitun identiteetin edut verrattuna palveluperiaatteisiin?
- Kuinka hallitset sovelluksen salaisuuksia turvallisesti?
- Mikä on AZD:n konfigurointihierarkia?

---

### Luku 4: Infrastruktuuri koodina ja käyttöönotto (Viikko 4-5)
**Kesto**: 1-1,5 tuntia | **Vaikeustaso**: ⭐⭐⭐

#### Oppimistavoitteet
- Luo ja mukauta Bicep-infrastruktuurimalleja
- Toteuta edistyneitä käyttöönoton malleja ja työnkulkuja
- Ymmärrä resurssien provisiointistrategiat
- Suunnittele skaalautuvia monipalveluarkkitehtuureja

#### Keskeiset käsitteet
- Bicep-mallin rakenne ja parhaat käytännöt
- Resurssiriippuvuudet ja käyttöönoton järjestys
- Parametritiedostot ja mallien modulaarisuus
- Mukautetut koukut ja käyttöönoton automaatio

#### Käytännön harjoitukset
1. **Mukautetun mallin luominen**: Rakenna monipalvelusovelluksen malli
2. **Bicep-osaaminen**: Luo modulaarisia, uudelleenkäytettäviä infrastruktuurikomponentteja
3. **Käyttöönoton automaatio**: Toteuta ennen/jälkeen käyttöönoton koukut
4. **Arkkitehtuurin suunnittelu**: Ota käyttöön monimutkainen mikropalveluarkkitehtuuri

#### Arviointikysymykset
- Kuinka luot mukautettuja Bicep-malleja AZD:lle?
- Mitkä ovat parhaat käytännöt infrastruktuurikoodin järjestämiseen?
- Kuinka käsittelet resurssiriippuvuuksia malleissa?
- Mitkä käyttöönoton mallit tukevat käyttökatkottomia päivityksiä?

---

### Luku 5: Moniagenttiset tekoälyratkaisut (Viikko 6-7)
**Kesto**: 2-3 tuntia | **Vaikeustaso**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Suunnittele ja toteuta moniagenttisia tekoälyarkkitehtuureja
- Orkestroi agenttien koordinointi ja viestintä
- Ota käyttöön tuotantovalmiita tekoälyratkaisuja valvonnalla
- Ymmärrä agenttien erikoistuminen ja työnkulun mallit

#### Keskeiset käsitteet
- Moniagenttiset arkkitehtuurimallit ja suunnitteluperiaatteet
- Agenttien viestintäprotokollat ja datavirta
- Kuormituksen tasapainotus ja skaalausstrategiat tekoälyagenteille
- Tuotantovalvonta moniagenttisille järjestelmille

#### Käytännön harjoitukset
1. **Vähittäiskaupan ratkaisun käyttöönotto**: Ota käyttöön täydellinen moniagenttinen vähittäiskaupan skenaario
2. **Agenttien mukauttaminen**: Muokkaa asiakas- ja varastoagenttien käyttäytymistä
3. **Arkkitehtuurin skaalaus**: Toteuta kuormituksen tasapainotus ja automaattinen skaalaus
4. **Tuotantovalvonta**: Aseta kattava valvonta ja hälytykset

#### Arviointikysymykset
- Kuinka suunnittelet tehokkaita moniagenttisia viestintämalleja?
- Mitkä ovat keskeiset näkökohdat tekoälyagenttien kuormituksen skaalaamisessa?
- Kuinka valvot ja debuggaat moniagenttisia tekoälyjärjestelmiä?
- Mitkä tuotantokäytännöt varmistavat tekoälyagenttien luotettavuuden?

---

### Luku 6: Ennakkoon tehtävä validointi ja suunnittelu (Viikko 8)
**Kesto**: 1 tunti | **Vaikeustaso**: ⭐⭐

#### Oppimistavoitteet
- Suorita kattava kapasiteettisuunnittelu ja resurssien validointi
- Valitse optimaaliset Azure SKU:t kustannustehokkuuden saavuttamiseksi
- Toteuta automatisoidut ennakkotarkistukset ja validointi
- Suunnittele käyttöönotot kustannusoptimointistrategioilla

#### Keskeiset käsitteet
- Azure-resurssien kiintiöt ja kapasiteettirajoitukset
- SKU-valintakriteerit ja kustannusoptimointi
- Automatisoidut validointiskriptit ja testaus
- Käyttöönoton suunnittelu ja riskien arviointi

#### Käytännön harjoitukset
1. **Kapasiteettianalyysi**: Analysoi sovellustesi resurssivaatimukset
2. **SKU-optimointi**: Vertaa ja valitse kustannustehokkaat palvelutasot
3. **Validoinnin automaatio**: Toteuta ennakkotarkistusskriptit
4. **Kustannussuunnittelu**: Luo käyttöönoton kustannusarviot ja budjetit

#### Arviointikysymykset
- Kuinka validoit Azure-kapasiteetin ennen käyttöönottoa?
- Mitkä tekijät vaikuttavat SKU-valintapäätöksiin?
- Kuinka automatisoit ennakkotarkistuksen validoinnin?
- Mitkä strategiat auttavat optimoimaan käyttöönoton kustannuksia?
2. Kuinka validoit Azure-resurssien saatavuuden ennen käyttöönottoa?  
3. Mitkä ovat ennakkotarkistusjärjestelmän keskeiset komponentit?  
4. Kuinka arvioit ja hallitset käyttöönoton kustannuksia?  
5. Mitä seurantaa tarvitaan kapasiteettisuunnitteluun?

### Moduuli 5: Vianetsintä ja virheenkorjaus (Viikko 6)

#### Oppimistavoitteet  
- Hallitse järjestelmälliset vianetsintämenetelmät  
- Kehitä asiantuntemusta monimutkaisten käyttöönotto-ongelmien virheenkorjauksessa  
- Toteuta kattava seuranta ja hälytysjärjestelmät  
- Rakenna toimintavarmuus- ja palautusmenettelyt  

#### Keskeiset käsitteet  
- Yleiset käyttöönoton epäonnistumismallit  
- Lokianalyysi ja korrelaatiotekniikat  
- Suorituskyvyn seuranta ja optimointi  
- Tietoturvapoikkeamien havaitseminen ja reagointi  
- Katastrofien hallinta ja liiketoiminnan jatkuvuus  

#### Harjoitustehtävät  

**Harjoitus 5.1: Vianetsintätilanteet**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```  

**Harjoitus 5.2: Seurannan toteutus**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```  

**Harjoitus 5.3: Poikkeamiin reagointi**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```  

#### Itsearviointikysymykset  
1. Mikä on järjestelmällinen lähestymistapa azd-käyttöönottojen vianetsintään?  
2. Kuinka korreloit lokit useiden palveluiden ja resurssien välillä?  
3. Mitkä seurantamittarit ovat kriittisimpiä ongelmien varhaisessa havaitsemisessa?  
4. Kuinka toteutat tehokkaat katastrofien hallintamenettelyt?  
5. Mitkä ovat poikkeamiin reagointisuunnitelman keskeiset osat?  

### Moduuli 6: Edistyneet aiheet ja parhaat käytännöt (Viikot 7-8)

#### Oppimistavoitteet  
- Toteuta yritystason käyttöönoton mallit  
- Hallitse CI/CD-integraatio ja automaatio  
- Kehitä mukautettuja malleja ja osallistu yhteisöön  
- Ymmärrä edistyneet tietoturva- ja vaatimustenmukaisuusvaatimukset  

#### Keskeiset käsitteet  
- CI/CD-putkiston integraatiomallit  
- Mukautettujen mallien kehitys ja jakelu  
- Yrityksen hallintotavat ja vaatimustenmukaisuus  
- Edistyneet verkko- ja tietoturvakonfiguraatiot  
- Suorituskyvyn optimointi ja kustannusten hallinta  

#### Harjoitustehtävät  

**Harjoitus 6.1: CI/CD-integraatio**  
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```  

**Harjoitus 6.2: Mukautettujen mallien kehitys**  
```bash
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```  

**Harjoitus 6.3: Yritystason toteutus**  
```bash
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```  

#### Itsearviointikysymykset  
1. Kuinka integroit azd:n olemassa oleviin CI/CD-työnkulkuihin?  
2. Mitkä ovat mukautettujen mallien kehityksen keskeiset näkökohdat?  
3. Kuinka toteutat hallintoa ja vaatimustenmukaisuutta azd-käyttöönotossa?  
4. Mitkä ovat parhaat käytännöt yritystason käyttöönottoihin?  
5. Kuinka osallistut tehokkaasti azd-yhteisöön?  

## Käytännön projektit  

### Projekti 1: Henkilökohtainen portfolio-sivusto  
**Vaikeustaso**: Aloittelija  
**Kesto**: 1-2 viikkoa  

Rakenna ja ota käyttöön henkilökohtainen portfolio-sivusto käyttäen:  
- Staattinen verkkosivuston isännöinti Azure Storage -palvelussa  
- Mukautetun verkkotunnuksen konfigurointi  
- CDN-integraatio globaalin suorituskyvyn parantamiseksi  
- Automaattinen käyttöönoton putkisto  

**Toimitukset**:  
- Toimiva verkkosivusto, joka on otettu käyttöön Azureen  
- Mukautettu azd-malli portfolio-käyttöönottoihin  
- Käyttöönoton prosessin dokumentaatio  
- Kustannusanalyysi ja optimointisuositukset  

### Projekti 2: Tehtävienhallintasovellus  
**Vaikeustaso**: Keskitaso  
**Kesto**: 2-3 viikkoa  

Luo täysimittainen tehtävienhallintasovellus, jossa on:  
- React-frontend, joka on otettu käyttöön App Service -palvelussa  
- Node.js-API-taustajärjestelmä, jossa on autentikointi  
- PostgreSQL-tietokanta ja migraatiot  
- Application Insights -seuranta  

**Toimitukset**:  
- Täydellinen sovellus käyttäjäautentikoinnilla  
- Tietokannan skeema ja migraatiokäsikirjoitukset  
- Seurannan hallintapaneelit ja hälytyssäännöt  
- Moniympäristöinen käyttöönoton konfiguraatio  

### Projekti 3: Mikroservices-pohjainen verkkokauppa-alusta  
**Vaikeustaso**: Edistynyt  
**Kesto**: 4-6 viikkoa  

Suunnittele ja toteuta mikroservices-pohjainen verkkokauppa-alusta:  
- Useita API-palveluita (katalogi, tilaukset, maksut, käyttäjät)  
- Viestijonointegraatio Service Busin avulla  
- Redis-välimuisti suorituskyvyn optimointiin  
- Kattava lokitus ja seuranta  

**Toimitukset**:  
- Täydellinen mikroservices-arkkitehtuuri  
- Palveluiden välinen viestintämalli  
- Suorituskyvyn testaus ja optimointi  
- Tuotantovalmiit tietoturvakonfiguraatiot  

## Arviointi ja sertifiointi  

### Tietotarkistukset  

Suorita nämä arvioinnit jokaisen moduulin jälkeen:  

**Moduuli 1 Arviointi**: Peruskäsitteet ja asennus  
- Monivalintakysymyksiä ydinkäsitteistä  
- Käytännön asennus- ja konfigurointitehtäviä  
- Yksinkertainen käyttöönottoharjoitus  

**Moduuli 2 Arviointi**: Konfiguraatio ja ympäristöt  
- Ympäristönhallintaskenaarioita  
- Konfiguraation vianetsintätehtäviä  
- Tietoturvakonfiguraation toteutus  

**Moduuli 3 Arviointi**: Käyttöönotto ja provisiointi  
- Infrastruktuurin suunnittelutehtäviä  
- Monipalveluiden käyttöönoton skenaarioita  
- Suorituskyvyn optimointiharjoituksia  

**Moduuli 4 Arviointi**: Ennakkovarmistus  
- Kapasiteettisuunnittelun tapaustutkimuksia  
- Kustannusoptimointiskenaarioita  
- Varmistusputkiston toteutus  

**Moduuli 5 Arviointi**: Vianetsintä ja virheenkorjaus  
- Ongelman diagnosointiharjoituksia  
- Seurannan toteutustehtäviä  
- Poikkeamiin reagoinnin simulointeja  

**Moduuli 6 Arviointi**: Edistyneet aiheet  
- CI/CD-putkiston suunnittelu  
- Mukautettujen mallien kehitys  
- Yritysarkkitehtuurin skenaarioita  

### Lopullinen päätösprojekti  

Suunnittele ja toteuta kokonaisratkaisu, joka osoittaa kaikkien käsitteiden hallinnan:  

**Vaatimukset**:  
- Monitasoinen sovellusarkkitehtuuri  
- Useita käyttöönottoympäristöjä  
- Kattava seuranta ja hälytysjärjestelmä  
- Tietoturva- ja vaatimustenmukaisuustoteutus  
- Kustannusoptimointi ja suorituskyvyn viritys  
- Täydellinen dokumentaatio ja käyttöohjeet  

**Arviointikriteerit**:  
- Teknisen toteutuksen laatu  
- Dokumentaation kattavuus  
- Tietoturvan ja parhaiden käytäntöjen noudattaminen  
- Suorituskyvyn ja kustannusten optimointi  
- Vianetsinnän ja seurannan tehokkuus  

## Opiskeluresurssit ja viitteet  

### Virallinen dokumentaatio  
- [Azure Developer CLI Dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)  

### Yhteisöresurssit  
- [AZD Malligalleria](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisaatio](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Harjoitteluympäristöt  
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Lisätyökalut  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Opiskeluaikataulusuositukset  

### Kokopäiväinen opiskelu (8 viikkoa)  
- **Viikot 1-2**: Moduulit 1-2 (Aloittaminen, Konfiguraatio)  
- **Viikot 3-4**: Moduulit 3-4 (Käyttöönotto, Ennakkovarmistus)  
- **Viikot 5-6**: Moduulit 5-6 (Vianetsintä, Edistyneet aiheet)  
- **Viikot 7-8**: Käytännön projektit ja lopullinen arviointi  

### Osa-aikainen opiskelu (16 viikkoa)  
- **Viikot 1-4**: Moduuli 1 (Aloittaminen)  
- **Viikot 5-7**: Moduuli 2 (Konfiguraatio ja ympäristöt)  
- **Viikot 8-10**: Moduuli 3 (Käyttöönotto ja provisiointi)  
- **Viikot 11-12**: Moduuli 4 (Ennakkovarmistus)  
- **Viikot 13-14**: Moduuli 5 (Vianetsintä ja virheenkorjaus)  
- **Viikot 15-16**: Moduuli 6 (Edistyneet aiheet ja arviointi)  

---

## Edistymisen seuranta ja arviointikehys  

### Luvun suorittamisen tarkistuslista  

Seuraa edistymistäsi jokaisen luvun läpi näillä mitattavilla tuloksilla:  

#### 📚 Luku 1: Perusta ja nopea aloitus  
- [ ] **Asennus valmis**: AZD asennettu ja testattu alustallasi  
- [ ] **Ensimmäinen käyttöönotto**: Onnistuneesti otettu käyttöön todo-nodejs-mongo-malli  
- [ ] **Ympäristön asennus**: Ensimmäiset ympäristömuuttujat konfiguroitu  
- [ ] **Resurssien navigointi**: Tutkittu käyttöön otettuja resursseja Azure-portaalissa  
- [ ] **Komentojen hallinta**: Perus AZD-komennot hallussa  

#### 🤖 Luku 2: AI-ensimmäinen kehitys  
- [ ] **AI-mallin käyttöönotto**: Onnistuneesti otettu käyttöön azure-search-openai-demo  
- [ ] **RAG-toteutus**: Konfiguroitu dokumenttien indeksointi ja haku  
- [ ] **Mallin konfiguraatio**: Asetettu useita AI-malleja eri tarkoituksiin  
- [ ] **AI-seuranta**: Toteutettu Application Insights AI-työkuormille  
- [ ] **Suorituskyvyn optimointi**: Viritetty AI-sovelluksen suorituskyky  

#### ⚙️ Luku 3: Konfiguraatio ja autentikointi  
- [ ] **Moniympäristöinen asennus**: Konfiguroitu dev-, staging- ja prod-ympäristöt  
- [ ] **Tietoturvan toteutus**: Asetettu hallittu identiteettiautentikointi  
- [ ] **Salaisuuksien hallinta**: Integroitu Azure Key Vault arkaluontoisille tiedoille  
- [ ] **Parametrien hallinta**: Luotu ympäristökohtaiset konfiguraatiot  
- [ ] **Autentikoinnin hallinta**: Toteutettu turvalliset pääsykuviot  

#### 🏗️ Luku 4: Infrastruktuuri koodina ja käyttöönotto  
- [ ] **Mukautetun mallin luominen**: Rakennettu monipalvelusovelluksen malli  
- [ ] **Bicep-hallinta**: Luotu modulaarisia, uudelleenkäytettäviä infrastruktuurikomponentteja  
- [ ] **Käyttöönoton automaatio**: Toteutettu ennen/jälkeen käyttöönoton koukut  
- [ ] **Arkkitehtuurin suunnittelu**: Otettu käyttöön monimutkainen mikroservices-arkkitehtuuri  
- [ ] **Mallin optimointi**: Optimoitu mallit suorituskyvyn ja kustannusten kannalta  

#### 🎯 Luku 5: Moniagenttiset AI-ratkaisut  
- [ ] **Vähittäiskaupan ratkaisun käyttöönotto**: Otettu käyttöön täydellinen moniagenttinen vähittäiskauppaskenaario  
- [ ] **Agenttien mukauttaminen**: Muokattu asiakas- ja varastoagenttien käyttäytymistä  
- [ ] **Arkkitehtuurin skaalaus**: Toteutettu kuormituksen tasapainotus ja automaattinen skaalaus  
- [ ] **Tuotannon seuranta**: Asetettu kattava seuranta ja hälytysjärjestelmä  
- [ ] **Suorituskyvyn viritys**: Optimoitu moniagenttisen järjestelmän suorituskyky  

#### 🔍 Luku 6: Ennakkovarmistus ja suunnittelu  
- [ ] **Kapasiteettianalyysi**: Analysoitu sovellusten resurssivaatimukset  
- [ ] **SKU-optimointi**: Valittu kustannustehokkaat palvelutasot  
- [ ] **Varmistuksen automaatio**: Toteutettu ennakkovarmistusskriptit  
- [ ] **Kustannussuunnittelu**: Luotu käyttöönoton kustannusarviot ja budjetit  
- [ ] **Riskien arviointi**: Tunnistettu ja lievennetty käyttöönoton riskit  

#### 🚨 Luku 7: Vianetsintä ja virheenkorjaus  
- [ ] **Diagnostiikkataidot**: Onnistuneesti korjattu tarkoituksella rikottuja käyttöönottoja  
- [ ] **Lokianalyysi**: Käytetty tehokkaasti Azure Monitoria ja Application Insightsia  
- [ ] **Suorituskyvyn viritys**: Optimoitu hitaasti toimivia sovelluksia  
- [ ] **Palautusmenettelyt**: Toteutettu varmuuskopiointi ja katastrofien hallinta  
- [ ] **Seurannan asennus**: Luotu ennakoiva seuranta ja hälytysjärjestelmä  

#### 🏢 Luku 8: Tuotanto ja yritystason mallit  
- [ ] **Yritystason tietoturva**: Toteutettu kattavat tietoturvamallit  
- [ ] **Hallintokehys**: Asetettu Azure Policy ja resurssien hallinta  
- [ ] **Edistynyt seuranta**: Luotu hallintapaneelit ja automatisoidut hälytykset  
- [ ] **CI/CD-integraatio**: Rakennettu automatisoidut käyttöönoton putkistot  
- [ ] **Vaatimustenmukaisuuden toteutus**: Täytetty yrityksen vaatimustenmukaisuusvaatimukset  

### Oppimisen aikajana ja virstanpylväät  

#### Viikko 1-2: Perustan rakentaminen  
- **Virstanpylväs**: Ensimmäisen AI-sovelluksen käyttöönotto AZD:llä  
- **Vahvistus**: Toimiva sovellus, joka on käytettävissä julkisen URL:n kautta  
- **Taidot**: Perus AZD-työnkulut ja AI-palveluiden integrointi  

#### Viikko 3-4: Konfiguraation hallinta  
- **Virstanpylväs**: Moniympäristöinen käyttöönotto turvallisella autentikoinnilla  

- **Dokumentaatio**: Osallistu yhteisön dokumentaation ja esimerkkien luomiseen
- **Palaute**: Anna palautetta kurssisisällöstä ja Azure-palveluista

#### Ura Kehitys
- **Ammatillinen Verkosto**: Yhdistä Azure- ja tekoälyasiantuntijoihin
- **Puhumismahdollisuudet**: Esittele oppimiasi asioita konferensseissa tai tapaamisissa
- **Avoimen Lähdekoodin Panos**: Osallistu AZD-mallien ja työkalujen kehittämiseen
- **Mentorointi**: Ohjaa muita kehittäjiä heidän AZD-oppimispolullaan

---

**Luvun Navigointi:**
- **📚 Kurssin Etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Aloita Oppiminen**: [Luku 1: Perusta & Pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen Seuranta**: Seuraa etenemistäsi kattavan 8-luvun oppimisjärjestelmän avulla
- **🤝 Yhteisö**: [Azure Discord](https://discord.gg/microsoft-azure) tukemiseen ja keskusteluun

**Opiskelun Edistymisen Seuranta**: Käytä tätä jäsenneltyä opasta hallitaksesi Azure Developer CLI:n progressiivisen, käytännönläheisen oppimisen kautta, saavuttaen mitattavia tuloksia ja ammatillisia kehityshyötyjä.

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.