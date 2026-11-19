# Opas - Laajat oppimistavoitteet

**Oppimispolun navigointi**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Aloita oppiminen**: [Luku 1: Perusteet & Nopeasti alkuun](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: [Kurssin suoritus](../README.md#-course-completion--certification)

## Johdanto

Tämä laaja opas tarjoaa jäsennellyt oppimistavoitteet, keskeiset käsitteet, harjoitustehtävät ja arviointimateriaalit auttaakseen sinua hallitsemaan Azure Developer CLI:n (azd) käytön. Käytä opasta seurataksesi edistymistäsi ja varmistaaksesi, että olet katsonut kaikki olennaiset aihealueet.

## Oppimistavoitteet

Tämän oppaan suorittamalla sinä:
- Hallitset kaikki Azure Developer CLI:n perus- ja edistyneet käsitteet
- Kehität käytännön taitoja Azure-sovellusten käyttöönotossa ja hallinnassa
- Saat itsevarmuutta vianmääritykseen ja käyttöönottojen optimointiin
- Ymmärrät tuotantovalmiiden käyttöönottojen käytännöt ja turvallisuusnäkökohdat

## Oppimisen tulokset

Kun olet suorittanut kaikki tämän oppaan osiot, osaat:
- Suunnitella, ottaa käyttöön ja hallita täydellisiä sovellusarkkitehtuureja azd:llä
- Toteuttaa kattavan seurannan, turvallisuuden ja kustannusten optimoinnin strategiat
- Vianmäärittää monimutkaisia käyttöönotto-ongelmia itsenäisesti
- Luoda räätälöityjä malleja ja osallistua azd-yhteisöön

## 8 luvun oppimisrakenne

### Luku 1: Perusteet & Nopeasti alkuun (Viikko 1)
**Kesto**: 30-45 minuuttia | **Vaativuus**: ⭐

#### Oppimistavoitteet
- Ymmärtää Azure Developer CLI:n ydinkäsitteet ja terminologia
- Onnistuneesti asentaa ja konfiguroida AZD kehitysympäristöllesi
- Ottaa käyttöön ensimmäinen sovelluksesi valmiin mallin avulla
- Hallita AZD komentorivikäyttöliittymän navigointi tehokkaasti

#### Hallittavat keskeiset käsitteet
- AZD-projektin rakenne ja komponentit (azure.yaml, infra/, src/)
- Mallipohjaiset käyttöönoton työnkulut
- Ympäristöasetusten perusteet
- Resurssiryhmien ja tilauksen hallinta

#### Käytännön harjoitukset
1. **Asennuksen tarkistus**: Asenna AZD ja varmista `azd version` kanssa
2. **Ensimmäinen käyttöönotto**: Ota käyttöön todo-nodejs-mongo-malli onnistuneesti
3. **Ympäristön määritys**: Määritä ensimmäiset ympäristömuuttujasi
4. **Resurssien selailu**: Tutki otettuja resursseja Azure-portaalissa

#### Arviointikysymykset
- Mitkä ovat AZD-projektin ydinkomponentit?
- Kuinka aloitat uuden projektin mallin pohjalta?
- Mikä on ero `azd up` ja `azd deploy` välillä?
- Kuinka hallitset useita ympäristöjä AZD:llä?

---

### Luku 2: Tekoälylähtöinen kehitys (Viikko 2)
**Kesto**: 4-5 tuntia sisältäen työpajan | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Integroi Microsoft Foundry -palvelut AZD-työnkulkuihin
- Käytä GA-pakettia `microsoft.foundry` versiosta 1.37.0+ isännöityä agenttikehitystä varten
- Ota käyttöön ja konfiguroi tekoälyyn perustuvia sovelluksia
- Ymmärrä RAG:n (Retrieval-Augmented Generation) toteutusmallit
- Hallitse tekoälymallien käyttöönottoa ja skaalausta

#### Hallittavat keskeiset käsitteet
- Microsoft Foundry Models -palvelun integrointi ja API-hallinta
- AI-haun määritys ja vektorihakemisto
- Mallien käyttöönotto ja kapasiteettisuunnittelu
- AI-sovellusten seuranta ja suorituskyvyn optimointi
- Paikallinen Agent Inspector verrattuna pilvijäljityksiin, lähdekoodin käyttöönotto ja arviointiaineistot versionhallinnassa

#### Käytännön harjoitukset
1. **AI Chat Käyttöönotto**: Ota käyttöön azure-search-openai-demo-malli
2. **RAG-toteutus**: Määritä dokumenttien indeksointi ja hakutoiminnot
3. **Mallin määritys**: Aseta useita tekoälymalleja eri tarkoituksiin
4. **AI-seuranta**: Toteuta Application Insights tekoälykuormituksille
5. **GA Isännöity Agentti**: Seuraa [hosted-agent walkthroughia](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga); vertaa paikallisia ja pilvivastauksia, tarkastele arviointitulosta ja varmista siivouksen omistajuus

#### Arviointikysymykset
- Kuinka Microsoft Foundry Models -palvelut määritellään AZD-mallissa?
- Mitkä ovat RAG-arkkitehtuurin keskeiset osat?
- Kuinka hallitset tekoälymallien kapasiteetin ja skaalaamisen?
- Mitkä seurantamittarit ovat tärkeitä tekoälysovelluksille?
- Mitä laajennuksia sisältyy `microsoft.foundry`, ja miksi arvioinnit asennetaan erikseen?
- Miksi paikalliset agenttitestit aiheuttavat silti Azure-mallimaksuja?
- Mitä `azd down` jättää jälkeensä, kun käytät olemassa olevaa Foundry-projektia uudelleen?

---

### Luku 3: Määritys & Todentaminen (Viikko 3)
**Kesto**: 45-60 minuuttia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Hallitse ympäristön määritys- ja hallintastrategiat
- Toteuta turvalliset todennuskäytännöt ja hallittu identiteetti
- Järjestä resurssit asianmukaisin nimeämiskäytännöin
- Määritä moniympäristöiset käyttöönotot (kehitystila, testi, tuotanto)

#### Hallittavat keskeiset käsitteet
- Ympäristön hierarkia ja määrityksen priorisointi
- Hallittu identiteetti ja palveluperiaate-todennus
- Key Vault -integrointi salaisuuksien hallintaan
- Ympäristökohtainen parametrien hallinta

#### Käytännön harjoitukset
1. **Moniympäristön määritys**: Konfiguroi kehitys-, testi- ja tuotantoympäristöt
2. **Turvallisuusmääritys**: Toteuta hallitun identiteetin todennus
3. **Salaisuuksien hallinta**: Integroi Azure Key Vault arkaluonteisille tiedoille
4. **Parametrien hallinta**: Luo ympäristökohtaiset määritykset

#### Arviointikysymykset
- Kuinka määrität erilaiset ympäristöt AZD:llä?
- Mitkä ovat hallitun identiteetin edut verrattuna palveluperiaatteisiin?
- Kuinka hallitset sovelluksen salaisuudet turvallisesti?
- Mikä on määrityksen hierarkia AZD:ssä?

---

### Luku 4: Infrastruktuuri koodina & käyttöönotto (Viikko 4-5)
**Kesto**: 1-1,5 tuntia | **Vaativuus**: ⭐⭐⭐

#### Oppimistavoitteet
- Luo ja räätälöi Bicep-infrastruktuurimalleja
- Toteuta edistyneitä käyttöönotto- ja työnkulkuja
- Ymmärrä resurssien varausstrategiat
- Suunnittele skaalautuvia monipalveluarkkitehtuureja

- Ota käyttöön konttipohjaiset sovellukset Azure Container Appin ja AZD:n avulla


#### Hallittavat keskeiset käsitteet
- Bicep-mallin rakenne ja parhaat käytännöt
- Resurssiriippuvuudet ja käyttöönottojärjestyksen hallinta
- Parametritiedostot ja mallin moduularisuus
- Räätälöidyt koukut ja käyttöönottoautomaatiot
- Konttisovellusten käyttöönotto-mallit (pikakäynnistys, tuotanto, mikropalvelut)

#### Käytännön harjoitukset
1. **Räätälöidyn mallin luonti**: Rakenna monipalvelusovellusmalli
2. **Bicep-hallinta**: Luo moduulirakenteisia uudelleenkäytettäviä infrastruktuurikomponentteja
3. **Käyttöönottoautomaatiot**: Toteuta ennalta/jälkeen käynnistyvät koukut
4. **Arkkitehtuurin suunnittelu**: Käytä monimutkaista mikropalveluarkkitehtuuria käyttöönotossa
5. **Konttisovelluksen käyttöönotto**: Ota käyttöön esimerkit [Simple Flask API](../../../examples/container-app/simple-flask-api) ja [Microservices Architecture](../../../examples/container-app/microservices) AZD:llä

#### Arviointikysymykset
- Kuinka luot räätälöityjä Bicep-malleja AZD:lle?
- Mitkä ovat parhaat käytännöt infrastruktuurikoodin järjestämiseen?
- Kuinka käsittelet resurssiriippuvuuksia malleissa?
- Mitkä käyttöönotto-mallit tukevat katkottomia päivityksiä?

---

### Luku 5: Moniagenttiset tekoälyratkaisut (Viikko 6-7)
**Kesto**: 2-3 tuntia | **Vaativuus**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Suunnittele ja toteuta moniagenttisia tekoälyarkkitehtuureja
- Orkestroi agenttien koordinointi ja viestintä
- Ota käyttöön tuotantovalmiita tekoälyratkaisuja valvonnalla
- Ymmärrä agenttien erikoistuminen ja työnkulkujen mallit
- Integroi konttipohjaiset mikropalvelut moniagenttiratkaisuihin

#### Hallittavat keskeiset käsitteet
- Moniagenttisten arkkitehtuurien mallit ja suunnitteluperiaatteet
- Agenttien viestintäprotokollat ja datavirrat
- Kuormantasaus ja skaalausstrategiat tekoälyagentteihin
- Tuotantovalvonta moniagenttijärjestelmissä
- Palveluiden välinen viestintä konttipohjaisessa ympäristössä

#### Käytännön harjoitukset
1. **Vähittäiskaupan arkkitehtuurin tarkastelu**: Analysoi vähittäiskaupan suunnitelmaa ja tunnista sovelluskomponentit, jotka on toteutettava ennen käyttöönottoa
2. **Agenttien räätälöinti**: Muokkaa asiakas- ja varastoagenttien käyttäytymistä
3. **Arkkitehtuurin skaalaus**: Toteuta kuormantasauksen ja automaattisen skaalaamisen ratkaisut
4. **Tuotantovalvonta**: Määritä kattava valvonta ja hälytykset
5. **Mikropalveluintegraatio**: Laajenna [Microservices Architecture](../../../examples/container-app/microservices) -esimerkkiä tukemaan agenttikohtaisia työnkulkuja

#### Arviointikysymykset
- Kuinka suunnittelet tehokkaat moniagenttien viestintämallit?
- Mitkä ovat keskeiset näkökohdat tekoälyagenttien kuormituksen skaalaamisessa?
- Kuinka seuraat ja debuggaat moniagenttisia tekoälyjärjestelmiä?
- Mitkä tuotantomallit takaavat luotettavuuden tekoälyagenteille?

---

### Luku 6: Ennen käyttöönottoa tehtävä validointi & suunnittelu (Viikko 8)
**Kesto**: 1 tunti | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Suorita kattava kapasiteettisuunnittelu ja resurssien validointi
- Valitse kustannustehokkaat Azure SKU:t
- Toteuta automatisoidut valmiustarkistukset ja validoinnit
- Suunnittele käyttöönotot kustannusten optimointistrategioilla

#### Hallittavat keskeiset käsitteet
- Azuren resurssien kvotat ja kapasiteettirajoitukset
- SKU-valinnan kriteerit ja kustannusten hallinta
- Automaattiset validointiskriptit ja testaus
- Käyttöönoton suunnittelu ja riskin arviointi

#### Käytännön harjoitukset
1. **Kapasiteettianalyysi**: Arvioi sovellustesi resurssitarpeet
2. **SKU-optimointi**: Vertaa ja valitse kustannustehokkaat palvelut
3. **Validointiautomaatiot**: Toteuta tarkistusohjelmat ennen käyttöönottoa
4. **Kustannussuunnittelu**: Laadi käyttöönoton kustannusarviot ja budjetit

#### Arviointikysymykset
- Kuinka validoit Azure-kapasiteetin ennen käyttöönottoa?
- Mitkä tekijät vaikuttavat SKU-valintaan?
- Kuinka automatisoit valmiustarkistuksen?
- Mitkä strategiat auttavat optimoimaan käyttöönoton kustannukset?

---

### Luku 7: Vianmääritys & Debuggaus (Viikko 9)
**Kesto**: 1-1,5 tuntia | **Vaativuus**: ⭐⭐

#### Oppimistavoitteet
- Kehitä systemaattiset debuggausmenetelmät AZD-käyttöönotoille
- Ratkaise yleisimmät käyttöönotto- ja määritysvirheet
- Debuggaa tekoälyyn liittyvät ongelmat ja suorituskykyhaitat
- Toteuta valvonta ja hälytykset ongelmien ennakoivaan havaitsemiseen

#### Hallittavat keskeiset käsitteet
- Diagnostiikkatekniikat ja lokitusstrategiat
- Yleisimmät virhemallit ja niiden ratkaisut
- Suorituskyvyn seuranta ja optimointi
- Tapahtumien hallinta ja palautusmenettelyt

#### Käytännön harjoitukset
1. **Diagnostiikkataidot**: Harjoittele tahallisesti rikkinäisillä käyttöönoidoilla
2. **Lokianalyysi**: Käytä Azure Monitoria ja Application Insightsia tehokkaasti
3. **Suorituskyvyn hienosäätö**: Optimoi hitaita sovelluksia
4. **Palautusmenettelyt**: Toteuta varmuuskopiointi ja katastrofipalautus

#### Arviointikysymykset
- Mitkä ovat yleisimmät AZD-käyttöönottojen virheet?
- Kuinka debuggaat todennukseen ja käyttöoikeuksiin liittyviä ongelmia?
- Mitkä valvontastrategiat ehkäisevät tuotanto-ongelmia?
- Kuinka optimoit sovelluksen suorituskyvyn Azurella?

---

### Luku 8: Tuotanto- ja yritysmallit (Viikko 10-11)
**Kesto**: 2-3 tuntia | **Vaativuus**: ⭐⭐⭐⭐

#### Oppimistavoitteet
- Toteuta yritystason käyttöönotto-strategioita
- Suunnittele turvallisuusmallit ja vaatimustenmukaisuuskäytännöt
- Perusta seuranta, hallinta ja kustannusten hallinta
- Luo skaalautuvat CI/CD-putket AZD-integraatiolla
- Sovella parhaita käytäntöjä tuotantokonttisovellusten käyttöönottoon (turvallisuus, seuranta, kustannukset, CI/CD)

#### Hallittavat keskeiset käsitteet
- Yritystason turvallisuus- ja vaatimustenmukaisuusvaatimukset
- Hallintakehykset ja politiikkojen toteutus
- Edistynyt seuranta ja kustannusten hallinta
- CI/CD-integraatio ja automatisoidut käyttöönotto-putket
- Blue-green ja kanarialähetyskäytännöt konttikuormille

#### Käytännön harjoitukset
1. **Yritysturvallisuus**: Toteuta kattavia turvallisuusmalleja
2. **Hallintakehys**: Määritä Azure Policy ja resurssien hallinta
3. **Edistynyt seuranta**: Luo kojetaulut ja automatisoidut hälytykset
4. **CI/CD-integraatio**: Rakenna automatisoidut käyttöönotto-putket
5. **Tuotantokonttisovellukset**: Sovella turvallisuus-, seuranta- ja kustannusoptimointia [Microservices Architecture](../../../examples/container-app/microservices) -esimerkissä

#### Arviointikysymykset
- Kuinka toteutat yritysturvallisuuden AZD-käyttöönotossa?
- Mitkä hallintamallit takaavat vaatimustenmukaisuuden ja kustannusten hallinnan?
- Kuinka suunnittelet skaalautuvan seurannan tuotantojärjestelmissä?
- Mitkä CI/CD-mallit toimivat parhaiten AZD-työnkulkujen kanssa?

#### Oppimistavoitteet
- Ymmärrä Azure Developer CLI:n perusteet ja ydinkäsitteet
- Asenna ja konfiguroi azd kehitysympäristöösi onnistuneesti
- Suorita ensimmäinen käyttöönotto valmiin mallin avulla
- Tutustu azd-projektin rakenteeseen ja avainkomponentteihin

#### Hallittavat keskeiset käsitteet
- Mallit, ympäristöt ja palvelut
- azure.yaml-konfiguraatiorakenne
- Perus azd-komennot (init, up, down, deploy)
- Infrastruktuuri koodina -periaatteet
- Azure-todennus ja -valtuutus

#### Harjoitustehtävät

**Harjoitus 1.1: Asennus ja määritys**
```text
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI only for exercises or template hooks that explicitly use `az`; authenticate AZD independently
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Harjoitus 1.2: Ensimmäinen käyttöönotto**
```text
# Deploy a simple web application:
1. Initialize project in an empty directory: azd init --template todo-nodejs-mongo .
2. Review project structure and configuration files
3. Deploy to Azure: azd up
4. Test the deployed application
5. Clean up resources: azd down
```

**Harjoitus 1.3: Projektin rakenteen analyysi**
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
3. Kuinka ympäristöt auttavat hallitsemaan erilaisia käyttöönottoja?
4. Mitä todennusmenetelmiä azd:n kanssa voi käyttää?
5. Mitä tapahtuu, kun suoritat `azd up` ensimmäistä kertaa?

---

## Edistymisen seuranta ja arviointi
```text
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Harjoitus 2.2: Edistynyt konfiguraatio**
```text
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Harjoitus 2.3: Turvallisuusmääritys**
```text
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Itsearviointikysymykset
1. Kuinka azd käsittelee ympäristömuuttujien priorisointia?
2. Mitä ovat käyttöönotto-koukut ja milloin niitä tulisi käyttää?
3. Kuinka määrität eri SKU:t eri ympäristöille?
4. Mitkä ovat erilaisten todennusmenetelmien turvallisuusvaikutukset?
5. Kuinka hallitset salaisuuksia ja herkkiä määritystietoja?

### Moduuli 3: Käyttöönotto ja varaus (Viikko 4)

#### Oppimistavoitteet
- Hallitse käyttöönoton työnkulkuja ja parhaita käytäntöjä
- Ymmärrä Infrastructure as Code -periaatteet Bicep-mallien avulla
- Toteuta monimutkaisia monipalveluarkkitehtuureja
- Optimoi käyttöönoton suorituskyky ja luotettavuus

#### Hallittavat keskeiset käsitteet
- Bicep-mallin rakenne ja moduulit
- Resurssiriippuvuudet ja käyttöönottojärjestys
- Käyttöönotto-strategiat (blue-green, asteittainen päivitys)
- Monialueiset käyttöönotot
- Tietokantamigraatiot ja datanhallinta

#### Harjoitustehtävät

**Harjoitus 3.1: Räätälöity infrastruktuuri**
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

**Harjoitus 3.3: Tietokantaintegraatio**
```text
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Itsearviointikysymykset
1. Mitkä ovat Bicepin käytön edut ARM-mallipohjiin verrattuna?
2. Miten käsittelet tietokantamigraatiossa azd-julkaisuissa?
3. Mitä strategioita on olemassa nollakatkoksen julkaisuihin?
4. Miten hallitset riippuvuuksia palveluiden välillä?
5. Mitkä ovat monialuejulkaisun huomioon otettavat seikat?

### Moduuli 4: Julkaisua edeltävä validointi (viikko 5)

#### Oppimistavoitteet
- Toteuta kattavat julkaisua edeltävät tarkastukset
- Hallitse kapasiteettisuunnittelu ja resurssien validointi
- Ymmärrä SKU-valinnan ja kustannusoptimoinnin perusteet
- Rakenna automatisoidut validointiputket

#### Keskeiset opittavat käsitteet
- Azuren resurssikiintiöt ja rajoitukset
- SKU-valinnan kriteerit ja kustannusvaikutukset
- Automaattiset validointiskriptit ja työkalut
- Kapasiteettisuunnittelumenetelmät
- Suorituskyvyn testaus ja optimointi

#### Harjoitukset

**Harjoitus 4.1: Kapasiteettisuunnittelu**
```text
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Harjoitus 4.2: Julkaisua edeltävä validointi**
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
1. Mitkä tekijät vaikuttavat SKU-valintoihin?
2. Miten validoit Azure-resurssien saatavuuden ennen julkaisua?
3. Mitkä ovat julkaisua edeltävän tarkistuksen järjestelmän keskeiset osat?
4. Miten arvioit ja hallitset julkaisukustannuksia?
5. Mikä valvonta on olennaista kapasiteettisuunnittelussa?

### Moduuli 5: Vianetsintä ja debuggaus (viikko 6)

#### Oppimistavoitteet
- Hallitse järjestelmälliset vianetsintämenetelmät
- Kehitä osaamista monimutkaisten julkaisujen ongelmien debuggaamisessa
- Toteuta kattava monitorointi ja hälytys
- Rakenna häiriötilanteisiin reagoinnin ja palautumisen prosessit

#### Keskeiset opittavat käsitteet
- Yleiset julkaisun epäonnistumismallit
- Lokien analysointi ja korrelaatiotekniikat
- Suorituskyvyn valvonta ja optimointi
- Turvallisuushäiriöiden havaitseminen ja reagointi
- Katastrofipalautus ja liiketoiminnan jatkuvuus

#### Harjoitukset

**Harjoitus 5.1: Vianetsintätilanteet**
```text
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Harjoitus 5.2: Monitoroinnin toteutus**
```text
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Harjoitus 5.3: Häiriötilannevastaus**
```text
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Itsearviointikysymykset
1. Mikä on järjestelmällinen lähestymistapa azd-julkaisujen vianetsintään?
2. Miten korreloit lokeja useiden palveluiden ja resurssien välillä?
3. Mitkä monitorointimittarit ovat kriittisimpiä ongelmien varhaisessa havaitsemisessa?
4. Miten toteutat tehokkaat katastrofipalautusmenettelyt?
5. Mitkä ovat incident response -suunnitelman keskeiset osat?

### Moduuli 6: Edistyneet aiheet ja parhaat käytännöt (viikko 7-8)

#### Oppimistavoitteet
- Toteuta yritystason julkaisumallit
- Hallitse CI/CD-integraatio ja automaatio
- Kehitä räätälöityjä mallipohjia ja osallistu yhteisöön
- Ymmärrä edistyneet turvallisuus- ja säädösvaatimukset

#### Keskeiset opittavat käsitteet
- CI/CD-putkiston integraatiomallit
- Räätälöity mallipohjakehitys ja jakelu
- Yrityshallinto ja säädösten noudattaminen
- Edistyneet verkkoyhteydet ja turvallisuusasetukset
- Suorituskyvyn optimointi ja kustannusten hallinta

#### Harjoitukset

**Harjoitus 6.1: CI/CD-integraatio**
```text
# Implement automated deployment pipelines:
1. GitHub Actions workflow for azd deployments
2. Azure DevOps pipeline integration
3. Multi-stage deployment with approvals
4. Automated testing and quality gates
5. Security scanning and compliance checks
```

**Harjoitus 6.2: Räätälöidyn mallipohjan kehitys**
```text
# Create and publish custom templates:
1. Design template for your organization's architecture
2. Implement parameterization and customization options
3. Add comprehensive documentation and examples
4. Test template across different environments
5. Publish and maintain template in template gallery
```

**Harjoitus 6.3: Yrityssovellus**
```text
# Implement enterprise-grade features:
1. Multi-tenant architecture with proper isolation
2. Centralized logging and monitoring
3. Compliance and governance controls
4. Cost allocation and chargeback mechanisms
5. Disaster recovery and business continuity
```

#### Itsearviointikysymykset
1. Miten integroit azd:n nykyisiin CI/CD-työnkulkuihin?
2. Mitkä ovat keskeiset huomioon otettavat asiat räätälöityä mallipohjaa kehitettäessä?
3. Miten toteutat hallinnon ja säädösten vaatimusten mukaisuuden azd-julkaisuissa?
4. Mitkä ovat parhaat käytännöt yritystason julkaisuissa?
5. Miten myötävaikutat tehokkaasti azd-yhteisöön?

## Käytännön projektit

### Projekti 1: Henkilökohtainen portfoliosivusto
**Vaativuus**: Aloittelija  
**Kesto**: 1-2 viikkoa

Rakenna ja julkaise henkilökohtainen portfoliosivusto käyttäen:
- Staattinen verkkosivusto Azuren Storage-palvelussa
- Räätälöidyn verkkotunnuksen konfigurointi
- CDN-integraatio maailmanlaajuiseen suorituskykyyn
- Automaattinen julkaisuputki

**Tulokset**:
- Toimiva verkkosivusto julkaistuna Azureen
- Räätälöity azd-mallipohja portfoliosovelluksille
- Dokumentaatio julkaisuprosessista
- Kustannusanalyysi ja optimointisuositukset

### Projekti 2: Tehtävienhallintasovellus
**Vaativuus**: Keskitaso  
**Kesto**: 2-3 viikkoa

Luo täysiverinen tehtävienhallintasovellus, jossa on:
- React-käyttöliittymä julkaistuna App Serviceen
- Node.js API-taustapalvelu autentikoinnilla
- PostgreSQL-tietokanta migraatioineen
- Application Insights -valvonta

**Tulokset**:
- Valmis sovellus käyttäjätunnistuksella
- Tietokantakaavio ja migraatiot
- Monitorointinäkymät ja hälytyssäännöt
- Moniympäristöjulkaisun konfigurointi

### Projekti 3: Mikropalveluiden verkkokauppa-alusta
**Vaativuus**: Edistynyt  
**Kesto**: 4-6 viikkoa

Suunnittele ja toteuta mikropalveluarkkitehtuuri verkkokauppa-alustalle:
- Useita API-palveluita (katalogi, tilaukset, maksut, käyttäjät)
- Viestijonointegratio Service Busin kautta
- Redis-välimuisti suorituskyvyn optimointiin
- Kattava lokitus ja monitorointi

**Vertailuesimerkki**: Katso [Microservices Architecture](../../../examples/container-app/microservices) kaksipalveluinen oppimismalli ja julkaisuesimerkki. Jonot, pysyvyys, autentikointi, maksujen käsittely ja tuotantovakaus ovat omia projektejaan.

**Tulokset**:
- Valmis mikropalveluarkkitehtuuri
- Palveluiden välisten viestintämallien toteutus
- Suorituskyvyn testaus ja optimointi
- Tuotantovalmiiden turvallisuusratkaisujen toteutus

## Arviointi ja sertifiointi

### Tietotarkistukset

Suorita nämä arvioinnit jokaisen moduulin jälkeen:

**Moduuli 1 Arviointi**: Peruskäsitteet ja asennus
- Monivalintakysymykset ydinkäsitteistä
- Käytännön asennus- ja konfigurointitehtävät
- Yksinkertainen julkaisu

**Moduuli 2 Arviointi**: Konfigurointi ja ympäristöt
- Ympäristöhallinnan skenaariot
- Konfiguroinnin vianetsintäharjoitukset
- Turvallisuusasetusten toteutus

**Moduuli 3 Arviointi**: Julkaisu ja provisiointi
- Infrastruktuurin suunnittelutehtävät
- Monipalvelujulkaisu skenaariot
- Suorituskyvyn optimointiharjoitukset

**Moduuli 4 Arviointi**: Julkaisua edeltävä validointi
- Kapasiteettisuunnittelun tapaustutkimukset
- Kustannusoptimointiskenaariot
- Validointiputken toteutus

**Moduuli 5 Arviointi**: Vianetsintä ja debuggaus
- Ongelman diagnosointiharjoitukset
- Monitoroinnin toteutustehtävät
- Häiriötilanneharjoitukset

**Moduuli 6 Arviointi**: Edistyneet aiheet
- CI/CD-putken suunnittelu
- Räätälöityjen mallipohjien kehitys
- Yritysarkkitehtuurin skenaariot

### Lopputyöprojekti

Suunnittele ja toteuta kokonaisvaltainen ratkaisu, joka osoittaa kaikkien käsitteiden hallinnan:

**Vaatimukset**:
- Monikerroksinen sovellusarkkitehtuuri
- Useita julkaisuympäristöjä
- Kattava monitorointi ja hälytykset
- Turvallisuuden ja säädösten noudattaminen
- Kustannusoptimointi ja suorituskyvyn hienosäätö
- Täydellinen dokumentaatio ja käyttöohjeet

**Arviointikriteerit**:
- Teknisen toteutuksen laatu
- Dokumentaation kattavuus
- Turvallisuus ja parhaat käytännöt
- Suorituskyky ja kustannusoptimointi
- Vianetsinnän ja monitoroinnin tehokkuus

## Opiskelu- ja viitelähteet

### Virallinen dokumentaatio
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Bicep Documentation](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Yhteisön resurssit
- [AZD Template Gallery](https://azure.github.io/awesome-azd/)
- [Azure-Samples GitHub Organization](https://github.com/Azure-Samples)
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)

### Harjoitusympäristöt
- [Azure Free Account](https://azure.microsoft.com/free/)
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)
- [GitHub Actions](https://github.com/features/actions)

### Lisätyökalut
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)

## Opintoaikataulusuositukset

### Kokopäiväopiskelu (8 viikkoa)
- **Viikot 1-2**: Moduulit 1-2 (Aloitus, konfigurointi)
- **Viikot 3-4**: Moduulit 3-4 (Julkaisu, julkaisua edeltävä validointi)
- **Viikot 5-6**: Moduulit 5-6 (Vianetsintä, edistyneet aiheet)
- **Viikot 7-8**: Käytännön projektit ja lopputentti

### Osa-aikainen opiskelu (16 viikkoa)
- **Viikot 1-4**: Moduuli 1 (Aloitus)
- **Viikot 5-7**: Moduuli 2 (Konfigurointi ja ympäristöt)
- **Viikot 8-10**: Moduuli 3 (Julkaisu ja provisiointi)
- **Viikot 11-12**: Moduuli 4 (Julkaisua edeltävä validointi)
- **Viikot 13-14**: Moduuli 5 (Vianetsintä ja debuggaus)
- **Viikot 15-16**: Moduuli 6 (Edistyneet aiheet ja arviointi)

---

## Edistymisen seuranta ja arviointikehys

### Lukukappaleen suorittamisen tarkistuslista

Seuraa edistymistäsi jokaisen kappaleen kohdalla näillä mitattavilla tavoitteilla:

#### 📚 Kappale 1: Perusta & nopea aloitus
- [ ] **Asennus valmis**: AZD asennettu ja vahvistettu alustallasi
- [ ] **Ensimmäinen julkaisu**: Todo-nodejs-mongo-malli onnistuneesti julkaistu
- [ ] **Ympäristön asetus**: Ensimmäiset ympäristömuuttujat konfiguroitu
- [ ] **Resurssien selaus**: Tutkinut julkaistuja resursseja Azure-portaalissa
- [ ] **Komentojen hallinta**: Tuttu perus-AZD-komentoihin

#### 🤖 Kappale 2: AI-ensimmäinen kehitys  
- [ ] **AI-mallin julkaisu**: Azure-search-openai-demo mallin julkaisu onnistui
- [ ] **RAG-toteutus**: Asiakirjojen indeksointi ja haku konfiguroitu
- [ ] **Mallin konfigurointi**: Useita AI-malleja eri tarkoituksiin asetettu
- [ ] **AI-valvonta**: Application Insights toteutettu AI-kuormille
- [ ] **Suorituskyvyn optimointi**: AI-sovelluksen suorituskykyä viritetty

#### ⚙️ Kappale 3: Konfiguraatio & autentikointi
- [ ] **Moniympäristöasetus**: Kehitys-, testi- ja tuotantoympäristöt konfiguroitu
- [ ] **Turvallisuuden toteutus**: Hallittu identiteetti -autentikointi otettu käyttöön
- [ ] **Salaisuuksien hallinta**: Azure Key Vault integroituna arkaluontoisiin tietoihin
- [ ] **Parametrien hallinta**: Ympäristökohtaiset asetukset luotu
- [ ] **Autentikoinnin hallinta**: Turvallinen pääsynhallinta toteutettu

#### 🏗️ Kappale 4: Infrastruktuuri koodina & julkaisu
- [ ] **Räätälöity mallipohjan luonti**: Rakennettu monipalvelusovellusten mallipohja
- [ ] **Bicep-osaaminen**: Moduulirakenteiset ja uudelleenkäytettävät infrastruktuurikomponentit luotu
- [ ] **Julkaisun automaatio**: Julkaisun esivalmistelut ja jälkitoimet toteutettu
- [ ] **Arkkitehtuurin suunnittelu**: Julkaistu monimutkainen mikropalveluarkkitehtuuri
- [ ] **Mallipohjan optimointi**: Optimoitu mallipohjat suorituskyvyn ja kustannusten mukaan

#### 🎯 Kappale 5: Moniedustainen AI-ratkaisu
- [ ] **Jälleenmyyntiarkkitehtuurin tarkistus**: Tunnistettu puuttuvat sovellusosat ja suunniteltu niiden toteutus ja validointi
- [ ] **Agenttien mukautus**: Muokattu Asiakas- ja Varastoagenttien käyttäytymistä
- [ ] **Arkkitehtuurin skaalaus**: Toteutettu kuormantasapainotus ja automaattinen skaalautuvuus
- [ ] **Tuotannon monitorointi**: Rakennettu kattava monitorointi ja hälytys
- [ ] **Suorituskyvyn hionn**: Optimoitu moniedustaisen järjestelmän suorituskyky

#### 🔍 Kappale 6: Julkaisua edeltävä validointi & suunnittelu
- [ ] **Kapasiteettianalyysi**: Analysoitu sovellusten resurssivaatimukset
- [ ] **SKU-optimointi**: Valittu kustannustehokkaat palvelutasot
- [ ] **Validoinnin automaatio**: Toteutettu julkaisua edeltävät tarkistusskriptit
- [ ] **Kustannussuunnittelu**: Laadittu julkaisukustannusten arvioinnit ja budjetit
- [ ] **Riskienhallinta**: Tunnistettu ja hallittu julkaisuriskiä

#### 🚨 Kappale 7: Vianetsintä & debuggaus
- [ ] **Diagnostiikka**: Debuggannut onnistuneesti tahallaan rikottuja julkaisuja
- [ ] **Lokien analyysi**: Käyttänyt Azure Monitoria ja Application Insightsia tehokkaasti
- [ ] **Suorituskyvyn optimointi**: Optimoitu hitaasti toimivia sovelluksia
- [ ] **Palautusprosessit**: Toteuttanut varmuuskopioinnin ja katastrofipalautuksen
- [ ] **Monitorointiasetus**: Luonut ennakoivan monitoroinnin ja hälytykset

#### 🏢 Kappale 8: Tuotanto & yritysratkaisut
- [ ] **Yritysturvallisuus**: Toteuttanut kattavat turvallisuusmallit
- [ ] **Hallintakehys**: Konfiguroinut Azure Policy ja resurssien hallinnan
- [ ] **Edistynyt monitorointi**: Luonut kojelaudat ja automatisoidut hälytykset
- [ ] **CI/CD-integraatio**: Rakentanut automatisoidut julkaisuputket
- [ ] **Säädösten noudattaminen**: Täyttää yrityksen vaatimukset

### Oppimisen aikajana ja virstanpylväät

#### Viikot 1-2: Perustusten rakentaminen
- **Virstanpylväs**: Julkaissut ensimmäisen AI-sovelluksen AZD:llä
- **Validointi**: Toimiva sovellus saatavilla julkisella URL-osoitteella
- **Taidot**: Perustiedot AZD-työnkuluista ja AI-palveluiden integroinnista

#### Viikot 3-4: Konfigurointiosaaminen
- **Virstanpylväs**: Moniympäristöinen julkaisu turvallisella autentikoinnilla
- **Validointi**: Sama sovellus julkaistu dev/testi/tuotanto-ympäristöihin
- **Taidot**: Ympäristöhallinta ja turvallisuusasetusten toteutus

#### Viikot 5-6: Infrastruktuuriasiantuntijuus
- **Virstanpylväs**: Räätälöity mallipohja monipalvelusovellukselle
- **Validointi**: Uudelleenkäytettävä mallipohja julkaistu toisen tiimin jäsenen toimesta
- **Taidot**: Bicep-osaaminen ja infrastruktuurin automaatio

#### Viikot 7-8: Edistynyt AI-toteutus
- **Virstanpylväs**: Tuotantovalmiit moniedustaiset AI-ratkaisut
- **Validointi**: Järjestelmä käsittelee reaalimaailman kuormaa monitoroinnin alaisena
- **Taidot**: Moniedustajien orkestrointi ja suorituskyvyn optimointi

#### Viikot 9-10: Tuotantovalmius
- **Virstanpylväs**: Yritystason julkaisu täysillä säädösten mukaisuuksilla
- **Validointi**: Läpäisee turvallisuustarkastuksen ja kustannusoptimoinnin auditoinnin
- **Taidot**: Hallinto, monitorointi ja CI/CD-integraatio

### Arviointi ja sertifiointi

#### Tiedon vahvistusmenetelmät
1. **Käytännön käyttöönotot**: Toimivat sovellukset jokaiseen lukuun
2. **Koodikatselmukset**: Mallipohjan ja konfiguraation laadunarviointi
3. **Ongelmanratkaisu**: Vianmääritystilanteet ja ratkaisut
4. **Vertaisopetus**: Selitä käsitteitä muille oppijoille
5. **Yhteisön panos**: Jaa mallipohjia tai parannuksia

#### Ammatillisen kehityksen tulokset
- **Portfoliohankkeet**: Oppimisen käyttöönotot ja arkkitehtuuriharjoitukset; tuotantovalmius vaatii erillisen toteutuksen ja arvion
- **Tekniset taidot**: Alan standardin mukaiset AZD- ja tekoälyn käyttöönoton asiantuntijuudet
- **Ongelmanratkaisukyky**: Itsenäinen vianetsintä ja optimointi
- **Yhteisön tunnustus**: Aktiivinen osallistuminen Azure-kehittäjäyhteisöön
- **Uraedistys**: Taidot soveltuvat suoraan pilvi- ja tekoälytehtäviin

#### Menestysmittarit
- **Käyttöönoton onnistumisprosentti**: >95 % onnistuneista käyttöönotosta
- **Vianetsintäaika**: <30 minuuttia yleisimmissä ongelmissa
- **Suorituskyvyn optimointi**: Näytettävissä olevat parannukset kustannuksissa ja suorituskyvyssä
- **Turvallisuusarvio**: Kirjaa ohjaimet ja jäljellä olevat puutteet organisaatiosi vaatimuksiin; kurssin suoritus ei takaa vaatimustenmukaisuutta
- **Tiedonsiirto**: Kyky mentorointiin muille kehittäjille

### Jatkuva oppiminen ja yhteisön osallistuminen

#### Pysy ajan tasalla
- **Azure-päivitykset**: Seuraa Azure Developer CLI:n julkaisumuistiinpanoja
- **Yhteisötapahtumat**: Osallistu Azure- ja tekoälykehittäjien tapahtumiin
- **Dokumentaatio**: Osallistu yhteisön dokumentaatioon ja esimerkkeihin
- **Palauteprosessi**: Anna palautetta kurssisisällöstä ja Azure-palveluista

#### Ura kehitys
- **Ammatillinen verkosto**: Yhdisty Azure- ja tekoälyasiantuntijoihin
- **Puhujamahdollisuudet**: Esittele oppimiasi asioita konferensseissa tai tapaamisissa
- **Avoimen lähdekoodin panos**: Panosta AZD-mallipohjiin ja työkaluihin
- **Mentorointi**: Ohjaa muita kehittäjiä heidän AZD-oppimispolullaan

---

**Lukujen navigointi:**
- **📚 Kurssin koti**: [AZD Aloittelijoille](../README.md)
- **📖 Aloita oppiminen**: [Luku 1: Perusta & Pikakäynnistys](../README.md#-chapter-1-foundation--quick-start)
- **🎯 Edistymisen seuranta**: Seuraa etenemistäsi kattavan 8-luvun oppimisjärjestelmän kautta
- **🤝 Yhteisö**: [Azure Discord](https://discord.gg/microsoft-azure) tukea ja keskustelua varten

**Opiskelun edistymisen seuranta**: Käytä tätä jäsenneltyä opasta hallitaksesi Azure Developer CLI:tä vaiheittaisen, käytännönläheisen oppimisen kautta mitattavilla tuloksilla ja ammatillisen kehityksen hyödyillä.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->