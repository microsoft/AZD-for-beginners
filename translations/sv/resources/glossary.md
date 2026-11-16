# Ordlista - Azure och AZD Terminologi

**Referens för Alla Kapitlen**
- **📚 Kursstart**: [AZD För Nybörjare](../README.md)
- **📖 Lär Dig Grunderna**: [Kapitel 1: AZD Grunder](../docs/chapter-01-foundation/azd-basics.md)
- **🤖 AI Termer**: [Kapitel 2: AI-Först Utveckling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)

## Introduktion

Den här omfattande ordlistan ger definitioner för termer, koncept och förkortningar som används i Azure Developer CLI och Azure molnutveckling. Väsentlig referens för att förstå teknisk dokumentation, felsöka problem och kommunicera effektivt om azd-projekt och Azure-tjänster.

## Lärandemål

Genom att använda denna ordlista kommer du att:
- Förstå grundläggande Azure Developer CLI-terminologi och koncept
- Bemästra Azure molnutvecklings vokabulär och tekniska termer
- Hänvisa till Infrastructure as Code och deployment-terminologi effektivt
- Begripa namn på Azure-tjänster, förkortningar och deras syften
- Få tillgång till definitioner för felsökning och debugging-terminologi
- Lära dig avancerade Azure-arkitektur- och utvecklingskoncept

## Läranderesultat

Genom regelbunden användning av denna ordlista kommer du att kunna:
- Kommunicera effektivt med korrekt Azure Developer CLI-terminologi
- Förstå teknisk dokumentation och felmeddelanden tydligare
- Navigera Azure-tjänster och koncept med säkerhet
- Felsöka problem med lämpligt tekniskt vokabulär
- Bidra till diskussioner i teamet med korrekt tekniskt språk
- Utöka din kunskap om Azure molnutveckling systematiskt

## A

**ARM-mall**  
Azure Resource Manager-mall. JSON-baserat Infrastructure as Code-format som används för att deklarativt definiera och distribuera Azure-resurser.

**App Service**  
Azures plattform-som-en-tjänst (PaaS) erbjudande för hosting av webbapplikationer, REST API:er och mobila backends utan att hantera infrastruktur.

**Application Insights**  
Azures applikationsprestandaövervakning (APM) tjänst som ger djupgående insikter i applikationens prestanda, tillgänglighet och användning.

**Azure CLI**  
Kommandoradsgränssnitt för hantering av Azure-resurser. Det kompletterar AZD men har separat inloggning; kärn-AZD-autentisering använder `azd auth login`.

**Azure Developer CLI (azd)**  
Utvecklarinriktat kommandoradsverktyg som påskyndar processen att bygga och distribuera applikationer till Azure med hjälp av mallar och Infrastructure as Code.

**azure.yaml**  
Huvudkonfigurationsfilen för ett azd-projekt som definierar tjänster, infrastruktur och deploy-hookar.

**Azure Resource Manager (ARM)**  
Azures tjänst för distribution och hantering som tillhandahåller ett hanteringslager för att skapa, uppdatera och ta bort resurser.

## B

**Bicep**  
Domänspecifikt språk (DSL) utvecklat av Microsoft för att distribuera Azure-resurser. Har enklare syntax än ARM-mallar men kompilerar till ARM.

**Build (Komplettering)**  
Processen att kompilera källkod, installera beroenden och förbereda applikationer för deployment.

**Blue-Green Deployment**  
Distributionsstrategi som använder två identiska produktionsmiljöer (blå och grön) för att minimera driftstopp och risk.

## C

**Container Apps**  
Azures serverlösa container-tjänst som möjliggör körning av containeriserade applikationer utan att hantera komplex infrastruktur.

**CI/CD**  
Kontinuerlig Integration/Kontinuerlig Deployment. Automatiserade praxis för att integrera kodändringar och distribuera applikationer.

**Cosmos DB**  
Azures globalt distribuerade multimodell-databas som erbjuder omfattande SLA:er för genomströmning, latens, tillgänglighet och konsistens.

**Konfiguration**  
Inställningar och parametrar som styr applikationens beteende och deploy-alternativ.

## D

**Deployment**  
Processen att installera och konfigurera applikationer och deras beroenden på mål-infrastruktur.

**Docker**  
Plattform för att utveckla, leverera och köra applikationer med container-teknologi.

**Dockerfile**  
Textfil som innehåller instruktioner för att bygga en Docker containerbild.

## E

**Miljö**  
Ett deploymål som representerar en specifik instans av din applikation (t.ex. utveckling, staging, produktion).

**Miljövariabler**  
Konfigurationsvärden lagrade som nyckel-värde-par som applikationer kan läsa vid körning.

**Endpoint**  
URL eller nätverksadress där en applikation eller tjänst kan nås.

## F

**Function App**  
Azures serverlösa compute-tjänst som möjliggör körning av händelsestyrd kod utan att hantera infrastruktur.

## G

**GitHub Actions**  
CI/CD-plattform integrerad med GitHub-repositorier för att automatisera arbetsflöden.

**Git**  
Distribuerat versionskontrollsystem som används för att spåra förändringar i källkod.

## H

**Hooks**  
Anpassade skript eller kommandon som körs vid specifika punkter under distributionens livscykel (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Den Azure-tjänsttyp där en applikation ska distribueras (t.ex. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praxis för att definiera och hantera infrastruktur genom kod istället för manuella processer.

**Init**  
Processen att initiera ett nytt azd-projekt, vanligtvis från en mall.

## J

**JSON**  
JavaScript Object Notation. Ett dataformat vanligtvis använt för konfigurationsfiler och API-responser.

**JWT**  
JSON Web Token. Standard för säker överföring av information mellan parter i form av ett JSON-objekt.

## K

**Key Vault**  
Azures tjänst för att säkert lagra och hantera hemligheter, nycklar och certifikat.

**Kusto Query Language (KQL)**  
Frågespråk som används för att analysera data i Azure Monitor, Application Insights och andra Azure-tjänster.

## L

**Load Balancer**  
Tjänst som distribuerar inkommande nätverkstrafik över flera servrar eller instanser.

**Log Analytics**  
Azure-tjänst för att samla in, analysera och agera på telemetridata från moln- och lokala miljöer.

## M

**Managed Identity**  
Azure-funktion som tillhandahåller Azure-tjänster med en automatiskt hanterad identitet för autentisering mot andra Azure-tjänster.

**Mikrotjänster**  
Arkitekturellt tillvägagångssätt där applikationer byggs som en samling av små, självständiga tjänster.

**Monitor**  
Azures enhetliga övervakningslösning som ger full-stack observabilitet över applikationer och infrastruktur.

## N

**Node.js**  
JavaScript-runtime byggd på Chromes V8 JavaScript-motor för att bygga server-side applikationer.

**npm**  
Paketchef för Node.js som hanterar beroenden och paket.

## O

**Output**  
Värden som returneras från infrastruktursdistribuering och som kan användas av applikationer eller andra resurser.

## P

**Package**  
Processen att förbereda applikationskod och beroenden för distribution.

**Parametrar**  
Indatavärden som skickas till infrastruktursmallar för att anpassa distributioner.

**PostgreSQL**  
Open-source relationsdatabassystem som stöds som en hanterad tjänst i Azure.

**Provisioning**  
Processen att skapa och konfigurera Azure-resurser som definieras i infrastruktursmallar.

## Q

**Quota**  
Begränsningar av mängden resurser som kan skapas i en Azure-prenumeration eller region.

## R

**Resource Group**  
Logisk behållare för Azure-resurser som delar samma livscykel, behörigheter och policyer.

**Resource Token**  
Unik sträng som genereras av azd för att säkerställa att resursnamn är unika över distributioner.

**REST API**  
Arkitekturstil för att designa nätverksapplikationer med HTTP-metoder.

**Rollback**  
Processen att återgå till en tidigare version av en applikation eller infrastrukturskonfiguration.

## S

**Tjänst**  
En komponent av din applikation definierad i azure.yaml (t.ex. webb front-end, API backend, databas).

**SKU**  
Lagerhållningsenhet. Representerar olika servicelager eller prestandanivåer för Azure-resurser.

**SQL-databas**  
Azures hanterade relationsdatabastjänst baserad på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjänst för att bygga och distribuera full-stack webbapplikationer från källkodsförråd.

**Storage Account**  
Azure-tjänst som tillhandahåller molnlagring för dataobjekt inklusive blobs, filer, köer och tabeller.

**Prenumeration**  
Azure-kontos behållare som rymmer resursgrupper och resurser, med associerad fakturering och åtkomsthantering.

## T

**Mall**  
Förbyggd projektstruktur som innehåller applikationskod, infrastruktursdefinitioner och konfiguration för vanliga scenarier.

**Terraform**  
Open-source Infrastructure as Code-verktyg som stöder flera molnleverantörer inklusive Azure.

**Traffic Manager**  
Azures DNS-baserade trafikladdningsbalanserare för att distribuera trafik över globala Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Sträng som identifierar en viss resurs.

**URL**  
Uniform Resource Locator. Typ av URI som specificerar var en resurs finns och hur den kan hämtas.

## V

**Virtuellt Nätverk (VNet)**  
Grundläggande byggsten för privata nätverk i Azure, som tillhandahåller isolering och segmentering.

**VS Code**  
Visual Studio Code. Populär kodredigerare med utmärkt Azure och azd-integration.

## W

**Webhook**  
HTTP-callback som triggas av specifika händelser, vanligtvis använd i CI/CD-pipelines.

**What-if**  
Azure-funktion som visar vilka förändringar en distribution skulle göra utan att faktiskt genomföra den.

## Y

**YAML**  
YAML Ain't Markup Language. Mänskligt läsbart dataserialiseringsstandard som används för konfigurationsfiler som azure.yaml.

## Z

**Zon**  
Fysiskt separata platser inom en Azure-region som ger redundans och hög tillgänglighet.

---

## Vanliga Förkortningar

| Förkortning | Fullständig Form | Beskrivning |
|---------|-----------|-------------|
| AAD | Azure Active Directory (numera Microsoft Entra ID) | Identitets- och åtkomsthanteringstjänst |
| ACR | Azure Container Registry | Containerbild-registreringstjänst |
| AKS | Azure Kubernetes Service | Hanterad Kubernetes-tjänst |
| API | Application Programming Interface | Uppsättning protokoll för att bygga mjukvara |
| ARM | Azure Resource Manager | Azures distributions- och hanteringstjänst |
| CDN | Content Delivery Network | Distribuerat nätverk av servrar |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserade utvecklingspraxis |
| CLI | Command Line Interface | Textbaserat användargränssnitt |
| DNS | Domain Name System | System för att översätta domännamn till IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Säker version av HTTP |
| IaC | Infrastructure as Code | Hantering av infrastruktur genom kod |
| JSON | JavaScript Object Notation | Datautbytesformat |
| JWT | JSON Web Token | Tokenformat för säker informationsöverföring |
| KQL | Kusto Query Language | Frågespråk för Azure datatjänster |
| RBAC | Role-Based Access Control | Åtkomstkontroll baserat på användarroller |
| REST | Representational State Transfer | Arkitekturstil för webbtjänster |
| SDK | Software Development Kit | Samling av utvecklingsverktyg |
| SLA | Service Level Agreement | Åtagande om tillgänglighet/prestanda för tjänst |
| SQL | Structured Query Language | Språk för att hantera relationsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiska protokoll |
| URI | Uniform Resource Identifier | Sträng som identifierar en resurs |
| URL | Uniform Resource Locator | Typ av URI som specificerar resursens plats |
| VM | Virtual Machine | Emulering av ett datorsystem |
| VNet | Virtual Network | Privat nätverk i Azure |
| YAML | YAML Ain't Markup Language | Dataserialiseringsstandard |

---

## Azure Tjänstenamn Karta

| Vanligt Namn | Officiellt Azure Tjänstenamn | azd Hosttyp |
|-------------|------------------------------|---------------|
| Web App | Azure App Service | `appservice` |
| API App | Azure App Service | `appservice` |
| Container App | Azure Container Apps | `containerapp` |
| Function | Azure Functions | `function` |
| Static Site | Azure Static Web Apps | `staticwebapp` |
| Databas | Azure Database for PostgreSQL | Infrastrukturresurs, inte en applikation `host` |
| NoSQL DB | Azure Cosmos DB | Infrastrukturresurs, inte en applikation `host` |
| Storage | Azure Storage Account | Infrastrukturresurs, inte en inbyggd applikation `host` |
| Cache | Azure Managed Redis | Infrastrukturresurs, inte en applikation `host` |
| Sök | Azure AI Search | Infrastrukturresurs, inte en applikation `host` |
| Meddelanden | Azure Service Bus | Infrastrukturresurs, inte en applikation `host` |

`services.<name>.host` väljer ett applikations-distributionsmål; det är inte en förkortning för någon Azure-resurstyp. Databaser, caches, söktjänster och köer brukar vanligtvis tillhandahållas genom infrastrukturleverantören och kopplas till applikationen via outputs/konfiguration.

---

## Kontexts-specifika Termer

### Utvecklingstermer
- **Hot Reload**: Uppdaterar automatiskt applikationer under utveckling utan omstart
- **Build Pipeline**: Automatiserad process för att bygga och testa kod
- **Deployment Slot**: Staging-miljö inom en App Service
- **Environment Parity**: Att hålla utvecklings-, staging- och produktionsmiljöer lika

### Säkerhetstermer
- **Managed Identity**: Azure-funktion som tillhandahåller automatisk hantering av autentiseringsuppgifter
- **Key Vault**: Säker lagring för hemligheter, nycklar och certifikat
- **RBAC**: Rollbaserad åtkomstkontroll för Azure-resurser
- **Network Security Group**: Virtuell brandvägg för att styra nätverkstrafik

### Övervakningstermer
- **Telemetry**: Automatisk insamling av mätningar och data
- **Application Performance Monitoring (APM)**: Övervakning av mjukvaruprestanda
- **Log Analytics**: Tjänst för att samla in och analysera loggdata
- **Alert Rules**: Automatiska notifieringar baserade på mätvärden eller villkor

### Deploy-terminologi
- **Blue-Green Deployment**: Distribueringsstrategi utan driftstopp
- **Canary Deployment**: Gradvis utrullning till en delmängd användare
- **Rolling Update**: Sekventiell ersättning av applikationsinstanser
- **Rollback**: Återgång till tidigare applikationsversion

---

**Användningstips**: Använd `Ctrl+F` för att snabbt söka efter specifika termer i denna ordlista. Termer är korsrefererade där det är tillämpligt.

---

**Navigering**
- **Föregående Lektion**: [Fuskark](cheat-sheet.md)
- **Nästa Lektion**: [FAQ](faq.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->