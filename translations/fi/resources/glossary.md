# Sanasto - Azure ja AZD Terminologia

**Viite kaikille luvuilla**
- **📚 Kurssin etusivu**: [AZD Aloittelijoille](../README.md)
- **📖 Opi perusteet**: [Luku 1: AZD Perusteet](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI Termit**: [Luku 2: AI-Ensimmäinen Kehitys](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Johdanto

Tämä laaja sanasto tarjoaa määritelmiä termeille, käsitteille ja lyhenteille, joita käytetään Azure Developer CLI:ssä ja Azuren pilvikehityksessä. Oleellinen viite teknisen dokumentaation ymmärtämiseen, vianmääritykseen ja tehokkaaseen viestintään azd-projekteista ja Azure-palveluista.

## Oppimistavoitteet

Tämän sanaston avulla:
- Ymmärrät keskeiset Azure Developer CLI -terminologiat ja käsitteet
- Hallitset Azuren pilvikehityksen sanaston ja tekniset termit
- Viittaat tehokkaasti Infrastructure as Code- ja käyttöönotto-termeihin
- Ymmärrät Azure-palvelujen nimet, lyhenteet ja niiden tarkoitukset
- Saat määritelmiä vianmääritykseen ja debuggaustermistöön
- Opit edistyneitä Azure-arkkitehtuurin ja kehityksen käsitteitä

## Oppimistulokset

Säännöllisen viittauksen avulla tähän sanastoon pystyt:
- Viestimään tehokkaasti käyttäen oikeita Azure Developer CLI -termejä
- Ymmärtämään teknistä dokumentaatiota ja virheilmoituksia selkeämmin
- Navigoimaan Azuren palveluissa ja käsitteissä luottavaisin mielin
- Vianmäärityksessä käyttämään asianmukaista teknistä sanastoa
- Osallistumaan tiimikeskusteluihin tarkalla teknisellä kielellä
- Laajentamaan Azure-pilvikehityksen tietämystäsi systemaattisesti

## A

**ARM Malli**  
Azure Resource Manager -malli. JSON-pohjainen Infrastructure as Code -muoto, jota käytetään Azure-resurssien määrittelyyn ja käyttöönottoon deklaratiivisesti.

**App Service**  
Azuren palvelualustan (PaaS) tarjoama ympäristö verkkosovellusten, REST-rajapintojen ja mobiilitaustapalveluiden isännöintiin ilman infrastruktuurin hallintaa.

**Application Insights**  
Azuren sovelluksen suorituskyvyn valvontapalvelu (APM), joka tarjoaa syvällistä tietoa sovelluksen suorituskyvystä, saatavuudesta ja käytöstä.

**Azure CLI**  
Komentoriviliittymä Azure-resurssien hallintaan. Se täydentää AZD:tä, mutta edellyttää erillistä kirjautumista; AZD:n ydinautentikoinnissa käytetään `azd auth login`.

**Azure Developer CLI (azd)**  
Kehittäjäkeskeinen komentorivityökalu, joka nopeuttaa sovellusten rakentamis- ja käyttöönottoprosessia Azureen käyttäen malleja ja Infrastructure as Code -periaatetta.

**azure.yaml**  
Azd-projektin pääkonfigurointitiedosto, joka määrittelee palvelut, infrastruktuurin ja käyttöönoton koukut.

**Azure Resource Manager (ARM)**  
Azuren käyttöönotto- ja hallintapalvelu, joka tarjoaa hallintakerroksen resurssien luomiseen, päivittämiseen ja poistamiseen.

## B

**Bicep**  
Microsoftin kehittämä domain-spesifinen kieli (DSL) Azure-resurssien käyttöönottoon. Tarjoaa yksinkertaisemman syntaksin kuin ARM-mallit ja kääntyy ARM:ksi.

**Build**  
Prosessi, jossa lähdekoodi käännetään, riippuvuudet asennetaan ja sovellukset valmistellaan käyttöönottoa varten.

**Blue-Green Deployment**  
Käyttöönotto-strategia, joka hyödyntää kahta identtistä tuotantoympäristöä (sininen ja vihreä) minimoi downtime-ajan ja riskin.

## C

**Container Apps**  
Azuren palvelimetön konttipalvelu, joka mahdollistaa konttien ajamisen ilman monimutkaisen infrastruktuurin hallintaa.

**CI/CD**  
Jatkuva integraatio/jatkuva käyttöönotto. Automaattiset käytännöt koodimuutosten integrointiin ja sovellusten käyttöönottoon.

**Cosmos DB**  
Azuren maailmanlaajuisesti jakautunut, monimalli tietokantapalvelu, joka tarjoaa kattavat SLA:t läpimenolle, latenssille, saatavuudelle ja konsistenssille.

**Konfiguraatio**  
Asetukset ja parametrit, jotka ohjaavat sovelluksen toimintaa ja käyttöönoton vaihtoehtoja.

## D

**Deployment**  
Prosessi, jossa asennetaan ja konfiguroidaan sovellukset ja niiden riippuvuudet kohdeinfrastruktuuriin.

**Docker**  
Alusta, jonka avulla kehitetään, toimitetaan ja ajetaan sovelluksia konttiteknologian avulla.

**Dockerfile**  
Tekstitiedosto, joka sisältää ohjeet Docker-konttikuvan rakentamiseen.

## E

**Ympäristö**  
Käyttöönottokohde, joka edustaa tiettyä sovelluksesi instanssia (esim. kehitys, testi, tuotanto).

**Ympäristömuuttujat**  
Konfiguraatioarvot, jotka tallennetaan avain-arvo -pareina ja joihin sovellukset voivat päästä käsiksi suoritusaikana.

**Endpoint**  
URL tai verkkosijainti, josta sovellus tai palvelu on saavutettavissa.

## F

**Function App**  
Azuren palvelimetön laskentapalvelu, joka mahdollistaa tapahtumapohjaisen koodin ajamisen ilman infrastruktuurin hallintaa.

## G

**GitHub Actions**  
CI/CD-alusta, joka on integroitu GitHub-repositorioihin työnkulkujen automatisointia varten.

**Git**  
Hajautettu versionhallintajärjestelmä, jota käytetään lähdekoodin muutosten seurantaan.

## H

**Hooks**  
Mukautetut skriptit tai komennot, jotka suoritetaan tietyissä vaiheissa käyttöönoton elinkaaressa (preprovision, postprovision, predeploy, postdeploy).

**Isäntä**  
Azuren palvelutyyppi, johon sovellus asennetaan (esim. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Käytäntö infrastruktuurin määrittelyyn ja hallintaan koodin avulla manuaalisten prosessien sijaan.

**Init**  
Uuden azd-projektin alustamisprosessi, tyypillisesti mallin pohjalta.

## J

**JSON**  
JavaScript Object Notation. Yleisesti käytetty tiedonsiirtoformaatti konfiguraatiotiedostoissa ja API-vastauksissa.

**JWT**  
JSON Web Token. Standardi turvalliseen tiedonsiirtoon osapuolten välillä JSON-objektina.

## K

**Key Vault**  
Azuren palvelu salaisuuksien, avainten ja sertifikaattien turvalliseen tallennukseen ja hallintaan.

**Kusto Query Language (KQL)**  
Kyselykieli, jota käytetään Azuren Monitorin, Application Insightsin ja muiden palvelujen datan analysointiin.

## L

**Load Balancer**  
Palvelu, joka jakaa saapuvan verkkoliikenteen useiden palvelimien tai instanssien kesken.

**Log Analytics**  
Azure-palvelu telemetriadatan keräämiseen, analysointiin ja hyödyntämiseen pilvi- ja paikallisympäristöissä.

## M

**Managed Identity**  
Azuren ominaisuus, joka tarjoaa palveluille automaattisesti hallinnoidun identiteetin muiden Azure-palvelujen todennukseen.

**Microservices**  
Arkkitehtoninen lähestymistapa, jossa sovellukset rakennetaan pienen, itsenäisten palvelujen kokoelmana.

**Monitor**  
Azuren yhtenäinen valvontaratkaisu, joka tarjoaa kattavan näkyvyyden sovelluksiin ja infrastruktuuriin.

## N

**Node.js**  
JavaScript-suoritinympäristö, joka rakentuu Chromen V8-moottorin päälle ja jota käytetään palvelinpuolen sovellusten rakentamiseen.

**npm**  
Node.js:n pakettienhallinta, joka hallitsee riippuvuuksia ja paketteja.

## O

**Output**  
Arvot, jotka palautuvat infrastruktuurin käyttöönotosta ja joita sovellukset tai muut resurssit voivat käyttää.

## P

**Package**  
Prosessi, jossa sovelluskoodi ja riippuvuudet valmistellaan käyttöönottoa varten.

**Parameters**  
Syötearvot, jotka välitetään infrastruktuurimalleille käyttöönottojen mukauttamiseksi.

**PostgreSQL**  
Avoimen lähdekoodin relaatiotietokantajärjestelmä, jota tuetaan Azure-managed palveluna.

**Provisioning**  
Prosessi, jossa luodaan ja konfiguroidaan Azure-resursseja infrastruktuurimalleihin määriteltyjen tietojen mukaan.

## Q

**Quota**  
Rajat resurssien määrälle, joita voidaan luoda Azure-tilauksessa tai alueella.

## R

**Resource Group**  
Looginen kontti Azure-resursseille, jotka jakavat saman elinkaaren, käyttöoikeudet ja politiikat.

**Resource Token**  
Azdin generoima ainutkertainen merkkijono resurssien nimien yksilöimiseksi käyttöönottojen yli.

**REST API**  
Arkkitehtoninen tyyli verkko-ohjelmistojen suunnitteluun HTTP-metodeja käyttäen.

**Rollback**  
Prosessi, jossa palautetaan sovellus tai infrastruktuurin konfiguraatio aiempaan versioon.

## S

**Palvelu**  
Sovelluksen komponentti, joka on määritelty azure.yaml:ssä (esim. web-käyttöliittymä, API-taustajärjestelmä, tietokanta).

**SKU**  
Stock Keeping Unit. Edustaa erilaisia palvelutasoluokkia tai suorituskykytasoja Azure-resursseille.

**SQL Database**  
Azuren hallittu relaatiotietokantapalvelu, joka perustuu Microsoft SQL Serveriin.

**Static Web Apps**  
Azure-palvelu täyden pinon web-sovellusten rakentamiseen ja käyttöönottoon lähdekoodivarastoista.

**Storage Account**  
Azure-palvelu, joka tarjoaa pilvitallennustilan datakohteille kuten blobit, tiedostot, jonot ja taulukot.

**Subscription**  
Azure-tilin kontti, joka sisältää resurssiryhmiä ja resursseja, sekä niihin liittyvän laskutuksen ja käyttöoikeuden hallinnan.

## T

**Template**  
Esirakennettu projektirakenne, joka sisältää sovelluskoodin, infrastruktuurin määritelmät ja konfiguraation yleisiin käyttötapauksiin.

**Terraform**  
Avoimen lähdekoodin Infrastructure as Code -työkalu, joka tukee useita pilvipalveluntarjoajia mukaan lukien Azure.

**Traffic Manager**  
Azuren DNS-pohjainen liikenteen kuormantasain, joka jakaa liikennettä maailmanlaajuisesti Azure-alueiden kesken.

## U

**URI**  
Uniform Resource Identifier. Merkkijono, joka tunnistaa tietyn resurssin.

**URL**  
Uniform Resource Locator. URI:n tyyppi, joka määrittelee resurssin sijainnin ja tavan sen hakemiseen.

## V

**Virtual Network (VNet)**  
Perusrakenne yksityisille verkoille Azure:ssa, joka tarjoaa eristyksen ja segmentoinnin.

**VS Code**  
Visual Studio Code. Suosittu koodieditori, jossa on erinomainen Azure- ja azd-integraatio.

## W

**Webhook**  
HTTP callback, joka laukaistaan tietyissä tapahtumissa, yleisesti käytetty CI/CD-putkistoissa.

**What-if**  
Azure-ominaisuus, joka näyttää, mitä muutoksia käyttöönotto tekisi ilman, että se suoritetaan.

## Y

**YAML**  
YAML Ain't Markup Language. Ihmislukuisen datan serialisointistandardi, jota käytetään konfiguraatiotiedostoissa kuten azure.yaml.

## Z

**Zone**  
Fyysisesti erilliset sijainnit Azure-alueen sisällä, jotka tarjoavat redundanssia ja korkeaa käytettävyyttä.

---

## Yleiset lyhenteet

| Lyhenne | Täysi muoto | Kuvaus |
|---------|-----------|-------------|
| AAD | Azure Active Directory (nykyisin Microsoft Entra ID) | Identiteetin ja pääsynhallintapalvelu |
| ACR | Azure Container Registry | Konttikuvarekisteripalvelu |
| AKS | Azure Kubernetes Service | Hallittu Kubernetes-palvelu |
| API | Application Programming Interface | Ohjelmistojen rakentamista varten määritelty protokollakokoelma |
| ARM | Azure Resource Manager | Azuren käyttöönotto- ja hallintapalvelu |
| CDN | Content Delivery Network | Hajautettu palvelinverkko |
| CI/CD | Continuous Integration/Continuous Deployment | Automaattiset kehityskäytännöt |
| CLI | Command Line Interface | Tekstipohjainen käyttöliittymä |
| DNS | Domain Name System | Järjestelmä, joka kääntää verkkotunnukset IP-osoitteiksi |
| HTTPS | Hypertext Transfer Protocol Secure | HTTP:n turvallinen versio |
| IaC | Infrastructure as Code | Infrastruktuurin hallinta koodin avulla |
| JSON | JavaScript Object Notation | Tiedonsiirtoformaatti |
| JWT | JSON Web Token | Turvalliseen tiedonsiirtoon tarkoitettu token-muoto |
| KQL | Kusto Query Language | Kyselykieli Azure-datapalveluille |
| RBAC | Role-Based Access Control | Käyttöoikeuksien hallintamenetelmä käyttäjäroolien perusteella |
| REST | Representational State Transfer | Web-palveluiden arkkitehtoninen tyyli |
| SDK | Software Development Kit | Kehitystyökalupaketti |
| SLA | Service Level Agreement | Sitoumus palvelun saatavuudesta/suorituskyvystä |
| SQL | Structured Query Language | Relaatiotietokantojen hallintakieli |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiset protokollat |
| URI | Uniform Resource Identifier | Resurssin tunnistava merkkijono |
| URL | Uniform Resource Locator | URI:n tyyppi, joka määrittää resurssin sijainnin |
| VM | Virtual Machine | Tietokonejärjestelmän emulaatio |
| VNet | Virtual Network | Yksityisverkko Azure:ssa |
| YAML | YAML Ain't Markup Language | Dataserialisointistandardi |

---

## Azure-palvelujen nimien vastineet

| Yleinen nimi | Virallinen Azure-palvelun nimi | azd Isäntätunnus |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Database | Azure Database for PostgreSQL | Infrastruktuuriresurssi, ei sovellus `host` |
| NoSQL DB | Azure Cosmos DB | Infrastruktuuriresurssi, ei sovellus `host` |
| Storage | Azure Storage Account | Infrastruktuuriresurssi, ei sisäänrakennettu sovellus `host` |
| Cache | Azure Managed Redis | Infrastruktuuriresurssi, ei sovellus `host` |
| Search | Azure AI Search | Infrastruktuuriresurssi, ei sovellus `host` |
| Messaging | Azure Service Bus | Infrastruktuuriresurssi, ei sovellus `host` |

`services.<name>.host` valitsee sovelluksen käyttöönoton kohteen; se ei ole mikään Azure-resurssityyppien lyhenne. Tietokannat, välimuistit, hakupalvelut ja jonot yleensä provisionoidaan infrastruktuuripalveluntarjoajan kautta ja liitetään sovellukseen outputtein/konfiguraation kautta.

---

## Kontekstisidonnaiset termit

### Kehitystermit
- **Hot Reload**: Sovellusten automaattinen päivitys kehityksen aikana ilman uudelleenkäynnistystä
- **Build Pipeline**: Automatisoitu prosessi koodin rakentamiseksi ja testaamiseksi
- **Deployment Slot**: Välivaiheen ympäristö App Servicessä
- **Environment Parity**: Kehitys-, testi- ja tuotantoympäristöjen samankaltaisuuden ylläpito

### Turvallisuustermit
- **Managed Identity**: Azure-ominaisuus, joka tarjoaa automaattisen tunnistetietojen hallinnan
- **Key Vault**: Salaisuuksien, avainten ja sertifikaattien turvallinen tallennus
- **RBAC**: Roolipohjainen käyttöoikeuksien hallinta Azure-resursseille
- **Network Security Group**: Virtuaalinen palomuuri verkkoliikenteen hallintaan

### Valvontatermit
- **Telemetry**: Automaattinen mittausten ja tietojen keruu
- **Application Performance Monitoring (APM)**: Sovelluksen suorituskyvyn valvonta
- **Log Analytics**: Palvelu lokidatan keräämiseen ja analysointiin
- **Alert Rules**: Automaattiset ilmoitukset mittareiden tai ehtojen perusteella

### Käyttöönotto-termit
- **Blue-Green Deployment**: Downtime-vapaa käyttöönotto-strategia
- **Canary Deployment**: Vähittäinen käyttöönotto osalle käyttäjistä
- **Rolling Update**: Sovelluksen instanssien peräkkäinen vaihto
- **Rollback**: Paluu aiempaan sovellusversioon

---

**Käyttövinkki**: Käytä `Ctrl+F` nopeasti hakeaksesi tiettyjä termejä tästä sanastosta. Termit ovat ristiinviitattuina tarpeen mukaan.

---

**Navigointi**
- **Edellinen oppitunti**: [Pikasetti](cheat-sheet.md)
- **Seuraava oppitunti**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->