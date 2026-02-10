# Sanasto - Azure ja AZD -terminologia

**Viite kaikkiin lukuihin**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Opiskele perusteet**: [Luku 1: AZD-perusteet](../docs/getting-started/azd-basics.md)
- **🤖 AI-termit**: [Luku 2: AI-ensuuntautunut kehitys](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Johdanto

Tämä kattava sanasto tarjoaa määritelmiä Azure Developer CLI:ssä ja Azure-pilvikehityksessä käytetyille termeille, käsitteille ja lyhenteille. Olennaista viitetietoa teknisen dokumentaation ymmärtämiseen, ongelmanratkaisuun ja tehokkaaseen kommunikointiin azd-projektien ja Azure-palveluiden yhteydessä.

## Oppimistavoitteet

Tämän sanaston avulla voit:
- Ymmärtää keskeiset Azure Developer CLI -terminologian käsitteet
- Hallita Azure-pilvikehityksen sanaston ja tekniset termit
- Viitata Infrastructure as Code- ja käyttöönotto-termistöön tehokkaasti
- Ymmärtää Azure-palveluiden nimet, lyhenteet ja niiden tarkoitukset
- Saada määritelmiä vianmääritys- ja debuggaustermeille
- Oppia edistyneitä Azure-arkkitehtuuriin ja kehitykseen liittyviä käsitteitä

## Oppimistulokset

Säännöllisen viittauksen avulla tähän sanastoon pystyt:
- Kommunikoimaan tehokkaasti käyttäen asianmukaista Azure Developer CLI -terminologiaa
- Ymmärtämään teknistä dokumentaatiota ja virheilmoituksia selkeämmin
- Navigoimaan Azure-palveluissa ja käsitteissä itsevarmasti
- Vianmääritykseen sopivan teknisen sanaston avulla
- Osallistumaan tiimikeskusteluihin täsmällisellä teknisellä kielellä
- Laajentamaan Azure-pilvikehityksen tietämystäsi systemaattisesti

## A

**ARM-malli**  
Azure Resource Manager -malli. JSON-pohjainen Infrastructure as Code -muoto, jota käytetään Azure-resurssien deklaratiiviseen määrittelyyn ja käyttöönottoon.

**App Service**  
Azuren platform-as-a-service (PaaS) -tarjous web-sovellusten, REST-rajapintojen ja mobiilitaustojen isännöintiin ilman infrastruktuurin hallintaa.

**Application Insights**  
Azuren sovelluksen suorituskyvyn valvontapalvelu (APM), joka tarjoaa syvällistä tietoa sovelluksen suorituskyvystä, käytettävyydestä ja käytöstä.

**Azure CLI**  
Komentorivityökalu Azure-resurssien hallintaan. Sitä käyttää azd todennukseen ja joihinkin toimintoihin.

**Azure Developer CLI (azd)**  
Kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamista ja käyttöönottoa Azureen käyttämällä malleja ja Infrastructure as Code -periaatetta.

**azure.yaml**  
Pääkonfiguraatiotiedosto azd-projektille, joka määrittelee palvelut, infrastruktuurin ja käyttöönoton hookit.

**Azure Resource Manager (ARM)**  
Azuren käyttöönotto- ja hallintapalvelu, joka tarjoaa hallintakerroksen resurssien luomiseen, päivittämiseen ja poistamiseen.

## B

**Bicep**  
Microsoftin kehittämä domain-spesifinen kieli (DSL) Azure-resurssien käyttöönottoon. Tarjoaa yksinkertaisemman syntaksin kuin ARM-mallit ja kääntyy ARM:iin.

**Build**  
Prosessi, jossa lähdekoodi käännetään, riippuvuudet asennetaan ja sovellukset valmistellaan käyttöönottoa varten.

**Blue-Green Deployment**  
Käyttöönotto-strategia, joka käyttää kahta identtistä tuotantoympäristöä (blue ja green) käyttökatkosten ja riskin minimoimiseksi.

## C

**Container Apps**  
Azuren serveritön konttipalvelu, joka mahdollistaa konttien ajamisen ilman monimutkaisen infrastruktuurin hallintaa.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automaattiset käytännöt koodimuutosten integroimiseksi ja sovellusten käyttöönotoksi.

**Cosmos DB**  
Azuren maailmanlaajuisesti hajautettu, monimalli-tietokantapalvelu, joka tarjoaa kattavat SLA:t läpäisevyydelle, latenssille, saatavuudelle ja konsistenssille.

**Configuration**  
Asetukset ja parametrit, jotka ohjaavat sovelluksen käyttäytymistä ja käyttöönottoasetuksia.

## D

**Deployment**  
Prosessi, jossa sovellukset ja niiden riippuvuudet asennetaan ja konfiguroidaan kohdeinfrastruktuuriin.

**Docker**  
Alusta sovellusten kehittämiseen, toimittamiseen ja ajamiseen konttiteknologiaa hyödyntäen.

**Dockerfile**  
Tekstitiedosto, joka sisältää ohjeet Docker-konttikuvun rakentamiseen.

## E

**Environment**  
Käyttöönottokohde, joka edustaa tiettyä sovelluksen esiintymää (esim. development, staging, production).

**Environment Variables**  
Asetusarvot, jotka tallennetaan avain-arvopareina ja joihin sovellukset voivat päästä käsiksi ajonaikana.

**Endpoint**  
URL tai verkkotunnus, josta sovellukseen tai palveluun pääsee käsiksi.

## F

**Function App**  
Azuren serverless-laskentapalvelu, joka mahdollistaa tapahtumaohjatun koodin suorittamisen ilman infrastruktuurin hallintaa.

## G

**GitHub Actions**  
GitHub-repositorioihin integroitava CI/CD-alusta työnkulkujen automatisointiin.

**Git**  
Hajautettu versionhallintajärjestelmä, jota käytetään lähdekoodin muutosten seuraamiseen.

## H

**Hooks**  
Mukautetut skriptit tai komennot, jotka suoritetaan tietyissä kohdissa käyttöönoton elinkaaren aikana (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azure-palvelutyyppi, johon sovellus tullaan käyttöönottaa (esim. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Käytäntö infrastruktuurin määrittelystä ja hallinnasta koodin avulla manuaalisten prosessien sijaan.

**Init**  
Uuden azd-projektin alustamisprosessi, yleensä mallipohjaisesti.

## J

**JSON**  
JavaScript Object Notation. Lähinnä konfigurointi- ja API-vastausten tietojenvaihtoformaatti.

**JWT**  
JSON Web Token. Standardi tietojen turvalliseen välittämiseen osapuolten välillä JSON-objektina.

## K

**Key Vault**  
Azuren palvelu salaisuuksien, avainten ja sertifikaattien turvalliseen tallentamiseen ja hallintaan.

**Kusto Query Language (KQL)**  
Kyselykieli, jota käytetään datan analysointiin Azure Monitorissa, Application Insightsissa ja muissa Azure-palveluissa.

## L

**Load Balancer**  
Palvelu, joka jakaa saapuvan verkkoliikenteen useiden palvelimien tai instanssien kesken.

**Log Analytics**  
Azuren palvelu telemetriadatan keräämiseen, analysointiin ja hyödyntämiseen pilvi- ja paikallisympäristöistä.

## M

**Managed Identity**  
Azure-ominaisuus, joka tarjoaa Azure-palveluille automaattisesti hallinnoidun identiteetin muiden Azure-palveluiden todennukseen.

**Microservices**  
Arkkitehtoninen lähestymistapa, jossa sovellus koostuu pienistä, itsenäisistä palveluista.

**Monitor**  
Azuren yhtenäinen valvontaratkaisu, joka tarjoaa täyspinnoisen näkyvyyden sovelluksiin ja infrastruktuuriin.

## N

**Node.js**  
Chromen V8-moottorin päälle rakennettu JavaScript-ajonaikaympäristö palvelinpuolen sovellusten rakentamiseen.

**npm**  
Node.js:n pakettienhallinta, joka hallitsee riippuvuuksia ja paketteja.

## O

**Output**  
Arvot, jotka palautuvat infrastruktuurin käyttöönotosta ja joita sovellukset tai muut resurssit voivat hyödyntää.

## P

**Package**  
Prosessi, jossa sovelluskoodi ja riippuvuudet valmistellaan käyttöönottoa varten.

**Parameters**  
Syöttöarvot, jotka välitetään infrastruktuurimalleille käyttöönottojen räätälöimiseksi.

**PostgreSQL**  
Avoimen lähdekoodin relaatiotietokantajärjestelmä, jota Azure tukee hallinnoituna palveluna.

**Provisioning**  
Prosessi Azure-resurssien luomiseksi ja konfiguroimiseksi infrastruktuurimalleissa määriteltyjen asetusten mukaisesti.

## Q

**Quota**  
Rajoitukset sille, kuinka paljon resursseja voidaan luoda Azure-tilauksessa tai -alueella.

## R

**Resource Group**  
Looginen kontti Azure-resursseille, jotka jakavat saman elinkaaren, käyttöoikeudet ja politiikat.

**Resource Token**  
Ainutlaatuinen merkkijono, jonka azd luo varmistaakseen, että resurssien nimet ovat yksilöllisiä käyttöönottojen välillä.

**REST API**  
Arkkitehtoninen tyyli verkottuneiden sovellusten suunnitteluun HTTP-menetelmiä käyttäen.

**Rollback**  
Prosessi, jossa palautetaan aiempi versio sovelluksesta tai infrastruktuurin konfiguraatiosta.

## S

**Service**  
Sovelluksesi komponentti, joka on määritelty azure.yaml-tiedostossa (esim. web frontend, API backend, tietokanta).

**SKU**  
Stock Keeping Unit. Kuvaa erilaisia palvelutasoja tai suorituskykyvaihtoehtoja Azure-resursseille.

**SQL Database**  
Azuren hallinnoitu relaatiotietokantapalvelu, joka perustuu Microsoft SQL Serveriin.

**Static Web Apps**  
Azure-palvelu koko pinon web-sovellusten rakentamiseen ja käyttöönottoon lähdekoodivarastoista.

**Storage Account**  
Azure-palvelu, joka tarjoaa pilvitallennustilan objekteille, kuten blobeille, tiedostoille, jonoille ja taulukoille.

**Subscription**  
Azure-tilin kontti, joka sisältää resurssiryhmät ja resurssit sekä siihen liittyvän laskutuksen ja käyttöoikeuksien hallinnan.

## T

**Template**  
Ennalta rakennettu projektirakenne, joka sisältää sovelluskoodin, infrastruktuurin määrittelyt ja konfiguraation yleisiin skenaarioihin.

**Terraform**  
Avoimen lähdekoodin Infrastructure as Code -työkalu, joka tukee useita pilvitarjoajia, mukaan lukien Azure.

**Traffic Manager**  
Azuren DNS-pohjainen liikenteen kuormantasain, joka jakaa liikennettä globaalisti Azure-alueiden välillä.

## U

**URI**  
Uniform Resource Identifier. Merkkijono, joka tunnistaa tietyn resurssin.

**URL**  
Uniform Resource Locator. URI:n tyyppi, joka kertoo, missä resurssi sijaitsee ja miten sen saa haettua.

## V

**Virtual Network (VNet)**  
Perusrakenne yksityisverkoille Azuressa, tarjoten eristystä ja segmentointia.

**VS Code**  
Visual Studio Code. Suosittu koodieditori, jolla on erinomainen Azure- ja azd-integraatio.

## W

**Webhook**  
HTTP-kutsupohjainen palautus, joka laukaistaan tiettyjen tapahtumien yhteydessä, yleisesti käytetty CI/CD-putkissa.

**What-if**  
Azure-ominaisuus, joka näyttää, mitä muutoksia käyttöönotto tekisi ilman, että se suoritetaan todella.

## Y

**YAML**  
YAML Ain't Markup Language. Ihmislukuiseksi suunniteltu tietojen sarjoitusstandardi, jota käytetään konfiguraatiotiedostoissa kuten azure.yaml.

## Z

**Zone**  
Fysikaalisesti erillisiä sijainteja Azure-alueen sisällä, jotka tarjoavat redundanssia ja korkean saatavuuden.

---

## Yleiset lyhenteet

| Lyhenne | Koko nimi | Kuvaus |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identiteetin ja pääsynhallinnan palvelu |
| ACR | Azure Container Registry | Konttikuvien rekisteröintipalvelu |
| AKS | Azure Kubernetes Service | Hallinnoitu Kubernetes-palvelu |
| API | Application Programming Interface | Sovellusohjelmointirajapinta |
| ARM | Azure Resource Manager | Azuren käyttöönoton ja hallinnan palvelu |
| CDN | Content Delivery Network | Sisällönjakeluverkko |
| CI/CD | Continuous Integration/Continuous Deployment | Automaattiset kehitys- ja käyttöönotto-käytännöt |
| CLI | Command Line Interface | Komentorivikäyttöliittymä |
| DNS | Domain Name System | Järjestelmä verkkotunnusten kääntämiseen IP-osoitteiksi |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP:n suojattu versio |
| IaC | Infrastructure as Code | Infrastruktuurin hallinta koodin avulla |
| JSON | JavaScript Object Notation | Tietojenvaihtoformaatti |
| JWT | JSON Web Token | Token-muoto turvalliseen tietojen välitykseen |
| KQL | Kusto Query Language | Kyselykieli Azure-datapalveluille |
| RBAC | Role-Based Access Control | Roolipohjainen käyttöoikeuksien hallinta |
| REST | Representational State Transfer | Verkkopalvelujen arkkitehtoninen tyyli |
| SDK | Software Development Kit | Ohjelmistokehityspaketti |
| SLA | Service Level Agreement | Palvelutasositoumus |
| SQL | Structured Query Language | Relaatiotietokantojen hallintaan tarkoitettu kieli |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiset protokollat |
| URI | Uniform Resource Identifier | Resurssin tunnistava merkkijono |
| URL | Uniform Resource Locator | URI-tyyppi, joka määrittää resurssin sijainnin |
| VM | Virtual Machine | Tietokonejärjestelmän emulaatio |
| VNet | Virtual Network | Yksityisverkko Azuressa |
| YAML | YAML Ain't Markup Language | Tietojen sarjoitusstandardi |

---

## Azure-palvelujen nimien vastaavuudet

| Yleinen nimi | Virallinen Azure-palvelun nimi | azd Host -tyyppi |
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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Kontekstiin liittyvät termit

### Kehitykseen liittyvät termit
- **Hot Reload**: Sovellusten automaattinen päivitys kehityksen aikana ilman uudelleenkäynnistystä
- **Build Pipeline**: Automaattinen prosessi koodin rakentamiseen ja testaamiseen
- **Deployment Slot**: Staging-ympäristö App Servicessä
- **Environment Parity**: Kehitys-, staging- ja tuotantoympäristöjen pitäminen samanlaisina

### Turvallisuuteen liittyvät termit
- **Managed Identity**: Azure-ominaisuus, joka tarjoaa automaattisen tunnistetietojen hallinnan
- **Key Vault**: Turvallinen säiliö salaisuuksille, avaimille ja sertifikaateille
- **RBAC**: Roolipohjainen käyttöoikeuksien hallinta Azure-resursseille
- **Network Security Group**: Virtuaalinen palomuuri verkkoliikenteen hallintaan

### Valvontaan liittyvät termit
- **Telemetry**: Mittausten ja datan automaattinen kerääminen
- **Application Performance Monitoring (APM)**: Sovellusten suorituskyvyn valvonta
- **Log Analytics**: Palvelu lokidatan keräämiseen ja analysointiin
- **Alert Rules**: Automaattiset ilmoitukset mittarien tai ehtojen perusteella

### Käyttöönottoon liittyvät termit
- **Blue-Green Deployment**: Käyttöönotto-strategia ilman käyttökatkoksia
- **Canary Deployment**: Asteittainen käyttöönotto osalle käyttäjistä
- **Rolling Update**: Sovellusinstanssien peräkkäinen korvaaminen
- **Rollback**: Palautus aiempaan sovellusversioon

---

**Käyttövinkki**: Käytä `Ctrl+F` etsiäksesi nopeasti tiettyjä termejä tässä sanastossa. Termit on ristiinviitattu tarvittaessa.

---

**Navigointi**
- **Edellinen oppitunti**: [Muistilista](cheat-sheet.md)
- **Seuraava oppitunti**: [UKK](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automatisoiduissa käännöksissä saattaa olla virheitä tai epätarkkuuksia. Alkuperäinen asiakirja alkuperäiskielellään on määräävä lähde. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä johtuvista väärinkäsityksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->