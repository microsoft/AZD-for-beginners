# Sanasto - Azure ja AZD -terminologia

**Viite kaikille luvuille**
- **📚 Kurssin kotisivu**: [AZD Aloittelijoille](../README.md)
- **📖 Lue perusteet**: [Luku 1: AZD-perusteet](../docs/getting-started/azd-basics.md)
- **🤖 AI-terminologia**: [Luku 2: AI-ensisuuntainen kehitys](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava sanasto tarjoaa määritelmiä Azure Developer CLI:ssä ja Azure-pilvikehityksessä käytetyille termeille, käsitteille ja lyhenteille. Olennaista viitetietoa teknisen dokumentaation ymmärtämiseen, ongelmien ratkaisuun ja tehokkaaseen viestintään azd-projekteista ja Azure-palveluista.

## Oppimistavoitteet

Tämän sanaston avulla:
- Ymmärrät Azure Developer CLI:n keskeisen terminologian ja käsitteet
- Hallitset Azure-pilvikehityksen sanaston ja tekniset termit
- Viittaat Infrastructure as Code- ja käyttöönottoon liittyvään terminologiaan tehokkaasti
- Ymmärrät Azure-palveluiden nimet, lyhenteet ja niiden tarkoitukset
- Saat määritelmiä vianetsintään ja debuggausterminologiaan
- Opit edistyneempiä Azure-arkkitehtuuriin ja kehitykseen liittyviä käsitteitä

## Oppimistulokset

Kun viittaat tähän sanastoon säännöllisesti, pystyt:
- Kommunikoimaan tehokkaasti käyttäen asianmukaista Azure Developer CLI -terminologiaa
- Ymmärtämään teknistä dokumentaatiota ja virheilmoituksia selkeämmin
- Navigoimaan Azure-palveluissa ja -käsitteissä itsevarmasti
- Vianetsimään ongelmia käyttäen oikeaa teknistä sanastoa
- Osallistumaan tiimikeskusteluihin tarkalla teknisellä kielellä
- Laajentamaan Azure-pilvikehityksen osaamistasi järjestelmällisesti

## A

**ARM Template**  
Azure Resource Manager -malli. JSON-pohjainen Infrastructure as Code -muoto, jota käytetään Azure-resurssien määrittelyyn ja käyttöönottoon deklaratiivisesti.

**App Service**  
Azuren platform-as-a-service (PaaS) -tarjonta verkkosovellusten, REST-rajapintojen ja mobiilitaustapalveluiden isännöintiin ilman infrastruktuurin hallintaa.

**Application Insights**  
Azuren sovellusten suorituskyvyn valvontapalvelu (APM), joka tarjoaa syvällistä tietoa sovellusten suorituskyvystä, saatavuudesta ja käytöstä.

**Azure CLI**  
Komentoriviliittymä Azure-resurssien hallintaan. azd käyttää sitä todennukseen ja joihinkin toimintoihin.

**Azure Developer CLI (azd)**  
Kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamisen ja käyttöönoton prosessia Azureen käyttämällä malleja ja Infrastructure as Code -menetelmiä.

**azure.yaml**  
Pääkonfiguraatiotiedosto azd-projektille, joka määrittelee palvelut, infrastruktuurin ja käyttöönoton koukkuja.

**Azure Resource Manager (ARM)**  
Azuren käyttöönotto- ja hallintapalvelu, joka tarjoaa hallintakerroksen resurssien luomiseen, päivittämiseen ja poistamiseen.

## B

**Bicep**  
Microsoftin kehittämä domaineihin erikoistunut kieli (DSL) Azure-resurssien käyttöönottoon. Tarjoaa yksinkertaisemman syntaksin kuin ARM-mallit ja kääntyy ARM-malleiksi.

**Build**  
Prosessi, jossa lähdekoodi käännetään, riippuvuudet asennetaan ja sovellukset valmistellaan käyttöönottoa varten.

**Blue-Green Deployment**  
Käyttöönotto-strategia, jossa käytetään kahta identtistä tuotantoympäristöä (blue ja green) käyttökatkojen ja riskin minimoimiseksi.

## C

**Container Apps**  
Azuren serverless-konttipalvelu, joka mahdollistaa konttisoitujen sovellusten ajamisen ilman monimutkaisen infrastruktuurin hallintaa.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automaattiset käytännöt koodimuutosten integroimiseksi ja sovellusten käyttöönottoon.

**Cosmos DB**  
Azuren globaalisti hajautettu, monimalli tietokantapalvelu, joka tarjoaa kattavat SLA:t läpäisevyydelle, latenssille, saatavuudelle ja johdonmukaisuudelle.

**Configuration**  
Asetukset ja parametrit, jotka ohjaavat sovelluksen käyttäytymistä ja käyttöönottoasetuksia.

## D

**Deployment**  
Prosessi, jossa sovellukset ja niiden riippuvuudet asennetaan ja konfiguroidaan kohdeinfrastruktuuriin.

**Docker**  
Alusta sovellusten kehittämiseen, jakeluun ja ajamiseen konttiteknologian avulla.

**Dockerfile**  
Tekstitiedosto, joka sisältää ohjeet Docker-konttikuvaan rakentamiseen.

## E

**Environment**  
Käyttöönoton kohde, joka edustaa tiettyä sovelluksen ilmentymää (esim. kehitys, staging, tuotanto).

**Environment Variables**  
Konfiguraatioviarit, jotka tallennetaan avain-arvo-pareina ja joita sovellukset voivat käyttää suoritusajassa.

**Endpoint**  
URL-osoite tai verkko-osoite, josta sovellukseen tai palveluun pääsee käsiksi.

## F

**Function App**  
Azuren serverless-laskentapalvelu, joka mahdollistaa tapahtumapohjaisen koodin ajamisen ilman infrastruktuurin hallintaa.

## G

**GitHub Actions**  
GitHub-repositorioon integroidu CI/CD-alusta työnkulkujen automatisointiin.

**Git**  
Hajautettu versionhallintajärjestelmä, jota käytetään lähdekoodin muutosten seuraamiseen.

## H

**Hooks**  
Mukautetut skriptit tai komennot, jotka suoritetaan tiettyinä ajankohtina käyttöönoton elinkaaren aikana (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure-palvelutyyppi, johon sovellus otetaan käyttöön (esim. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Käytäntö infrastruktuurin määrittelystä ja hallinnasta koodin avulla manuaalisten prosessien sijaan.

**Init**  
Prosessi uuden azd-projektin alustus, tyypillisesti mallista.

## J

**JSON**  
JavaScript Object Notation. Tiedonvaihtoformaatti, jota käytetään yleisesti konfiguraatiotiedostoissa ja API-vastauksissa.

**JWT**  
JSON Web Token. Standardi tietoturvalliselle tiedon välitykselle osapuolten välillä JSON-objektina.

## K

**Key Vault**  
Azuren palvelu salaisuuksien, avainten ja varmenteiden turvalliseen säilytykseen ja hallintaan.

**Kusto Query Language (KQL)**  
Kyselykieli, jota käytetään tietojen analysointiin Azure Monitorissa, Application Insightsissa ja muissa Azure-palveluissa.

## L

**Load Balancer**  
Palvelu, joka jakaa saapuvan verkkoliikenteen useiden palvelimien tai ilmentymien kesken.

**Log Analytics**  
Azure-palvelu telemetriatietojen keräämiseen, analysointiin ja hyödyntämiseen pilvi- ja paikallisympäristöistä.

## M

**Managed Identity**  
Azure-ominaisuus, joka tarjoaa Azure-palveluille automaattisesti hallinnoidun identiteetin muiden Azure-palveluiden todentamista varten.

**Microservices**  
Arkkitehtoninen lähestymistapa, jossa sovellukset rakennetaan kokoelmasta pieniä, itsenäisiä palveluja.

**Monitor**  
Azuren yhtenäinen valvontaratkaisu, joka tarjoaa koko pinon havainnoitavuutta sovelluksille ja infrastruktuurille.

## N

**Node.js**  
JavaScript-suoritin, joka on rakennettu Chrome V8 -moottorin päälle ja jota käytetään palvelinpuolen sovellusten rakentamiseen.

**npm**  
Node.js:n paketinhallinta, joka hallinnoi riippuvuuksia ja paketteja.

## O

**Output**  
Arvot, jotka palautuvat infrastruktuurin käyttöönotosta ja joita sovellukset tai muut resurssit voivat käyttää.

## P

**Package**  
Prosessi, jossa sovelluskoodi ja riippuvuudet valmistellaan käyttöönottoa varten.

**Parameters**  
Syötearvot, jotka välitetään infrastruktuurimalleille käyttöönottojen mukauttamiseksi.

**PostgreSQL**  
Avoimen lähdekoodin relaatiotietokantajärjestelmä, jota tuetaan hallittuna palveluna Azuressa.

**Provisioning**  
Prosessi Azure-resurssien luomiseksi ja konfiguroimiseksi infrastruktuurimalleissa määritellyn mukaisesti.

## Q

**Quota**  
Rajoitukset resurssien määrälle, joita voidaan luoda Azure-tilauksessa tai alueella.

## R

**Resource Group**  
Looginen säiliö Azure-resursseille, jotka jakavat saman elinkaaren, käyttöoikeudet ja politiikat.

**Resource Token**  
Ainutkertainen merkkijono, jonka azd generoi varmistaakseen resurssien nimet ainutkertaisiksi käyttöönottojen välillä.

**REST API**  
Arkkitehtoninen tyyli verkkosovellusten suunnitteluun HTTP-menetelmiä käyttäen.

**Rollback**  
Prosessi, jossa palautetaan aiempi versio sovelluksesta tai infrastruktuurikokoonpanosta.

## S

**Service**  
Sovelluksen komponentti, joka on määritelty azure.yaml-tiedostossa (esim. web-frontend, API-backend, tietokanta).

**SKU**  
Stock Keeping Unit. Kuvastaa eri palvelutasoja tai suorituskykyvaihtoehtoja Azure-resursseille.

**SQL Database**  
Azuren hallittu relaatiotietokantapalvelu, joka perustuu Microsoft SQL Serveriin.

**Static Web Apps**  
Azure-palvelu täyspinon verkkosovellusten rakentamiseen ja käyttöönottoon lähdekoodivarastoista.

**Storage Account**  
Azure-palvelu, joka tarjoaa pilvitallennuksen datalle, mukaan lukien blobit, tiedostot, jonot ja taulut.

**Subscription**  
Azure-tilauksen säiliö, joka sisältää Resource Groupit ja resurssit sekä niihin liittyvän laskutuksen ja käyttöoikeuksien hallinnan.

## T

**Template**  
Esirakennettu projektirakenne, joka sisältää sovelluskoodin, infrastruktuurin määritelmät ja konfiguraation yleisiin skenaarioihin.

**Terraform**  
Avoimen lähdekoodin Infrastructure as Code -työkalu, joka tukee useita pilvipalveluntarjoajia, mukaan lukien Azure.

**Traffic Manager**  
Azuren DNS-pohjainen liikenteen kuormantasaaja, joka jakaa liikennettä maailmanlaajuisesti eri Azure-alueiden välillä.

## U

**URI**  
Uniform Resource Identifier. Merkkijono, joka tunnistaa tietyn resurssin.

**URL**  
Uniform Resource Locator. URI-tyyppi, joka määrittää, missä resurssi sijaitsee ja miten se haetaan.

## V

**Virtual Network (VNet)**  
Perusrakennuspalikka yksityisverkoille Azuressa, joka tarjoaa eristystä ja segmentointia.

**VS Code**  
Visual Studio Code. Suosittu koodieditori, jolla on erinomainen Azure- ja azd-integraatio.

## W

**Webhook**  
HTTP-kutsu, joka laukaistaan tiettyjen tapahtumien perusteella, yleisesti käytetty CI/CD-putkissa.

**What-if**  
Azure-ominaisuus, joka näyttää, mitä muutoksia käyttöönotto tekisi ilman, että muutoksia todella suoritetaan.

## Y

**YAML**  
YAML ei ole merkintäkieli. Ihmislukuisuuteen suunniteltu tiedonserialisointistandardi, jota käytetään konfiguraatiotiedostoissa kuten azure.yaml.

## Z

**Zone**  
Fyysisesti erilliset sijainnit Azure-alueen sisällä, jotka tarjoavat redundanssia ja korkeaa saatavuutta.

---

## Yleiset lyhenteet

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Identiteetin ja pääsynhallinnan palvelu |
| ACR | Azure Container Registry | Konttikuvien rekisteröintipalvelu |
| AKS | Azure Kubernetes Service | Hallittu Kubernetes-palvelu |
| API | Application Programming Interface | Rajapintaohjelmointirajapinta ohjelmiston rakentamiseen |
| ARM | Azure Resource Manager | Azuren käyttöönotto- ja hallintapalvelu |
| CDN | Content Delivery Network | Palvelimista koostuva jakeluverkko |
| CI/CD | Continuous Integration/Continuous Deployment | Automaattiset kehitys- ja käyttöönotto-käytännöt |
| CLI | Command Line Interface | Tekstipohjainen käyttäjäliittymä |
| DNS | Domain Name System | Järjestelmä, joka muuntaa domain-nimet IP-osoitteiksi |
| HTTPS | Hypertext Transfer Protocol Secure | Suojattu HTTP-versio |
| IaC | Infrastructure as Code | Infrastruktuurin hallinta koodin avulla |
| JSON | JavaScript Object Notation | Tiedonvaihtoformaatti |
| JWT | JSON Web Token | Tietoturvallinen tunniste tietojen välitykseen |
| KQL | Kusto Query Language | Kyselykieli Azure-tietopalveluille |
| RBAC | Role-Based Access Control | Käyttöoikeuksien hallinta roolien perusteella |
| REST | Representational State Transfer | Arkkitehtoninen tyyli web-palveluille |
| SDK | Software Development Kit | Kokoelma kehitystyökaluja |
| SLA | Service Level Agreement | Sitoumus palvelun saatavuudesta/suorituskyvystä |
| SQL | Structured Query Language | Kieli relaatiotietokantojen hallintaan |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiset protokollat |
| URI | Uniform Resource Identifier | Resurssia tunnistava merkkijono |
| URL | Uniform Resource Locator | URI:n tyyppi, joka määrittää resurssin sijainnin |
| VM | Virtual Machine | Tietokonejärjestelmän emulointi |
| VNet | Virtual Network | Yksityinen verkko Azuressa |
| YAML | YAML Ain't Markup Language | Tiedonserialisointistandardi |

---

## Azure-palveluiden nimikartoitukset

| Common Name | Official Azure Service Name | azd Host Type |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Storage | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Search | Azure AI Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Kontekstiin liittyvät termit

### Kehitykseen liittyvät termit
- **Hot Reload**: Sovellusten automaattinen päivittäminen kehityksen aikana ilman uudelleenkäynnistystä
- **Build Pipeline**: Automaattinen prosessi koodin rakentamiseen ja testaamiseen
- **Deployment Slot**: Staging-ympäristö App Servicessä
- **Environment Parity**: Kehitys-, staging- ja tuotantoympäristöjen pitäminen samankaltaisina

### Turvallisuusterminologia
- **Managed Identity**: Azure-ominaisuus, joka tarjoaa automaattisen tunnistetietojen hallinnan
- **Key Vault**: Turvallinen säilytystila salaisuuksille, avaimille ja varmenteille
- **RBAC**: Roolipohjainen käyttöoikeuksien hallinta Azure-resursseille
- **Network Security Group**: Virtuaalinen palomuuri verkkoliikenteen hallintaan

### Valvontaan liittyvät termit
- **Telemetry**: Mittausten ja tietojen automaattinen keruu
- **Application Performance Monitoring (APM)**: Ohjelmiston suorituskyvyn valvonta
- **Log Analytics**: Palvelu lokitietojen keräämiseen ja analysointiin
- **Alert Rules**: Automaattiset ilmoitukset metriikoihin tai ehtoihin perustuen

### Käyttöönottoon liittyvät termit
- **Blue-Green Deployment**: Käyttöönotto-strategia, joka mahdollistaa käyttökatkojen välttämisen
- **Canary Deployment**: Asteittainen julkaisu osalle käyttäjistä
- **Rolling Update**: Sovellusinstanssien korvaaminen peräkkäin
- **Rollback**: Palautus aiempaan sovellusversioon

---

**Käyttövinkki**: Käytä `Ctrl+F` etsiäksesi nopeasti tiettyjä termejä tässä sanastossa. Termit ovat ristiviitteitä tarvittaessa.

---

**Navigointi**
- **Edellinen oppitunti**: [Muistilista](cheat-sheet.md)
- **Seuraava oppitunti**: [Usein kysytyt kysymykset](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->