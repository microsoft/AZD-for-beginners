# Opintomuistio - Kattavat oppimistavoitteet

**Oppimispolun navigointi**
- **📚 Kurssin etusivu**: [AZD For Beginners](../README.md)
- **📖 Aloita oppiminen**: [Chapter 1: Foundation & Quick Start](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: [Course Completion](../README.md#-course-completion--certification)

## Johdanto

Tämä kattava opintomuistio tarjoaa rakenteelliset oppimistavoitteet, keskeiset käsitteet, käytännön harjoituksia ja arviointimateriaalit auttaakseen sinua hallitsemaan Azure Developer CLI:n (azd) käytön. Käytä tätä opasta seurataaksesi edistymistäsi ja varmistaaksesi, että olet käsitellyt kaikki olennaiset aiheet.

## Oppimistavoitteet

Opintomuistion suorittamalla sinä:
- Hallitset kaikki Azure Developer CLI:n perustason ja edistyneet käsitteet
- Kehität käytännön taitoja Azure-sovellusten käyttöönotossa ja hallinnassa
- Saat varmuutta vikojen selvittämiseen ja käyttöönottojen optimointiin
- Ymmärrät tuotantovalmiit käyttöönotto-käytännöt ja turvallisuusnäkökohdat

## Oppimistulokset

Kun olet suorittanut tämän opintomuistion kaikki osiot, osaat:
- Suunnitella, ottaa käyttöön ja hallita kokonaisia sovellusarkkitehtuureja azd:llä
- Toteuttaa kattavat monitorointi-, turvallisuus- ja kustannusten optimointistrategiat
- Selvittää monimutkaisia käyttöönotto-ongelmia itsenäisesti
- Luoda mukautettuja malleja ja osallistua azd-yhteisöön

## 8-osainen oppimisrakenne

### Luku 1: Perusteet & Pikaopas (Viikko 1)
**Kesto**: 30-45 minuuttia | **Vaativuus**: ⭐

#### Oppimistavoitteet
- Ymmärtää Azure Developer CLI:n keskeiset käsitteet ja terminologia
- Onnistuneesti asentaa ja konfiguroida AZD kehitysalustallasi
- Ota ensimmäinen sovelluksesi käyttöön olemassa olevan mallin avulla
- Navigoida AZD komentoriviliittymässä tehokkaasti

#### Keskeiset käsitteet
- AZD-projektin rakenne ja komponentit (azure.yaml, infra/, src/)
- Mallipohjaiset käyttöönottojen työnkulut
- Ympäristökonfiguraation perusteet
- Resurssiryhmien ja tilauksen hallinta

#### Käytännön harjoitukset
1. **Asennuksen varmistus**: Asenna AZD ja varmista versio `azd version`
2. **Ensimmäinen käyttöönotto**: Ota todo-nodejs-mongo-malli käyttöön onnistuneesti
3. **Ympäristön määritys**: Konfiguroi ensimmäiset ympäristömuuttujasi
4. **Resurssien tutkiminen**: Selaa otettuja resursseja Azure-portaalissa

#### Arviointikysymykset
- Mitkä ovat AZD-projektin ydinkomponentit?
- Miten alustat uuden projektin mallista?
- Mikä on ero `azd up`- ja `azd deploy`-komentojen välillä?
- Miten hallinnoit useita ympäristöjä AZD:llä?

---

### Luku 2: AI-First Development (Viikko 2)
**Kesto**: 1-2 tuntia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Integroida Microsoft Foundry -palveluita AZD-työnkulkuihin
- Ota käyttöön ja konfiguroi tekoälyllä varustettuja sovelluksia
- Ymmärtää RAG (Retrieval-Augmented Generation) -toteutusmallit
- Hallinnoida AI-mallien käyttöönottoja ja skaalausta

#### Keskeiset käsitteet
- Microsoft Foundry Models -palvelun integrointi ja API-hallinta
- AI-haun konfigurointi ja vektori-indeksointi
- Mallien käyttöönotto-strategiat ja kapasiteettisuunnittelu
- AI-sovellusten monitorointi ja suorituskyvyn optimointi

#### Käytännön harjoitukset
1. **AI Chat -käyttöönotto**: Ota azure-search-openai-demo-malli käyttöön
2. **RAG-toteutus**: Konfiguroi dokumenttien indeksointi ja haku
3. **Mallikonfiguraatio**: Aseta useita AI-malleja eri tarkoituksiin
4. **AI-monitorointi**: Toteuta Application Insights AI-kuormituksille

#### Arviointikysymykset
- Miten konfiguroit Microsoft Foundry Models -palvelut AZD-mallissa?
- Mitkä ovat RAG-arkkitehtuurin keskeiset osat?
- Miten hallinnoit AI-mallien kapasiteettia ja skaalausta?
- Mitkä monitorointimittarit ovat tärkeitä AI-sovelluksille?

---

### Luku 3: Konfigurointi & Autentikointi (Viikko 3)
**Kesto**: 45-60 minuuttia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Hallita ympäristöjen konfigurointi- ja hallintastrategiat
- Toteuttaa turvalliset autentikointimallit ja managed identity -ratkaisut
- Organisoida resursseja oikeilla nimeämiskäytännöillä
- Konfiguroida monen ympäristön käyttöönotot (dev, staging, prod)

#### Keskeiset käsitteet
- Ympäristöhierarkia ja konfiguraation etusijajärjestys
- Managed identity ja service principal -autentikointi
- Key Vault -integraatio salaisuuksien hallintaan
- Ympäristökohtainen parametrien hallinta

#### Käytännön harjoitukset
1. **Moniympäristöjen määritys**: Konfiguroi dev-, staging- ja prod-ympäristöt
2. **Turvamääritys**: Toteuta managed identity -autentikointi
3. **Salaisuuksien hallinta**: Integroi Azure Key Vault arkaluonteisille tiedoille
4. **Parametrien hallinta**: Luo ympäristökohtaiset konfiguraatiot

#### Arviointikysymykset
- Miten konfiguroit eri ympäristöt AZD:llä?
- Mitkä ovat managed identityn edut service principalien sijaan?
- Miten hallitset sovelluksen salaisuuksia turvallisesti?
- Mikä on konfiguraation hierarkia AZD:ssä?

---

### Luku 4: Infrastructure as Code & Deployment (Viikko 4-5)
**Kesto**: 1-1.5 tuntia | **Vaativuus**: ⭐⭐⭐

#### Oppimistavoitteet
- Luo ja mukauta Bicep-infrastruktuurimalleja
- Toteuttaa edistyneitä käyttöönottojen malleja ja työnkulkuja
- Ymmärtää resurssien provisiointistrategiat
- Suunnitella skaalautuvia monipalveluarkkitehtuureja

- Ota konttipohjaiset sovellukset käyttöön Azure Container Appsilla ja AZD:llä


#### Keskeiset käsitteet
- Bicep-mallin rakenne ja parhaat käytännöt
- Resurssiriippuvuudet ja käyttöönottojen järjestys
- Parametritiedostot ja mallien modulaarisuus
- Mukautetut hookit ja käyttöönottoautomaatiot
- Container App -käyttöönottomallit (pika-aloitus, tuotanto, mikropalvelut)

#### Käytännön harjoitukset
1. **Mukautetun mallin luominen**: Rakenna monipalveluinen sovellusmalli
2. **Bicep-mestaruus**: Luo modulaarisia, uudelleenkäytettäviä infrastruktuurikomponentteja
3. **Käyttöönottoautomaatiot**: Toteuta pre-/post-käyttöönottohookit
4. **Arkkitehtisuunnittelu**: Ota käyttöön monimutkainen mikropalveluarkkitehtuuri
5. **Container App -käyttöönotto**: Ota [Simple Flask API](../../../examples/container-app/simple-flask-api) ja [Microservices Architecture](../../../examples/container-app/microservices) -esimerkit käyttöön AZD:llä

#### Arviointikysymykset
- Miten luot mukautetut Bicep-mallit AZD:lle?
- Mitkä ovat parhaat käytännöt infrastruktuurikoodin organisointiin?
- Miten käsittelet resurssiriippuvuuksia malleissa?
- Mitkä käyttöönottojen mallit tukevat nollakatkoksetonta päivitystä?

---

### Luku 5: Multi-Agent AI Solutions (Viikko 6-7)
**Kesto**: 2-3 tuntia | **Vaativuus**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Suunnitella ja toteuttaa multi-agent -AI-arkkitehtuureja
- Orkestroi agenttien koordinointi ja kommunikointi
- Ota tuotantovalmiit AI-ratkaisut käyttöön monitoroinnin kanssa
- Ymmärtää agenttien erikoistuminen ja työnkulkujen mallit
- Integroida konttipohjaiset mikropalvelut osaksi multi-agent -ratkaisuja

#### Keskeiset käsitteet
- Multi-agent -arkkitehtuurin mallit ja suunnitteluperiaatteet
- Agenttien kommunikointiprotokollat ja datavirtaus
- Kuormantasauksen ja skaalausstrategiat AI-agenttien kohdalla
- Tuotannon monitorointi multi-agent -järjestelmille
- Palvelu-palvelulle -kommunikointi konttipohjaisissa ympäristöissä

#### Käytännön harjoitukset
1. **Vähittäiskaupan skenaarion käyttöönotto**: Ota käyttöön täydellinen multi-agent -vähittäiskaupan skenaario
2. **Agenttien muokkaus**: Muokkaa Customer- ja Inventory-agenttien käyttäytymistä
3. **Arkkitehtuurin skaalaus**: Toteuta kuormantasaus ja automaattinen skaalaus
4. **Tuotantoseuranta**: Aseta kattava monitorointi ja hälytys
5. **Mikropalvelujen integraatio**: Laajenna [Microservices Architecture](../../../examples/container-app/microservices) -esimerkkiä tukemaan agenttipohjaisia työnkulkuja

#### Arviointikysymykset
- Miten suunnittelet tehokkaita multi-agent -kommunikaatiomalleja?
- Mitkä ovat tärkeimmät huomioitavat seikat AI-agenttien kuormituksen skaalaamisessa?
- Miten monitoroit ja debuggaat multi-agent -AI-järjestelmiä?
- Mitkä tuotantokäytännöt varmistavat AI-agenttien luotettavuuden?

---

### Luku 6: Pre-Deployment Validation & Planning (Viikko 8)
**Kesto**: 1 tunti | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Suorittaa kattava kapasiteettisuunnittelu ja resurssien validointi
- Valita optimaaliset Azure SKU:t kustannustehokkuuden perusteella
- Toteuttaa automatisoituja esitarkistuksia ja validointeja
- Suunnitella käyttöönotot kustannusten optimoinnin näkökulmasta

#### Keskeiset käsitteet
- Azuren resurssikiintiöt ja kapasiteettirajoitukset
- SKU-valinnan kriteerit ja kustannusoptimointi
- Automaattiset validointiskriptit ja testaus
- Käyttöönottojen suunnittelu ja riskien arviointi

#### Käytännön harjoitukset
1. **Kapasiteettianalyysi**: Analysoi sovellustesi resurssitarpeet
2. **SKU-optimointi**: Vertaa ja valitse kustannustehokkaita palvelutasoja
3. **Validointiautomaatio**: Toteuta esikäyttöönoton tarkistusskriptit
4. **Kustannussuunnittelu**: Laadi käyttöönoton kustannusarviot ja budjetit

#### Arviointikysymykset
- Miten validoit Azuren kapasiteetin ennen käyttöönottoa?
- Mitkä tekijät vaikuttavat SKU-valintoihin?
- Miten automatisoit esikäyttöönoton validoinnin?
- Mitkä strategiat auttavat optimoimaan käyttöönoton kustannuksia?

---

### Luku 7: Troubleshooting & Debugging (Viikko 9)
**Kesto**: 1-1.5 tuntia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Kehittää systemaattisia debuggausmenetelmiä AZD-käyttöönottoihin
- Ratkoa yleisimpiä käyttöönotto- ja konfigurointihaasteita
- Debugata AI-spesifisiä ongelmia ja suorituskykyongelmia
- Toteuttaa monitorointi ja hälytykset proaktiiviseen ongelmien havaitsemiseen

#### Keskeiset käsitteet
- Diagnostiikkatekniikat ja lokitusstrategiat
- Yleisimmät virhekuviot ja niiden ratkaisut
- Suorituskyvyn monitorointi ja optimointi
- Incident response ja palautusmenettelyt

#### Käytännön harjoitukset
1. **Diagnostiikkataidot**: Harjoittele tahallisesti rikotuilla käyttöönottoilla
2. **Lokien analyysi**: Käytä Azure Monitoria ja Application Insightsia tehokkaasti
3. **Suorituskyvyn optimointi**: Optimoi hitaasti toimivia sovelluksia
4. **Palautusmenettelyt**: Toteuta varmuuskopiointi ja katastrofipalautus

#### Arviointikysymykset
- Mitkä ovat yleisimmät AZD-käyttöönottojen virheet?
- Miten debuggaat autentikointi- ja käyttöoikeusongelmia?
- Mitkä monitorointistrategiat auttavat estämään tuotanto-ongelmia?
- Miten optimoit sovelluksen suorituskykyä Azuressa?

---

### Luku 8: Production & Enterprise Patterns (Viikko 10-11)
**Kesto**: 2-3 tuntia | **Vaativuus**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Toteuttaa yritystason käyttöönotto-strategioita
- Suunnitella turvallisuusmalleja ja vaatimustenmukaisuusrakenteita
- Vakiinnuttaa monitorointi, governance ja kustannusten hallinta
- Luoda skaalautuvat CI/CD-putket AZD-integraatiolla
- Soveltaa parhaat käytännöt tuotannon container app -käyttöönottoihin (turvallisuus, monitorointi, kustannukset, CI/CD)

#### Keskeiset käsitteet
- Yritystason turvallisuus- ja vaatimustenmukaisuusvaatimukset
- Governance-kehykset ja politiikkojen toteutus
- Edistynyt monitorointi ja kustannusten hallinta
- CI/CD-integraatio ja automatisoidut käyttöönotto-putket
- Blue-green ja canary-käyttöönotto-strategiat konttipohjaisille kuormille

#### Käytännön harjoitukset
1. **Yritysturvallisuus**: Toteuta kattavat turvallisuusmallit
2. **Governance-kehys**: Ota käyttöön Azure Policy ja resurssien hallinta
3. **Edistynyt monitorointi**: Luo dashboardit ja automatisoidut hälytykset
4. **CI/CD-integraatio**: Rakenna automatisoidut käyttöönotto-putket
5. **Tuotannon Container Apps**: Sovella turvallisuutta, monitorointia ja kustannusoptimointia [Microservices Architecture](../../../examples/container-app/microservices) -esimerkkiin

#### Arviointikysymykset
- Miten toteutat yritystason turvallisuuden AZD-käyttöönotossa?
- Mitkä governance-käytännöt varmistavat vaatimustenmukaisuuden ja kustannusten hallinnan?
- Miten suunnittelet skaalautuvan monitoroinnin tuotantojärjestelmille?
- Mitkä CI/CD-mallit toimivat parhaiten AZD-työnkulkujen kanssa?

#### Oppimistavoitteet
- Ymmärtää Azure Developer CLI:n perusasiat ja keskeiset käsitteet
- Onnistuneesti asentaa ja konfiguroida azd kehitysympäristössäsi
- Saada ensimmäinen käyttöönotto valmiiksi olemassa olevaa mallia käyttäen
- Navigoida azd-projektin rakenteessa ja ymmärtää keskeiset komponentit

#### Keskeiset käsitteet
- Mallit, ympäristöt ja palvelut
- azure.yaml -konfiguraation rakenne
- Perus azd-komennot (init, up, down, deploy)
- Infrastructure as Code -periaatteet
- Azure-autentikointi ja valtuutus

#### Käytännön harjoitukset

**Harjoitus 1.1: Asennus ja käyttöönotto**
```bash
# Suorita nämä tehtävät:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Harjoitus 1.2: Ensimmäinen käyttöönotto**
```bash
# Ota käyttöön yksinkertainen verkkosovellus:
1. Initialize project: azd init --template todo-nodejs-mongo
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Harjoitus 1.3: Projektirakenteen analyysi**
```
Analyze the following components:
1. azure.yaml - service definitions and hooks
2. infra/ directory - Bicep templates and modules
3. src/ directory - application source code
4. .azure/ directory - environment configurations
```

#### Itsearviointikysymykset
1. Mitkä ovat azd-arkkitehtuurin kolme ydinkäsitettä?
2. Mikä on azure.yaml-tiedoston tarkoitus?
3. Miten ympäristöt auttavat hallitsemaan eri käyttöönotto kohteita?
4. Mitä autentikointimenetelmiä voidaan käyttää azd:n kanssa?
5. Mitä tapahtuu, kun suoritat `azd up` ensimmäisen kerran?

---

## Edistymisen seuranta ja arviointikehys
```bash
# Luo ja konfiguroi useita ympäristöjä:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Harjoitus 2.2: Edistynyt konfigurointi**
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Harjoitus 2.3: Turvakonfigurointi**
```bash
# Toteuta turvallisuuden parhaat käytännöt:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Itsearviointikysymykset
1. Miten azd käsittelee ympäristömuuttujien etusijajärjestystä?
2. Mitkä ovat deployment hookit ja milloin niitä tulisi käyttää?
3. Miten konfiguroit eri SKU:t eri ympäristöille?
4. Mitkä ovat eri autentikointimenetelmien turvallisuusvaikutukset?
5. Miten hallitset salaisuuksia ja arkaluonteista konfiguraatiotietoa?

### Moduuli 3: Käyttöönotto ja provisiointi (Viikko 4)

#### Oppimistavoitteet
- Hallita käyttöönottojen työnkulkuja ja parhaat käytännöt
- Ymmärtää Infrastructure as Code Bicep-malleilla
- Toteuttaa monimutkaisia monipalveluarkkitehtuureja
- Optimoida käyttöönottojen suorituskyky ja luotettavuus

#### Keskeiset käsitteet
- Bicep-mallin rakenne ja moduulit
- Resurssiriippuvuudet ja järjestys
- Käyttöönotto-strategiat (blue-green, rolling updates)
- Monialueiset käyttöönotot
- Tietokantamuutokset ja datanhallinta

#### Käytännön harjoitukset

**Harjoitus 3.1: Mukautettu infrastruktuuri**
```bicep
// Create custom Bicep templates for:
1. Web application with custom domain and SSL
2. Database with backup and high availability
3. Storage account with access policies
4. Monitoring and logging configuration
5. Network security groups and virtual networks
```

**Harjoitus 3.2: Monipalvelusovellus**
```bash
# Ota käyttöön mikropalveluarkkitehtuuri:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Harjoitus 3.3: Tietokantaintegraatio**
```bash
# Toteuta tietokannan käyttöönoton mallit:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Itsearviointikysymykset
1. Mitkä ovat Bicepin etuja ARM-malleihin verrattuna?
2. Miten käsittelet tietokantamuutoksia azd-käyttöönotossa?
3. Mitä strategioita on nollakatkoksettomiin käyttöönottoihin?
4. Miten hallinnoit riippuvuuksia palveluiden välillä?
5. Mitkä tekijät tulee huomioida monialueisissa käyttöönotossa?

### Moduuli 4: Pre-Deployment Validation (Viikko 5)

#### Oppimistavoitteet
- Toteuta kattavat ennen käyttöönottoa tehtävät tarkistukset
- Hallitse kapasiteettisuunnittelu ja resurssien validointi
- Ymmärrä SKU-valinta ja kustannusten optimointi
- Rakenna automatisoidut validointiputket

#### Hallittavat keskeiset käsitteet
- Azure-resurssien kiintiöt ja rajoitukset
- SKU-valintakriteerit ja kustannusvaikutukset
- Automaattiset validointiskriptit ja -työkalut
- Kapasiteettisuunnittelumenetelmät
- Suorituskyvyn testaus ja optimointi

#### Harjoitustehtävät

**Exercise 4.1: Capacity Planning**
```bash
# Toteuta kapasiteetin validointi:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Exercise 4.2: Pre-flight Validation**
```powershell
# Rakenna kattava validointiputki:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Exercise 4.3: SKU Optimization**
```bash
# Optimoi palvelukonfiguraatiot:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Itsearviointikysymykset
1. Mitkä tekijät tulisi vaikuttaa SKU-valintapäätöksiin?
2. Kuinka validoit Azure-resurssien saatavuuden ennen käyttöönottoa?
3. Mitkä ovat esilennontarkistusjärjestelmän keskeiset osat?
4. Kuinka arvioit ja hallitset käyttöönoton kustannuksia?
5. Mikä seuranta on oleellista kapasiteettisuunnittelussa?

### Module 5: Troubleshooting and Debugging (Week 6)

#### Learning Objectives
- Hallitse järjestelmälliset vianetsintämenetelmät
- Kehitä asiantuntemusta monimutkaisten käyttöönotto-ongelmien debuggaamiseen
- Ota käyttöön kattava valvonta ja hälytykset
- Rakenna häiriötilanteiden käsittely- ja palautusmenettelyt

#### Hallittavat keskeiset käsitteet
- Yleiset käyttöönottojen epäonnistumismallit
- Lokien analysointi ja korrelaatiotekniikat
- Suorituskyvyn seuranta ja optimointi
- Tietoturvapoikkeamien havaitseminen ja reagointi
- Disaster recovery ja liiketoiminnan jatkuvuus

#### Harjoitustehtävät

**Exercise 5.1: Troubleshooting Scenarios**
```bash
# Harjoittele yleisten ongelmien ratkaisemista:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Exercise 5.2: Monitoring Implementation**
```bash
# Ota käyttöön kattava valvonta:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Exercise 5.3: Incident Response**
```bash
# Laadi häiriötilanteiden reagointimenettelyt:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Itsearviointikysymykset
1. Mikä on systemaattinen lähestymistapa azd-käyttöönottojen vianmääritykseen?
2. Kuinka korreloit lokeja useiden palveluiden ja resurssien välillä?
3. Mitkä seurannan mittarit ovat kriittisimpiä varhaiseen ongelmien havaitsemiseen?
4. Kuinka toteutat tehokkaat disaster recovery -menettelyt?
5. Mitkä ovat incident response -suunnitelman keskeiset osat?

### Module 6: Advanced Topics and Best Practices (Week 7-8)

#### Learning Objectives
- Ota käyttöön yritystason käyttöönottojen mallit
- Hallitse CI/CD-integraatio ja automaatio
- Kehitä mukautettuja templateja ja osallistu yhteisöön
- Ymmärrä kehittyneet turvallisuus- ja vaatimustenmukaisuusvaatimukset

#### Hallittavat keskeiset käsitteet
- CI/CD-putkien integraatiomallit
- Mukautettujen templatejen kehitys ja jakelu
- Yrityshallinto ja vaatimustenmukaisuus
- Edistyneet verkko- ja tietoturva-asetukset
- Suorituskyvyn optimointi ja kustannusten hallinta

#### Harjoitustehtävät

**Exercise 6.1: CI/CD Integration**
```yaml
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Exercise 6.2: Custom Template Development**
```bash
# Luo ja julkaise mukautettuja malleja:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Exercise 6.3: Enterprise Implementation**
```bash
# Toteuta yritystason ominaisuuksia:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Itsearviointikysymykset
1. Kuinka integroit azd olemassa oleviin CI/CD-työnkulkuihin?
2. Mitkä ovat keskeiset huomioitavat seikat mukautettujen templatejen kehityksessä?
3. Kuinka toteutat governancen ja vaatimustenmukaisuuden azd-käyttöönotossa?
4. Mitkä ovat parhaat käytännöt yritystason käyttöönottoihin?
5. Kuinka kontribuoit tehokkaasti azd-yhteisöön?

## Käytännön projektit

### Project 1: Personal Portfolio Website
**Complexity**: Beginner  
**Duration**: 1-2 weeks

Rakenna ja ota käyttöön henkilökohtainen portfoliosivusto käyttäen:
- Staattisen verkkosivuston hosting Azure Storage -palvelussa
- Mukautetun verkkotunnuksen konfigurointi
- CDN-integraatio globaalin suorituskyvyn parantamiseksi
- Automaattinen käyttöönotto putki

**Toimitukset**:
- Toimiva sivusto, joka on otettu käyttöön Azureen
- Mukautettu azd-template portfoliosivustojen käyttöönottoon
- Käyttöönoton dokumentaatio
- Kustannusanalyysi ja optimointisuositukset

### Project 2: Task Management Application
**Complexity**: Intermediate  
**Duration**: 2-3 weeks

Luo full-stack-tehtävienhallintasovellus, joka sisältää:
- React-frontend, joka on deployattu App Serviceen
- Node.js API backend autentikoinnilla
- PostgreSQL-tietokanta migraatioilla
- Application Insights -valvonta

**Toimitukset**:
- Täydellinen sovellus käyttäjäautentikoinnilla
- Tietokantaskeema ja migraatioskiptit
- Valvontapaneelit ja hälytyssäännöt
- Moniympäristöinen käyttöönoton konfiguraatio

### Project 3: Microservices E-commerce Platform
**Complexity**: Advanced  
**Duration**: 4-6 weeks

Suunnittele ja toteuta mikropalvelupohjainen e-kauppa-alusta:
- Useita API-palveluita (catalog, orders, payments, users)
- Viestijonointegraatio Service Busin kanssa
- Redis-cache suorituskyvyn optimointiin
- Kattava lokitus ja valvonta

**Viiteesimerkki**: Katso [Mikropalveluarkkitehtuuri](../../../examples/container-app/microservices) tuotantovalmiista templatesta ja käyttöönotto-oppaasta

**Toimitukset**:
- Täydellinen mikropalveluarkkitehtuuri
- Palveluiden välisten kommunikointimallien dokumentaatio
- Suorituskyvyn testaus ja optimointi
- Tuotantovalmiit tietoturvaratkaisut

## Arviointi ja sertifiointi

### Tietotarkistukset

Suorita nämä arvioinnit kunkin moduulin jälkeen:

**Module 1 Assessment**: Peruskäsitteet ja asennus
- Monivalintakysymyksiä ydinaiheista
- Käytännön asennus- ja konfiguraatiotehtäviä
- Yksinkertainen käyttöönottoharjoitus

**Module 2 Assessment**: Konfigurointi ja ympäristöt
- Ympäristöhallinnan skenaariot
- Konfiguraation vianetsintäharjoitukset
- Turvallisuuskonfiguraation toteutus

**Module 3 Assessment**: Käyttöönotto ja provisiointi
- Infrastruktuurin suunnittelun haasteet
- Monipalveluiden käyttöönotto-skenaariot
- Suorituskyvyn optimointiharjoitukset

**Module 4 Assessment**: Ennen käyttöönottoa tehtävät validoinnit
- Kapasiteettisuunnittelun tapaustutkimukset
- Kustannusoptimointiskenaariot
- Validointiputken toteutus

**Module 5 Assessment**: Vianmääritys ja debuggaus
- Ongelman diagnosointiharjoitukset
- Valvonnan toteutustehtävät
- Incidenssiskenaarioiden simuloinnit

**Module 6 Assessment**: Edistyneet aiheet
- CI/CD-putken suunnittelu
- Mukautettujen templatejen kehitys
- Yritysarkkitehtuurin skenaariot

### Lopullinen Capstone-projekti

Suunnittele ja toteuta kokonaisratkaisu, joka osoittaa kaikkien käsitteiden hallinnan:

**Vaatimukset**:
- Monikerroksinen sovellusarkkitehtuuri
- Useita käyttöönottoympäristöjä
- Kattava valvonta ja hälytykset
- Tietoturva- ja vaatimustenmukaisuuden toteutus
- Kustannusten optimointi ja suorituskyvyn hienosäätö
- Täydellinen dokumentaatio ja runbookit

**Arviointikriteerit**:
- Tekninen toteutuksen laatu
- Dokumentaation kattavuus
- Tietoturva ja parhaiden käytäntöjen noudattaminen
- Suorituskyky ja kustannusoptimointi
- Vianmäärityksen ja valvonnan tehokkuus

## Opiskelu- ja viitetiedot

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

## Opiskeluohjelmaehdotukset

### Kokopäiväinen opiskelu (8 viikkoa)
- **Viikot 1-2**: Modulien 1-2 (Aloittaminen, Konfigurointi)
- **Viikot 3-4**: Modulien 3-4 (Käyttöönotto, Ennen käyttöönottoa)
- **Viikot 5-6**: Modulien 5-6 (Vianmääritys, Edistyneet aiheet)
- **Viikot 7-8**: Käytännön projektit ja loppuarviointi

### Osa-aikainen opiskelu (16 viikkoa)
- **Viikot 1-4**: Moduuli 1 (Aloittaminen)
- **Viikot 5-7**: Moduuli 2 (Konfigurointi ja ympäristöt)
- **Viikot 8-10**: Moduuli 3 (Käyttöönotto ja provisiointi)
- **Viikot 11-12**: Moduuli 4 (Ennen käyttöönottoa tehtävät validoinnit)
- **Viikot 13-14**: Moduuli 5 (Vianmääritys ja debuggaus)
- **Viikot 15-16**: Moduuli 6 (Edistyneet aiheet ja arviointi)

---

## Edistymisen seuranta ja arviointikehys

### Luvun suorituschecklista

Seuraa edistymistäsi kunkin luvun läpi näillä mitattavilla tuloksilla:

#### 📚 Luku 1: Perusta & pika-aloitus
- [ ] **Installation Complete**: AZD asennettu ja vahvistettu alustallasi
- [ ] **First Deployment**: todo-nodejs-mongo -templaten onnistunut käyttöönotto
- [ ] **Environment Setup**: Ensimmäisten ympäristömuuttujien konfigurointi
- [ ] **Resource Navigation**: Tutkinut otetut resurssit Azure-portaalissa
- [ ] **Command Mastery**: Tunnet olosi mukavaksi perus AZD -komennoissa

#### 🤖 Luku 2: AI-ensijainen kehitys  
- [ ] **AI Template Deployment**: azure-search-openai-demo otettu onnistuneesti käyttöön
- [ ] **RAG Implementation**: Dokumenttien indeksoinnin ja hakemisen konfigurointi
- [ ] **Model Configuration**: Useiden AI-mallien asennus eri käyttötarkoituksiin
- [ ] **AI Monitoring**: Application Insightsin käyttöönotto AI-kuormituksille
- [ ] **Performance Optimization**: AI-sovelluksen suorituskyvyn hienosäätö

#### ⚙️ Luku 3: Konfigurointi & autentikointi
- [ ] **Multi-Environment Setup**: dev-, staging- ja prod-ympäristöjen konfigurointi
- [ ] **Security Implementation**: Managed identity -autentikoinnin käyttöönotto
- [ ] **Secrets Management**: Azure Key Vaultin integrointi arkaluontoisille tiedoille
- [ ] **Parameter Management**: Ympäristökohtaiset konfiguraatiot luotu
- [ ] **Authentication Mastery**: Turvallisten käyttöoikeusmallien toteutus

#### 🏗️ Luku 4: Infrastructure as Code & käyttöönotto
- [ ] **Custom Template Creation**: Rakennettu monipalvelusovelluksen mukautettu template
- [ ] **Bicep Mastery**: Luotu modulaarisia, uudelleenkäytettäviä infrastruktuurikomponentteja
- [ ] **Deployment Automation**: Esija/täki-käyttöönottohookien toteutus
- [ ] **Architecture Design**: Monimutkaisen mikropalveluarkkitehtuurin käyttöönotto
- [ ] **Template Optimization**: Templatejen optimointi suorituskyvyn ja kustannusten kannalta

#### 🎯 Luku 5: Multi-Agent AI -ratkaisut
- [ ] **Retail Solution Deployment**: Täydellisen multi-agent -vähittäismallitoteutuksen käyttöönotto
- [ ] **Agent Customization**: Customer- ja Inventory-agenttien käyttäytymisen muokkaus
- [ ] **Architecture Scaling**: Kuormantasauksen ja auto-scalingin toteutus
- [ ] **Production Monitoring**: Kattavan valvonnan ja hälytysten käyttöönotto
- [ ] **Performance Tuning**: Multi-agent -järjestelmän suorituskyvyn optimointi

#### 🔍 Luku 6: Ennen käyttöönottoa tehtävät validoinnit & suunnittelu
- [ ] **Capacity Analysis**: Sovellusten resurssivaatimusten analysointi
- [ ] **SKU Optimization**: Kustannustehokkaiden palvelutasojen valinta
- [ ] **Validation Automation**: Ennen käyttöönottoa tehtävien tarkistusskriptien toteutus
- [ ] **Cost Planning**: Käyttöönoton kustannusarvioiden ja budjettien laatiminen
- [ ] **Risk Assessment**: Käyttöönottoon liittyvien riskien tunnistaminen ja lieventäminen

#### 🚨 Luku 7: Vianmääritys & debuggaus
- [ ] **Diagnostic Skills**: Tarkoituksella rikkinäisten käyttöönottojen debuggaus onnistuneesti
- [ ] **Log Analysis**: Azure Monitorin ja Application Insightsin tehokas hyödyntäminen
- [ ] **Performance Tuning**: Hitaiden sovellusten suorituskyvyn optimointi
- [ ] **Recovery Procedures**: Varautumisen ja disaster recovery -menettelyjen toteutus
- [ ] **Monitoring Setup**: Ennakoivan valvonnan ja hälytysten luominen

#### 🏢 Luku 8: Tuotanto & yritystason mallit
- [ ] **Enterprise Security**: Kattavien tietoturvamallien toteutus
- [ ] **Governance Framework**: Azure Policyn ja resurssien hallinnan käyttöönotto
- [ ] **Advanced Monitoring**: Paneelien ja automaattisten hälytysten luominen
- [ ] **CI/CD Integration**: Automaattisten käyttöönotto-putkien rakentaminen
- [ ] **Compliance Implementation**: Yritystason vaatimustenmukaisuuden täyttäminen

### Oppimisaikataulu ja virstanpylväät

#### Viikot 1-2: Perustan rakentaminen
- **Virstanpylväs**: Ota ensimmäinen AI-sovellus käyttöön AZD:llä
- **Varmistus**: Toimiva sovellus julkisessa URL-osoitteessa
- **Taidot**: Perus-AZD-työnkulut ja AI-palveluiden integrointi

#### Viikot 3-4: Konfiguraation hallinta
- **Virstanpylväs**: Moniympäristöinen käyttöönotto turvallisella autentikoinnilla
- **Varmistus**: Sama sovellus otettu käyttöön dev/staging/prod -ympäristöihin
- **Taidot**: Ympäristöhallinta ja turvallisuuden toteutus

#### Viikot 5-6: Infrastruktuurin asiantuntemus
- **Virstanpylväs**: Mukautettu template monipalvelusovellukselle
- **Varmistus**: Uudelleenkäytettävä template otettu käyttöön toisen tiimin toimesta
- **Taidot**: Bicep-osaaminen ja infrastruktuurin automaatio

#### Viikot 7-8: Edistynyt AI-toteutus
- **Virstanpylväs**: Tuotantovalmiin multi-agent -AI-ratkaisun toteutus
- **Varmistus**: Järjestelmä kestää todellisen kuorman valvonnalla
- **Taidot**: Multi-agent -orkestrointi ja suorituskyvyn optimointi

#### Viikot 9-10: Tuotantovalmius
- **Virstanpylväs**: Yritystason käyttöönotto täydessä vaatimustenmukaisuudessa
- **Varmistus**: Hyväksyntä tietoturvatarkastuksesta ja kustannusoptimointiauditista
- **Taidot**: Governance, valvonta ja CI/CD-integraatio

### Arviointi ja sertifiointi

#### Tiedon varmistusmenetelmät
1. **Käytännön käyttöönotot**: Toimivat sovellukset jokaiselle luvulle
2. **Koodiarvioinnit**: Templatejen ja konfiguraatioiden laadun arviointi
3. **Ongelmanratkaisu**: Vianmääritysskenaarioiden ratkaisut
4. **Vertaisopetus**: Selitä käsitteitä muille oppijoille
5. **Yhteisöpanos**: Jaa templateja tai parannuksia

#### Ammatillisen kehityksen tulokset
- **Portfolioprojektit**: 8 tuotantovalmista käyttöönottoa
- **Tekniset taidot**: Alan standardin mukainen AZD- ja AI-käyttöönotto-osaaminen
- **Ongelmanratkaisutaidot**: Itsenäinen vianmääritys ja optimointi
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Azure-kehittäjäyhteisöön
- **Uran eteneminen**: Taidot suoraan sovellettavissa pilvi- ja AI-rooleihin

#### Menestysmittarit
- **Käyttöönottojen onnistumisprosentti**: >95% onnistunutta käyttöönottoa
- **Vianetsintäaika**: <30 minuuttia yleisten ongelmien kohdalla
- **Suorituskyvyn optimointi**: Todennettavissa olevia parannuksia kustannuksissa ja suorituskyvyssä
- **Tietoturvan noudattaminen**: Kaikki käyttöönotot täyttävät yrityksen tietoturvastandardit
- **Tietämyksen siirto**: Kyky mentorointiin muille kehittäjille

### Jatkuva oppiminen ja yhteisöosallistuminen

#### Pysy ajan tasalla
- **Azure-päivitykset**: Seuraa Azure Developer CLI:n julkaisumuistiinpanoja
- **Yhteisötapahtumat**: Osallistu Azure- ja AI-kehittäjätapahtumiin
- **Dokumentaatio**: Osallistu yhteisön dokumentaatioon ja esimerkkien laatimiseen
- **Palautesilmukka**: Anna palautetta kurssisisällöstä ja Azure-palveluista

#### Urakehitys
- **Ammatillinen verkosto**: Verkostoidu Azure- ja AI-asiantuntijoiden kanssa
- **Puhumismahdollisuudet**: Esittele oppejasi konferensseissa tai meetup-tapahtumissa
- **Open source -panos**: Osallistu AZD-mallien ja työkalujen kehittämiseen
- **Mentorointi**: Ohjaa muita kehittäjiä heidän AZD-oppimispolullaan

---

**Lukujen navigointi:**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../README.md)
- **📖 Aloita oppiminen**: [Luku 1: Perusta & Pikakäynnistys](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: Seuraa etenemistäsi kattavan 8-osaisen oppimisjärjestelmän kautta
- **🤝 Yhteisö**: [Azure Discord](https://discord.gg/microsoft-azure) tukea ja keskustelua varten

**Opintojen edistymisen seuranta**: Käytä tätä jäsenneltyä opasta hallitaksesi Azure Developer CLI:n asteittaisen, käytännönläheisen oppimisen avulla, joka tarjoaa mitattavissa olevia tuloksia ja ammatillisen kehityksen etuja.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattikäännöksissä voi esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä on pidettävä määräävänä lähteenä. Kriittisten tietojen osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa mistään väärinymmärryksistä tai virheellisistä tulkinnoista, jotka johtuvat tämän käännöksen käytöstä.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->