# Vanliga frågor (FAQ)

**Få hjälp per kapitel**
- **📚 Kursstartsida**: [AZD för nybörjare](../README.md)
- **🚆 Installationsproblem**: [Kapitel 1: Installation och uppsättning](../docs/getting-started/installation.md)
- **🤖 AI-frågor**: [Kapitel 2: AI-First Development](../docs/microsoft-foundry/microsoft-foundry-integration.md)
- **🔧 Felsökning**: [Kapitel 7: Troubleshooting & Debugging](../docs/troubleshooting/common-issues.md)

## Introduktion

Denna omfattande FAQ ger svar på de vanligaste frågorna om Azure Developer CLI (azd) och distributioner till Azure. Hitta snabba lösningar på vanliga problem, förstå bästa praxis och få förtydliganden kring azd-koncept och arbetsflöden.

## Lärandemål

Genom att gå igenom denna FAQ kommer du att:
- Hitta snabba svar på vanliga frågor och problem kring Azure Developer CLI
- Förstå nyckelbegrepp och terminologi genom praktiska frågor och svar
- Få tillgång till felsökningslösningar för frekventa problem och felscenarier
- Lära dig bästa praxis genom vanliga frågor om optimering
- Upptäcka avancerade funktioner och kapaciteter genom expertfrågor
- Snabbt kunna referera till vägledning om kostnader, säkerhet och distributionsstrategi

## Läranderesultat

Genom regelbunden användning av denna FAQ kommer du att kunna:
- Lösa vanliga problem med Azure Developer CLI självständigt med hjälp av tillhandahållna lösningar
- Fatta informerade beslut om distributionsstrategier och konfigurationer
- Förstå relationen mellan azd och andra Azure-verktyg och tjänster
- Tillämpa bästa praxis baserat på communityerfarenheter och expertrekommendationer
- Felsöka autentisering, distribution och konfigurationsproblem effektivt
- Optimera kostnader och prestanda med hjälp av FAQ-insikter och rekommendationer

## Innehållsförteckning

- [Getting Started](../../../resources)
- [Authentication & Access](../../../resources)
- [Templates & Projects](../../../resources)
- [Deployment & Infrastructure](../../../resources)
- [Configuration & Environments](../../../resources)
- [Troubleshooting](../../../resources)
- [Cost & Billing](../../../resources)
- [Best Practices](../../../resources)
- [Advanced Topics](../../../resources)

---

## Getting Started

### F: Vad är Azure Developer CLI (azd)?
**S**: Azure Developer CLI (azd) är ett utvecklarcentrerat kommandoradsverktyg som påskyndar tiden det tar att få din applikation från lokal utvecklingsmiljö till Azure. Det tillhandahåller bästa praxis genom mallar och hjälper till under hela distributionslivscykeln.

### F: Hur skiljer sig azd från Azure CLI?
**S**: 
- **Azure CLI**: Allmänt verktyg för hantering av Azure-resurser
- **azd**: Utvecklarfokuserat verktyg för applikationsdistributionsarbetsflöden
- azd använder Azure CLI internt men erbjuder högre abstraktioner för vanliga utvecklingsscenarier
- azd inkluderar mallar, miljöhantering och distributionsautomatisering

### F: Behöver jag Azure CLI installerat för att använda azd?
**S**: Ja, azd kräver Azure CLI för autentisering och vissa operationer. Installera Azure CLI först, installera sedan azd.

### F: Vilka programmeringsspråk stöder azd?
**S**: azd är språkövergripande. Det fungerar med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statisk webbplats
- Containeriserade applikationer

### F: Kan jag använda azd med befintliga projekt?
**S**: Ja! Du kan antingen:
1. Använda `azd init` för att lägga till azd-konfiguration i befintliga projekt
2. Anpassa befintliga projekt för att matcha azd-mallstrukturen
3. Skapa egna mallar baserade på din befintliga arkitektur

---

## Authentication & Access

### F: Hur autentiserar jag mot Azure med azd?
**S**: Använd `azd auth login` som öppnar ett webbläsarfönster för Azure-autentisering. För CI/CD-scenarier, använd service principals eller hanterade identiteter.

### F: Kan jag använda azd med flera Azure-prenumerationer?
**S**: Ja. Använd `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` för att specificera vilken prenumeration som ska användas för varje miljö.

### F: Vilka behörigheter behöver jag för att distribuera med azd?
**S**: Typiskt behöver du:
- **Contributor**-roll på resursgruppen eller prenumerationen
- **User Access Administrator** om du distribuerar resurser som kräver rolltilldelningar
- Specifika behörigheter varierar beroende på mall och de resurser som distribueras

### F: Kan jag använda azd i CI/CD-pipelines?
**S**: Absolut! azd är utformat för integration i CI/CD. Använd service principals för autentisering och ställ in miljövariabler för konfiguration.

### F: Hur hanterar jag autentisering i GitHub Actions?
**S**: Använd Azure Login-action med service principal-referenser:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Templates & Projects

### F: Var kan jag hitta azd-mallar?
**S**: 
- Officiella mallar: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community-mallar: Sök på GitHub efter "azd-template"
- Använd `azd template list` för att bläddra bland tillgängliga mallar

### F: Hur skapar jag en anpassad mall?
**S**: 
1. Börja med en befintlig mallstruktur
2. Modifiera `azure.yaml`, infrastrukturfiler och applikationskod
3. Testa noggrant med `azd up`
4. Publicera till GitHub med lämpliga taggar

### F: Kan jag använda azd utan en mall?
**S**: Ja, använd `azd init` i ett befintligt projekt för att skapa nödvändiga konfigurationsfiler. Du behöver manuellt konfigurera `azure.yaml` och infrastrukturfiler.

### F: Vad är skillnaden mellan officiella och community-mallar?
**S**: 
- **Officiella mallar**: Underhålls av Microsoft, uppdateras regelbundet, omfattande dokumentation
- **Community-mallar**: Skapade av utvecklare, kan ha specialiserade användningsfall, varierande kvalitet och underhåll

### F: Hur uppdaterar jag en mall i mitt projekt?
**S**: Mallar uppdateras inte automatiskt. Du kan:
1. Jämföra och slå ihop ändringar manuellt från källmallen
2. Börja om med `azd init` med den uppdaterade mallen
3. Cherry-picka specifika förbättringar från uppdaterade mallar

---

## Deployment & Infrastructure

### F: Vilka Azure-tjänster kan azd distribuera?
**S**: azd kan distribuera vilken Azure-tjänst som helst via Bicep/ARM-mallar, inklusive:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Storage, Key Vault, Application Insights
- Nätverk, säkerhet och övervakningsresurser

### F: Kan jag distribuera till flera regioner?
**S**: Ja, konfigurera flera regioner i dina Bicep-mallar och ställ in platsparametern lämpligt för varje miljö.

### F: Hur hanterar jag databas-schemamigreringar?
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
**S**: Ja, använd `azd provision` för att endast distribuera infrastrukturkomponenterna som definieras i dina mallar.

### F: Hur distribuerar jag till befintliga Azure-resurser?
**S**: Detta är komplext och inte direkt stöds. Du kan:
1. Importera befintliga resurser i dina Bicep-mallar
2. Använda referenser till befintliga resurser i mallarna
3. Modifiera mallarna för att villkorligt skapa eller referera resurser

### F: Kan jag använda Terraform istället för Bicep?
**S**: För närvarande stöder azd främst Bicep/ARM-mallar. Terraform-stöd är inte officiellt tillgängligt, även om community-lösningar kan finnas.

---

## Configuration & Environments

### F: Hur hanterar jag olika miljöer (dev, staging, prod)?
**S**: Skapa separata miljöer med `azd env new <environment-name>` och konfigurera olika inställningar för varje:
```bash
azd env new development
azd env new staging  
azd env new production
```

### F: Var lagras miljökonfigurationer?
**S**: I `.azure`-mappen i din projektkatalog. Varje miljö har sin egen mapp med konfigurationsfiler.

### F: Hur ställer jag in miljöspecifik konfiguration?
**S**: Använd `azd env set` för att konfigurera miljövariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### F: Kan jag dela miljökonfigurationer med teammedlemmar?
**S**: Mappen `.azure` innehåller känslig information och bör inte committas till versionskontroll. Istället:
1. Dokumentera nödvändiga miljövariabler
2. Använd distributionsskript för att sätta upp miljöer
3. Använd Azure Key Vault för känslig konfiguration

### F: Hur åsidosätter jag mallarnas standardvärden?
**S**: Ställ in miljövariabler som motsvarar mallparametrarna:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Troubleshooting

### F: Varför misslyckas `azd up`?
**S**: Vanliga orsaker:
1. **Autentiseringsproblem**: Kör `azd auth login`
2. **Otillräckliga behörigheter**: Kontrollera dina Azure-rolltilldelningar
3. **Konflikter i resursnamn**: Byt AZURE_ENV_NAME
4. **Kvantitets-/kapacitetsproblem**: Kontrollera regional tillgänglighet
5. **Mallfel**: Validera Bicep-mallarna

### F: Hur felsöker jag distributionsfel?
**S**: 
1. Använd `azd deploy --debug` för detaljerad utdata
2. Kontrollera distributionshistorik i Azure-portalen
3. Granska Aktivitetloggen i Azure-portalen
4. Använd `azd show` för att visa aktuell miljöstatus

### F: Varför fungerar inte mina miljövariabler?
**S**: Kontrollera:
1. Att variabelnamnen matchar mallparametrarna exakt
2. Att värden är korrekt citerade om de innehåller mellanslag
3. Att rätt miljö är vald: `azd env select <environment>`
4. Att variablerna är satta i rätt miljö

### F: Hur städar jag upp misslyckade distributioner?
**S**: 
```bash
azd down --force --purge
```
Detta tar bort alla resurser och miljökonfiguration.

### F: Varför är min applikation inte tillgänglig efter distribution?
**S**: Kontrollera:
1. Att distributionen slutfördes framgångsrikt
2. Att applikationen körs (kontrollera loggar i Azure-portalen)
3. Att nätverkssäkerhetsgrupper tillåter trafik
4. Att DNS/anpassade domäner är korrekt konfigurerade

---

## Cost & Billing

### F: Hur mycket kommer azd-distributioner att kosta?
**S**: Kostnader beror på:
- Azure-tjänster som distribueras
- Valda service tiers/SKUs
- Prisskillnader mellan regioner
- Användningsmönster

Använd [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) för uppskattningar.

### F: Hur kontrollerar jag kostnader i azd-distributioner?
**S**: 
1. Använd lägre tier SKUs för utvecklingsmiljöer
2. Konfigurera Azure-budgetar och varningar
3. Använd `azd down` för att ta bort resurser när de inte behövs
4. Välj lämpliga regioner (kostnader varierar per plats)
5. Använd Azure Cost Management-verktyg

### F: Finns det gratisalternativ för azd-mallar?
**S**: Många Azure-tjänster erbjuder gratisnivåer:
- App Service: Gratisnivå tillgänglig
- Azure Functions: 1M gratis körningar/månad
- Cosmos DB: Gratisnivå med 400 RU/s
- Application Insights: Första 5GB/månad gratis

Konfigurera mallar för att använda gratisnivåer där det finns.

### F: Hur uppskattar jag kostnader innan distribution?
**S**: 
1. Granska mallens `main.bicep` för att se vilka resurser som skapas
2. Använd Azure Pricing Calculator med specifika SKUs
3. Distribuera först till en utvecklingsmiljö för att övervaka faktiska kostnader
4. Använd Azure Cost Management för detaljerad kostnadsanalys

---

## Best Practices

### F: Vilka är bästa praxis för azd-projektstruktur?
**S**: 
1. Håll applikationskod separat från infrastrukturen
2. Använd meningsfulla servicenamn i `azure.yaml`
3. Implementera korrekt felhantering i build-skript
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

### F: Ska jag committa `.azure`-mappen till versionskontroll?
**S**: **Nej!** Mappen `.azure` innehåller känslig information. Lägg till den i `.gitignore`:
```gitignore
.azure/
```

### F: Hur hanterar jag hemligheter och känslig konfiguration?
**S**: 
1. Använd Azure Key Vault för hemligheter
2. Referera Key Vault-hemligheter i applikationskonfiguration
3. Committa aldrig hemligheter till versionskontroll
4. Använd hanterade identiteter för tjänst-till-tjänst-autentisering

### F: Vad är rekommenderat tillvägagångssätt för CI/CD med azd?
**S**: 
1. Använd separata miljöer för varje steg (dev/staging/prod)
2. Implementera automatiserade tester innan distribution
3. Använd service principals för autentisering
4. Lagra känslig konfiguration i pipeline-hemligheter/variabler
5. Implementera godkännandegates för produktionsdistributioner

---

## Advanced Topics

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
2. Standardisera på azd-mallar över teamen
3. Integrera med befintlig övervakning och larm
4. Använd azd:s JSON-utdata för pipelineintegration

### F: Kan jag använda azd med Azure DevOps?
**S**: Ja, azd fungerar med vilket CI/CD-system som helst. Skapa Azure DevOps-pipelines som använder azd-kommandon.

### F: Hur bidrar jag till azd eller skapar community-mallar?
**S**:
1. **azd-verktyget**: Bidra till [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mallar**: Skapa mallar enligt [riktlinjer för mallar](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentation**: Bidra till dokumentation på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### Fråga: Vad är färdplanen för azd?
**Svar**: Kontrollera den [officiella färdplanen](https://github.com/Azure/azure-dev/projects) för planerade funktioner och förbättringar.

### Fråga: Hur migrerar jag från andra driftsättningsverktyg till azd?
**Svar**: 
1. Analysera befintlig driftsättningsarkitektur
2. Skapa motsvarande Bicep-mallar
3. Konfigurera `azure.yaml` så att den matchar befintliga tjänster
4. Testa noggrant i utvecklingsmiljön
5. Migrera miljöer gradvis

---

## Har du fortfarande frågor?

### **Sök först**
- Kontrollera den [officiella dokumentationen](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Sök i [GitHub issues](https://github.com/Azure/azure-dev/issues) efter liknande problem

### **Få hjälp**
- [GitHub Discussions](https://github.com/Azure/azure-dev/discussions) - Gemenskapsstöd
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniska frågor
- [Azure Discord](https://discord.gg/azure) - Chatt i realtid

### **Rapportera problem**
- [GitHub Issues](https://github.com/Azure/azure-dev/issues/new) - Buggrapporter och funktionsförfrågningar
- Inkludera relevanta loggar, felmeddelanden och steg för att reproducera

### **Lär dig mer**
- [Azure Developer CLI documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)

---

*Denna FAQ uppdateras regelbundet. Senast uppdaterad: 9 september 2025*

---

**Navigering**
- **Föregående lektion**: [Ordlista](glossary.md)
- **Nästa lektion**: [Studieguide](study-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Vi strävar efter noggrannhet, men var medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Originaldokumentet på dess ursprungliga språk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas en professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->