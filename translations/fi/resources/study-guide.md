# Opas - Laajat oppimistavoitteet

**Oppimispolun navigointi**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Aloita opiskelu**: [Luku 1: Perusteet & Nopea aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistyksen seuranta**: [Kurssin suoritus](../README.md#-course-completion--certification)

## Johdanto

Tämä laaja opas tarjoaa rakenteelliset oppimistavoitteet, keskeiset käsitteet, harjoitustehtävät ja arviointimateriaalit auttaakseen sinua hallitsemaan Azure Developer CLI:n (azd) käytön. Käytä tätä opasta edistymisesi seuraamiseen ja varmista, että olet katsonut kaikki oleelliset aiheet.

## Oppimistavoitteet

Tämän oppaan suorittamalla sinä:
- Hallitset kaikki Azure Developer CLI:n perus- ja edistyneet käsitteet
- Kehität käytännön taitoja Azure-sovellusten käyttöönotossa ja hallinnassa
- Saat itsevarmuutta vianmäärityksessä ja käyttöönottojen optimoinnissa
- Ymmärrät tuotantovalmiiden käyttöönottojen käytännöt ja tietoturva-asiat

## Oppimistulokset

Suoritettuasi kaikki oppaan osiot osaat:
- Suunnitella, ottaa käyttöön ja hallita kokonaisia sovellusarkkitehtuureja käyttäen azd:tä
- Toteuttaa kattavat valvonta-, tietoturva- ja kustannusten optimointistrategiat
- Ratkaista itsenäisesti monimutkaisia käyttöönotto-ongelmia
- Luoda omia malleja ja osallistua azd-yhteisöön

## 8-lukuinen oppimisrakenne

### Luku 1: Perusteet & Nopea aloitus (Viikko 1)
**Kesto**: 30-45 minuuttia | **Vaativuus**: ⭐

#### Oppimistavoitteet
- Ymmärtää Azure Developer CLI:n ydinkäsitteet ja terminologia
- Onnistuneesti asentaa ja konfiguroida AZD kehitysalustallasi
- Ottaa käyttöön ensimmäinen sovellus olemassa olevaa mallia käyttäen
- Navigoida AZD:n komentorivikäyttöliittymässä tehokkaasti

#### Keskeiset hallittavat käsitteet
- AZD-projektin rakenne ja komponentit (azure.yaml, infra/, src/)
- Mallipohjaiset käyttöönoton työnkulut
- Ympäristön perusasetukset
- Resurssiryhmän ja tilauksen hallinta

#### Käytännön harjoitukset
1. **Asennuksen Tarkistus**: Asenna AZD ja varmista se käyttämällä `azd version`
2. **Ensimmäinen Julkaisu**: Julkaise todo-nodejs-mongo -malli onnistuneesti
3. **Ympäristön Asetus**: Määritä ensimmäiset ympäristömuuttujasi
4. **Resurssien Tutkiminen**: Selaa julkaistuja resursseja Azure-portaalissa

#### Arviointikysymykset
- Mitkä ovat AZD-projektin keskeiset komponentit?
- Kuinka aloitat uuden projektin mallista?
- Mikä on ero `azd up` ja `azd deploy` välillä?
- Kuinka hallitset useita ympäristöjä AZD:llä?

---

### Luku 2: AI-Ensisijainen Kehitys (Viikko 2)
**Kesto**: 1-2 tuntia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Integroi Microsoft Foundry -palvelut AZD-työnkulkuihin
- Julkaise ja konfiguroi tekoälypohjaiset sovellukset
- Ymmärrä RAG (Retrieval-Augmented Generation) -toteutusmallit
- Hallitse tekoälymallien julkaisuja ja skaalausta

#### Keskeiset Hallittavat Käsitteet
- Microsoft Foundry Models -palvelun integrointi ja API-hallinta
- AI Search -konfiguraatio ja vektori-indeksointi
- Mallin julkaisustrategiat ja kapasiteettisuunnittelu
- AI-sovellusten valvonta ja suorituskyvyn optimointi

#### Käytännön Harjoitukset
1. **AI Chat -julkaisu**: Julkaise azure-search-openai-demo -malli
2. **RAG-toteutus**: Konfiguroi dokumenttien indeksointi ja haku
3. **Mallin Konfigurointi**: Aseta useita tekoälymalleja erilaisiin tarkoituksiin
4. **AI-valvonta**: Ota käyttöön Application Insights AI-työkuormille

#### Arviointikysymykset
- Kuinka konfiguroit Microsoft Foundry Models -palveluja AZD-mallissa?
- Mitkä ovat RAG-arkkitehtuurin keskeiset osat?
- Kuinka hallitset tekoälymallin kapasiteettia ja skaalausta?
- Mitkä seurantamittarit ovat tärkeitä AI-sovelluksille?

---

### Luku 3: Konfiguraatio ja Todennus (Viikko 3)
**Kesto**: 45-60 minuuttia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Hallitse ympäristön konfiguraatio- ja hallintastrategiat
- Ota käyttöön turvalliset todennusmallit ja hallittu identiteetti
- Järjestä resurssit oikeilla nimeämiskäytännöillä
- Konfiguroi moniympäristöjulkaisut (kehittynyt, testi, tuotanto)

#### Keskeiset Hallittavat Käsitteet
- Ympäristön hierarkia ja konfiguraation etusijajärjestys
- Hallittu identiteetti ja palvelupääkäyttäjän todennus
- Key Vault -integrointi salaisuuksien hallintaan
- Ympäristökohtainen parametrien hallinta

#### Käytännön Harjoitukset
1. **Moniympäristön Asetus**: Konfiguroi kehittynyt, testi ja tuotanto -ympäristöt
2. **Turvallisuuden Konfiguraatio**: Ota käyttöön hallittu identiteettitodennus
3. **Salaisuuksien Hallinta**: Integroi Azure Key Vault arkaluontoisille tiedoille
4. **Parametrien Hallinta**: Luo ympäristökohtaiset konfiguraatiot

#### Arviointikysymykset
- Kuinka konfiguroit eri ympäristöt AZD:llä?
- Mitkä ovat hallitun identiteetin edut palvelupääkäyttäjiin verrattuna?
- Kuinka hallitset sovelluksen salaisuudet turvallisesti?
- Mikä on konfiguraation hierarkia AZD:ssä?

---

### Luku 4: Infrastruktuuri Koodina ja Julkaisu (Viikko 4-5)
**Kesto**: 1-1.5 tuntia | **Vaativuus**: ⭐⭐⭐

#### Oppimistavoitteet
- Luo ja mukauta Bicep-infrastruktuurimalleja
- Toteuta kehittyneitä julkaisu- ja työnkulkuja
- Ymmärrä resurssien provisiointistrategiat
- Suunnittele skaalautuvia monipalveluarkkitehtuureja

- Julkaise säilöitettyjä sovelluksia Azure Container Appsillä ja AZD:llä


#### Keskeiset Hallittavat Käsitteet
- Bicep-mallin rakenne ja parhaat käytännöt
- Resurssien riippuvuudet ja julkaisujärjestys
- Parametritiedostot ja mallien modulaarisuus
- Räätälöidyt koukut ja julkaisun automaatio
- Säilöapplikaatioiden julkaisumallit (pikakäynnistys, tuotanto, mikropalvelut)

#### Käytännön Harjoitukset
1. **Räätälöidyn Mallin Luonti**: Rakenna monipalvelusovelluksen malli
2. **Bicep-osaaminen**: Luo modulaarisia, uudelleenkäytettäviä infrastruktuurikomponentteja
3. **Julkaisun Automaatio**: Toteuta esija jälkijulkaisuun koukut
4. **Arkkitehtuurin Suunnittelu**: Julkaise monimutkainen mikropalveluarkkitehtuuri
5. **Säilöapplikaation Julkaisu**: Julkaise [Simple Flask API](../../../examples/container-app/simple-flask-api) ja [Microservices Architecture](../../../examples/container-app/microservices) -esimerkit käyttäen AZD:tä

#### Arviointikysymykset
- Kuinka luot räätälöityjä Bicep-malleja AZD:lle?
- Mitkä ovat parhaat käytännöt infrastruktuurikoodin järjestämisessä?
- Kuinka hallitset resurssiriippuvuuksia malleissa?
- Mitkä julkaisu- ja päivitysmallit tukevat keskeytyksetöntä päivitystä?

---

### Luku 5: Moni-Agenttiset AI-Ratkaisut (Viikko 6-7)
**Kesto**: 2-3 tuntia | **Vaativuus**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Suunnittele ja toteuta moni-agenttisia AI-arkkitehtuureja
- Orkestroi agenttien koordinointi ja viestintä
- Julkaise tuotantovalmiita AI-ratkaisuja valvonnan kanssa
- Ymmärrä agenttien erikoistuminen ja työnkulkumallit
- Integroida säilömitetyt mikropalvelut moni-agenttisiin ratkaisuihin

#### Keskeiset Hallittavat Käsitteet
- Moni-agenttiarkkitehtuurin mallit ja suunnitteluperiaatteet
- Agenttien viestintäprotokollat ja tiedonkulku
- Kuormantasauksen ja skaalausstrategiat AI-agentteihin
- Tuotannon valvonta moni-agenttijärjestelmissä
- Palvelu-palvelu -viestintä säilöytävissä ympäristöissä

#### Käytännön Harjoitukset
1. **Vähittäiskaupan Arkkitehtuurin Tarkastelu**: Analysoi vähittäiskaupan pohjapiirros ja tunnista, mitkä sovelluskomponentit on toteutettava ennen julkaisua
2. **Agentin Mukauttaminen**: Muokkaa Asiakas- ja Varastoagentin käyttäytymistä
3. **Arkkitehtuurin Skaalaus**: Toteuta kuormantasaus ja automaattinen skaalaus
4. **Tuotannon Valvonta**: Luo kattava valvonta ja hälytys
5. **Mikropalvelujen Integraatio**: Laajenna [Microservices Architecture](../../../examples/container-app/microservices) -esimerkkiä agenttipohjaisten työnkulkujen tukemiseksi

#### Arviointikysymykset
- Kuinka suunnittelet tehokkaat moni-agenttiviestintämallit?
- Mitkä ovat keskeiset näkökohdat AI-agenttien työkuormien skaalaamisessa?
- Kuinka valvot ja debuggaat moni-agenttisia AI-järjestelmiä?
- Mitkä tuotantomallit takaavat luotettavuuden AI-agentteihin?

---

### Luku 6: Ennen Julkaisua - Vahvistus ja Suunnittelu (Viikko 8)
**Kesto**: 1 tunti | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Suorita kattava kapasiteettisuunnittelu ja resurssien vahvistus
- Valitse optimaaliset Azure SKU:t kustannustehokkuuteen
- Ota käyttöön automatisoidut esilennon tarkastukset ja vahvistukset
- Suunnittele julkaisut kustannusoptimointistrategioilla

#### Keskeiset Hallittavat Käsitteet
- Azure-resurssien kiintiöt ja kapasiteettirajoitukset
- SKU-valintakriteerit ja kustannusten optimointi
- Automaattiset vahvistusskriptit ja testaus
- Julkaisusuunnittelu ja riskinarviointi

#### Käytännön Harjoitukset
1. **Kapasiteettianalyysi**: Analysoi sovellustesi resurssivaatimukset
2. **SKU-optimointi**: Vertaa ja valitse kustannustehokkaat palvelutason vaihtoehdot
3. **Vahvistusautomaatio**: Toteuta ennen julkaisua tehtävät tarkastusskriptit
4. **Kustannussuunnittelu**: Laadi julkaisukustannusten arvioinnit ja budjetit

#### Arviointikysymykset
- Kuinka varmistat Azure-kapasiteetin ennen julkaisua?
- Mitkä tekijät vaikuttavat SKU-valintapäätöksiin?
- Kuinka automatisoit ennen julkaisua tehtävää vahvistamista?
- Mitkä strategiat auttavat optimoimaan julkaisukustannuksia?

---

### Luku 7: Ongelmienratkaisu ja Virheidenkorjaus (Viikko 9)
**Kesto**: 1-1.5 tuntia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Kehitä systemaattisia virheenkorjausmenetelmiä AZD-julkaisuissa
- Ratkaise yleisiä julkaisu- ja konfiguraatio-ongelmia
- Debuggaa AI-spesifejä ongelmia ja suorituskykyhaasteita
- Ota käyttöön valvonta ja hälytysprosessit ennakoivaan ongelmien tunnistamiseen

#### Keskeiset Hallittavat Käsitteet
- Diagnostiikkatekniikat ja lokitusstrategiat
- Yleiset virhemahdollisuudet ja niiden ratkaisut
- Suorituskyvyn valvonta ja optimointi
- Tapahtumien reagointi ja palautusmenettelyt

#### Käytännön Harjoitukset
1. **Diagnostiikka**: Harjoittele tahallaan rikotuilla julkaisuilla
2. **Lokianalyysi**: Hyödynnä Azure Monitor ja Application Insights tehokkaasti
3. **Suorituskyvyn Viritys**: Optimoi hitaasti toimivat sovellukset
4. **Palautusmenettelyt**: Toteuta varmuuskopiot ja katastrofipalautus

#### Arviointikysymykset
- Mitkä ovat yleisimmät AZD-julkaisujen epäonnistumiset?
- Kuinka debuggaat todennus- ja käyttöoikeusongelmia?
- Mitkä valvontastrategiat auttavat estämään tuotanto-ongelmia?
- Kuinka optimoit sovellusten suorituskykyä Azure-ympäristössä?

---

### Luku 8: Tuotanto- ja Yritysmallit (Viikko 10-11)
**Kesto**: 2-3 tuntia | **Vaativuus**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Toteuta yritystason julkaisu- ja käyttöönotto-strategioita
- Suunnittele turvallisuusmalleja ja noudattamiskehyksiä
- Perusta valvonta, hallinta ja kustannusten hallinta
- Luo skaalautuvat CI/CD-putket AZD-integraatiolla
- Sovella parhaita käytäntöjä tuotantotason säilöapplikaatioiden julkaisuun (turvallisuus, valvonta, kustannukset, CI/CD)

#### Keskeiset Hallittavat Käsitteet
- Yritysturvallisuus ja noudattamisvaatimukset
- Hallintakehykset ja politiikkojen toteutus
- Kehittynyt valvonta ja kustannusten hallinta
- CI/CD-integraatio ja automatisoidut julkaisulinjat
- Sinivihreä ja kanarialaivajulkaisu säilötyille työkuormille

#### Käytännön Harjoitukset
1. **Yritysturvallisuus**: Ota käyttöön kattavat turvallisuusmallit
2. **Hallintakehys**: Luo Azure Policy ja resurssien hallinta
3. **Kehittynyt Valvonta**: Luo mittaristot ja automatisoitu hälytys
4. **CI/CD-Integraatio**: Rakenna automatisoidut julkaisulinjat
5. **Tuotannon Säilöapplikaatiot**: Sovella turvallisuus-, valvonta- ja kustannusoptimointia [Microservices Architecture](../../../examples/container-app/microservices) -esimerkkiin

#### Arviointikysymykset
- Kuinka toteutat yritysturvallisuuden AZD-julkaisuissa?
- Mitkä hallintamallit varmistavat noudattamisen ja kustannusten hallinnan?
- Kuinka suunnittelet skaalautuvan valvonnan tuotantojärjestelmille?
- Mitkä CI/CD-mallit toimivat parhaiten AZD-työnkuluissa?

#### Oppimistavoitteet
- Ymmärrä Azure Developer CLI:n perusteet ja keskeiset käsitteet
- Asenna ja konfiguroi azd kehitysympäristössä onnistuneesti
- Suorita ensimmäinen julkaisu olemassa olevan mallin avulla
- Selaa azd-projektin rakennetta ja ymmärrä keskeiset komponentit

#### Keskeiset Hallittavat Käsitteet
- Mallit, ympäristöt ja palvelut
- azure.yaml-konfiguraatiorakenne
- Perusazd-komennot (init, up, down, deploy)
- Infrastruktuuri koodina -periaatteet
- Azure-todennus ja -valtuutus

#### Käytännön Harjoitukset

**Harjoitus 1.1: Asennus ja Asetus**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Harjoitus 1.2: Ensimmäinen Julkaisu**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Harjoitus 1.3: Projektin Rakenneanalyysi**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Itsearviointikysymykset
1. Mitkä ovat azd-arkkitehtuurin kolme keskeistä käsitettä?
2. Mikä on azure.yaml-tiedoston tarkoitus?
3. Kuinka ympäristöt auttavat hallitsemaan eri julkaisukohteita?
4. Mitä todennusmenetelmiä voidaan käyttää azd:n kanssa?
5. Mitä tapahtuu, kun suoritat `azd up` ensimmäistä kertaa?

---

## Edistymisen Seuranta ja Arviointikehys
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Harjoitus 2.2: Kehittynyt Konfiguraatio**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Harjoitus 2.3: Turvallisuuden Konfiguraatio**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Itsearviointikysymykset
1. Kuinka azd käsittelee ympäristömuuttujien etusijajärjestyksen?
2. Mitkä ovat julkaisukoukut ja milloin niitä käytetään?
3. Kuinka konfiguroit eri SKU:t eri ympäristöille?
4. Mitä turvallisuusvaikutuksia eri todennusmenetelmillä on?
5. Kuinka hallitset salaisuuksia ja arkaluontoista konfiguraatiotietoa?

### Moduuli 3: Julkaisu ja Provisiointi (Viikko 4)

#### Oppimistavoitteet
- Hallitse julkaisut työnkulut ja parhaat käytännöt
- Ymmärrä infrastruktuuri koodina Bicep-malleilla
- Toteuta monimutkaisia monipalveluarkkitehtuureja
- Optimoi julkaisun suorituskyky ja luotettavuus

#### Keskeiset Hallittavat Käsitteet
- Bicep-mallin rakenne ja moduulit
- Resurssiriippuvuudet ja järjestys
- Julkaisustrategiat (sinivihreä, porrastetut päivitykset)
- Monialuejulkaisut
- Tietokantamigraatiot ja tiedonhallinta

#### Käytännön Harjoitukset

**Harjoitus 3.1: Räätälöity Infrastruktuuri**
```text
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Harjoitus 3.2: Monipalvelusovellus**
```text
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Harjoitus 3.3: Tietokannan Integraatio**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Itsearviointikysymykset
1. Mitkä ovat Bicep-mallien edut ARM-malleihin verrattuna?
2. Kuinka hallitset tietokantamigraatiot azd-julkaisuissa?
3. Mitä strategioita on olemassa keskeytyksettömään julkaisuun?
4. Kuinka hallitset riippuvuuksia palveluiden välillä?
5. Mitä tulee huomioida monialuejulkaisuissa?

### Moduuli 4: Ennen Julkaisua Vahvistus (Viikko 5)

#### Oppimistavoitteet
- Toteuta kattavat esiasennustarkastukset
- Hallitse kapasiteettisuunnittelu ja resurssien validointi
- Ymmärrä SKU-valinta ja kustannusten optimointi
- Rakenna automatisoidut validointiputket

#### Keskeiset hallittavat käsitteet
- Azuren resurssikvot ja -rajoitukset
- SKU-valintakriteerit ja kustannusvaikutukset
- Automaattiset validointiskriptit ja -työkalut
- Kapasiteettisuunnittelumenetelmät
- Suorituskyvyn testaus ja optimointi

#### Harjoitustehtävät

**Harjoitus 4.1: Kapasiteettisuunnittelu**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Harjoitus 4.2: Esilennon validointi**
```text
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Harjoitus 4.3: SKU-optimointi**
```text
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Itsearviointikysymykset
1. Mitkä tekijät tulisi vaikuttaa SKU-valintapäätöksiin?
2. Kuinka varmistat Azuren resurssien saatavuuden ennen käyttöönottoa?
3. Mitkä ovat esilennontarkistuksen järjestelmän keskeiset osat?
4. Kuinka arvioit ja hallitset käyttöönoton kustannuksia?
5. Mikä valvonta on olennaista kapasiteettisuunnittelussa?

### Moduuli 5: Vianmääritys ja virheenkorjaus (Viikko 6)

#### Oppimistavoitteet
- Hallitse järjestelmälliset vianmääritysmenetelmät
- Kehitä asiantuntemus monimutkaisten käyttöönotto-ongelmien virheenkorjauksessa
- Toteuta kattava valvonta ja hälytysjärjestelmä
- Rakenna häiriövastemenettelyt ja palautusprosessit

#### Keskeiset hallittavat käsitteet
- Yleiset käyttöönoton virhekuviot
- Lokianalyysi- ja korrelaatiotekniikat
- Suorituskyvyn valvonta ja optimointi
- Tietoturvahäiriöiden havaitseminen ja reagointi
- Katastrofipalautus ja liiketoiminnan jatkuvuus

#### Harjoitustehtävät

**Harjoitus 5.1: Vianmääritystilanteet**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Harjoitus 5.2: Valvonnan toteutus**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Harjoitus 5.3: Häiriövastetoimenpiteet**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Itsearviointikysymykset
1. Mikä on järjestelmällinen lähestymistapa azd-käyttöönottojen vianmäärityksessä?
2. Kuinka korreloit lokeja useiden palveluiden ja resurssien välillä?
3. Mitkä valvonnan mittarit ovat kriittisimpiä varhaisessa ongelmien havaitsemisessa?
4. Kuinka toteutat tehokkaat katastrofipalautusmenettelyt?
5. Mitkä ovat keskeiset osat häiriövastesuunnitelmassa?

### Moduuli 6: Edistyneet aiheet ja parhaat käytännöt (Viikot 7-8)

#### Oppimistavoitteet
- Toteuta yritystason käyttöönottoarkkitehtuureja
- Hallitse CI/CD-integraatio ja automaatio
- Kehitä räätälöityjä malleja ja osallistu yhteisöön
- Ymmärrä edistyneet tietoturva- ja vaatimustenmukaisuusvaatimukset

#### Keskeiset hallittavat käsitteet
- CI/CD-putkiston integrointimallit
- Räätälöityjen mallien kehitys ja jakelu
- Yrityshallinto ja vaatimustenmukaisuus
- Edistyneet verkko- ja tietoturvakokoonpanot
- Suorituskyvyn optimointi ja kustannusten hallinta

#### Harjoitustehtävät

**Harjoitus 6.1: CI/CD-integraatio**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Harjoitus 6.2: Räätälöidyn mallin kehitys**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Harjoitus 6.3: Yritystason toteutus**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Itsearviointikysymykset
1. Kuinka integroit azd olemassa oleviin CI/CD-työnkulkuihin?
2. Mitkä ovat keskeiset seikat räätälöityjen mallien kehityksessä?
3. Kuinka toteutat hallinnon ja vaatimustenmukaisuuden azd-käyttöönotossa?
4. Mitkä ovat parhaat käytännöt yritystason käyttöönottoihin?
5. Kuinka kontribuoit tehokkaasti azd-yhteisöön?

## Käytännön projektit

### Projekti 1: Henkilökohtainen portfoliosivusto
**Vaikeustaso**: Aloittelija  
**Kesto**: 1-2 viikkoa

Rakenna ja ota käyttöön henkilökohtainen portfoliosivusto käyttäen:
- Staattinen verkkosivuston hosting Azure Storagella
- Räätälöidyn verkkotunnuksen konfigurointi
- CDN-integraatio globaalin suorituskyvyn parantamiseksi
- Automaattinen käyttöönotto putkisto

**Toimitettavat**:
- Toimiva verkkosivusto Azuressa
- Räätälöity azd-malli portfoliosivuston käyttöönottoon
- Käyttöönoton dokumentaatio
- Kustannusanalyysi ja optimointisuositukset

### Projekti 2: Tehtävien hallintasovellus
**Vaikeustaso**: Keskitaso  
**Kesto**: 2-3 viikkoa

Luo täyden pinon tehtävien hallintasovellus, jossa on:
- React-käyttöliittymä, joka on otettu käyttöön App Servicessä
- Node.js API-taustapalvelu autentikoinnilla
- PostgreSQL-tietokanta migraatioilla
- Application Insights -valvonta

**Toimitettavat**:
- Täydellinen sovellus käyttäjäautentikoinnilla
- Tietokantaskeema ja migraatiokäsikirjoitukset
- Valvontapaneelit ja hälytyssäännöt
- Moniympäristöinen käyttöönoton konfigurointi

### Projekti 3: Mikropalvelupohjainen verkkokauppa-alusta
**Vaikeustaso**: Edistynyt  
**Kesto**: 4-6 viikkoa

Suunnittele ja toteuta mikropalvelupohjainen verkkokauppa-alusta:
- Useita API-palveluita (tuotekatalogi, tilaukset, maksut, käyttäjät)
- Viestijonointegratio Service Busin kanssa
- Redis-välimuisti suorituskyvyn optimointiin
- Kattava lokitus ja valvonta

**Viite-esimerkki**: Katso [Microservices Architecture](../../../examples/container-app/microservices) kahden palvelun oppimismalli ja käyttöönotto-opas. Jonot, pysyvyys, autentikointi, maksujen käsittely ja tuotantovalmennus ovat erillisiä projektitöitä.

**Toimitettavat**:
- Täydellinen mikropalveluarkkitehtuuri
- Palveluiden välinen viestintämallit
- Suorituskyvyn testaus ja optimointi
- Tuotantovalmiit tietoturvatoteutukset

## Arviointi ja sertifiointi

### Tietotarkistukset

Suorita nämä arvioinnit jokaisen moduulin jälkeen:

**Moduuli 1 Arviointi**: Peruskäsitteet ja asennus
- Monivalintakysymyksiä ydinkäsitteistä
- Käytännön asennus- ja konfigurointitehtäviä
- Yksinkertainen käyttöönottoharjoitus

**Moduuli 2 Arviointi**: Konfigurointi ja ympäristöt
- Ympäristönhallinnan skenaariot
- Konfiguroinnin vianmääritysharjoitukset
- Tietoturvakonfiguroinnin toteutus

**Moduuli 3 Arviointi**: Käyttöönotto ja provisiointi
- Infrastruktuurin suunnittelutehtävät
- Monipalvelukäyttöönoton skenaariot
- Suorituskyvyn optimointiharjoitukset

**Moduuli 4 Arviointi**: Esikäyttöönoton validointi
- Kapasiteettisuunnittelun tapaustutkimukset
- Kustannusten optimointiskenaariot
- Validointiputken toteutus

**Moduuli 5 Arviointi**: Vianmääritys ja virheenkorjaus
- Ongelman diagnoosiharjoitukset
- Valvonnan toteutustehtävät
- Häiriövastetilanteiden simulaatiot

**Moduuli 6 Arviointi**: Edistyneet aiheet
- CI/CD-putkiston suunnittelu
- Räätälöidyn mallin kehitys
- Yritysarkkitehtuurin skenaariot

### Lopullinen päätösprojekti

Suunnittele ja toteuta kokonaisratkaisu, joka osoittaa hallitsevasi kaikki käsitteet:

**Vaatimukset**:
- Monikerroksinen sovellusarkkitehtuuri
- Useita käyttöönottoympäristöjä
- Kattava valvonta ja hälytys
- Tietoturva- ja vaatimustenmukaisuustoteutus
- Kustannusten optimointi ja suorituskyvyn hienosäätö
- Täydellinen dokumentaatio ja käyttöohjeet

**Arviointikriteerit**:
- Teknisen toteutuksen laatu
- Dokumentaation kattavuus
- Tietoturvan ja parhaiden käytäntöjen noudattaminen
- Suorituskyvyn ja kustannusoptimoinnin taso
- Vianmäärityksen ja valvonnan tehokkuus

## Opiskelu- ja viitetarvikkeet

### Virallinen dokumentaatio
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Yhteisöresurssit
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Harjoitteluympäristöt
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Lisätyökalut
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Opiskeluohjelman suositukset

### Kokopäiväinen opiskelu (8 viikkoa)
- **Viikot 1-2**: Moduulit 1-2 (Aloitus, Konfigurointi)
- **Viikot 3-4**: Moduulit 3-4 (Käyttöönotto, Esikäyttöönotto)
- **Viikot 5-6**: Moduulit 5-6 (Vianmääritys, Edistyneet aiheet)
- **Viikot 7-8**: Käytännön projektit ja lopullinen arviointi

### Osa-aikainen opiskelu (16 viikkoa)
- **Viikot 1-4**: Moduuli 1 (Aloitus)
- **Viikot 5-7**: Moduuli 2 (Konfigurointi ja ympäristöt)
- **Viikot 8-10**: Moduuli 3 (Käyttöönotto ja provisiointi)
- **Viikot 11-12**: Moduuli 4 (Esikäyttöönoton validointi)
- **Viikot 13-14**: Moduuli 5 (Vianmääritys ja virheenkorjaus)
- **Viikot 15-16**: Moduuli 6 (Edistyneet aiheet ja arviointi)

---

## Edistymisen seuranta ja arviointikehys

### Luvun suorittamisen tarkistuslista

Seuraa edistymistäsi jokaisen luvun kohdalla näiden mitattavien tavoitteiden avulla:

#### 📚 Luku 1: Perusta & nopea aloitus
- [ ] **Asennus valmis**: AZD asennettu ja vahvistettu alustallasi
- [ ] **Ensimmäinen käyttöönotto**: todo-nodejs-mongo mallin onnistunut käyttöönotto
- [ ] **Ympäristön asetukset**: Ensimmäisten ympäristömuuttujien konfigurointi
- [ ] **Resurssien selaus**: Tutustunut käyttöönotettuihin resursseihin Azure-portaalissa
- [ ] **Komentojen hallinta**: Perusazd-komentojen käyttäminen sujuvasti

#### 🤖 Luku 2: AI-ensimmäinen kehitys  
- [ ] **AI-mallin käyttöönotto**: azure-search-openai-demo mallin onnistunut käyttöönotto
- [ ] **RAG-toteutus**: Dokumenttien indeksointi ja haku konfiguroitu
- [ ] **Mallin konfigurointi**: Usean AI-mallin asetukset erilaisille tarkoituksille
- [ ] **AI-valvonta**: Application Insights toteutettu AI-kuormille
- [ ] **Suorituskyvyn optimointi**: AI-sovelluksen suorituskyvyn hienosäätö

#### ⚙️ Luku 3: Konfigurointi & autentikointi
- [ ] **Moniympäristöasennus**: dev-, staging- ja prod-ympäristöt konfiguroitu
- [ ] **Tietoturvatoimet**: Hallittu identiteetti autentikointi toteutettu
- [ ] **Salaisuuksien hallinta**: Azure Key Vault integroitu arkaluontoisia tietoja varten
- [ ] **Parametrien hallinta**: Ympäristökohtaiset asetukset luotu
- [ ] **Autentikoinnin hallinta**: Turvallisten käyttöoikeusmallien toteutus

#### 🏗️ Luku 4: Infrastruktuuri koodina & käyttöönotto
- [ ] **Räätälöity mallin luonti**: Monipalvelusovelluksen malli rakennettu
- [ ] **Bicep-hallinta**: Modulaariset ja uudelleenkäytettävät infrastruktuurikomponentit luotu
- [ ] **Käyttöönoton automaatio**: Ennen/jälkeen käyttöönotto-koukut toteutettu
- [ ] **Arkkitehtuurisuunnittelu**: Monimutkaisen mikropalveluarkkitehtuurin käyttöönotto
- [ ] **Mallien optimointi**: Mallit optimoitu suorituskyvyn ja kustannusten osalta

#### 🎯 Luku 5: Moni-agenttiset AI-ratkaisut
- [ ] **Vähittäiskaupan arkkitehtuurin tarkastelu**: Puuttuvat sovellusosat tunnistettu ja niiden toteutus ja validointi suunniteltu
- [ ] **Agenttien räätälöinti**: Asiakas- ja varastoagenttien käyttäytymät muokattu
- [ ] **Arkkitehtuurin skaalaus**: Kuormantasauksen ja automaattisen skaalaamisen toteutus
- [ ] **Tuotannon valvonta**: Kattava valvonta ja hälytysjärjestelmä luotu
- [ ] **Suorituskyvyn hienosäätö**: Moni-agenttisen järjestelmän suorituskyky optimoitu

#### 🔍 Luku 6: Esikäyttöönoton validointi & suunnittelu
- [ ] **Kapasiteettianalyysi**: Sovellusten resurssivaatimukset analysoitu
- [ ] **SKU-optimointi**: Kustannustehokkaat palvelutasot valittu
- [ ] **Validoinnin automatisointi**: Esikäyttöönottotarkastuskomentosarjat toteutettu
- [ ] **Kustannussuunnittelu**: Käyttöönoton kustannusarviot ja budjetit luotu
- [ ] **Riskien arviointi**: Käyttöönoton riskit tunnistettu ja lievennetty

#### 🚨 Luku 7: Vianmääritys & virheenkorjaus
- [ ] **Diagnostiikkataidot**: Tahallisesti rikki menneet käyttöönotot onnistuneesti korjattu
- [ ] **Lokianalyysi**: Azure Monitorin ja Application Insightsin tehokas käyttö
- [ ] **Suorituskyvyn hienosäätö**: Hitaasti toimivien sovellusten optimointi
- [ ] **Palautusmenettelyt**: Varmuuskopiointi ja katastrofipalautus toteutettu
- [ ] **Valvonnan asennus**: Proaktiivinen valvonta ja hälytys järjestetty

#### 🏢 Luku 8: Tuotanto & yritystason mallit
- [ ] **Yritystason tietoturva**: Kattavat tietoturvamallit toteutettu
- [ ] **Hallintakehys**: Azure Policy ja resurssienhallinta käyttöön otettu
- [ ] **Edistynyt valvonta**: Paneelit ja automaattiset hälytykset luotu
- [ ] **CI/CD-integraatio**: Automaattiset käyttöönotto-putkistot rakennettu
- [ ] **Vaatimustenmukaisuuden toteutus**: Yritystason vaatimustenmukaisuus saavutettu

### Oppimisen aikajana ja virstanpylväät

#### Viikot 1-2: Perustan rakentaminen
- **Virstanpylväs**: Ensimmäisen AI-sovelluksen käyttöönotto AZD:llä
- **Vahvistus**: Toimiva sovellus julkisen URL:n kautta
- **Taidot**: Perustason AZD-työnkulut ja AI-palveluiden integrointi

#### Viikot 3-4: Konfiguroinnin hallinta
- **Virstanpylväs**: Moniympäristöinen käyttöönotto turvallisella autentikoinnilla
- **Vahvistus**: Sama sovellus otettu käyttöön dev-/staging-/prod-ympäristöissä
- **Taidot**: Ympäristönhallinta ja tietoturvan toteutus

#### Viikot 5-6: Infrastruktuuriasiantuntemus
- **Virstanpylväs**: Räätälöity malli monipalvelusovellukselle
- **Vahvistus**: Malli otettu uudelleen käyttöön toisen tiimin jäsenen toimesta
- **Taidot**: Bicep-osaaminen ja infrastruktuuriautomaation hallinta

#### Viikot 7-8: Edistyneet AI-toteutukset
- **Virstanpylväs**: Tuotantovalmiiksi viimeistelty moni-agenttinen AI-ratkaisu
- **Vahvistus**: Järjestelmä käsittelee todellisen kuorman valvonnan alaisena
- **Taidot**: Moni-agenttien orkestrointi ja suorituskyvyn optimointi

#### Viikot 9-10: Tuotantovalmius
- **Virstanpylväs**: Yritystason käyttöönotto täysimittaisella vaatimustenmukaisuudella
- **Vahvistus**: Turvatarkastus ja kustannusten optimointitarkastus läpäisty
- **Taidot**: Hallinto, valvonta ja CI/CD-integraatio

### Arviointi ja sertifiointi

#### Tiedon vahvistusmenetelmät
1. **Käytännön käyttöönotot**: Toimivat sovellukset jokaiselle luvulle
2. **Koodikatselmukset**: Mallien ja konfiguraatioiden laadun arviointi
3. **Ongelmanratkaisu**: Vianmääritystilanteet ja ratkaisut
4. **Vertaisopetus**: Käsitteiden selittäminen muille oppijoille
5. **Yhteisön kontribuutio**: Mallien tai parannusten jakaminen

#### Ammatillisen kehittymisen tulokset
- **Portfolioprojektit**: Käyttöönotto- ja arkkitehtuuriharjoitukset; tuotantovalmius vaatii erillisen toteutuksen ja arvioinnin
- **Tekniset taidot**: Alan standardin mukaista AZD- ja AI-käyttöönotto-osaamista
- **Ongelmanratkaisukyky**: Itsenäinen vianmääritys ja optimointi
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Azure-kehittäjäyhteisöön
- **Uran eteneminen**: Taitoja, joita voi suoraan soveltaa pilvi- ja tekoälytehtävissä

#### Menestysmittarit
- **Julkaisujen onnistumisprosentti**: >95 % onnistuneista julkaisuista
- **Ongelmanratkaisuaika**: <30 minuuttia yleisimpiin ongelmiin
- **Suorituskyvyn optimointi**: Näytettävissä olevat parannukset kustannuksissa ja suorituskyvyssä
- **Turvallisuustarkastus**: Dokumentoi ohjaukset ja jäljellä olevat puutteet organisaatiosi vaatimuksia vastaan; kurssin suorittaminen ei takaa vaatimustenmukaisuutta
- **Tietojen siirto**: Kyky mentorointiin muille kehittäjille

### Jatkuva oppiminen ja yhteisön osallistuminen

#### Pysy ajan tasalla
- **Azure-päivitykset**: Seuraa Azure Developer CLI -julkaisumuistiinpanoja
- **Yhteisötapahtumat**: Osallistu Azure- ja tekoälykehittäjien tapahtumiin
- **Dokumentaatio**: Osallistu yhteisön dokumentaation ja esimerkkien laatimiseen
- **Palaute**: Anna palautetta kurssimateriaalista ja Azure-palveluista

#### Urakehitys
- **Ammatillinen verkosto**: Verkostoidu Azure- ja tekoälyasiantuntijoiden kanssa
- **Puhetilaisuudet**: Esittele oppimiasi asioita konferensseissa tai tapaamisissa
- **Avoimen lähdekoodin panostus**: Osallistu AZD-mallien ja työkalujen kehitykseen
- **Mentorointi**: Ohjaa muita kehittäjiä heidän AZD-opintomatkallaan

---

**Lukuvalikko:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../README.md)
- **📖 Aloita opiskelu**: [Luku 1: Perusteet ja pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: Seuraa etenemistäsi kattavan 8-luvun oppimisjärjestelmän kautta
- **🤝 Yhteisö**: [Azure Discord](https://discord.gg/microsoft-azure) tukea ja keskustelua varten

**Opiskelun edistymisen seuranta**: Käytä tätä jäsentynyttä opasta hallitaksesi Azure Developer CLI:tä asteittaisen, käytännönläheisen oppimisen avulla mitattavien tulosten ja ammatillisen kehityksen hyötyjen saavuttamiseksi.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->