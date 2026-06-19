# Ordlista - Azure och AZD-terminologi

**Reference for All Chapters**
- **📚 Kursstartsida**: [AZD för nybörjare](../README.md)
- **📖 Lär dig grunderna**: [Kapitel 1: AZD-grunderna](../docs/getting-started/azd-basics.md)
- **🤖 AI-termer**: [Kapitel 2: AI-först utveckling](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduktion

Denna omfattande ordlista ger definitioner för termer, begrepp och akronymer som används i Azure Developer CLI och Azure-molnutveckling. Ett grundläggande uppslagsverk för att förstå teknisk dokumentation, felsöka problem och kommunicera effektivt om azd-projekt och Azure-tjänster.

## Lärandemål

Genom att använda denna ordlista kommer du att:
- Förstå grundläggande terminologi och begrepp för Azure Developer CLI
- Bemästra vokabulär och tekniska termer för Azure-molnutveckling
- Snabbt slå upp termer relaterade till Infrastructure as Code och distribution
- Förstå Azure-tjänsternas namn, akronymer och deras syften
- Få tillgång till definitioner för felsökning och debugging-termer
- Lära dig avancerade Azure-arkitektur- och utvecklingskoncept

## Läranderesultat

Med regelbunden användning av denna ordlista kommer du att kunna:
- Kommunicera effektivt med korrekt terminologi för Azure Developer CLI
- Förstå teknisk dokumentation och felmeddelanden tydligare
- Navigera Azure-tjänster och begrepp med förtroende
- Felsöka problem med lämplig teknisk vokabulär
- Bidra i teamdiskussioner med korrekt tekniskt språk
- Utöka din kunskap om Azure-molnutveckling systematiskt

## A

**ARM Template**  
Azure Resource Manager template. JSON-baserat Infrastructure as Code-format som används för att deklarativt definiera och distribuera Azure-resurser.

**App Service**  
Azures platform-as-a-service (PaaS)-erbjudande för att hosta webbapplikationer, REST-API:er och mobil-backends utan att hantera underliggande infrastruktur.

**Application Insights**  
Azures tjänst för övervakning av applikationsprestanda (APM) som ger djupa insikter i applikationens prestanda, tillgänglighet och användning.

**Azure CLI**  
Kommando­radsgränssnitt för att hantera Azure-resurser. Används av azd för autentisering och vissa operationer.

**Azure Developer CLI (azd)**  
Ett utvecklarcentrerat kommandoradsverktyg som påskyndar processen att bygga och distribuera applikationer till Azure med mallar och Infrastructure as Code.

**azure.yaml**  
Huvudkonfigurationsfilen för ett azd-projekt som definierar tjänster, infrastruktur och deploy-hooks.

**Azure Resource Manager (ARM)**  
Azures tjänst för distribution och hantering som tillhandahåller ett hanteringslager för att skapa, uppdatera och ta bort resurser.

## B

**Bicep**  
Domain-specific language (DSL) utvecklat av Microsoft för att distribuera Azure-resurser. Ger enklare syntax än ARM-mallar samtidigt som det kompileras till ARM.

**Build**  
Processen att kompilera källkod, installera beroenden och förbereda applikationer för distribution.

**Blue-Green Deployment**  
Distribueringsstrategi som använder två identiska produktionsmiljöer (blå och grön) för att minimera driftstopp och risk.

## C

**Container Apps**  
Azures serverlösa container­tjänst som möjliggör körning av containeriserade applikationer utan att hantera komplex infrastruktur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatiserade metoder för att integrera kodändringar och distribuera applikationer.

**Cosmos DB**  
Azures globalt distribuerade, multimodala databastjänst som erbjuder omfattande SLA:er för genomströmning, latens, tillgänglighet och konsistens.

**Configuration**  
Inställningar och parametrar som styr applikationens beteende och distributionsalternativ.

## D

**Deployment**  
Processen att installera och konfigurera applikationer och deras beroenden på målinfrastrukturen.

**Docker**  
Plattform för att utveckla, leverera och köra applikationer med containerteknologi.

**Dockerfile**  
Textfil som innehåller instruktioner för att bygga en Docker-containerbild.

## E

**Environment**  
Ett distribueringsmål som representerar en specifik instans av din applikation (t.ex. utveckling, staging, produktion).

**Environment Variables**  
Konfigurationsvärden lagrade som nyckel-värde-par som applikationer kan nå vid körning.

**Endpoint**  
URL eller nätverksadress där en applikation eller tjänst kan nås.

## F

**Function App**  
Azures serverlösa compute-tjänst som möjliggör körning av händelsestyrd kod utan att hantera infrastruktur.

## G

**GitHub Actions**  
CI/CD-plattform integrerad med GitHub-repositorier för att automatisera arbetsflöden.

**Git**  
Distribuerat versionshanteringssystem som används för att spåra ändringar i källkod.

## H

**Hooks**  
Anpassade skript eller kommandon som körs vid specifika punkter under distributionslivscykeln (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Den Azure-tjänsttyp där en applikation kommer att distribueras (t.ex. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxis att definiera och hantera infrastruktur genom kod istället för manuella processer.

**Init**  
Processen att initialisera ett nytt azd-projekt, typiskt från en mall.

## J

**JSON**  
JavaScript Object Notation. Datautbytesformat som ofta används för konfigurationsfiler och API-svar.

**JWT**  
JSON Web Token. Standard för att säkert överföra information mellan parter som ett JSON-objekt.

## K

**Key Vault**  
Azures tjänst för att säkert lagra och hantera hemligheter, nycklar och certifikat.

**Kusto Query Language (KQL)**  
Frågespråk som används för att analysera data i Azure Monitor, Application Insights och andra Azure-tjänster.

## L

**Load Balancer**  
Tjänst som fördelar inkommande nätverkstrafik över flera servrar eller instanser.

**Log Analytics**  
Azure-tjänst för att samla in, analysera och agera på telemetridata från moln- och lokala miljöer.

## M

**Managed Identity**  
Azure-funktion som tillhandahåller Azure-tjänster en automatiskt hanterad identitet för autentisering mot andra Azure-tjänster.

**Microservices**  
Arkitekturmetod där applikationer byggs som en samling små, oberoende tjänster.

**Monitor**  
Azures enhetliga övervakningslösning som erbjuder fullstack-observability över applikationer och infrastruktur.

## N

**Node.js**  
JavaScript-runtime byggd på Chromes V8 JavaScript-motor för att bygga server-side-applikationer.

**npm**  
Paket­hanterare för Node.js som hanterar beroenden och paket.

## O

**Output**  
Värden som returneras från infrastrukturdistribution och som kan användas av applikationer eller andra resurser.

## P

**Package**  
Processen att förbereda applikationskod och beroenden för distribution.

**Parameters**  
Inmatningsvärden som skickas till infrastrukturmallar för att anpassa distributioner.

**PostgreSQL**  
Open-source relationsdatabassystem som stöds som en hanterad tjänst i Azure.

**Provisioning**  
Processen att skapa och konfigurera Azure-resurser definierade i infrastrukturmallar.

## Q

**Quota**  
Begränsningar för hur många resurser som kan skapas i en Azure-prenumeration eller region.

## R

**Resource Group**  
Logisk behållare för Azure-resurser som delar samma livscykel, behörigheter och policyer.

**Resource Token**  
Unik sträng genererad av azd för att säkerställa att resursnamn är unika över distributioner.

**REST API**  
Arkitekturstil för att designa nätverksapplikationer med hjälp av HTTP-metoder.

**Rollback**  
Processen att återgå till en tidigare version av en applikation eller infrastrukturkonfiguration.

## S

**Service**  
En komponent i din applikation definierad i azure.yaml (t.ex. webbfrontend, API-backend, databas).

**SKU**  
Stock Keeping Unit. Representerar olika tjänstenivåer eller prestandanivåer för Azure-resurser.

**SQL Database**  
Azures hanterade relationsdatabastjänst baserad på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjänst för att bygga och distribuera fullstack-webbapplikationer från källkodsförråd.

**Storage Account**  
Azure-tjänst som erbjuder molnlagring för dataobjekt inklusive blobs, filer, köer och tabeller.

**Subscription**  
Azure-kontobehållare som innehåller resursgrupper och resurser, med tillhörande fakturering och åtkomsthantering.

## T

**Template**  
Förbyggd projektstruktur som innehåller applikationskod, infrastrukturnotationer och konfiguration för vanliga scenarier.

**Terraform**  
Open-source Infrastructure as Code-verktyg som stödjer flera molnleverantörer inklusive Azure.

**Traffic Manager**  
Azures DNS-baserade trafiklasterutjämnare för att fördela trafik över globala Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Sträng som identifierar en viss resurs.

**URL**  
Uniform Resource Locator. Typ av URI som specificerar var en resurs finns och hur man hämtar den.

## V

**Virtual Network (VNet)**  
Grundläggande byggsten för privata nätverk i Azure, som erbjuder isolering och segmentering.

**VS Code**  
Visual Studio Code. Populär kodredigerare med utmärkt Azure- och azd-integration.

## W

**Webhook**  
HTTP-callback som triggas av specifika händelser, vanligt i CI/CD-pipelines.

**What-if**  
Azure-funktion som visar vilka ändringar som skulle göras av en distribution utan att faktiskt utföra den.

## Y

**YAML**  
YAML Ain't Markup Language. Mänskligt läsbart data­serialiseringsformat som används för konfigurationsfiler som azure.yaml.

## Z

**Zone**  
Fysiskt separata platser inom en Azure-region som ger redundans och hög tillgänglighet.

---

## Vanliga akronymer

| Akronym | Full form | Beskrivning |
|---------|-----------|-------------|
| AAD | Azure Active Directory (now Microsoft Entra ID) | Tjänst för identitets- och åtkomsthantering |
| ACR | Azure Container Registry | Containerbildsregistertjänst |
| AKS | Azure Kubernetes Service | Hanterad Kubernetes-tjänst |
| API | Application Programming Interface | Uppsättning protokoll för att bygga programvara |
| ARM | Azure Resource Manager | Azures distributions- och hanteringstjänst |
| CDN | Content Delivery Network | Distribuerat nätverk av servrar |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserade utvecklingsmetoder |
| CLI | Command Line Interface | Textbaserat användargränssnitt |
| DNS | Domain Name System | System för att översätta domännamn till IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Säker version av HTTP |
| IaC | Infrastructure as Code | Hantering av infrastruktur genom kod |
| JSON | JavaScript Object Notation | Datautbytesformat |
| JWT | JSON Web Token | Tokenformat för säker informationsöverföring |
| KQL | Kusto Query Language | Frågespråk för Azures datatjänster |
| RBAC | Role-Based Access Control | Åtkomstkontrollbaserad på användarroller |
| REST | Representational State Transfer | Arkitekturstil för webbtjänster |
| SDK | Software Development Kit | Samling utvecklingsverktyg |
| SLA | Service Level Agreement | Åtagande om tjänstens tillgänglighet/prestanda |
| SQL | Structured Query Language | Språk för hantering av relationsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiska protokoll |
| URI | Uniform Resource Identifier | Sträng som identifierar en resurs |
| URL | Uniform Resource Locator | Typ av URI som specificerar resursens plats |
| VM | Virtual Machine | Emulering av ett datorsystem |
| VNet | Virtual Network | Privat nätverk i Azure |
| YAML | YAML Ain't Markup Language | Standard för dataserialisering |

---

## Azure Service Name Mappings

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

## Kontextsberoende termer

### Utvecklingstermer
- **Hot Reload**: Uppdatering av applikationer automatiskt under utveckling utan att behöva starta om
- **Build Pipeline**: Automatiserad process för att bygga och testa kod
- **Deployment Slot**: Stagingmiljö inom en App Service
- **Environment Parity**: Att hålla utvecklings-, staging- och produktionsmiljöer lika

### Säkerthetermer
- **Managed Identity**: Azure-funktion som tillhandahåller automatisk hantering av autentiseringsuppgifter
- **Key Vault**: Säker lagring för hemligheter, nycklar och certifikat
- **RBAC**: Rollbaserad åtkomstkontroll för Azure-resurser
- **Network Security Group**: Virtuell brandvägg för att styra nätverkstrafik

### Övervakningstermer
- **Telemetry**: Automatisk insamling av mätningar och data
- **Application Performance Monitoring (APM)**: Övervakning av programvaruprestanda
- **Log Analytics**: Tjänst för att samla in och analysera loggdata
- **Alert Rules**: Automatiska aviseringar baserade på mätvärden eller villkor

### Distribuerings­termer
- **Blue-Green Deployment**: Distribueringsstrategi med noll driftstopp
- **Canary Deployment**: Gradvis utrullning till en delmängd av användare
- **Rolling Update**: Sekventiell ersättning av applikationsinstanser
- **Rollback**: Återgå till en tidigare applikationsversion

---

**Usage Tip**: Use `Ctrl+F` to quickly search for specific terms in this glossary. Terms are cross-referenced where applicable.

---

**Navigering**
- **Föregående lektion**: [Fusklista](cheat-sheet.md)
- **Nästa lektion**: [Vanliga frågor (FAQ)](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->