<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "f16d2988a24670d1b6aa2372de1a231a",
  "translation_date": "2025-09-17T23:22:35+00:00",
  "source_file": "resources/glossary.md",
  "language_code": "sv"
}
-->
# Ordlista - Azure och AZD Terminologi

**Referens för Alla Kapitlen**
- **📚 Kurshem**: [AZD För Nybörjare](../README.md)
- **📖 Lär Dig Grunderna**: [Kapitel 1: AZD Grunder](../docs/getting-started/azd-basics.md)
- **🤖 AI Termer**: [Kapitel 2: AI-Driven Utveckling](../docs/ai-foundry/azure-ai-foundry-integration.md)

## Introduktion

Denna omfattande ordlista ger definitioner för termer, koncept och akronymer som används inom Azure Developer CLI och Azure molnutveckling. En viktig referens för att förstå teknisk dokumentation, felsöka problem och kommunicera effektivt om azd-projekt och Azure-tjänster.

## Lärandemål

Genom att använda denna ordlista kommer du att:
- Förstå grundläggande terminologi och koncept för Azure Developer CLI
- Behärska vokabulär och tekniska termer inom Azure molnutveckling
- Effektivt referera till terminologi för Infrastructure as Code och distribution
- Förstå Azure-tjänsternas namn, akronymer och deras syften
- Få tillgång till definitioner för felsöknings- och debuggningsrelaterade termer
- Lära dig avancerade koncept inom Azure-arkitektur och utveckling

## Läranderesultat

Med regelbunden användning av denna ordlista kommer du att kunna:
- Kommunicera effektivt med korrekt terminologi för Azure Developer CLI
- Förstå teknisk dokumentation och felmeddelanden tydligare
- Navigera Azure-tjänster och koncept med självförtroende
- Felsöka problem med rätt teknisk vokabulär
- Bidra till teamdiskussioner med korrekt tekniskt språk
- Systematiskt utöka din kunskap om Azure molnutveckling

## A

**ARM-mall**  
Azure Resource Manager-mall. JSON-baserat format för Infrastructure as Code som används för att definiera och distribuera Azure-resurser deklarativt.

**App Service**  
Azures plattform-som-en-tjänst (PaaS) för att hosta webbapplikationer, REST-API:er och mobila backend-tjänster utan att hantera infrastruktur.

**Application Insights**  
Azures tjänst för applikationsprestandaövervakning (APM) som ger djupgående insikter i applikationens prestanda, tillgänglighet och användning.

**Azure CLI**  
Kommandoradsgränssnitt för att hantera Azure-resurser. Används av azd för autentisering och vissa operationer.

**Azure Developer CLI (azd)**  
Utvecklarfokuserat kommandoradsverktyg som påskyndar processen att bygga och distribuera applikationer till Azure med hjälp av mallar och Infrastructure as Code.

**azure.yaml**  
Huvudkonfigurationsfilen för ett azd-projekt som definierar tjänster, infrastruktur och distributionskrokar.

**Azure Resource Manager (ARM)**  
Azures distributions- och hanteringstjänst som tillhandahåller ett hanteringslager för att skapa, uppdatera och ta bort resurser.

## B

**Bicep**  
Domänspecifikt språk (DSL) utvecklat av Microsoft för att distribuera Azure-resurser. Ger enklare syntax än ARM-mallar samtidigt som det kompileras till ARM.

**Bygg**  
Processen att kompilera källkod, installera beroenden och förbereda applikationer för distribution.

**Blue-Green Deployment**  
Distributionsstrategi som använder två identiska produktionsmiljöer (blå och grön) för att minimera driftstopp och risk.

## C

**Container Apps**  
Azures serverlösa containertjänst som möjliggör körning av containeriserade applikationer utan att hantera komplex infrastruktur.

**CI/CD**  
Kontinuerlig Integration/Kontinuerlig Distribution. Automatiserade metoder för att integrera kodändringar och distribuera applikationer.

**Cosmos DB**  
Azures globalt distribuerade, multi-modell databas som erbjuder omfattande SLA:er för genomströmning, latens, tillgänglighet och konsistens.

**Konfiguration**  
Inställningar och parametrar som styr applikationsbeteende och distributionsalternativ.

## D

**Distribution**  
Processen att installera och konfigurera applikationer och deras beroenden på mål-infrastruktur.

**Docker**  
Plattform för att utveckla, leverera och köra applikationer med hjälp av containerteknologi.

**Dockerfile**  
Textfil som innehåller instruktioner för att bygga en Docker-containerbild.

## E

**Miljö**  
Ett distributionsmål som representerar en specifik instans av din applikation (t.ex. utveckling, staging, produktion).

**Miljövariabler**  
Konfigurationsvärden lagrade som nyckel-värde-par som applikationer kan komma åt vid körning.

**Endpoint**  
URL eller nätverksadress där en applikation eller tjänst kan nås.

## F

**Function App**  
Azures serverlösa beräkningstjänst som möjliggör körning av händelsedriven kod utan att hantera infrastruktur.

## G

**GitHub Actions**  
CI/CD-plattform integrerad med GitHub-repositorier för att automatisera arbetsflöden.

**Git**  
Distribuerat versionskontrollsystem som används för att spåra ändringar i källkod.

## H

**Hooks**  
Anpassade skript eller kommandon som körs vid specifika punkter under distributionslivscykeln (preprovision, postprovision, predeploy, postdeploy).

**Host**  
Typ av Azure-tjänst där en applikation kommer att distribueras (t.ex. appservice, containerapp, function).

## I

**Infrastructure as Code (IaC)**  
Praktik att definiera och hantera infrastruktur genom kod istället för manuella processer.

**Init**  
Processen att initiera ett nytt azd-projekt, vanligtvis från en mall.

## J

**JSON**  
JavaScript Object Notation. Datautbytesformat som ofta används för konfigurationsfiler och API-svar.

**JWT**  
JSON Web Token. Standard för säker överföring av information mellan parter som ett JSON-objekt.

## K

**Key Vault**  
Azures tjänst för säker lagring och hantering av hemligheter, nycklar och certifikat.

**Kusto Query Language (KQL)**  
Frågespråk som används för att analysera data i Azure Monitor, Application Insights och andra Azure-tjänster.

## L

**Load Balancer**  
Tjänst som distribuerar inkommande nätverkstrafik över flera servrar eller instanser.

**Log Analytics**  
Azure-tjänst för att samla in, analysera och agera på telemetridata från moln- och lokala miljöer.

## M

**Managed Identity**  
Azure-funktion som ger Azure-tjänster en automatiskt hanterad identitet för autentisering till andra Azure-tjänster.

**Mikrotjänster**  
Arkitektonisk metod där applikationer byggs som en samling av små, oberoende tjänster.

**Monitor**  
Azures enhetliga övervakningslösning som ger fullstack-observabilitet över applikationer och infrastruktur.

## N

**Node.js**  
JavaScript-runtime byggd på Chromes V8 JavaScript-motor för att bygga serverbaserade applikationer.

**npm**  
Paketmanager för Node.js som hanterar beroenden och paket.

## O

**Output**  
Värden som returneras från infrastrukturdistribution och kan användas av applikationer eller andra resurser.

## P

**Paket**  
Processen att förbereda applikationskod och beroenden för distribution.

**Parametrar**  
Inmatningsvärden som skickas till infrastrukturmallar för att anpassa distributioner.

**PostgreSQL**  
Öppen källkod relationsdatabassystem som stöds som en hanterad tjänst i Azure.

**Provisionering**  
Processen att skapa och konfigurera Azure-resurser definierade i infrastrukturmallar.

## Q

**Kvot**  
Begränsningar för mängden resurser som kan skapas i en Azure-prenumeration eller region.

## R

**Resursgrupp**  
Logisk behållare för Azure-resurser som delar samma livscykel, behörigheter och policyer.

**Resurssymbol**  
Unik sträng genererad av azd för att säkerställa att resursnamn är unika över distributioner.

**REST API**  
Arkitektonisk stil för att designa nätverksapplikationer med HTTP-metoder.

**Rollback**  
Processen att återgå till en tidigare version av en applikation eller infrastrukturkonfiguration.

## S

**Tjänst**  
En komponent av din applikation definierad i azure.yaml (t.ex. webbfrontend, API-backend, databas).

**SKU**  
Stock Keeping Unit. Representerar olika tjänstenivåer eller prestandanivåer för Azure-resurser.

**SQL-databas**  
Azures hanterade relationsdatabastjänst baserad på Microsoft SQL Server.

**Static Web Apps**  
Azure-tjänst för att bygga och distribuera fullstack-webbapplikationer från källkodsförråd.

**Storage Account**  
Azure-tjänst som tillhandahåller molnlagring för dataobjekt inklusive blobs, filer, köer och tabeller.

**Prenumeration**  
Azure-kontobehållare som innehåller resursgrupper och resurser, med tillhörande fakturering och åtkomsthantering.

## T

**Mall**  
Förbyggd projektstruktur som innehåller applikationskod, infrastrukturdefinitioner och konfiguration för vanliga scenarier.

**Terraform**  
Öppen källkod Infrastructure as Code-verktyg som stöder flera molnleverantörer inklusive Azure.

**Traffic Manager**  
Azures DNS-baserade trafiklastbalanserare för att distribuera trafik över globala Azure-regioner.

## U

**URI**  
Uniform Resource Identifier. Sträng som identifierar en specifik resurs.

**URL**  
Uniform Resource Locator. Typ av URI som specificerar var en resurs finns och hur den kan hämtas.

## V

**Virtuellt Nätverk (VNet)**  
Grundläggande byggsten för privata nätverk i Azure, som tillhandahåller isolering och segmentering.

**VS Code**  
Visual Studio Code. Populär kodredigerare med utmärkt integration för Azure och azd.

## W

**Webhook**  
HTTP-återkoppling som triggas av specifika händelser, vanligtvis använd i CI/CD-pipelines.

**What-if**  
Azure-funktion som visar vilka ändringar som skulle göras av en distribution utan att faktiskt utföra den.

## Y

**YAML**  
YAML Ain't Markup Language. Människoläsbart dataserialiseringsstandard som används för konfigurationsfiler som azure.yaml.

## Z

**Zon**  
Fysiskt separerade platser inom en Azure-region som tillhandahåller redundans och hög tillgänglighet.

---

## Vanliga Akronymer

| Akronym | Fullständig Form | Beskrivning |
|---------|------------------|-------------|
| AAD | Azure Active Directory | Identitets- och åtkomsthanteringstjänst |
| ACR | Azure Container Registry | Tjänst för containerbildsregister |
| AKS | Azure Kubernetes Service | Hanterad Kubernetes-tjänst |
| API | Application Programming Interface | Protokoll för att bygga mjukvara |
| ARM | Azure Resource Manager | Azures distributions- och hanteringstjänst |
| CDN | Content Delivery Network | Distribuerat nätverk av servrar |
| CI/CD | Continuous Integration/Continuous Deployment | Automatiserade utvecklingsmetoder |
| CLI | Command Line Interface | Textbaserat användargränssnitt |
| DNS | Domain Name System | System för att översätta domännamn till IP-adresser |
| HTTPS | Hypertext Transfer Protocol Secure | Säker version av HTTP |
| IaC | Infrastructure as Code | Hantering av infrastruktur genom kod |
| JSON | JavaScript Object Notation | Datautbytesformat |
| JWT | JSON Web Token | Tokenformat för säker informationsöverföring |
| KQL | Kusto Query Language | Frågespråk för Azure datatjänster |
| RBAC | Role-Based Access Control | Åtkomstkontrollmetod baserad på användarroller |
| REST | Representational State Transfer | Arkitektonisk stil för webbtjänster |
| SDK | Software Development Kit | Samling av utvecklingsverktyg |
| SLA | Service Level Agreement | Åtagande om tjänstetillgänglighet/prestanda |
| SQL | Structured Query Language | Språk för att hantera relationsdatabaser |
| SSL/TLS | Secure Sockets Layer/Transport Layer Security | Kryptografiska protokoll |
| URI | Uniform Resource Identifier | Sträng som identifierar en resurs |
| URL | Uniform Resource Locator | Typ av URI som specificerar resursens plats |
| VM | Virtuell Maskin | Emulering av ett datorsystem |
| VNet | Virtuellt Nätverk | Privat nätverk i Azure |
| YAML | YAML Ain't Markup Language | Dataserialiseringsstandard |

---

## Azure Tjänstenamn Mappningar

| Vanligt Namn | Officiellt Azure Tjänstenamn | azd Host Typ |
|--------------|------------------------------|--------------|
| Webbapp | Azure App Service | `appservice` |
| API-app | Azure App Service | `appservice` |
| Containerapp | Azure Container Apps | `containerapp` |
| Funktion | Azure Functions | `function` |
| Statisk Webbplats | Azure Static Web Apps | `staticwebapp` |
| Databas | Azure Database for PostgreSQL | `postgres` |
| NoSQL DB | Azure Cosmos DB | `cosmosdb` |
| Lagring | Azure Storage Account | `storage` |
| Cache | Azure Cache for Redis | `redis` |
| Sökning | Azure Cognitive Search | `search` |
| Meddelanden | Azure Service Bus | `servicebus` |

---

## Kontexts-specifika Termer

### Utvecklingstermer
- **Hot Reload**: Automatisk uppdatering av applikationer under utveckling utan omstart
- **Byggpipeline**: Automatiserad process för att bygga och testa kod
- **Distributionsslot**: Staging-miljö inom en App Service
- **Miljöparitet**: Att hålla utvecklings-, staging- och produktionsmiljöer liknande

### Säkerhetstermer
- **Managed Identity**: Azure-funktion som tillhandahåller automatisk hantering av autentiseringsuppgifter
- **Key Vault**: Säker lagring för hemligheter, nycklar och certifikat
- **RBAC**: Rollbaserad åtkomstkontroll för Azure-resurser
- **Network Security Group**: Virtuell brandvägg för att kontrollera nätverkstrafik

### Övervakningstermer
- **Telemetri**: Automatisk insamling av mätningar och data
- **Applikationsprestandaövervakning (APM)**: Övervakning av mjukvaruprestanda
- **Log Analytics**: Tjänst för att samla in och analysera loggdata
- **Larmregler**: Automatiska notifieringar baserade på mätvärden eller villkor

### Distributions-termer
- **Blue-Green Deployment**: Noll-downtime distributionsstrategi
- **Canary Deployment**: Gradvis utrullning till en delmängd av användare
- **Rolling Update**: Sekventiell ersättning av applikationsinstanser
- **Rollback**: Återgång till tidigare applikationsversion

---

**Användningstips**: Använd `Ctrl+F` för att snabbt söka efter specifika termer i denna ordlista. Termer är korsrefererade där det är tillämpligt.

---

**Navigering**
- **Föregående Lektion**: [Cheat Sheet](cheat-sheet.md)
- **Nästa Lektion**: [FAQ](faq.md)

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess originalspråk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.