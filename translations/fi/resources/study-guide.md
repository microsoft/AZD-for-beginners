<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "02c0d6833f050997d358015c9d6b71d9",
  "translation_date": "2025-11-21T15:40:50+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "fi"
}
-->
# Opas opiskeluun - Kattavat oppimistavoitteet

**Oppimispolun navigointi**
- **📚 Kurssin aloitussivu**: [AZD aloittelijoille](../README.md)
- **📖 Aloita oppiminen**: [Luku 1: Perusteet ja pika-aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: [Kurssin suorittaminen](../README.md#-course-completion--certification)

## Johdanto

Tämä kattava opas tarjoaa jäsennellyt oppimistavoitteet, keskeiset käsitteet, harjoitustehtävät ja arviointimateriaalit, jotka auttavat sinua hallitsemaan Azure Developer CLI:n (azd). Käytä tätä opasta edistymisesi seuraamiseen ja varmista, että olet käynyt läpi kaikki olennaiset aiheet.

## Oppimistavoitteet

Tämän oppaan suorittamisen jälkeen:
- Hallitset kaikki Azure Developer CLI:n perus- ja edistyneet käsitteet
- Kehität käytännön taitoja Azure-sovellusten käyttöönotossa ja hallinnassa
- Saat varmuutta vianetsinnässä ja käyttöönottojen optimoinnissa
- Ymmärrät tuotantovalmiiden käyttöönottojen käytännöt ja turvallisuusnäkökohdat

## Oppimistulokset

Kaikkien oppaan osioiden suorittamisen jälkeen osaat:
- Suunnitella, ottaa käyttöön ja hallita kokonaisia sovellusarkkitehtuureja azd:n avulla
- Toteuttaa kattavia valvonta-, turvallisuus- ja kustannusoptimointistrategioita
- Ratkaista monimutkaisia käyttöönotto-ongelmia itsenäisesti
- Luoda mukautettuja malleja ja osallistua azd-yhteisöön

## 8-luvun oppimisrakenne

### Luku 1: Perusteet ja pika-aloitus (Viikko 1)
**Kesto**: 30-45 minuuttia | **Vaikeustaso**: ⭐

#### Oppimistavoitteet
- Ymmärrä Azure Developer CLI:n ydinkäsitteet ja terminologia
- Asenna ja määritä AZD onnistuneesti kehitysalustallesi
- Ota ensimmäinen sovellus käyttöön olemassa olevan mallin avulla
- Navigoi tehokkaasti AZD:n komentoriviliittymässä

#### Keskeiset käsitteet
- AZD-projektin rakenne ja komponentit (azure.yaml, infra/, src/)
- Mallipohjaiset käyttöönoton työnkulut
- Ympäristön perusasetukset
- Resurssiryhmien ja tilauksien hallinta

#### Käytännön harjoitukset
1. **Asennuksen tarkistus**: Asenna AZD ja tarkista `azd version` -komennolla
2. **Ensimmäinen käyttöönotto**: Ota käyttöön todo-nodejs-mongo-malli onnistuneesti
3. **Ympäristön määrittäminen**: Määritä ensimmäiset ympäristömuuttujasi
4. **Resurssien tutkiminen**: Navigoi käyttöön otettuja resursseja Azure-portaalissa

#### Arviointikysymykset
- Mitkä ovat AZD-projektin ydinkomponentit?
- Kuinka aloitat uuden projektin mallista?
- Mikä ero on `azd up`- ja `azd deploy` -komentojen välillä?
- Kuinka hallitset useita ympäristöjä AZD:llä?

---

### Luku 2: AI-ensimmäinen kehitys (Viikko 2)
**Kesto**: 1-2 tuntia | **Vaikeustaso**: ⭐⭐

#### Oppimistavoitteet
- Integroi Microsoft Foundry -palvelut AZD-työnkulkuihin
- Ota käyttöön ja määritä tekoälypohjaisia sovelluksia
- Ymmärrä RAG (Retrieval-Augmented Generation) -toteutusmallit
- Hallitse tekoälymallien käyttöönottoa ja skaalausta

#### Keskeiset käsitteet
- Azure OpenAI -palvelun integrointi ja API-hallinta
- AI-hakukonfiguraatio ja vektori-indeksointi
- Mallien käyttöönoton strategiat ja kapasiteettisuunnittelu
- Tekoälysovellusten valvonta ja suorituskyvyn optimointi

#### Käytännön harjoitukset
1. **AI-chatin käyttöönotto**: Ota käyttöön azure-search-openai-demo-malli
2. **RAG-toteutus**: Määritä asiakirjojen indeksointi ja haku
3. **Mallin konfigurointi**: Määritä useita tekoälymalleja eri tarkoituksiin
4. **AI-valvonta**: Toteuta Application Insights tekoälytyökuormille

#### Arviointikysymykset
- Kuinka määrität Azure OpenAI -palvelut AZD-mallissa?
- Mitkä ovat RAG-arkkitehtuurin keskeiset komponentit?
- Kuinka hallitset tekoälymallien kapasiteettia ja skaalausta?
- Mitkä valvontamittarit ovat tärkeitä tekoälysovelluksille?

---

### Luku 3: Konfigurointi ja todennus (Viikko 3)
**Kesto**: 45-60 minuuttia | **Vaikeustaso**: ⭐⭐

#### Oppimistavoitteet
- Hallitse ympäristön konfigurointi- ja hallintastrategiat
- Toteuta turvalliset todennusmallit ja hallitut identiteetit
- Järjestä resurssit asianmukaisilla nimeämiskäytännöillä
- Määritä monen ympäristön käyttöönotot (kehitys, testaus, tuotanto)

#### Keskeiset käsitteet
- Ympäristöhierarkia ja konfiguraation etusijajärjestys
- Hallittu identiteetti ja palveluperiaatteiden todennus
- Key Vault -integraatio salaisuuksien hallintaan
- Ympäristökohtainen parametrien hallinta

#### Käytännön harjoitukset
1. **Monen ympäristön asennus**: Määritä kehitys-, testaus- ja tuotantoympäristöt
2. **Turvallisuuskonfiguraatio**: Toteuta hallittu identiteettitodennus
3. **Salaisuuksien hallinta**: Integroi Azure Key Vault arkaluontoisille tiedoille
4. **Parametrien hallinta**: Luo ympäristökohtaiset konfiguraatiot

#### Arviointikysymykset
- Kuinka määrität eri ympäristöt AZD:llä?
- Mitkä ovat hallitun identiteetin edut verrattuna palveluperiaatteisiin?
- Kuinka hallitset sovelluksen salaisuuksia turvallisesti?
- Mikä on AZD:n konfiguraatiohierarkia?

---

### Luku 4: Infrastruktuuri koodina ja käyttöönotto (Viikot 4-5)
**Kesto**: 1-1,5 tuntia | **Vaikeustaso**: ⭐⭐⭐

#### Oppimistavoitteet
- Luo ja mukauta Bicep-infrastruktuurimalleja
- Toteuta edistyneitä käyttöönoton malleja ja työnkulkuja
- Ymmärrä resurssien provisiointistrategiat
- Suunnittele skaalautuvia monipalveluarkkitehtuureja

- Ota käyttöön konttipohjaisia sovelluksia Azure Container Apps -palvelun ja AZD:n avulla

#### Keskeiset käsitteet
- Bicep-mallien rakenne ja parhaat käytännöt
- Resurssiriippuvuudet ja käyttöönoton järjestys
- Parametritiedostot ja mallien modulaarisuus
- Mukautetut koukut ja käyttöönoton automaatio
- Konttisovellusten käyttöönoton mallit (pika-aloitus, tuotanto, mikropalvelut)

#### Käytännön harjoitukset
1. **Mukautetun mallin luominen**: Rakenna monipalveluinen sovellusmalli
2. **Bicep-osaaminen**: Luo modulaarisia, uudelleenkäytettäviä infrastruktuurikomponentteja
3. **Käyttöönoton automaatio**: Toteuta esikäyttöönotto- ja jälkikäyttöönotto-koukut
4. **Arkkitehtuurin suunnittelu**: Ota käyttöön monimutkainen mikropalveluarkkitehtuuri
5. **Konttisovelluksen käyttöönotto**: Ota käyttöön [Simple Flask API](../../../examples/container-app/simple-flask-api) ja [Microservices Architecture](../../../examples/container-app/microservices) -esimerkit AZD:n avulla

#### Arviointikysymykset
- Kuinka luot mukautettuja Bicep-malleja AZD:lle?
- Mitkä ovat parhaat käytännöt infrastruktuurikoodin järjestämiseen?
- Kuinka käsittelet resurssiriippuvuuksia malleissa?
- Mitkä käyttöönoton mallit tukevat käyttökatkottomia päivityksiä?

---

### Luku 5: Moniagenttiset tekoälyratkaisut (Viikot 6-7)
**Kesto**: 2-3 tuntia | **Vaikeustaso**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Suunnittele ja toteuta moniagenttisia tekoälyarkkitehtuureja
- Orkestroi agenttien koordinointi ja viestintä
- Ota käyttöön tuotantovalmiita tekoälyratkaisuja valvonnalla
- Ymmärrä agenttien erikoistuminen ja työnkulut
- Integroi konttipohjaisia mikropalveluita osaksi moniagenttisia ratkaisuja

#### Keskeiset käsitteet
- Moniagenttiset arkkitehtuurimallit ja suunnitteluperiaatteet
- Agenttien viestintäprotokollat ja tietovirrat
- Kuormituksen tasapainotus ja skaalausstrategiat tekoälyagenteille
- Tuotantovalvonta moniagenttisille järjestelmille
- Palveluiden välinen viestintä konttipohjaisissa ympäristöissä

#### Käytännön harjoitukset
1. **Vähittäiskaupan ratkaisun käyttöönotto**: Ota käyttöön täydellinen moniagenttinen vähittäiskauppaskenaario
2. **Agenttien mukauttaminen**: Muokkaa asiakas- ja varastoagenttien käyttäytymistä
3. **Arkkitehtuurin skaalaus**: Toteuta kuormituksen tasapainotus ja automaattinen skaalaus
4. **Tuotantovalvonta**: Määritä kattava valvonta ja hälytykset
5. **Mikropalveluiden integrointi**: Laajenna [Microservices Architecture](../../../examples/container-app/microservices) -esimerkkiä tukemaan agenttipohjaisia työnkulkuja

#### Arviointikysymykset
- Kuinka suunnittelet tehokkaita moniagenttisia viestintämalleja?
- Mitkä ovat keskeiset näkökohdat tekoälyagenttien työkuormien skaalaamisessa?
- Kuinka valvot ja debuggaat moniagenttisia tekoälyjärjestelmiä?
- Mitkä tuotantomallit varmistavat tekoälyagenttien luotettavuuden?

---

### Luku 6: Esikäyttöönoton validointi ja suunnittelu (Viikko 8)
**Kesto**: 1 tunti | **Vaikeustaso**: ⭐⭐

#### Oppimistavoitteet
- Suorita kattava kapasiteettisuunnittelu ja resurssien validointi
- Valitse optimaaliset Azure SKU:t kustannustehokkuuden saavuttamiseksi
- Toteuta automatisoidut tarkistukset ja validoinnit
- Suunnittele käyttöönotot kustannusoptimointistrategioilla

#### Keskeiset käsitteet
- Azuren resurssikiintiöt ja kapasiteettirajoitukset
- SKU-valintakriteerit ja kustannusoptimointi
- Automatisoidut validointiskriptit ja testaus
- Käyttöönoton suunnittelu ja riskien arviointi

#### Käytännön harjoitukset
1. **Kapasiteettianalyysi**: Analysoi sovellustesi resurssivaatimukset
2. **SKU-optimointi**: Vertaa ja valitse kustannustehokkaat palvelutasot
3. **Validoinnin automaatio**: Toteuta esikäyttöönoton tarkistusskriptit
4. **Kustannussuunnittelu**: Luo käyttöönoton kustannusarviot ja budjetit

#### Arviointikysymykset
- Kuinka validoit Azuren kapasiteetin ennen käyttöönottoa?
- Mitkä tekijät vaikuttavat SKU-valintapäätöksiin?
- Kuinka automatisoit esikäyttöönoton validoinnin?
- Mitkä strategiat auttavat optimoimaan käyttöönoton kustannuksia?

---

### Luku 7: Vianetsintä ja virheenkorjaus (Viikko 9)
**Kesto**: 1-1,5 tuntia | **Vaikeustaso**: ⭐⭐

#### Oppimistavoitteet
- Kehitä järjestelmällisiä vianetsintämenetelmiä AZD-käyttöönottoihin
- Ratkaise yleisiä käyttöönotto- ja konfiguraatio-ongelmia
- Debuggaa tekoälyyn liittyviä ongelmia ja suorituskykyongelmia
- Toteuta valvonta ja hälytykset proaktiiviseen ongelmien havaitsemiseen

#### Keskeiset käsitteet
- Diagnostiikkatekniikat ja lokistrategiat
- Yleiset virhekuviot ja niiden ratkaisut
- Suorituskyvyn valvonta ja optimointi
- Tapahtumien hallinta ja palautusmenettelyt

#### Käytännön harjoitukset
1. **Diagnostiikkataidot**: Harjoittele tarkoituksella rikottujen käyttöönottojen kanssa
2. **Lokianalyysi**: Käytä tehokkaasti Azure Monitoria ja Application Insightsia
3. **Suorituskyvyn hienosäätö**: Optimoi hitaasti toimivia sovelluksia
4. **Palautusmenettelyt**: Toteuta varmuuskopiointi ja katastrofipalautus

#### Arviointikysymykset
- Mitkä ovat yleisimmät AZD-käyttöönoton epäonnistumiset?
- Kuinka debuggaat todennus- ja käyttöoikeusongelmia?
- Mitkä valvontastrategiat auttavat estämään tuotanto-ongelmia?
- Kuinka optimoit sovelluksen suorituskykyä Azuren ympäristössä?

---

### Luku 8: Tuotanto- ja yrityskäytännöt (Viikot 10-11)
**Kesto**: 2-3 tuntia | **Vaikeustaso**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Toteuta yritystason käyttöönoton strategiat
- Suunnittele turvallisuusmallit ja vaatimustenmukaisuuskehykset
- Perusta valvonta, hallinto ja kustannusten hallinta
- Luo skaalautuvia CI/CD-putkia AZD-integraatiolla
- Sovella parhaita käytäntöjä tuotantokonttisovellusten käyttöönottoon (turvallisuus, valvonta, kustannukset, CI/CD)

#### Keskeiset käsitteet
- Yritystason turvallisuus- ja vaatimustenmukaisuusvaatimukset
- Hallintakehykset ja käytäntöjen toteutus
- Edistynyt valvonta ja kustannusten hallinta
- CI/CD-integraatio ja automatisoidut käyttöönoton putket
- Blue-green- ja canary-käyttöönoton strategiat konttipohjaisille työkuormille

#### Käytännön harjoitukset
1. **Yritystason turvallisuus**: Toteuta kattavat turvallisuusmallit
2. **Hallintakehys**: Määritä Azure Policy ja resurssien hallinta
3. **Edistynyt valvonta**: Luo kojelautoja ja automatisoituja hälytyksiä
4. **CI/CD-integraatio**: Rakenna automatisoidut käyttöönoton putket
5. **Tuotantokonttisovellukset**: Sovella turvallisuus-, valvonta- ja kustannusoptimointia [Microservices Architecture](../../../examples/container-app/microservices) -esimerkkiin

#### Arviointikysymykset
- Kuinka toteutat yritystason turvallisuuden AZD-käyttöönottoihin?
- Mitkä hallintamallit varmistavat vaatimustenmukaisuuden ja kustannusten hallinnan?
- Kuinka suunnittelet skaalautuvan valvonnan tuotantojärjestelmille?
- Mitkä CI/CD-mallit toimivat parhaiten AZD-työnkulkujen kanssa?

#### Oppimistavoitteet
- Ymmärrä Azure Developer CLI:n perusteet ja ydinkäsitteet
- Asenna ja määritä azd onnistuneesti kehitysympäristöösi
- Suorita ensimmäinen käyttöönotto olemassa olevan mallin avulla
- Navigoi azd-projektin rakenteessa ja ymmärrä keskeiset komponentit

#### Keskeiset käsitteet
- Mallit, ympäristöt ja
5. Mitä asioita tulee ottaa huomioon monialueisissa käyttöönotossa?

### Moduuli 4: Ennen käyttöönottoa tehtävä validointi (Viikko 5)

#### Oppimistavoitteet
- Toteuta kattavat tarkistukset ennen käyttöönottoa
- Hallitse kapasiteettisuunnittelu ja resurssien validointi
- Ymmärrä SKU-valinta ja kustannusoptimointi
- Rakenna automatisoituja validointiputkia

#### Keskeiset opittavat käsitteet
- Azuren resurssikiintiöt ja rajat
- SKU-valintakriteerit ja kustannusvaikutukset
- Automatisoidut validointiskriptit ja työkalut
- Kapasiteettisuunnittelun menetelmät
- Suorituskykytestaus ja optimointi

#### Harjoitustehtävät

**Harjoitus 4.1: Kapasiteettisuunnittelu**  
```bash
# Toteuta kapasiteetin validointi:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```
  
**Harjoitus 4.2: Ennakkotarkistus**  
```powershell
# Rakenna kattava validointiputki:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```
  
**Harjoitus 4.3: SKU-optimointi**  
```bash
# Optimoi palvelukonfiguraatiot:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```
  

#### Itsearviointikysymykset
1. Mitkä tekijät vaikuttavat SKU-valintapäätöksiin?  
2. Miten validoit Azuren resurssien saatavuuden ennen käyttöönottoa?  
3. Mitkä ovat ennakkotarkistusjärjestelmän keskeiset osat?  
4. Miten arvioit ja hallitset käyttöönoton kustannuksia?  
5. Mitä seurantaa tarvitaan kapasiteettisuunnittelussa?

### Moduuli 5: Vianetsintä ja virheenkorjaus (Viikko 6)

#### Oppimistavoitteet
- Hallitse systemaattiset vianetsintämenetelmät
- Kehitä asiantuntemusta monimutkaisten käyttöönotto-ongelmien virheenkorjauksessa
- Toteuta kattava seuranta ja hälytysjärjestelmä
- Rakenna toimintasuunnitelmat ja palautusmenettelyt

#### Keskeiset opittavat käsitteet
- Yleiset käyttöönoton epäonnistumismallit
- Lokianalyysi ja korrelaatiotekniikat
- Suorituskyvyn seuranta ja optimointi
- Tietoturvapoikkeamien havaitseminen ja reagointi
- Katastrofipalautus ja liiketoiminnan jatkuvuus

#### Harjoitustehtävät

**Harjoitus 5.1: Vianetsintätilanteet**  
```bash
# Harjoittele yleisten ongelmien ratkaisemista:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```
  
**Harjoitus 5.2: Seurannan toteutus**  
```bash
# Aseta kattava seuranta:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```
  
**Harjoitus 5.3: Poikkeamatilanteisiin reagointi**  
```bash
# Laadi tapahtumien käsittelymenettelyt:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```
  

#### Itsearviointikysymykset
1. Mikä on systemaattinen lähestymistapa azd-käyttöönottojen vianetsintään?  
2. Miten yhdistät lokit useiden palveluiden ja resurssien välillä?  
3. Mitkä seurantamittarit ovat kriittisimpiä ongelmien varhaisessa havaitsemisessa?  
4. Miten toteutat tehokkaat katastrofipalautusmenettelyt?  
5. Mitkä ovat poikkeamatilanteisiin reagointisuunnitelman keskeiset osat?

### Moduuli 6: Edistyneet aiheet ja parhaat käytännöt (Viikot 7-8)

#### Oppimistavoitteet
- Toteuta yritystason käyttöönoton mallit
- Hallitse CI/CD-integraatio ja automaatio
- Kehitä mukautettuja malleja ja osallistu yhteisöön
- Ymmärrä edistyneet tietoturva- ja vaatimustenmukaisuusvaatimukset

#### Keskeiset opittavat käsitteet
- CI/CD-putkien integraatiomallit
- Mukautettujen mallien kehitys ja jakelu
- Yrityshallinta ja vaatimustenmukaisuus
- Edistyneet verkko- ja tietoturvakokoonpanot
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
# Luo ja julkaise mukautettuja malleja:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```
  
**Harjoitus 6.3: Yritystason toteutus**  
```bash
# Toteuta yritystason ominaisuuksia:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```
  

#### Itsearviointikysymykset
1. Miten integroit azd:n olemassa oleviin CI/CD-työnkulkuihin?  
2. Mitkä ovat keskeiset näkökohdat mukautettujen mallien kehittämisessä?  
3. Miten toteutat hallinnan ja vaatimustenmukaisuuden azd-käyttöönotossa?  
4. Mitkä ovat parhaat käytännöt yritystason käyttöönottoihin?  
5. Miten osallistut tehokkaasti azd-yhteisöön?

## Käytännön projektit

### Projekti 1: Henkilökohtainen portfoliosivusto  
**Vaikeustaso**: Aloittelija  
**Kesto**: 1-2 viikkoa  

Rakenna ja ota käyttöön henkilökohtainen portfoliosivusto käyttäen:  
- Staattisen verkkosivuston isännöintiä Azure Storagessa  
- Mukautettua verkkotunnuksen määritystä  
- CDN-integraatiota globaalin suorituskyvyn parantamiseksi  
- Automaattista käyttöönoton putkea  

**Toimitettavat**:  
- Toimiva verkkosivusto, joka on otettu käyttöön Azuren kautta  
- Mukautettu azd-malli portfolioiden käyttöönottoa varten  
- Käyttöönoton prosessin dokumentaatio  
- Kustannusanalyysi ja optimointisuositukset  

### Projekti 2: Tehtävienhallintasovellus  
**Vaikeustaso**: Keskitaso  
**Kesto**: 2-3 viikkoa  

Luo täysimittainen tehtävienhallintasovellus, jossa on:  
- React-frontend, joka on otettu käyttöön App Servicessä  
- Node.js API -taustajärjestelmä, jossa on autentikointi  
- PostgreSQL-tietokanta ja migraatiot  
- Application Insights -seuranta  

**Toimitettavat**:  
- Täydellinen sovellus käyttäjäautentikoinnilla  
- Tietokannan skeema ja migraatioskriptit  
- Seurantapaneelit ja hälytyssäännöt  
- Moniympäristöinen käyttöönoton konfiguraatio  

### Projekti 3: Mikroservices-pohjainen verkkokauppa-alusta  
**Vaikeustaso**: Edistynyt  
**Kesto**: 4-6 viikkoa  

Suunnittele ja toteuta mikroservices-pohjainen verkkokauppa-alusta:  
- Useita API-palveluita (katalogi, tilaukset, maksut, käyttäjät)  
- Viestijonointegraatio Service Busin avulla  
- Redis-välimuisti suorituskyvyn optimointiin  
- Kattava lokitus ja seuranta  

**Viite-esimerkki**: Katso [Microservices Architecture](../../../examples/container-app/microservices) tuotantovalmiin mallin ja käyttöönotto-oppaan osalta  

**Toimitettavat**:  
- Täydellinen mikroservices-arkkitehtuuri  
- Palveluiden välinen viestintämalli  
- Suorituskykytestaus ja optimointi  
- Tuotantovalmiin tietoturvan toteutus  

## Arviointi ja sertifiointi

### Tietojen tarkistukset

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

**Moduuli 4 Arviointi**: Ennen käyttöönottoa tehtävä validointi  
- Kapasiteettisuunnittelun tapaustutkimuksia  
- Kustannusoptimointiskenaarioita  
- Validointiputken toteutus  

**Moduuli 5 Arviointi**: Vianetsintä ja virheenkorjaus  
- Ongelman diagnosointiharjoituksia  
- Seurannan toteutustehtäviä  
- Poikkeamatilanteiden simulointeja  

**Moduuli 6 Arviointi**: Edistyneet aiheet  
- CI/CD-putken suunnittelu  
- Mukautettujen mallien kehitys  
- Yritysarkkitehtuurin skenaariot  

### Lopullinen päätösprojekti

Suunnittele ja toteuta kokonaisratkaisu, joka osoittaa kaikkien käsitteiden hallinnan:

**Vaatimukset**:  
- Monitasoinen sovellusarkkitehtuuri  
- Useita käyttöönottoympäristöjä  
- Kattava seuranta ja hälytykset  
- Tietoturvan ja vaatimustenmukaisuuden toteutus  
- Kustannusoptimointi ja suorituskyvyn hienosäätö  
- Täydellinen dokumentaatio ja käyttöohjeet  

**Arviointikriteerit**:  
- Teknisen toteutuksen laatu  
- Dokumentaation kattavuus  
- Tietoturvan ja parhaiden käytäntöjen noudattaminen  
- Suorituskyvyn ja kustannusten optimointi  
- Vianetsinnän ja seurannan tehokkuus  

## Opiskeluresurssit ja viitteet

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

## Opiskeluaikataulusuositukset

### Kokoaikainen opiskelu (8 viikkoa)
- **Viikot 1-2**: Moduulit 1-2 (Aloittaminen, Konfiguraatio)  
- **Viikot 3-4**: Moduulit 3-4 (Käyttöönotto, Ennen käyttöönottoa)  
- **Viikot 5-6**: Moduulit 5-6 (Vianetsintä, Edistyneet aiheet)  
- **Viikot 7-8**: Käytännön projektit ja lopullinen arviointi  

### Osa-aikainen opiskelu (16 viikkoa)
- **Viikot 1-4**: Moduuli 1 (Aloittaminen)  
- **Viikot 5-7**: Moduuli 2 (Konfiguraatio ja ympäristöt)  
- **Viikot 8-10**: Moduuli 3 (Käyttöönotto ja provisiointi)  
- **Viikot 11-12**: Moduuli 4 (Ennen käyttöönottoa tehtävä validointi)  
- **Viikot 13-14**: Moduuli 5 (Vianetsintä ja virheenkorjaus)  
- **Viikot 15-16**: Moduuli 6 (Edistyneet aiheet ja arviointi)  

---

## Edistymisen seuranta ja arviointikehys

### Luvun suorittamisen tarkistuslista

Seuraa edistymistäsi jokaisen luvun läpi näiden mitattavien tulosten avulla:

#### 📚 Luku 1: Perusteet ja nopea aloitus
- [ ] **Asennus valmis**: AZD asennettu ja testattu alustallasi  
- [ ] **Ensimmäinen käyttöönotto**: Onnistunut todo-nodejs-mongo-mallin käyttöönotto  
- [ ] **Ympäristön asennus**: Ensimmäisten ympäristömuuttujien konfigurointi  
- [ ] **Resurssien navigointi**: Tutustuttu Azure-portaalin resursseihin  
- [ ] **Komentojen hallinta**: Perus AZD-komentojen hallinta  

#### 🤖 Luku 2: AI-pohjainen kehitys  
- [ ] **AI-mallin käyttöönotto**: Onnistunut azure-search-openai-demo käyttöönotto  
- [ ] **RAG-toteutus**: Dokumenttien indeksoinnin ja haun konfigurointi  
- [ ] **Mallin konfigurointi**: Useiden AI-mallien asennus eri tarkoituksiin  
- [ ] **AI-seuranta**: Application Insights -seurannan toteutus AI-työkuormille  
- [ ] **Suorituskyvyn optimointi**: AI-sovelluksen suorituskyvyn hienosäätö  

#### ⚙️ Luku 3: Konfiguraatio ja autentikointi
- [ ] **Moniympäristöinen asennus**: Kehitys-, testaus- ja tuotantoympäristöjen konfigurointi  
- [ ] **Tietoturvan toteutus**: Hallitun identiteetin autentikoinnin asennus  
- [ ] **Salaisuuksien hallinta**: Azure Key Vaultin integrointi arkaluontoisille tiedoille  
- [ ] **Parametrien hallinta**: Ympäristökohtaiset konfiguraatiot luotu  
- [ ] **Autentikoinnin hallinta**: Turvallisten pääsypolkujen toteutus  

#### 🏗️ Luku 4: Infrastruktuuri koodina ja käyttöönotto
- [ ] **Mukautetun mallin luominen**: Monipalvelusovelluksen mallin rakentaminen  
- [ ] **Bicep-hallinta**: Modulaaristen, uudelleenkäytettävien infrastruktuurikomponenttien luominen  
- [ ] **Käyttöönoton automaatio**: Ennen/jälkeen käyttöönoton koukkujen toteutus  
- [ ] **Arkkitehtuurin suunnittelu**: Monimutkaisen mikroservices-arkkitehtuurin käyttöönotto  
- [ ] **Mallin optimointi**: Mallien optimointi suorituskyvyn ja kustannusten osalta  

#### 🎯 Luku 5: Moniagenttiset AI-ratkaisut
- [ ] **Vähittäiskaupan ratkaisun käyttöönotto**: Täydellisen moniagenttisen vähittäiskauppaskenaarion käyttöönotto  
- [ ] **Agenttien mukautus**: Asiakas- ja varastoagenttien käyttäytymisen muokkaus  
- [ ] **Arkkitehtuurin skaalaus**: Kuormantasauksen ja automaattisen skaalauksen toteutus  
- [ ] **Tuotannon seuranta**: Kattavan seurannan ja hälytysjärjestelmän asennus  
- [ ] **Suorituskyvyn hienosäätö**: Moniagenttijärjestelmän suorituskyvyn optimointi  

#### 🔍 Luku 6: Ennen käyttöönottoa tehtävä validointi ja suunnittelu
- [ ] **Kapasiteettianalyysi**: Sovellusten resurssivaatimusten analysointi  
- [ ] **SKU-optimointi**: Kustannustehokkaiden palvelutasojen valinta  
- [ ] **Validoinnin automaatio**: Ennen käyttöönottoa tehtävien tarkistusskriptien toteutus  
- [ ] **Kustannussuunnittelu**: Käyttöönoton kustannusarvioiden ja budjettien luominen  
- [ ] **Riskien arviointi**: Käyttöönoton riskien tunnistaminen ja lieventäminen  

#### 🚨 Luku 7: Vianetsintä ja virheenkorjaus
- [ ] **Diagnostiikkataidot**: Onnistunut virheellisten käyttöönottojen vianetsintä  
- [ ] **Lokianalyysi**: Azuren Monitorin ja Application Insightsin tehokas käyttö  
- [ ] **Suorituskyvyn hienosäätö**: Hitaasti toimivien sovellusten optimointi  
- [ ] **Palautusmenettelyt**: V
5. **Yhteisön panos**: Jaa malleja tai parannuksia

#### Ammatillisen kehityksen tulokset
- **Portfolio-projektit**: 8 tuotantovalmiiksi toteutettua julkaisua
- **Tekniset taidot**: Alan standardien mukainen AZD- ja AI-julkaisujen osaaminen
- **Ongelmanratkaisukyky**: Itsenäinen vianetsintä ja optimointi
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Azure-kehittäjäyhteisöön
- **Uramahdollisuudet**: Pilvi- ja AI-rooleihin suoraan soveltuvat taidot

#### Menestysmittarit
- **Julkaisujen onnistumisprosentti**: >95 % onnistuneita julkaisuja
- **Vianetsintäaika**: <30 minuuttia yleisille ongelmille
- **Suorituskyvyn optimointi**: Näyttöä kustannusten ja suorituskyvyn parannuksista
- **Turvallisuusvaatimusten noudattaminen**: Kaikki julkaisut täyttävät yritysturvallisuusstandardit
- **Tiedon jakaminen**: Kyky ohjata muita kehittäjiä

### Jatkuva oppiminen ja yhteisön osallistuminen

#### Pysy ajan tasalla
- **Azure-päivitykset**: Seuraa Azure Developer CLI:n julkaisumuistiinpanoja
- **Yhteisötapahtumat**: Osallistu Azure- ja AI-kehittäjätapahtumiin
- **Dokumentaatio**: Osallistu yhteisön dokumentaatioon ja esimerkkeihin
- **Palaute**: Anna palautetta kurssisisällöstä ja Azure-palveluista

#### Urakehitys
- **Ammatillinen verkosto**: Yhdistä Azure- ja AI-asiantuntijoihin
- **Puhumismahdollisuudet**: Esittele oppimaasi konferensseissa tai tapaamisissa
- **Avoimen lähdekoodin panos**: Osallistu AZD-mallien ja työkalujen kehittämiseen
- **Mentorointi**: Ohjaa muita kehittäjiä heidän AZD-oppimispolullaan

---

**Luvun navigointi:**
- **📚 Kurssin etusivu**: [AZD For Beginners](../README.md)
- **📖 Aloita oppiminen**: [Luku 1: Perusteet ja nopea aloitus](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: Seuraa edistymistäsi kattavan 8-luvun oppimisjärjestelmän avulla
- **🤝 Yhteisö**: [Azure Discord](https://discord.gg/microsoft-azure) tukea ja keskustelua varten

**Opiskelun edistymisen seuranta**: Käytä tätä jäsenneltyä opasta hallitaksesi Azure Developer CLI:n progressiivisen, käytännönläheisen oppimisen avulla, joka tarjoaa mitattavia tuloksia ja ammatillisen kehityksen etuja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Tärkeissä tiedoissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->