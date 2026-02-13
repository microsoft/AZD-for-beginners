# Ordlista - Azure och AZD Terminologi

**Referens för alla kapitel**
- **📚 Kursens startsida**: [AZD för nybörjare](../README.md)
- **📖 Lär dig grunderna**: [Kapitel 1: AZD-grunderna](../docs/getting-started/azd-basics.md)
- **🤖 AI-termer**: [Kapitel 2: AI-först utveckling](../docs/microsoft-foundry/microsoft-foundry-integration.md)

## Introduktion

Denna omfattande ordlista ger definitioner för termer, begrepp och förkortningar som används i Azure Developer CLI och Azure-molnutveckling. En viktig referens för att förstå teknisk dokumentation, felsöka problem och kommunicera effektivt om azd-projekt och Azure-tjänster.

## Lärandemål

Genom att använda denna ordlista kommer du att:
- Förstå grundläggande terminologi och begrepp för Azure Developer CLI
- Bemästra vokabulär och tekniska termer för Azure-molnutveckling
- Snabbt slå upp termer relaterade till Infrastructure as Code och distribution
- Förstå Azure-tjänsternas namn, förkortningar och deras syften
- Få åtkomst till definitioner för felsökning och debuggningsterminologi
- Lära dig avancerade Azure-arkitektur- och utvecklingskoncept

## Läranderesultat

Med regelbunden användning av denna ordlista kommer du att kunna:
- Kommunicera effektivt med korrekt terminologi för Azure Developer CLI
- Förstå teknisk dokumentation och felmeddelanden tydligare
- Navigera Azure-tjänster och koncept med självförtroende
- Felsöka problem med lämplig teknisk vokabulär
- Bidra till teamdiskussioner med korrekt tekniskt språk
- Utöka din kunskap om Azure-molnutveckling systematiskt

## A

**ARM Template**  
Azure Resource Manager-mall. JSON-baserat Infrastructure as Code-format som används för att deklarativt definiera och distribuera Azure-resurser.

**App Service**  
Azures plattform-som-en-tjänst (PaaS) för att hosta webbapplikationer, REST-API:er och mobila backends utan att hantera underliggande infrastruktur.

**Application Insights**  
Azures tjänst för övervakning av applikationsprestanda (APM) som ger djup insikt i applikationers prestanda, tillgänglighet och användning.

**Azure CLI**  
Kommandoradsgränssnitt för att hantera Azure-resurser. Används av azd för autentisering och vissa operationer.

**Azure Developer CLI (azd)**  
Utvecklarcentrerat kommandoradsverktyg som påskyndar processen att bygga och distribuera applikationer till Azure med hjälp av mallar och infrastruktur som kod.

**azure.yaml**  
Huvudkonfigurationsfilen för ett azd-projekt som definierar tjänster, infrastruktur och distributionshooks.

**Azure Resource Manager (ARM)**  
Azures tjänst för distribution och hantering som tillhandahåller ett hanteringslager för att skapa, uppdatera och ta bort resurser.

## B

**Bicep**  
Domänspecifikt språk (DSL) utvecklat av Microsoft för att distribuera Azure-resurser. Erbjuder enklare syntax än ARM-mallar samtidigt som det kompileras till ARM.

**Build**  
Processen att kompilera källkod, installera beroenden och förbereda applikationer för distribution.

**Blue-Green Deployment**  
Distributionsstrategi som använder två identiska produktionsmiljöer (blue och green) för att minimera driftstopp och risk.

## C

**Container Apps**  
Azures serverlösa containertjänst som möjliggör körning av containeriserade applikationer utan att hantera komplex infrastruktur.

**CI/CD**  
Continuous Integration/Continuous Deployment. Automatiserade metoder för att integrera kodändringar och distribuera applikationer.

**Cosmos DB**  
Azures globalt distribuerade multi-modell databas­tjänst som erbjuder omfattande SLA:er för genomströmning, latens, tillgänglighet och konsistens.

**Configuration**  
Inställningar och parametrar som styr applikationens beteende och distributionsalternativ.

## D

**Deployment**  
Processen att installera och konfigurera applikationer och deras beroenden på mål-infrastrukturen.

**Docker**  
Plattform för att utveckla, leverera och köra applikationer med containerteknik.

**Dockerfile**  
Textfil som innehåller instruktioner för att bygga en Docker-containerimage.

## E

**Environment**  
Ett distributionsmål som representerar en specifik instans av din applikation (t.ex. utveckling, staging, produktion).

**Environment Variables**  
Konfigurationsvärden lagrade som nyckel–värde-par som applikationer kan komma åt vid körning.

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
Processen att initiera ett nytt azd-projekt, vanligtvis från en mall.

## J

**JSON**  
JavaScript Object Notation. Datautbytesformat som ofta används för konfigurationsfiler och API-svar.

**JWT**  
JSON Web Token. Standard för att säkert överföra information mellan parter som ett JSON-objekt.

## K

**Key Vault**  
Azures tjänst för säker lagring och hantering av hemligheter, nycklar och certifikat.

**Kusto Query Language (KQL)**  
Frågespråk som används för att analysera data i Azure Monitor, Application Insights och andra Azure-tjänster.

## L

**Load Balancer**  
Tjänst som fördelar inkommande nätverkstrafik över flera servrar eller instanser.

**Log Analytics**  
Azures tjänst för att samla in, analysera och agera på telemetridata från moln och lokala miljöer.

## M

**Managed Identity**  
Azure-funktion som ger Azure-tjänster en automatiskt hanterad identitet för autentisering mot andra Azure-tjänster.

**Microservices**  
Arkitekturmetod där applikationer byggs som en samling små, oberoende tjänster.

**Monitor**  
Azures enhetliga övervakningslösning som ger full-stack-observabilitet över applikationer och infrastruktur.

## N

**Node.js**  
JavaScript-runtime byggd på Chromes V8-motor för att skapa serverside-applikationer.

**npm**  
Paket­hanterare för Node.js som hanterar beroenden och paket.

## O

**Output**  
Värden som returneras från infrastrukturdistribution och som kan användas av applikationer eller andra resurser.

## P

**Package**  
Processen att förbereda applikationskod och beroenden för distribution.

**Parameters**  
Ingångsvärden som skickas till infrastrukturella mallar för att anpassa distributioner.

**PostgreSQL**  
Öppen källkods relationsdatabassystem som stöds som en hanterad tjänst i Azure.

**Provisioning**  
Processen att skapa och konfigurera Azure-resurser definierade i infrastrukturella mallar.

## Q

**Quota**  
Begränsningar för hur mycket resurser som kan skapas i en Azure-prenumeration eller region.

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
En komponent av din applikation definierad i azure.yaml (t.ex. webbfrontend, API-backend, databas).

**SKU**  
Stock Keeping Unit. Representerar olika servicetier eller prestandanivåer för Azure-resurser.

**SQL Database**  
Azures hanterade relationsdatabastjänst baserad på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjänst för att bygga och distribuera fullstack-webbapplikationer från källkodsförvar.

**Storage Account**  
Azure-tjänst som tillhandahåller molnlagring för dataobjekt inklusive blobs, filer, köer och tabeller.

**Subscription**  
Azure-kontobehållare som innehåller resource groups och resurser, med tillhörande fakturering och åtkomsthantering.

## T

**Template**  
Förbyggd projektstruktur som innehåller applikationskod, infrastrukturddefinitioner och konfiguration för vanliga scenarier.

**Terraform**  
Open-source Infrastructure as Code-verktyg som stöder flera molnleverantörer inklusive Azure.

**Traffic Manager**  
Azures DNS-baserade trafiklastbalanserare för att distribuera trafik över globala Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Sträng som identifierar en viss resurs.

**URL**  
Uniform Resource Locator. Typ av URI som anger var en resurs finns och hur man hämtar den.

## V

**Virtual Network (VNet)**  
Grundläggande byggsten för privata nätverk i Azure som ger isolering och segmentering.

**VS Code**  
Visual Studio Code. Populär kodeditor med utmärkt Azure- och azd-integration.

## W

**Webhook**  
HTTP-kallback som triggas av specifika händelser, vanligtvis använd i CI/CD-pipelines.

**What-if**  
Azure-funktion som visar vilka ändringar som skulle göras av en distribution utan att faktiskt utföra dem.

## Y

**YAML**  
YAML Ain't Markup Language. Mänskligt läsbart data­serialiseringsformat som används för konfigurationsfiler som azure.yaml.

## Z

**Zone**  
Fysiskt separata platser inom en Azure-region som ger redundans och hög tillgänglighet.

---

## Vanliga förkortningar

| Acronym | Full Form | Description |
|---------|-----------|-------------|
| AAD | Azure Active Directory | Identitets- och åtkomsthanteringstjänst |
| ACR | Azure Container Registry | Tjänst för containerimage-registry |
| AKS | Azure Kubernetes Service | Hanterad Kubernetes-tjänst |
| API | Application Programming Interface | Uppsättning protokoll för att bygga mjukvara |
| ARM | Azure Resource Manager | Azures tjänst för distribution och hantering |
| CDN | Content Delivery Network | Distribuerat nätverk av servrar |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserade utvecklingsmetoder |
| CLI | Command Line Interface | Textbaserat användargränssnitt |
| DNS | Domain Name System | System för att översätta domännamn till IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Säker version av HTTP |
| IaC | Infrastructure as Code | Hantering av infrastruktur genom kod |
| JSON | JavaScript Object Notation | Datautbytesformat |
| JWT | JSON Web Token | Tokenformat för säker informationsöverföring |
| KQL | Kusto Query Language | Frågespråk för Azure-datatjänster |
| RBAC | Role-Based Access Control | Åtkomstkontrollmetod baserad på användarroller |
| REST | Representational State Transfer | Arkitekturstil för webbtjänster |
| SDK | Software Development Kit | Samling utvecklingsverktyg |
| SLA | Service Level Agreement | Åtagande om tjänstens tillgänglighet/prestanda |
| SQL | Structured Query Language | Språk för att hantera relationsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiska protokoll |
| URI | Uniform Resource Identifier | Sträng som identifierar en resurs |
| URL | Uniform Resource Locator | Typ av URI som specificerar resursens plats |
| VM | Virtual Machine | Emulering av ett datorsystem |
| VNet | Virtual Network | Privata nätverk i Azure |
| YAML | YAML Ain't Markup Language | Data­serialiseringsstandard |

---

## Azure-tjänstens namnmappar

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
| Search | Azure Cognitive Search | `search` |
| Messaging | Azure Service Bus | `servicebus` |

---

## Kontextsberoende termer

### Utvecklingstermer
- **Hot Reload**: Uppdatering av applikationer automatiskt under utveckling utan omstart
- **Build Pipeline**: Automatiserad process för att bygga och testa kod
- **Deployment Slot**: Stagingmiljö inom en App Service
- **Environment Parity**: Att hålla utvecklings-, staging- och produktionsmiljöer lika

### Säkerhetstermer
- **Managed Identity**: Azure-funktion som tillhandahåller automatisk hantering av autentiseringsuppgifter
- **Key Vault**: Säker lagring för hemligheter, nycklar och certifikat
- **RBAC**: Rollbaserad åtkomstkontroll för Azure-resurser
- **Network Security Group**: Virtuell brandvägg för att kontrollera nätverkstrafik

### Övervakningstermer
- **Telemetry**: Automatisk insamling av mätvärden och data
- **Application Performance Monitoring (APM)**: Övervakning av mjukvaruprestanda
- **Log Analytics**: Tjänst för att samla in och analysera loggdata
- **Alert Rules**: Automatiska meddelanden baserade på mätvärden eller villkor

### Distributions­termer
- **Blue-Green Deployment**: Distributionsstrategi utan driftstopp
- **Canary Deployment**: Gradvis utrullning till en delmängd av användare
- **Rolling Update**: Sekventiell ersättning av applikationsinstanser
- **Rollback**: Återställning till tidigare applikationsversion

---

**Tips för användning**: Använd `Ctrl+F` för att snabbt söka efter specifika termer i denna ordlista. Termer är korsrefererade där det är tillämpligt.

---

**Navigering**
- **Föregående lektion**: [Fuskblad](cheat-sheet.md)
- **Nästa lektion**: [Vanliga frågor](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, vänligen observera att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För viktig information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->