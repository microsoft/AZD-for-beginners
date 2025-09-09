<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "59cb1c1635512e212da16d50f3259ca4",
  "translation_date": "2025-09-09T22:50:50+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "fi"
}
-->
# Sanasto - Azure Developer CLI -terminologia

## Johdanto

Tämä kattava sanasto tarjoaa määritelmiä termeille, käsitteille ja lyhenteille, joita käytetään Azure Developer CLI:ssä ja Azure-pilvikehityksessä. Olennainen viite teknisen dokumentaation ymmärtämiseen, ongelmien ratkaisemiseen ja tehokkaaseen viestintään azd-projekteista ja Azure-palveluista.

## Oppimistavoitteet

Tämän sanaston avulla opit:
- Ymmärtämään keskeiset Azure Developer CLI -terminologiat ja käsitteet
- Hallitsemaan Azure-pilvikehityksen sanaston ja tekniset termit
- Viittaamaan tehokkaasti Infrastructure as Code - ja käyttöönoton terminologiaan
- Ymmärtämään Azure-palveluiden nimet, lyhenteet ja niiden tarkoitukset
- Pääsemään käsiksi määritelmiin ongelmanratkaisun ja virheenkorjauksen terminologiasta
- Oppimaan edistyneitä Azure-arkkitehtuurin ja kehityksen käsitteitä

## Oppimistulokset

Säännöllisesti viittaamalla tähän sanastoon pystyt:
- Viestimään tehokkaasti käyttämällä oikeaa Azure Developer CLI -terminologiaa
- Ymmärtämään teknistä dokumentaatiota ja virheilmoituksia selkeämmin
- Navigoimaan Azure-palveluissa ja -käsitteissä itsevarmasti
- Ratkaisemaan ongelmia käyttämällä asianmukaista teknistä sanastoa
- Osallistumaan tiimikeskusteluihin tarkalla teknisellä kielellä
- Laajentamaan Azure-pilvikehityksen tietämystäsi järjestelmällisesti

## A

**ARM-malli**  
Azure Resource Manager -malli. JSON-pohjainen Infrastructure as Code -muoto, jota käytetään Azure-resurssien määrittämiseen ja käyttöönottoon deklaratiivisesti.

**App Service**  
Azuren platform-as-a-service (PaaS) -tarjonta verkkosovellusten, REST-API:iden ja mobiilitaustajärjestelmien isännöintiin ilman infrastruktuurin hallintaa.

**Application Insights**  
Azuren sovellussuorituskyvyn valvontapalvelu (APM), joka tarjoaa syvällisiä näkemyksiä sovelluksen suorituskyvystä, saatavuudesta ja käytöstä.

**Azure CLI**  
Komentoriviliittymä Azure-resurssien hallintaan. Käytetään azd:n autentikointiin ja joihinkin toimintoihin.

**Azure Developer CLI (azd)**  
Kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamista ja käyttöönottoa Azureen käyttämällä malleja ja Infrastructure as Code -menetelmiä.

**azure.yaml**  
azd-projektin pääkonfiguraatiotiedosto, joka määrittää palvelut, infrastruktuurin ja käyttöönoton koukut.

**Azure Resource Manager (ARM)**  
Azuren käyttöönotto- ja hallintapalvelu, joka tarjoaa hallintakerroksen resurssien luomiseen, päivittämiseen ja poistamiseen.

## B

**Bicep**  
Microsoftin kehittämä domain-specific language (DSL) Azure-resurssien käyttöönottoon. Tarjoaa yksinkertaisemman syntaksin kuin ARM-mallit ja kääntyy ARM-muotoon.

**Build**  
Lähdekoodin kääntämisen, riippuvuuksien asentamisen ja sovellusten valmistelun prosessi käyttöönottoa varten.

**Blue-Green Deployment**  
Käyttöönotto-strategia, joka käyttää kahta identtistä tuotantoympäristöä (sininen ja vihreä) minimoidakseen käyttökatkot ja riskit.

## C

**Container Apps**  
Azuren serverless-konttipalvelu, joka mahdollistaa konttien ajamisen ilman monimutkaisen infrastruktuurin hallintaa.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatisoidut käytännöt koodimuutosten integrointiin ja sovellusten käyttöönottoon.

**Cosmos DB**  
Azuren globaalisti hajautettu, monimallinen tietokantapalvelu, joka tarjoaa kattavat SLA:t läpimenolle, viiveelle, saatavuudelle ja johdonmukaisuudelle.

**Konfiguraatio**  
Asetukset ja parametrit, jotka ohjaavat sovelluksen toimintaa ja käyttöönoton vaihtoehtoja.

## D

**Käyttöönotto**  
Sovellusten ja niiden riippuvuuksien asentamisen ja konfiguroinnin prosessi kohdeinfrastruktuuriin.

**Docker**  
Alusta sovellusten kehittämiseen, toimittamiseen ja ajamiseen konttiteknologian avulla.

**Dockerfile**  
Tekstitiedosto, joka sisältää ohjeet Docker-konttikuvan rakentamiseen.

## E

**Ympäristö**  
Käyttöönoton kohde, joka edustaa sovelluksesi tiettyä instanssia (esim. kehitys, testaus, tuotanto).

**Ympäristömuuttujat**  
Konfiguraatioarvot, jotka tallennetaan avain-arvo-pareina ja joita sovellukset voivat käyttää ajon aikana.

**Päätepiste**  
URL-osoite tai verkkosoite, jossa sovellus tai palvelu on käytettävissä.

## F

**Function App**  
Azuren serverless-laskentapalvelu, joka mahdollistaa tapahtumapohjaisen koodin ajamisen ilman infrastruktuurin hallintaa.

## G

**GitHub Actions**  
CI/CD-alusta, joka on integroitu GitHub-repositorioihin työnkulkujen automatisointia varten.

**Git**  
Hajautettu versionhallintajärjestelmä, jota käytetään lähdekoodin muutosten seuraamiseen.

## H

**Hooks**  
Mukautettuja skriptejä tai komentoja, jotka suoritetaan tietyissä kohdissa käyttöönoton elinkaaren aikana (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Azuren palvelutyyppi, johon sovellus otetaan käyttöön (esim. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Käytäntö infrastruktuurin määrittämisestä ja hallinnasta koodin avulla manuaalisten prosessien sijaan.

**Init**  
Uuden azd-projektin alustamisen prosessi, yleensä mallista.

## J

**JSON**  
JavaScript Object Notation. Tiedonvaihtomuoto, jota käytetään yleisesti konfiguraatiotiedostoissa ja API-vastauksissa.

**JWT**  
JSON Web Token. Standardi tiedon turvalliseen välittämiseen osapuolten välillä JSON-objektina.

## K

**Key Vault**  
Azuren palvelu salaisuuksien, avainten ja sertifikaattien turvalliseen säilyttämiseen ja hallintaan.

**Kusto Query Language (KQL)**  
Kyselykieli, jota käytetään datan analysointiin Azure Monitorissa, Application Insightsissa ja muissa Azure-palveluissa.

## L

**Kuormantasaaja**  
Palvelu, joka jakaa saapuvan verkkoliikenteen useiden palvelimien tai instanssien kesken.

**Log Analytics**  
Azuren palvelu pilvi- ja paikallisten ympäristöjen telemetriatietojen keräämiseen, analysointiin ja hyödyntämiseen.

## M

**Hallittu identiteetti**  
Azuren ominaisuus, joka tarjoaa Azure-palveluille automaattisesti hallitun identiteetin muiden Azure-palveluiden autentikointiin.

**Mikropalvelut**  
Arkkitehtuurinen lähestymistapa, jossa sovellukset rakennetaan pienistä, itsenäisistä palveluista.

**Monitorointi**  
Azuren yhtenäinen valvontaratkaisu, joka tarjoaa täyden näkyvyyden sovelluksiin ja infrastruktuuriin.

## N

**Node.js**  
JavaScript-ajoympäristö, joka on rakennettu Chromen V8 JavaScript-moottorin päälle palvelinpuolen sovellusten rakentamiseen.

**npm**  
Node.js:n paketinhallintaohjelma, joka hallitsee riippuvuuksia ja paketteja.

## O

**Output**  
Arvot, jotka palautetaan infrastruktuurin käyttöönotosta ja joita sovellukset tai muut resurssit voivat käyttää.

## P

**Paketti**  
Sovelluskoodin ja riippuvuuksien valmisteluprosessi käyttöönottoa varten.

**Parametrit**  
Syöttöarvot, jotka välitetään infrastruktuurimalleille käyttöönoton mukauttamiseksi.

**PostgreSQL**  
Avoimen lähdekoodin relaatiotietokantajärjestelmä, jota tuetaan hallittuna palveluna Azuren kautta.

**Provisioning**  
Azure-resurssien luomisen ja konfiguroinnin prosessi infrastruktuurimalleissa määritettyjen asetusten mukaisesti.

## Q

**Quota**  
Rajoitukset resurssien määrälle, jotka voidaan luoda Azure-tilauksessa tai alueella.

## R

**Resurssiryhmä**  
Looginen säiliö Azure-resursseille, jotka jakavat saman elinkaaren, käyttöoikeudet ja käytännöt.

**Resurssitunnus**  
azd:n generoima yksilöllinen merkkijono, joka varmistaa resurssien nimien ainutlaatuisuuden käyttöönottojen välillä.

**REST API**  
Arkkitehtuurityyli verkotettujen sovellusten suunnitteluun HTTP-menetelmien avulla.

**Rollback**  
Prosessi, jossa palataan sovelluksen tai infrastruktuurin aiempaan versioon.

## S

**Palvelu**  
Sovelluksesi komponentti, joka on määritelty azure.yaml-tiedostossa (esim. verkkokäyttöliittymä, API-taustajärjestelmä, tietokanta).

**SKU**  
Stock Keeping Unit. Edustaa eri palvelutasoja tai suorituskykytasoja Azure-resursseille.

**SQL-tietokanta**  
Azuren hallittu relaatiotietokantapalvelu, joka perustuu Microsoft SQL Serveriin.

**Static Web Apps**  
Azuren palvelu full-stack-verkkosovellusten rakentamiseen ja käyttöönottoon lähdekoodirepositorioista.

**Storage Account**  
Azuren palvelu, joka tarjoaa pilvitallennusta dataobjekteille, kuten blobit, tiedostot, jonot ja taulukot.

**Tilauksen**  
Azure-tili, joka sisältää resurssiryhmät ja resurssit, sekä niihin liittyvän laskutuksen ja käyttöoikeuksien hallinnan.

## T

**Malli**  
Valmiiksi rakennettu projektirakenne, joka sisältää sovelluskoodin, infrastruktuurimääritelmät ja konfiguraation yleisiin skenaarioihin.

**Terraform**  
Avoimen lähdekoodin Infrastructure as Code -työkalu, joka tukee useita pilvipalveluntarjoajia, mukaan lukien Azure.

**Traffic Manager**  
Azuren DNS-pohjainen liikenteen kuormantasaaja, joka jakaa liikenteen globaalien Azure-alueiden välillä.

## U

**URI**  
Uniform Resource Identifier. Merkkijono, joka tunnistaa tietyn resurssin.

**URL**  
Uniform Resource Locator. URI-tyyppi, joka määrittää, missä resurssi sijaitsee ja miten se haetaan.

## V

**Virtuaaliverkko (VNet)**  
Perusrakenne yksityisille verkoille Azuren sisällä, joka tarjoaa eristystä ja segmentointia.

**VS Code**  
Visual Studio Code. Suosittu koodieditori, joka tarjoaa erinomaisen Azure- ja azd-integraation.

## W

**Webhook**  
HTTP-pohjainen palautus, joka laukaistaan tiettyjen tapahtumien perusteella, yleisesti käytetty CI/CD-putkissa.

**What-if**  
Azuren ominaisuus, joka näyttää, mitä muutoksia käyttöönotto tekisi ilman, että se suoritetaan.

## Y

**YAML**  
YAML Ain't Markup Language. Ihmisen luettavissa oleva datan serialisointistandardi, jota käytetään konfiguraatiotiedostoissa, kuten azure.yaml.

## Z

**Vyöhyke**  
Fyysisesti erilliset sijainnit Azure-alueen sisällä, jotka tarjoavat redundanssia ja korkeaa saatavuutta.

---

## Yleiset lyhenteet

| Lyhenne | Täysi muoto | Kuvaus |
|---------|-------------|--------|
| AAD | Azure Active Directory | Identiteetti- ja käyttöoikeuksien hallintapalvelu |
| ACR | Azure Container Registry | Konttikuvarekisteripalvelu |
| AKS | Azure Kubernetes Service | Hallittu Kubernetes-palvelu |
| API | Application Programming Interface | Protokollat ohjelmiston rakentamiseen |
| ARM | Azure Resource Manager | Azuren käyttöönotto- ja hallintapalvelu |
| CDN | Content Delivery Network | Hajautettu palvelinverkosto |
| CI/CD | Continuous Integration/Continuous Deployment | Automatisoidut kehityskäytännöt |
| CLI | Command Line Interface | Tekstipohjainen käyttöliittymä |
| DNS | Domain Name System | Järjestelmä verkkotunnusten kääntämiseen IP-osoitteiksi |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP:n turvallinen versio |
| IaC | Infrastructure as Code | Infrastruktuurin hallinta koodin avulla |
| JSON | JavaScript Object Notation | Tiedonvaihtomuoto |
| JWT | JSON Web Token | Token-muoto turvalliseen tiedonvälitykseen |
| KQL | Kusto Query Language | Kyselykieli Azure-datapalveluille |
| RBAC | Role-Based Access Control | Käyttöoikeuksien hallintamenetelmä roolien perusteella |
| REST | Representational State Transfer | Arkkitehtuurityyli verkkopalveluille |
| SDK | Software Development Kit | Kehitystyökalujen kokoelma |
| SLA | Service Level Agreement | Sitoumus palvelun saatavuuteen/suorituskykyyn |
| SQL | Structured Query Language | Kieli relaatiotietokantojen hallintaan |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiset protokollat |
| URI | Uniform Resource Identifier | Merkkijono, joka tunnistaa resurssin |
| URL | Uniform Resource Locator | URI-tyyppi, joka määrittää resurssin sijainnin |
| VM | Virtual Machine | Tietokonejärjestelmän emulointi |
| VNet | Virtual Network | Yksityinen verkko Azuren sisällä |
| YAML | YAML Ain't Markup Language | Datan serialisointistandardi |

---

## Azure-palveluiden nimivastineet

| Yleinen nimi | Virallinen Azure-palvelun nimi | azd Host Type |
|--------------|--------------------------------|---------------|
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

## Kontekstikohtaiset termit

### Kehitystermit
- **Hot Reload**: Sovellusten automaattinen päivittäminen kehityksen aikana ilman uudelleenkäynnistystä
- **Build Pipeline**: Automatisoitu prosessi koodin rakentamiseen ja testaamiseen
- **Deployment Slot**: Staging-ympäristö App Servicen sisällä
- **Environment Parity**: Kehitys-, testaus- ja tuotantoympäristöjen yhdenmukaisuus

### Turvatermit
- **Managed Identity**: Azuren ominaisuus, joka tarjoaa automaattisen tunnusten hallinnan
- **Key Vault**: Turvallinen säilytys salaisuuksille, avaimille ja sertifikaateille
- **RBAC**: Roolipohjainen käyttöoikeuksien hallinta Azure-resursseille
- **Network Security Group**: Virtuaalinen palomuuri verkkoliikenteen hallintaan

### Valvontatermit
- **Telemetria**: Mittausten ja datan automaattinen kerääminen
- **Application Performance Monitoring (APM)**: Sovellussuorituskyvyn valvonta
- **Log Analytics**: Palvelu lokitietojen keräämiseen ja analysointiin
- **Alert Rules**: Automatisoidut ilmoitukset metristen tai ehtojen perusteella

### Käyttöönoton termit
- **Blue-Green Deployment**: Käyttökatkoton käyttöönotto-strategia
- **Canary Deployment**: Graduaalinen käyttöönotto käyttäjäjoukolle
- **Rolling Update**: Sovellusinstanssien peräkkäinen korvaaminen
- **Rollback**: Paluu sovelluksen aiempaan versioon

---

**Käyttövinkki**: Käytä `Ctrl+F`-toimintoa etsiäksesi nopeasti tiettyjä termejä tästä sanastosta. Termit on ristiviitattu, jos mahdollista.

---

**Navigointi**
- **Edellinen oppitunti**: [Cheat Sheet](cheat-sheet.md)
- **Seuraava oppitunti**: [FAQ](faq.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.