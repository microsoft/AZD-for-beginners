# Vanliga frågor (FAQ)

**Få hjälp per kapitel**
- **📚 Kursstart**: [AZD För nybörjare](../README.md)
- **🚆 Installationsproblem**: [Kapitel 1: Installation & Uppstart](../docs/chapter-01-foundation/installation.md)
- **🤖 AI-frågor**: [Kapitel 2: AI-First Utveckling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Felsökning**: [Kapitel 7: Felsökning & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denna omfattande FAQ ger svar på de vanligaste frågorna om Azure Developer CLI (azd) och Azure-distributioner. Hitta snabba lösningar på vanliga problem, förstå bästa praxis och få klarhet i azd-koncept och arbetsflöden.

## Lärandemål

Genom att gå igenom denna FAQ kommer du att:
- Hitta snabba svar på vanliga frågor och problem kring Azure Developer CLI
- Förstå nyckelkoncept och terminologi genom praktiskt Q&A-format 
- Få tillgång till felsökningslösningar för vanliga problem och fel
- Lära dig bästa praxis genom ofta förekommande frågor om optimering 
- Upptäcka avancerade funktioner och möjligheter genom expertfrågor
- Effektivt referera till kostnads-, säkerhets- och distributionsstrategier

## Läranderesultat

Med regelbunden hänvisning till denna FAQ kommer du kunna:
- Lösa vanliga problem med Azure Developer CLI självständigt med tillhandahållna lösningar
- Göra informerade val om distributionsstrategier och konfigurationer
- Förstå sambandet mellan azd och andra Azure-verktyg och tjänster
- Tillämpa bästa praxis baserad på erfarenhet från community och expertrekommendationer
- Felsöka autentiserings-, distributions- och konfigurationsproblem effektivt
- Optimera kostnader och prestanda med hjälp av insikter och rekommendationer från FAQ

## Innehållsförteckning

- [Komma igång](#getting-started)
- [Autentisering & åtkomst](#authentication--access)
- [Mallar & projekt](#templates--projects)
- [Distribution & infrastruktur](#deployment--infrastructure)
- [Konfiguration & miljöer](#configuration--environments)
- [Felsökning](#troubleshooting)
- [Kostnad & fakturering](#cost--billing)
- [Bästa praxis](#best-practices)
- [Avancerade ämnen](#advanced-topics)

---

## Komma igång

### F: Vad är Azure Developer CLI (azd)?
**S**: Azure Developer CLI (azd) är ett utvecklarcentrerat kommandoradsverktyg som påskyndar tiden det tar för dig att få din applikation från lokal utvecklingsmiljö till Azure. Det tillhandahåller bästa praxis genom mallar och hjälper till med hela distributionslivscykeln.

### F: Hur skiljer sig azd från Azure CLI?
**S**: 
- **Azure CLI**: Allmänt verktyg för hantering av Azure-resurser
- **azd**: Utvecklarfokuserat verktyg för applikationsdistributionsarbetsflöden
- azd har eget autentiserings- och distributionsarbetsflöde; Azure CLI är ett separat, kompletterande verktyg
- azd inkluderar mallar, miljöhantering och distributionsautomation

### F: Behöver jag installera Azure CLI för att använda azd?
**S**: Inte för det grundläggande AZD-arbetsflödet. Autentisera med `azd auth login`. Installera Azure CLI separat när en mall-hook eller övning uttryckligen kör `az`-kommandon.

### F: Vilka programmeringsspråk stöder azd?
**S**: azd är språkoberoende. Det fungerar med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statisk webbplatser
- Containeriserade applikationer

### F: Kan jag använda azd med befintliga projekt?
**S**: Ja! Du kan antingen:
1. Använda `azd init` för att lägga till azd-konfiguration i befintliga projekt
2. Anpassa befintliga projekt för att matcha azd-mallstrukturen
3. Skapa egna mallar baserade på din befintliga arkitektur

---

## Autentisering & åtkomst

### F: Hur autentiserar jag med Azure med azd?
**S**: Använd `azd auth login` som öppnar ett webbläsarfönster för Azure-autentisering. För CI/CD-scenarier, använd service principals eller hanterade identiteter.

### F: Kan jag använda azd med flera Azure-prenumerationer?
**S**: Ja. Använd `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` för att specificera vilken prenumeration som ska användas för varje miljö.

### F: Vilka behörigheter behöver jag för att distribuera med azd?
**S**: Vanligtvis behöver du:
- **Bidragsgivarrollen** på resursgruppen eller prenumerationen
- **Användaråtkomstadministratör** om resurser som kräver rolltilldelningar distribueras
- Specifika behörigheter varierar beroende på mall och resurser som distribueras

### F: Kan jag använda azd i CI/CD-pipelines?
**S**: Absolut! azd är designad för CI/CD-integration. Använd service principals för autentisering och ställ in miljövariabler för konfiguration.

### F: Hur hanterar jag autentisering i GitHub Actions?
**S**: Föredra workload identity federation (OIDC), konfigurerad med `azd pipeline config`. Det genererade arbetsflödet installerar AZD och autentiserar AZD direkt med en federerad identitet. Ett `azure/login`-steg ensam etablerar inte en AZD-inloggning. Ett inloggningssteg inom ett befintligt jobb är:
```yaml
permissions:
  contents: read
  id-token: write
steps:
  - uses: actions/checkout@v7
  - uses: Azure/setup-azd@v2
  - run: >-
      azd auth login
      --client-id "${{ vars.AZURE_CLIENT_ID }}"
      --tenant-id "${{ vars.AZURE_TENANT_ID }}"
      --federated-credential-provider github
```

Provisonera eller distribuera efter inloggning, med avsedd AZD-miljö, prenumeration och plats konfigurerad. Identitetens federerade legitimationsuppgifter måste lita på arbetsflödets repository/ref eller GitHub-miljö, och dess Azure-roller måste tillåta de begärda operationerna.

---

## Mallar & projekt

### F: Var kan jag hitta azd-mallar?
**S**: 
- Officiella och community-mallar: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Community-mallar: GitHub-sökning efter "azd-template"
- Använd `azd template list` för att bläddra i tillgängliga mallar

### F: Hur skapar jag en egen mall?
**S**: 
1. Börja med befintlig mallstruktur
2. Modifiera `azure.yaml`, infrastrukturn filer och applikationskod
3. Testa noggrant med `azd up`
4. Publicera på GitHub med lämpliga taggar

### F: Kan jag använda azd utan en mall?
**S**: Ja, använd `azd init` i ett befintligt projekt för att skapa nödvändiga konfigurationsfiler. Du måste manuellt konfigurera `azure.yaml` och infrastrukturn filer.

### F: Vad är skillnaden mellan officiella och community-mallar?
**S**: 
- **Officiella mallar**: Underhålls av Microsoft, regelbundet uppdaterade, omfattande dokumentation
- **Community-mallar**: Skapade av utvecklare, kan ha specialiserade användningsfall, varierande kvalitet och underhåll

### F: Hur uppdaterar jag en mall i mitt projekt?
**S**: Mallar uppdateras inte automatiskt. Du kan:
1. Jämföra och slå samman förändringar från källmallen manuellt
2. Börja om med `azd init` och den uppdaterade mallen
3. Plocka ut specifika förbättringar från uppdaterade mallar

---

## Distribution & Infrastruktur

### F: Vilka Azure-tjänster kan azd distribuera?
**S**: azd kan distribuera vilken Azure-tjänst som helst via Bicep/ARM-mallar, inklusive:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Nätverk, säkerhet och övervakningsresurser

### F: Kan jag distribuera till flera regioner?
**S**: Ja, konfigurera flera regioner i dina Bicep-mallar och ange lägesparametern lämpligt för varje miljö.

### F: Hur hanterar jag databas-schema-migrationer?
**S**: Använd distributions-hooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### F: Kan jag distribuera bara infrastrukturen utan applikationer?
**S**: Ja, använd `azd provision` för att distribuera endast infrastrukturkomponenterna definierade i dina mallar.

### F: Hur distribuerar jag till befintliga Azure-resurser?
**S**: Ja, när mallen stöder det. Referera befintliga resurser med Biceps `existing`-deklarationer eller mallens dokumenterade parametrar för befintliga resurser, och mappa applikationstjänster till deras avsedda mål. Detta importerar inte automatiskt ägarskap eller skapar saknade behörigheter. Granska mallen före distribution.

### F: Kan jag använda Terraform istället för Bicep?
**S**: Ja. AZD stödjer både Terraform och Bicep. Välj en Terraform-baserad mall eller konfigurera `infra.provider: terraform` i `azure.yaml` med lämpliga Terraform-filer och state/backend-konfiguration. Se [Terraform-arbetsflödet](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguration & miljöer

### F: Hur hanterar jag olika miljöer (dev, staging, prod)?
**S**: Skapa separata miljöer med `azd env new <environment-name>` och konfigurera olika inställningar för varje:
```bash
azd env new development
azd env new staging  
azd env new production
```

### F: Var lagras miljökonfigurationer?
**S**: I `.azure`-mappen inom din projektkatalog. Varje miljö har sin egen mapp med konfigurationsfiler.

### F: Hur sätter jag miljöspecifik konfiguration?
**S**: Använd `azd env set` för att konfigurera miljövariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### F: Kan jag dela miljökonfigurationer med teamkollegor?
**S**: `.azure`-mappen innehåller känslig information och bör inte checkas in i versionshantering. Istället:
1. Dokumentera nödvändiga miljövariabler
2. Använd distributionsskript för att sätta upp miljöer
3. Använd Azure Key Vault för känsliga konfigurationer

### F: Hur överskrider jag mallens standardinställningar?
**S**: Sätt miljövariabler som motsvarar mallparametrar:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Endast variabler som förbrukas av mallen påverkar distributionen. `SKU_NAME` ovan är ett exempel på anpassad indata, inte en universell AZD-inställning.

---

## Felsökning

### F: Varför misslyckas `azd up`?
**S**: Vanliga orsaker:
1. **Autentiseringsproblem**: Kör `azd auth login`
2. **Otillräckliga behörigheter**: Kontrollera dina Azure-rolltilldelningar
3. **Konflikter i resursnamn**: Granska den konfliktande resursen och mallens namngivningsindata; skapa en separat miljö med `azd env new` när isolering krävs
4. **Kvot-/kapacitetsproblem**: Kontrollera regional tillgänglighet
5. **Mallfel**: Validera Bicep-mallar

### F: Hur felsöker jag distributionsmisslyckanden?
**S**: 
1. Använd `azd deploy --debug` för detaljerad utskrift
2. Kontrollera distributionshistorik i Azure-portalen
3. Granska Aktivitetsloggen i Azure-portalen
4. Använd `azd show` för att visa aktuell miljöstatus

### F: Varför fungerar inte mina miljövariabler?
**S**: Kontrollera:
1. Variabelnamnen matchar mallparametrarna exakt
2. Värden är korrekt citerade om de innehåller blanksteg
3. Miljön är vald: `azd env select <environment>`
4. Variabler är satta i rätt miljö

### F: Hur rensar jag upp misslyckade distributioner?
**S**: 
```bash
azd down
```
Granska vald miljö och bekräftelse för radering först. Detta tar bort provisionerade Azure-resurser, inte den lokala `.azure`-miljökonfigurationen. `--purge` begär dessutom permanent borttagning av stödjda mjukborttagna resurser och kan blockeras av behållnings-/rensningsskydd; det är inte ett rutinmässigt återställningssteg.

### F: Varför är min applikation inte åtkomlig efter distribution?
**S**: Kontrollera:
1. Distributionen slutfördes framgångsrikt
2. Applikationen körs (kolla loggar i Azure-portalen)
3. Nätverkssäkerhetsgrupper tillåter trafik
4. DNS/egna domäner är korrekt konfigurerade

---

## Kostnad & fakturering

### F: Hur mycket kommer azd-distributioner att kosta?
**S**: Kostnader beror på:
- Azure-tjänster som distribueras
- Valda tjänstenivåer/SKU:er
- Regionala prisavvikelser
- Användningsmönster

Använd [Azure Price Calculator](https://azure.microsoft.com/pricing/calculator/) för uppskattningar.

### F: Hur kontrollerar jag kostnader i azd-distributioner?
**S**: 
1. Använd lägre tier-SKU:er för utvecklingsmiljöer
2. Sätt upp Azure-budgetar och larm
3. Använd `azd down` för att ta bort resurser när de inte behövs
4. Välj lämpliga regioner (kostnader varierar efter plats)
5. Använd Azure Cost Management-verktyg

### F: Finns det gratisnivåer för azd-mallar?
**S**: Vissa tjänster har gratis SKU:er eller månadsvisa bidrag, beroende på behörighet, värdplan, region och prenumerationsgränser. Dessa gör inte en hel mall gratis: databaser, sök, nätverk, register, telemetri och modellinferens kan ge kostnader separat. Kontrollera [Azure lista över gratis tjänster](https://azure.microsoft.com/free/) och aktuell prissättning för varje resurs innan distribution.

### F: Hur uppskattar jag kostnader innan distribution?
**S**: 
1. Granska mallens `main.bicep` för att se vilka resurser som skapas
2. Använd Azure Price Calculator med specifika SKU:er
3. Distribuera först till en utvecklingsmiljö för att övervaka faktiska kostnader
4. Använd Azure Cost Management för detaljerad kostnadsanalys

---

## Bästa praxis

### F: Vilka är bästa praxis för azd-projektstruktur?
**S**: 
1. Håll applikationskod separat från infrastruktur
2. Använd meningsfulla tjänstenamn i `azure.yaml`
3. Implementera korrekt felhantering i byggskript
4. Använd miljöspecifik konfiguration
5. Inkludera omfattande dokumentation

### F: Hur bör jag organisera flera tjänster i azd?
**S**: Använd den rekommenderade strukturen:
```
├── src/
│   ├── web/          # Frontend service
│   ├── api/          # Backend service  
│   └── worker/       # Background service
├── infra/            # Infrastructure templates
├── azure.yaml        # azd configuration
└── README.md         # Project documentation
```

### F: Bör jag checka in `.azure`-mappen i versionshantering?
**S**: **Nej!** `.azure`-mappen innehåller känslig information. Lägg till den i `.gitignore`:
```gitignore
.azure/
```

### F: Hur hanterar jag hemligheter och känslig konfiguration?
**S**: 
1. Använd Azure Key Vault för hemligheter
2. Referera till Key Vault-hemligheter i applikationskonfigurationen
3. Lämna aldrig hemligheter i versionskontroll
4. Använd hanterade identiteter för tjänst-till-tjänst-autentisering

### F: Vad är den rekommenderade metoden för CI/CD med azd?
**S**: 
1. Använd separata miljöer för varje steg (utv/test/prod)
2. Implementera automatiska tester innan distribution
3. Använd tjänsthuvudkonton för autentisering
4. Spara känslig konfiguration i pipeline-hemligheter/variabler
5. Implementera godkännandepunkter för produktionsdistributioner

---

## Avancerade ämnen

### F: Kan jag utöka azd med anpassad funktionalitet?
**S**: Ja, genom distributionshooks i `azure.yaml`:
```yaml
hooks:
  predeploy:
    run: ./scripts/custom-setup.sh
  postdeploy:
    run: ./scripts/custom-config.sh
```

### F: Hur integrerar jag azd med befintliga DevOps-processer?
**S**: 
1. Använd azd-kommandon i befintliga pipelineskript
2. Standardisera på azd-mallar över team
3. Integrera med befintlig övervakning och aviseringar
4. Använd azd:s JSON-utdata för pipelineintegration

### F: Kan jag använda azd med Azure DevOps?
**S**: Ja, azd fungerar med vilket CI/CD-system som helst. Skapa Azure DevOps-pipelines som använder azd-kommandon.

### F: Hur bidrar jag till azd eller skapar community-mallar?
**S**: 
1. **azd-verktyget**: Bidra till [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mallar**: Följ [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentation**: Bidra till dokumentationen vid [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### F: Vad är färdplanen för azd?
**S**: Kolla [den officiella färdplanen](https://github.com/Azure/azure-dev/projects) för planerade funktioner och förbättringar.

### F: Hur migrerar jag från andra distributionsverktyg till azd?
**S**: 
1. Analysera aktuell distributionsarkitektur
2. Skapa motsvarande Bicep-mallar
3. Konfigurera `azure.yaml` för att matcha aktuella tjänster
4. Testa noggrant i utvecklingsmiljö
5. Migrera miljöer gradvis

---

## Har du fortfarande frågor?

### **Sök först**
- Kolla [den officiella dokumentationen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Sök i [GitHub-ärenden](https://github.com/Azure/azure-dev/issues) efter liknande problem

### **Få hjälp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Gemenskapens stöd
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniska frågor
- [Azure Discord](https://discord.gg/azure) - Gemenskapens chatt i realtid

### **Rapportera problem**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Buggrapporter och funktionsförfrågningar
- Bifoga relevanta loggar, felmeddelanden och steg för att reproducera

### **Lär dig mer**
- [Dokumentation för Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Teknisk vägledning granskad: 4 november 2026. Molntillgänglighet och priser måste kontrolleras för din prenumeration och region.*

---

**Navigering**
- **Föregående lektion**: [Ordlista](glossary.md)
- **Nästa lektion**: [Studieguide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->