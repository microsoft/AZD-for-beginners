# Vanliga frågor (FAQ)

**Få hjälp per kapitel**
- **📚 Kursstartsida**: [AZD För nybörjare](../README.md)
- **🚆 Installationsproblem**: [Kapitel 1: Installation & Setup](../docs/chapter-01-foundation/installation.md)
- **🤖 AI-frågor**: [Kapitel 2: AI-Först utveckling](../docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🔧 Felsökning**: [Kapitel 7: Felsökning & Debugging](../docs/chapter-07-troubleshooting/common-issues.md)

## Introduktion

Denna omfattande FAQ ger svar på de vanligaste frågorna om Azure Developer CLI (azd) och Azure-distributioner. Hitta snabba lösningar på vanliga problem, förstå bästa praxis och få klarhet i azd-koncept och arbetsflöden.

## Lärandemål

Genom att läsa denna FAQ kommer du att:
- Hitta snabba svar på vanliga frågor och problem med Azure Developer CLI
- Förstå viktiga koncept och terminologi genom praktisk fråge-och-svar-format
- Få tillgång till felsökningslösningar för frekventa problem och fel
- Lära dig bästa praxis genom ofta ställda frågor om optimering
- Upptäcka avancerade funktioner och kapaciteter genom expertfrågor
- Effektivt använda vägledning om kostnader, säkerhet och distributionsstrategier

## Inlärningsresultat

Med regelbunden användning av denna FAQ kommer du att kunna:
- Självständigt lösa vanliga Azure Developer CLI-problem med hjälp av tillhandahållna lösningar
- fatta informerade beslut om distributionsstrategier och konfigurationer
- Förstå relationen mellan azd och andra Azure-verktyg och tjänster
- Tillämpa bästa praxis baserat på gemenskapens erfarenhet och expertrekommendationer
- Felsöka autentiserings-, distributions- och konfigurationsproblem effektivt
- Optimera kostnader och prestanda med insikter och rekommendationer från FAQ

## Innehållsförteckning

- [Komma igång](#getting-started)
- [Autentisering & Åtkomst](#authentication--access)
- [Mallarna & Projekt](#templates--projects)
- [Distribution & Infrastruktur](#deployment--infrastructure)
- [Konfiguration & Miljöer](#configuration--environments)
- [Felsökning](#troubleshooting)
- [Kostnad & Fakturering](#cost--billing)
- [Bästa Praxis](#best-practices)
- [Avancerade Ämnen](#advanced-topics)

---

## Komma igång

### F: Vad är Azure Developer CLI (azd)?
**S**: Azure Developer CLI (azd) är ett utvecklarfokuserat kommandoradsverktyg som påskyndar tiden det tar för dig att få din applikation från lokal utvecklingsmiljö till Azure. Det tillhandahåller bästa praxis genom mallar och hjälper till med hela distributionslivscykeln.

### F: Hur skiljer sig azd från Azure CLI?
**S**: 
- **Azure CLI**: Allmänt verktyg för att hantera Azure-resurser
- **azd**: Utvecklarfokuserat verktyg för applikationsdistributionsarbetsflöden
- azd har egen autentiserings- och distributionsarbetsflöde; Azure CLI är ett separat, komplementärt verktyg
- azd inkluderar mallar, miljöhantering och distributionsautomation

### F: Behöver jag ha Azure CLI installerat för att använda azd?
**S**: Inte för det kärn-AZD-arbetsflödet. Autentisera med `azd auth login`. Installera Azure CLI separat när en mall-hook eller en övning uttryckligen kör `az` kommandon.

### F: Vilka programmeringsspråk stöder azd?
**S**: azd är språkoberoende. Det fungerar med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statiska webbplatser
- Containerapplikationer

### F: Kan jag använda azd med befintliga projekt?
**S**: Ja! Du kan antingen:
1. Använda `azd init` för att lägga till azd-konfiguration till befintliga projekt
2. Anpassa befintliga projekt för att matcha azd-mallstrukturen
3. Skapa egna mallar baserade på din befintliga arkitektur

### F: Vad förändrades med Foundry-tilläggets allmänna tillgänglighet?
**S**: `microsoft.foundry`-paketet nådde version 1.0 och GA den 5 november 2026. Med AZD 1.37.0+ använd `azd ext install microsoft.foundry` för att installera sju kärntillägg för agenter, anslutningar, inspektör, projekt, rutiner, färdigheter och verktygslådor. Det är inte ett nytt kommandonamnrum och dess komponenter versioneras oberoende. Utvärderingar, dataset, finjustering och anpassade modeller installeras separat; valfria förhandsgranskningsfunktioner blir inte GA bara för att paketet är GA.

Den [hostade agent-genomgången](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) använder Python 3.13+ och aktuell uv. `azd ai agent run` öppnar Agent Inspector lokalt, men modellanrop använder fortfarande Azure och medför kostnader. Kodläge `azd deploy` laddar upp källkod för en fjärrkompilering utan att kräva lokal containerkompilering.

### F: Tar `azd down` bort en hostad agent från ett befintligt Foundry-projekt?
**S**: Inte för den återanvända projektvägen som beskrivs i hosted-agent snabbstart: den lämnar projektet, den hostade agenten och andra resurser på plats. Ta bort oönskade resurser separat utan att radera gemensamma resurser. Om miljön skapade ett nytt Foundry-projekt, raderar `azd down` dess resursgrupp och allt som finns i den. Granska [rengöringsanvisningarna](../docs/chapter-02-ai-development/microsoft-foundry-integration.md#7-clean-up-deliberately) och borttagningsdialoger innan du bekräftar.

---

## Autentisering & Åtkomst

### F: Hur autentiserar jag med Azure med azd?
**S**: Använd `azd auth login` som öppnar ett webbläsarfönster för Azure-autentisering. För CI/CD-scenarier, använd serviceprincipaler eller hanterade identiteter.

### F: Kan jag använda azd med flera Azure-prenumerationer?
**S**: Ja. Använd `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` för att specificera vilken prenumeration som ska användas för varje miljö.

### F: Vilka behörigheter behöver jag för att distribuera med azd?
**S**: Vanligtvis behöver du:
- **Bidragsgivare**-roll på resursgruppen eller prenumerationen
- **Användaråtkomstadministratör** om du distribuerar resurser som kräver rolltilldelningar
- Specifika behörigheter varierar beroende på mall och resurser som distribueras

### F: Kan jag använda azd i CI/CD-pipelines?
**S**: Absolut! azd är designat för CI/CD-integration. Använd serviceprincipaler för autentisering och ställ in miljövariabler för konfiguration.

### F: Hur hanterar jag autentisering i GitHub Actions?
**S**: Föredra workload identity federation (OIDC), konfigurerat med `azd pipeline config`. Det genererade arbetsflödet installerar AZD och autentiserar AZD direkt med en federerad identitet. Ett `azure/login` steg ensam etablerar ingen AZD-inloggning. Ett inloggningssteg inom ett befintligt jobb är:
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

Utför provisionering eller distribution efter inloggning, med avsett AZD-miljö, prenumeration och plats konfigurerade. Identitetens federerade autentiseringsuppgifter måste lita på arbetsflödets förvar/ref eller GitHub-miljö, och dess Azure-roller måste tillåta de begärda operationerna.

---

## Mallar & Projekt

### F: Var kan jag hitta azd-mallar?
**S**: 
- Officiella och gemenskapsmallar: [Awesome AZD](https://azure.github.io/awesome-azd/)
- Gemenskapsmallar: GitHub-sökning efter "azd-template"
- Använd `azd template list` för att bläddra bland tillgängliga mallar

### F: Hur skapar jag en anpassad mall?
**S**: 
1. Börja med en befintlig mallstruktur
2. Modifiera `azure.yaml`, infrastrukturfiler och applikationskod
3. Testa noggrant med `azd up`
4. Publicera på GitHub med lämpliga taggar

### F: Kan jag använda azd utan en mall?
**S**: Ja, använd `azd init` i ett befintligt projekt för att skapa nödvändiga konfigurationsfiler. Du måste manuellt konfigurera `azure.yaml` och infrastrukturfiler.

### F: Vad är skillnaden mellan officiella och gemenskapsmallar?
**S**: 
- **Officiella mallar**: Underhålls av Microsoft, regelbundet uppdaterade, omfattande dokumentation
- **Gemenskapsmallar**: Skapade av utvecklare, kan ha specialiserade användningsfall, varierande kvalitet och underhåll

### F: Hur uppdaterar jag en mall i mitt projekt?
**S**: Mallar uppdateras inte automatiskt. Du kan:
1. Manuellt jämföra och slå samman ändringar från källmallen
2. Börja om med `azd init` med den uppdaterade mallen
3. Plocka ut specifika förbättringar från uppdaterade mallar

---

## Distribution & Infrastruktur

### F: Vilka Azure-tjänster kan azd distribuera?
**S**: azd kan distribuera alla Azure-tjänster via Bicep/ARM-mallar, inklusive:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Nätverk, säkerhets- och övervakningsresurser

### F: Kan jag distribuera till flera regioner?
**S**: Ja, konfigurera flera regioner i dina Bicep-mallar och ställ in platsparametern lämpligt för varje miljö.

### F: Hur hanterar jag databasschema-migreringar?
**S**: Använd distributionshooks i `azure.yaml`:
```yaml
hooks:
  postdeploy:
    posix:
      run: ./scripts/migrate-database.sh
    windows:
      run: ./scripts/migrate-database.ps1
```

### F: Kan jag distribuera endast infrastrukturen utan applikationer?
**S**: Ja, använd `azd provision` för att distribuera enbart infrastrukturbeståndsdelarna definierade i dina mallar.

### F: Hur distribuerar jag till befintliga Azure-resurser?
**S**: Ja, om mallen stödjer det. Referera befintliga resurser med Biceps `existing`-deklarationer eller mallens dokumenterade parametrar för befintliga resurser, och koppla applikationstjänster till deras avsedda mål. Detta importerar inte ägandeskap och skapar inte automatiskt saknade behörigheter. Granska mallen innan distribution.

### F: Kan jag använda Terraform istället för Bicep?
**S**: Ja. AZD stödjer både Terraform och Bicep. Välj en Terraform-baserad mall eller konfigurera `infra.provider: terraform` i `azure.yaml`, med lämpliga Terraform-filer och state/backend-konfiguration. Se [Terraform-arbetsflödet](https://learn.microsoft.com/azure/developer/azure-developer-cli/use-terraform-for-azd).

---

## Konfiguration & Miljöer

### F: Hur hanterar jag olika miljöer (dev, staging, prod)?
**S**: Skapa separata miljöer med `azd env new <environment-name>` och konfigurera olika inställningar för varje:
```bash
azd env new development
azd env new staging  
azd env new production
```

### F: Var lagras miljökonfigurationer?
**S**: I `.azure`-mappen inom din projektmapp. Varje miljö har sin egen mapp med konfigurationsfiler.

### F: Hur ställer jag in miljöspecifik konfiguration?
**S**: Använd `azd env set` för att konfigurera miljövariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### F: Kan jag dela miljökonfigurationer mellan teammedlemmar?
**S**: `.azure`-mappen innehåller känslig information och bör inte läggas under versionskontroll. Istället:
1. Dokumentera nödvändiga miljövariabler
2. Använd distributionsskript för att sätta upp miljöer
3. Använd Azure Key Vault för känslig konfiguration

### F: Hur åsidosätter jag mallstandarder?
**S**: Ställ in miljövariabler som motsvarar mallparametrar:
```bash
azd env set AZURE_LOCATION westus2
azd env set SKU_NAME "B1"
```

Endast variabler som förbrukas av mallen påverkar distributionen. `SKU_NAME` ovan är ett exempel på ett anpassat indata, inte en universell AZD-inställning.

---

## Felsökning

### F: Varför misslyckas `azd up`?
**S**: Vanliga orsaker:
1. **Autentiseringsproblem**: Kör `azd auth login`
2. **Otillräckliga behörigheter**: Kontrollera dina Azure-rolltilldelningar
3. **Konflikter i resursnamn**: Granska den konfliktande resursen och mallens namngivningsparametrar; skapa en separat miljö med `azd env new` när isolering behövs
4. **Kvot-/kapacitetsproblem**: Kontrollera regional tillgänglighet
5. **Mallfel**: Validera Bicep-mallar

### F: Hur felsöker jag distributionsfel?
**S**: 
1. Använd `azd deploy --debug` för utförligt utskrift
2. Kontrollera distributionshistorik i Azure-portalen
3. Granska aktivitetsloggen i Azure-portalen
4. Använd `azd show` för att visa nuvarande miljötillstånd

### F: Varför fungerar inte mina miljövariabler?
**S**: Kontrollera:
1. Variabelnamn matchar mallparametrar exakt
2. Värden är korrekt citerade om de innehåller mellanslag
3. Miljö är vald: `azd env select <environment>`
4. Variabler är satta i rätt miljö

### F: Hur städar jag upp misslyckade distributioner?
**S**: 
```bash
azd down
```
Granska vald miljö och borttagningsbekräftelse först. Detta raderar provisionerade Azure-resurser, inte den lokala `.azure`-miljökonfigurationen. `--purge` begär även permanent radering av stödda mjukborttagna resurser och kan blockeras av behållnings-/rensningsskydd; det är inte ett rutinmässigt återställningssteg.

### F: Varför är min applikation inte tillgänglig efter distribution?
**S**: Kontrollera:
1. Distributionen slutfördes framgångsrikt
2. Applikationen körs (kontrollera loggar i Azure-portalen)
3. Nätverkssäkerhetsgrupper tillåter trafik
4. DNS/anpassade domäner är korrekt konfigurerade

---

## Kostnad & Fakturering

### F: Hur mycket kommer azd-distributioner att kosta?
**S**: Kostnader beror på:
- Azure-tjänster som distribueras
- Valda servicelager/SKUs
- Regionala prisskillnader
- Användningsmönster

Använd [Azure-priskalkylatorn](https://azure.microsoft.com/pricing/calculator/) för uppskattningar.

### F: Hur kontrollerar jag kostnader i azd-distributioner?
**S**: 
1. Använd lägre nivå SKUs för utvecklingsmiljöer
2. Ställ in Azure-budgetar och aviseringar
3. Använd `azd down` för att ta bort resurser när de inte behövs
4. Välj lämpliga regioner (kostnader varierar med plats)
5. Använd Azure Cost Management-verktyg

### F: Finns det gratisnivåer för azd-mallar?
**S**: Vissa tjänster har gratis SKU:er eller månatliga bidrag, beroende på behörighet, värdplan, region och prenumerationsgränser. Dessa gör inte en hel mall gratis: databaser, sök, nätverk, register, telemetri och modellinferens kan medföra kostnader separat. Kontrollera listan över [Azure gratis tjänster](https://azure.microsoft.com/free/) och aktuell prissättning för varje resurs innan distribution.

### F: Hur uppskattar jag kostnader innan distribution?
**S**: 
1. Granska mallens `main.bicep` för att se vilka resurser som skapas
2. Använd Azure Pricing Calculator med specifika SKU:er
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

### F: Hur organiserar jag flera tjänster i azd?
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

### F: Bör jag committa `.azure`-mappen till versionshantering?
**S**: **Nej!** `.azure`-mappen innehåller känslig information. Lägg till den i `.gitignore`:
```gitignore
.azure/
```

### F: Hur hanterar jag hemligheter och känslig konfiguration?
**S**: 
1. Använd Azure Key Vault för hemligheter
2. Referera till Key Vault-hemligheter i applikationskonfigurationen
3. Commit aldrig hemligheter till versionshantering
4. Använd hanterade identiteter för autentisering mellan tjänster

### F: Vad är rekommenderad metod för CI/CD med azd?
**S**: 
1. Använd separata miljöer för varje steg (dev/staging/prod)
2. Implementera automatiserade tester före distribution
3. Använd tjänstehuvuden för autentisering
4. Spara känslig konfiguration i pipeline-hemligheter/variabler
5. Implementera godkännandekontroller för produktionsdistributioner

---

## Avancerade ämnen

### F: Kan jag utöka azd med egen funktionalitet?
**S**: Ja, via distributionshooks i `azure.yaml`:
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
3. Integrera med befintlig övervakning och varningar
4. Använd azd:s JSON-utdata för pipelineintegration

### F: Kan jag använda azd med Azure DevOps?
**S**: Ja, azd fungerar med alla CI/CD-system. Skapa Azure DevOps-pipelines som använder azd-kommandon.

### F: Hur bidrar jag till azd eller skapar communitymallar?
**S**: 
1. **azd-verktyget**: Bidra till [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mallar**: Följ instruktionerna i [Awesome AZD gallery contribution instructions](https://github.com/Azure/awesome-azd#3-contribute-to-gallery)
3. **Dokumentation**: Bidra till dokumentationen på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### F: Vad är färdplanen för azd?
**S**: Kolla den [officiella färdplanen](https://github.com/Azure/azure-dev/projects) för planerade funktioner och förbättringar.

### F: Hur migrerar jag från andra distributionsverktyg till azd?
**S**: 
1. Analysera nuvarande distributionsarkitektur
2. Skapa motsvarande Bicep-mallar
3. Konfigurera `azure.yaml` för att matcha nuvarande tjänster
4. Testa noggrant i utvecklingsmiljö
5. Migrera miljöer gradvis

---

## Har du fortfarande frågor?

### **Sök först**
- Kolla [officiell dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Sök i [GitHub-ärenden](https://github.com/Azure/azure-dev/issues) för liknande problem

### **Få hjälp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Gemenskapsstöd
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniska frågor
- [Azure Discord](https://discord.gg/azure) - Community-chatt i realtid

### **Rapportera problem**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Felrapporter och funktionsönskemål
- Bifoga relevanta loggar, felmeddelanden och steg för att återskapa

### **Lär dig mer**
- [Azure Developer CLI dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Teknisk vägledning granskad: 4 november 2026. Molntillgänglighet och prissättning måste kontrolleras för din prenumeration och region.*

---

**Navigation**
- **Föregående lektion**: [Glossary](glossary.md)
- **Nästa lektion**: [Study Guide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->