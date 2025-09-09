<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "7634850a19864a183bc82ab5ac993c8a",
  "translation_date": "2025-09-09T22:25:56+00:00",
  "source_file": "resources/study-guide.md",
  "language_code": "fi"
}
-->
# Opas opiskeluun - AZD aloittelijoille

## Johdanto

Tämä kattava opas tarjoaa jäsennellyt oppimistavoitteet, keskeiset käsitteet, harjoitustehtävät ja arviointimateriaalit, jotka auttavat sinua hallitsemaan Azure Developer CLI:n (azd). Käytä tätä opasta edistymisesi seuraamiseen ja varmista, että olet käsitellyt kaikki olennaiset aiheet.

## Oppimistavoitteet

Tämän oppaan suorittamalla opit:
- Hallitsemaan kaikki Azure Developer CLI:n perus- ja edistyneet käsitteet
- Kehittämään käytännön taitoja Azure-sovellusten käyttöönotossa ja hallinnassa
- Rakentamaan varmuutta vianetsinnässä ja käyttöönoton optimoinnissa
- Ymmärtämään tuotantovalmiiden käyttöönottojen käytäntöjä ja turvallisuusnäkökohtia

## Oppimistulokset

Oppaan kaikkien osioiden suorittamisen jälkeen pystyt:
- Suunnittelemaan, ottamaan käyttöön ja hallitsemaan kokonaisia sovellusarkkitehtuureja azd:n avulla
- Toteuttamaan kattavia valvonta-, turvallisuus- ja kustannusoptimointistrategioita
- Ratkaisemaan monimutkaisia käyttöönotto-ongelmia itsenäisesti
- Luomaan mukautettuja malleja ja osallistumaan azd-yhteisöön

## Kurssin rakenne

### Moduuli 1: Aloittaminen (Viikot 1-2)

#### Oppimistavoitteet
- Ymmärrä Azure Developer CLI:n perusteet ja keskeiset käsitteet
- Asenna ja konfiguroi azd onnistuneesti kehitysympäristöösi
- Suorita ensimmäinen käyttöönotto olemassa olevan mallin avulla
- Navigoi azd-projektirakenteessa ja ymmärrä sen keskeiset komponentit

#### Keskeiset käsitteet
- Mallit, ympäristöt ja palvelut
- azure.yaml-konfiguraatiorakenne
- Peruskomennot azd:ssa (init, up, down, deploy)
- Infrastructure as Code -periaatteet
- Azure-autentikointi ja -valtuutus

#### Harjoitustehtävät

**Harjoitus 1.1: Asennus ja asetukset**  
```bash
# Complete these tasks:
1. Install azd using your preferred method
2. Install Azure CLI and authenticate
3. Verify installation with: azd version
4. Test connectivity with: azd auth login
5. Explore available templates: azd template list
```

**Harjoitus 1.2: Ensimmäinen käyttöönotto**  
```bash
# Deploy a simple web application:
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
1. Mitkä ovat azd-arkkitehtuurin kolme keskeistä käsitettä?
2. Mikä on azure.yaml-tiedoston tarkoitus?
3. Miten ympäristöt auttavat hallitsemaan eri käyttöönottojen kohteita?
4. Mitä autentikointimenetelmiä voidaan käyttää azd:ssa?
5. Mitä tapahtuu, kun suoritat `azd up` ensimmäistä kertaa?

### Moduuli 2: Konfigurointi ja ympäristöt (Viikko 3)

#### Oppimistavoitteet
- Hallitse ympäristöjen hallinta ja konfigurointi
- Ymmärrä edistyneet azure.yaml-konfiguraatiot
- Toteuta ympäristökohtaiset asetukset ja muuttujat
- Konfiguroi autentikointi eri skenaarioihin

#### Keskeiset käsitteet
- Ympäristöjen hierarkia ja muuttujien etusijajärjestys
- Palvelukonfiguraatio ja parametrit
- Hookit ja elinkaaritapahtumat
- Autentikointimenetelmät (käyttäjä, palvelutunnus, hallittu identiteetti)
- Konfiguraatiotiedostojen hallinta

#### Harjoitustehtävät

**Harjoitus 2.1: Moniympäristön asennus**  
```bash
# Create and configure multiple environments:
1. Create development environment: azd env new development
2. Create staging environment: azd env new staging
3. Create production environment: azd env new production
4. Configure different settings for each environment
5. Deploy the same application to different environments
```

**Harjoitus 2.2: Edistynyt konfiguraatio**  
```yaml
# Modify azure.yaml to include:
1. Multiple services with different configurations
2. Pre and post deployment hooks
3. Environment-specific parameters
4. Custom resource naming patterns
```

**Harjoitus 2.3: Turvallisuuskonfiguraatio**  
```bash
# Implement security best practices:
1. Configure managed identity for service authentication
2. Set up Azure Key Vault for secrets management
3. Implement least-privilege access controls
4. Enable HTTPS and secure communication protocols
```

#### Itsearviointikysymykset
1. Miten azd käsittelee ympäristömuuttujien etusijajärjestystä?
2. Mitä ovat käyttöönottohookit ja milloin niitä tulisi käyttää?
3. Miten konfiguroit eri SKU:t eri ympäristöille?
4. Mitkä ovat eri autentikointimenetelmien turvallisuusvaikutukset?
5. Miten hallitset salaisuuksia ja arkaluontoisia konfiguraatiotietoja?

### Moduuli 3: Käyttöönotto ja provisiointi (Viikko 4)

#### Oppimistavoitteet
- Hallitse käyttöönoton työnkulut ja parhaat käytännöt
- Ymmärrä Infrastructure as Code Bicep-mallien avulla
- Toteuta monimutkaisia monipalveluarkkitehtuureja
- Optimoi käyttöönoton suorituskyky ja luotettavuus

#### Keskeiset käsitteet
- Bicep-mallien rakenne ja moduulit
- Resurssiriippuvuudet ja järjestys
- Käyttöönoton strategiat (blue-green, rolling updates)
- Monialueiset käyttöönotot
- Tietokantamigraatiot ja datan hallinta

#### Harjoitustehtävät

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
# Deploy a microservices architecture:
1. Frontend web application
2. Backend API service
3. Database service
4. Message queue service
5. Background worker service
```

**Harjoitus 3.3: Tietokannan integrointi**  
```bash
# Implement database deployment patterns:
1. Deploy PostgreSQL with connection pooling
2. Implement schema migrations
3. Configure backup and recovery procedures
4. Set up read replicas for performance
5. Implement data seeding for different environments
```

#### Itsearviointikysymykset
1. Mitkä ovat Bicepin käytön edut verrattuna ARM-malleihin?
2. Miten käsittelet tietokantamigraatioita azd-käyttöönotossa?
3. Mitä strategioita on olemassa käyttökatkosten välttämiseksi?
4. Miten hallitset riippuvuuksia palveluiden välillä?
5. Mitkä ovat monialueisten käyttöönottojen huomioon otettavat seikat?

### Moduuli 4: Käyttöönoton ennakkovarmistus (Viikko 5)

#### Oppimistavoitteet
- Toteuta kattavat ennakkovarmistukset
- Hallitse kapasiteettisuunnittelu ja resurssien validointi
- Ymmärrä SKU-valinta ja kustannusoptimointi
- Rakenna automatisoituja validointiputkia

#### Keskeiset käsitteet
- Azuren resurssikiintiöt ja rajat
- SKU-valintakriteerit ja kustannusvaikutukset
- Automatisoidut validointiskriptit ja työkalut
- Kapasiteettisuunnittelun menetelmät
- Suorituskykytestaus ja optimointi

#### Harjoitustehtävät

**Harjoitus 4.1: Kapasiteettisuunnittelu**  
```bash
# Implement capacity validation:
1. Create scripts to check Azure quotas
2. Validate service availability in target regions
3. Estimate resource costs for different SKUs
4. Plan for scaling and growth requirements
5. Document capacity requirements for each environment
```

**Harjoitus 4.2: Ennakkovarmistus**  
```powershell
# Build comprehensive validation pipeline:
1. Authentication and permissions validation
2. Template syntax and parameter validation
3. Resource naming and availability checks
4. Network connectivity and security validation
5. Cost estimation and budget verification
```

**Harjoitus 4.3: SKU-optimointi**  
```bash
# Optimize service configurations:
1. Compare performance characteristics of different SKUs
2. Implement cost-effective development configurations
3. Design high-performance production configurations
4. Create monitoring dashboards for resource utilization
5. Set up auto-scaling policies
```

#### Itsearviointikysymykset
1. Mitkä tekijät vaikuttavat SKU-valintapäätöksiin?
2. Miten validoit Azuren resurssien saatavuuden ennen käyttöönottoa?
3. Mitkä ovat ennakkovarmistusjärjestelmän keskeiset komponentit?
4. Miten arvioit ja hallitset käyttöönoton kustannuksia?
5. Mitä valvontaa tarvitaan kapasiteettisuunnittelussa?

### Moduuli 5: Vianetsintä ja virheenkorjaus (Viikko 6)

#### Oppimistavoitteet
- Hallitse systemaattiset vianetsintämenetelmät
- Kehitä asiantuntemusta monimutkaisten käyttöönotto-ongelmien virheenkorjauksessa
- Toteuta kattava valvonta ja hälytysjärjestelmät
- Rakenna incident response - ja palautusmenettelyt

#### Keskeiset käsitteet
- Yleiset käyttöönoton epäonnistumismallit
- Lokianalyysi ja korrelaatiotekniikat
- Suorituskyvyn valvonta ja optimointi
- Turvallisuusincidenttien havaitseminen ja reagointi
- Katastrofipalautus ja liiketoiminnan jatkuvuus

#### Harjoitustehtävät

**Harjoitus 5.1: Vianetsintäskenaariot**  
```bash
# Practice resolving common issues:
1. Authentication and authorization failures
2. Resource provisioning conflicts
3. Application startup and runtime errors
4. Network connectivity problems
5. Performance and scaling issues
```

**Harjoitus 5.2: Valvonnan toteutus**  
```bash
# Set up comprehensive monitoring:
1. Application performance monitoring with Application Insights
2. Infrastructure monitoring with Azure Monitor
3. Custom dashboards and alerting rules
4. Log aggregation and analysis
5. Health check endpoints and automated testing
```

**Harjoitus 5.3: Incident Response**  
```bash
# Build incident response procedures:
1. Create runbooks for common problems
2. Implement automated recovery procedures
3. Set up notification and escalation workflows
4. Practice disaster recovery scenarios
5. Document lessons learned and improvements
```

#### Itsearviointikysymykset
1. Mikä on systemaattinen lähestymistapa azd-käyttöönottojen vianetsintään?
2. Miten korreloit lokit useiden palveluiden ja resurssien välillä?
3. Mitkä valvontamittarit ovat kriittisimpiä ongelmien varhaisessa havaitsemisessa?
4. Miten toteutat tehokkaat katastrofipalautusmenettelyt?
5. Mitkä ovat incident response -suunnitelman keskeiset komponentit?

### Moduuli 6: Edistyneet aiheet ja parhaat käytännöt (Viikot 7-8)

#### Oppimistavoitteet
- Toteuta yritystason käyttöönoton mallit
- Hallitse CI/CD-integraatio ja automaatio
- Kehitä mukautettuja malleja ja osallistu yhteisöön
- Ymmärrä edistyneet turvallisuus- ja vaatimustenmukaisuusvaatimukset

#### Keskeiset käsitteet
- CI/CD-putkien integraatiomallit
- Mukautettujen mallien kehitys ja jakelu
- Yrityksen hallinto ja vaatimustenmukaisuus
- Edistyneet verkko- ja turvallisuuskonfiguraatiot
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
1. Miten integroit azd:n olemassa oleviin CI/CD-työnkulkuihin?
2. Mitkä ovat keskeiset näkökohdat mukautettujen mallien kehityksessä?
3. Miten toteutat hallinnon ja vaatimustenmukaisuuden azd-käyttöönotossa?
4. Mitkä ovat parhaat käytännöt yritystason käyttöönottoihin?
5. Miten osallistut tehokkaasti azd-yhteisöön?

## Käytännön projektit

### Projekti 1: Henkilökohtainen portfoliosivusto  
**Vaikeustaso**: Aloittelija  
**Kesto**: 1-2 viikkoa  

Rakenna ja ota käyttöön henkilökohtainen portfoliosivusto käyttäen:
- Staattinen verkkosivuston hosting Azure Storagessa
- Mukautetun verkkotunnuksen konfiguraatio
- CDN-integraatio globaalin suorituskyvyn parantamiseksi
- Automatisoitu käyttöönoton putki

**Toimitukset**:
- Toimiva verkkosivusto, joka on otettu käyttöön Azuren kautta
- Mukautettu azd-malli portfolioiden käyttöönottoon
- Käyttöönoton prosessin dokumentaatio
- Kustannusanalyysi ja optimointisuositukset

### Projekti 2: Tehtävienhallintasovellus  
**Vaikeustaso**: Keskitaso  
**Kesto**: 2-3 viikkoa  

Luo täysimittainen tehtävienhallintasovellus, jossa on:
- React-frontend, joka on otettu käyttöön App Servicessä
- Node.js-API-taustajärjestelmä autentikoinnilla
- PostgreSQL-tietokanta migraatioilla
- Application Insights -valvonta

**Toimitukset**:
- Täydellinen sovellus käyttäjäautentikoinnilla
- Tietokannan skeema ja migraatioskriptit
- Valvontapaneelit ja hälytyssäännöt
- Moniympäristön käyttöönoton konfiguraatio

### Projekti 3: Mikroservices-pohjainen verkkokauppa-alusta  
**Vaikeustaso**: Edistynyt  
**Kesto**: 4-6 viikkoa  

Suunnittele ja toteuta mikroservices-pohjainen verkkokauppa-alusta:
- Useita API-palveluita (katalogi, tilaukset, maksut, käyttäjät)
- Viestijonon integrointi Service Busin avulla
- Redis-välimuisti suorituskyvyn optimointiin
- Kattava lokitus ja valvonta

**Toimitukset**:
- Täydellinen mikroservices-arkkitehtuuri
- Palveluiden välinen viestintämalli
- Suorituskykytestaus ja optimointi
- Tuotantovalmiin turvallisuuden toteutus

## Arviointi ja sertifiointi

### Tietotarkistukset

Suorita nämä arvioinnit jokaisen moduulin jälkeen:

**Moduuli 1 Arviointi**: Peruskäsitteet ja asennus  
- Monivalintakysymyksiä keskeisistä käsitteistä  
- Käytännön asennus- ja konfigurointitehtäviä  
- Yksinkertainen käyttöönottoharjoitus  

**Moduuli 2 Arviointi**: Konfigurointi ja ympäristöt  
- Ympäristönhallinnan skenaariot  
- Konfiguroinnin vianetsintätehtävät  
- Turvallisuuskonfiguraation toteutus  

**Moduuli 3 Arviointi**: Käyttöönotto ja provisiointi  
- Infrastruktuurin suunnittelun haasteet  
- Monipalvelun käyttöönoton skenaariot  
- Suorituskyvyn optimointiharjoitukset  

**Moduuli 4 Arviointi**: Ennakkovarmistus  
- Kapasiteettisuunnittelun tapaustutkimukset  
- Kustannusoptimoinnin skenaariot  
- Validointiputken toteutus  

**Moduuli 5 Arviointi**: Vianetsintä ja virheenkorjaus  
- Ongelman diagnosointiharjoitukset  
- Valvonnan toteutustehtävät  
- Incident response -simulaatiot  

**Moduuli 6 Arviointi**: Edistyneet aiheet  
- CI/CD-putken suunnittelu  
- Mukautettujen mallien kehitys  
- Yritysarkkitehtuurin skenaariot  

### Lopullinen päätösprojekti

Suunnittele ja toteuta kokonaisratkaisu, joka osoittaa kaikkien käsitteiden hallinnan:

**Vaatimukset**:
- Monitasoinen sovellusarkkitehtuuri  
- Useita käyttöönottoympäristöjä  
- Kattava valvonta ja hälytysjärjestelmät  
- Turvallisuuden ja vaatimustenmukaisuuden toteutus  
- Kustannusoptimointi ja suorituskyvyn hienosäätö  
- Täydellinen dokumentaatio ja käyttöohjeet  

**Arviointikriteerit**:
- Teknisen toteutuksen laatu  
- Dokumentaation kattavuus  
- Turvallisuuden ja parhaiden käytäntöjen noudattaminen  
- Suorituskyvyn ja kustannusten optimointi  
- Vianetsinnän ja valvonnan tehokkuus  

## Opiskeluresurssit ja viitteet

### Virallinen dokumentaatio
- [Azure Developer CLI Dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Bicep Dokumentaatio](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)  
- [Azure Arkkitehtuurikeskus](https://learn.microsoft.com/en-us/azure/architecture/)  

### Yhteisöresurssit
- [AZD Malligalleria](https://azure.github.io/awesome-azd/)  
- [Azure-Samples GitHub Organisaatio](https://github.com/Azure-Samples)  
- [Azure Developer CLI GitHub Repository](https://github.com/Azure/azure-dev)  

### Harjoitusympäristöt
- [Azure Free Account](https://azure.microsoft.com/free/)  
- [Azure DevOps Free Tier](https://azure.microsoft.com/services/devops/)  
- [GitHub Actions](https://github.com/features/actions)  

### Lisätyökalut
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- [Visual Studio Code](https://code.visualstudio.com/)  
- [Azure Tools Extension Pack](https://marketplace.visualstudio.com/items?itemName=ms-vscode.vscode-node-azure-pack)  

## Opiskeluaikataulusuositukset

### Kokopäiväinen opiskelu (8 viikkoa)
- **Viikot 1-2**: Moduulit 1-2 (Aloittaminen, Konfigurointi)  
- **Viikot 3-4**: Moduulit 3-4 (Käyttöönotto, Ennakkovarmistus)  
- **Viikot 5-6**: Moduulit 5-6 (Vianetsintä, Edistyneet aiheet)  
- **Viikot 7
3. **Osallistu avoimeen lähdekoodiin**: Jaa mallisi ja ratkaisusi yhteisön kanssa  
4. **Opeta muita**: Konseptien selittäminen toisille vahvistaa omaa ymmärrystäsi  
5. **Ole utelias**: Tutki jatkuvasti uusia Azure-palveluita ja integrointimalleja  

---

**Navigointi**  
- **Edellinen oppitunti**: [FAQ](faq.md)  
- **Seuraava oppitunti**: [Changelog](../changelog.md)  

**Opiskelun etenemisen seuranta**: Käytä tätä opasta oppimismatkan seuraamiseen ja varmista kattava perehtyminen kaikkiin Azure Developer CLI -konsepteihin ja käytäntöihin.  

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.