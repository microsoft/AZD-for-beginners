<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "a18b53f05c5e2fb42ebd98fcc82fcd18",
  "translation_date": "2025-09-09T22:36:11+00:00",
  "source_file": "resources/faq.md",
  "language_code": "sv"
}
-->
# Vanliga frågor (FAQ)

## Introduktion

Denna omfattande FAQ ger svar på de vanligaste frågorna om Azure Developer CLI (azd) och Azure-distributioner. Hitta snabba lösningar på vanliga problem, förstå bästa praxis och få klarhet i azd-koncept och arbetsflöden.

## Lärandemål

Genom att granska denna FAQ kommer du att:
- Hitta snabba svar på vanliga frågor och problem med Azure Developer CLI
- Förstå viktiga koncept och terminologi genom praktiska frågor och svar
- Få tillgång till felsökningslösningar för vanliga problem och fel
- Lära dig bästa praxis genom vanliga frågor om optimering
- Upptäcka avancerade funktioner och kapaciteter genom expertfrågor
- Effektivt referera till vägledning om kostnader, säkerhet och distributionsstrategier

## Läranderesultat

Med regelbunden hänvisning till denna FAQ kommer du att kunna:
- Självständigt lösa vanliga problem med Azure Developer CLI med hjälp av de tillhandahållna lösningarna
- Göra informerade beslut om distributionsstrategier och konfigurationer
- Förstå relationen mellan azd och andra Azure-verktyg och tjänster
- Tillämpa bästa praxis baserat på erfarenheter från communityn och expertrekommendationer
- Felsöka autentisering, distribution och konfigurationsproblem effektivt
- Optimera kostnader och prestanda med insikter och rekommendationer från FAQ

## Innehållsförteckning

- [Komma igång](../../../resources)
- [Autentisering & Åtkomst](../../../resources)
- [Mallar & Projekt](../../../resources)
- [Distribution & Infrastruktur](../../../resources)
- [Konfiguration & Miljöer](../../../resources)
- [Felsökning](../../../resources)
- [Kostnad & Fakturering](../../../resources)
- [Bästa praxis](../../../resources)
- [Avancerade ämnen](../../../resources)

---

## Komma igång

### F: Vad är Azure Developer CLI (azd)?
**S**: Azure Developer CLI (azd) är ett utvecklarfokuserat kommandoradsverktyg som påskyndar tiden det tar att få din applikation från den lokala utvecklingsmiljön till Azure. Det erbjuder bästa praxis genom mallar och hjälper med hela distributionslivscykeln.

### F: Hur skiljer sig azd från Azure CLI?
**S**: 
- **Azure CLI**: Allmänt verktyg för att hantera Azure-resurser
- **azd**: Utvecklarfokuserat verktyg för applikationsdistributionsarbetsflöden
- azd använder Azure CLI internt men erbjuder högre abstraktioner för vanliga utvecklingsscenarier
- azd inkluderar mallar, miljöhantering och automatisering av distribution

### F: Behöver jag ha Azure CLI installerat för att använda azd?
**S**: Ja, azd kräver Azure CLI för autentisering och vissa operationer. Installera Azure CLI först, och sedan azd.

### F: Vilka programmeringsspråk stöder azd?
**S**: azd är språkagnostiskt. Det fungerar med:
- Node.js/JavaScript/TypeScript
- Python
- .NET/C#
- Java
- Go
- PHP
- Statiska webbplatser
- Containeriserade applikationer

### F: Kan jag använda azd med befintliga projekt?
**S**: Ja! Du kan antingen:
1. Använda `azd init` för att lägga till azd-konfiguration till befintliga projekt
2. Anpassa befintliga projekt för att matcha azd-mallstrukturen
3. Skapa egna mallar baserade på din befintliga arkitektur

---

## Autentisering & Åtkomst

### F: Hur autentiserar jag med Azure med azd?
**S**: Använd `azd auth login` som öppnar ett webbläsarfönster för Azure-autentisering. För CI/CD-scenarier, använd tjänsteprinciper eller hanterade identiteter.

### F: Kan jag använda azd med flera Azure-abonnemang?
**S**: Ja. Använd `azd env set AZURE_SUBSCRIPTION_ID <subscription-id>` för att specificera vilket abonnemang som ska användas för varje miljö.

### F: Vilka behörigheter behöver jag för att distribuera med azd?
**S**: Vanligtvis behöver du:
- **Contributor**-rollen på resursgruppen eller abonnemanget
- **User Access Administrator** om du distribuerar resurser som kräver rolltilldelningar
- Specifika behörigheter varierar beroende på mall och resurser som distribueras

### F: Kan jag använda azd i CI/CD-pipelines?
**S**: Absolut! azd är designat för CI/CD-integration. Använd tjänsteprinciper för autentisering och ställ in miljövariabler för konfiguration.

### F: Hur hanterar jag autentisering i GitHub Actions?
**S**: Använd Azure Login-action med tjänsteprincipens autentiseringsuppgifter:
```yaml
- uses: azure/login@v1
  with:
    creds: ${{ secrets.AZURE_CREDENTIALS }}
- run: azd deploy --no-prompt
```

---

## Mallar & Projekt

### F: Var kan jag hitta azd-mallar?
**S**: 
- Officiella mallar: [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- Community-mallar: Sök på GitHub efter "azd-template"
- Använd `azd template list` för att bläddra bland tillgängliga mallar

### F: Hur skapar jag en egen mall?
**S**: 
1. Börja med en befintlig mallstruktur
2. Modifiera `azure.yaml`, infrastrukturfiler och applikationskod
3. Testa noggrant med `azd up`
4. Publicera på GitHub med lämpliga taggar

### F: Kan jag använda azd utan en mall?
**S**: Ja, använd `azd init` i ett befintligt projekt för att skapa nödvändiga konfigurationsfiler. Du måste manuellt konfigurera `azure.yaml` och infrastrukturfiler.

### F: Vad är skillnaden mellan officiella och community-mallar?
**S**: 
- **Officiella mallar**: Underhålls av Microsoft, uppdateras regelbundet, omfattande dokumentation
- **Community-mallar**: Skapade av utvecklare, kan ha specialiserade användningsfall, varierande kvalitet och underhåll

### F: Hur uppdaterar jag en mall i mitt projekt?
**S**: Mallar uppdateras inte automatiskt. Du kan:
1. Manuellt jämföra och slå samman ändringar från källmallen
2. Börja om med `azd init` med den uppdaterade mallen
3. Plocka specifika förbättringar från uppdaterade mallar

---

## Distribution & Infrastruktur

### F: Vilka Azure-tjänster kan azd distribuera?
**S**: azd kan distribuera alla Azure-tjänster via Bicep/ARM-mallar, inklusive:
- App Services, Container Apps, Functions
- Databaser (SQL, PostgreSQL, Cosmos DB)
- Lagring, Key Vault, Application Insights
- Nätverk, säkerhet och övervakningsresurser

### F: Kan jag distribuera till flera regioner?
**S**: Ja, konfigurera flera regioner i dina Bicep-mallar och ställ in platsparametern korrekt för varje miljö.

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

### F: Kan jag bara distribuera infrastruktur utan applikationer?
**S**: Ja, använd `azd provision` för att endast distribuera de infrastrukturella komponenterna som definieras i dina mallar.

### F: Hur distribuerar jag till befintliga Azure-resurser?
**S**: Detta är komplext och inte direkt stöds. Du kan:
1. Importera befintliga resurser till dina Bicep-mallar
2. Använda referenser till befintliga resurser i mallar
3. Modifiera mallar för att villkorligt skapa eller referera resurser

### F: Kan jag använda Terraform istället för Bicep?
**S**: För närvarande stöder azd främst Bicep/ARM-mallar. Terraform-stöd är inte officiellt tillgängligt, även om community-lösningar kan finnas.

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
**S**: I `.azure`-mappen inom din projektkatalog. Varje miljö har sin egen mapp med konfigurationsfiler.

### F: Hur ställer jag in miljöspecifik konfiguration?
**S**: Använd `azd env set` för att konfigurera miljövariabler:
```bash
azd env set AZURE_LOCATION eastus
azd env set DATABASE_TIER Basic
```

### F: Kan jag dela miljökonfigurationer med teammedlemmar?
**S**: `.azure`-mappen innehåller känslig information och bör inte checkas in i versionskontroll. Istället:
1. Dokumentera nödvändiga miljövariabler
2. Använd distributionsskript för att ställa in miljöer
3. Använd Azure Key Vault för känslig konfiguration

### F: Hur åsidosätter jag standardvärden i mallar?
**S**: Ställ in miljövariabler som motsvarar mallparametrar:
```bash
azd env set LOCATION "West US 2"
azd env set SKU_NAME "B1"
```

---

## Felsökning

### F: Varför misslyckas `azd up`?
**S**: Vanliga orsaker:
1. **Autentiseringsproblem**: Kör `azd auth login`
2. **Otillräckliga behörigheter**: Kontrollera dina Azure-rolltilldelningar
3. **Resursnamnskonflikter**: Ändra AZURE_ENV_NAME
4. **Kvot-/kapacitetsproblem**: Kontrollera regional tillgänglighet
5. **Mallfel**: Validera Bicep-mallar

### F: Hur felsöker jag distributionsfel?
**S**: 
1. Använd `azd deploy --debug` för detaljerad output
2. Kontrollera distributionshistorik i Azure-portalen
3. Granska aktivitetsloggen i Azure-portalen
4. Använd `azd show` för att visa aktuell miljöstatus

### F: Varför fungerar inte mina miljövariabler?
**S**: Kontrollera:
1. Variabelnamn matchar mallparametrar exakt
2. Värden är korrekt citerade om de innehåller mellanslag
3. Miljön är vald: `azd env select <environment>`
4. Variabler är inställda i rätt miljö

### F: Hur rensar jag misslyckade distributioner?
**S**: 
```bash
azd down --force --purge
```
Detta tar bort alla resurser och miljökonfigurationer.

### F: Varför är min applikation inte åtkomlig efter distribution?
**S**: Kontrollera:
1. Distributionen slutfördes framgångsrikt
2. Applikationen körs (kontrollera loggar i Azure-portalen)
3. Nätverkssäkerhetsgrupper tillåter trafik
4. DNS/anpassade domäner är korrekt konfigurerade

---

## Kostnad & Fakturering

### F: Hur mycket kostar azd-distributioner?
**S**: Kostnader beror på:
- Azure-tjänster som distribueras
- Tjänstenivåer/SKU:er som valts
- Regionala prisskillnader
- Användningsmönster

Använd [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/) för uppskattningar.

### F: Hur kontrollerar jag kostnader i azd-distributioner?
**S**: 
1. Använd lägre SKU:er för utvecklingsmiljöer
2. Ställ in Azure-budgetar och varningar
3. Använd `azd down` för att ta bort resurser när de inte behövs
4. Välj lämpliga regioner (kostnader varierar beroende på plats)
5. Använd Azure Cost Management-verktyg

### F: Finns det gratisalternativ för azd-mallar?
**S**: Många Azure-tjänster erbjuder gratisnivåer:
- App Service: Gratisnivå tillgänglig
- Azure Functions: 1M gratis exekveringar/månad
- Cosmos DB: Gratisnivå med 400 RU/s
- Application Insights: Första 5GB/månad gratis

Konfigurera mallar för att använda gratisnivåer där det är möjligt.

### F: Hur uppskattar jag kostnader innan distribution?
**S**: 
1. Granska mallens `main.bicep` för att se vilka resurser som skapas
2. Använd Azure Pricing Calculator med specifika SKU:er
3. Distribuera till en utvecklingsmiljö först för att övervaka faktiska kostnader
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

### F: Hur ska jag organisera flera tjänster i azd?
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

### F: Ska jag checka in `.azure`-mappen i versionskontroll?
**S**: **Nej!** `.azure`-mappen innehåller känslig information. Lägg till den i `.gitignore`:
```gitignore
.azure/
```

### F: Hur hanterar jag hemligheter och känslig konfiguration?
**S**: 
1. Använd Azure Key Vault för hemligheter
2. Referera Key Vault-hemligheter i applikationskonfiguration
3. Checka aldrig in hemligheter i versionskontroll
4. Använd hanterade identiteter för autentisering mellan tjänster

### F: Vad är det rekommenderade tillvägagångssättet för CI/CD med azd?
**S**: 
1. Använd separata miljöer för varje steg (dev/staging/prod)
2. Implementera automatiserade tester före distribution
3. Använd tjänsteprinciper för autentisering
4. Lagra känslig konfiguration i pipeline-hemligheter/variabler
5. Implementera godkännandesteg för produktionsdistributioner

---

## Avancerade ämnen

### F: Kan jag utöka azd med egen funktionalitet?
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
3. Integrera med befintlig övervakning och varning
4. Använd azd:s JSON-output för pipeline-integration

### F: Kan jag använda azd med Azure DevOps?
**S**: Ja, azd fungerar med alla CI/CD-system. Skapa Azure DevOps-pipelines som använder azd-kommandon.

### F: Hur bidrar jag till azd eller skapar community-mallar?
**S**: 
1. **azd-verktyg**: Bidra till [Azure/azure-dev](https://github.com/Azure/azure-dev)
2. **Mallar**: Skapa mallar enligt [mallriktlinjerna](https://github.com/Azure-Samples/awesome-azd)
3. **Dokumentation**: Bidra till dokumentation på [MicrosoftDocs/azure-dev-docs](https://github.com/MicrosoftDocs/azure-dev-docs)

### F: Vad är azd:s roadmap?
**S**: Kontrollera [den officiella roadmapen](https://github.com/Azure/azure-dev/projects) för planerade funktioner och förbättringar.

### F: Hur migrerar jag från andra distributionsverktyg till azd?
**S**:
1. Analysera nuvarande distributionsarkitektur  
2. Skapa motsvarande Bicep-mallar  
3. Konfigurera `azure.yaml` för att matcha nuvarande tjänster  
4. Testa noggrant i utvecklingsmiljön  
5. Migrera miljöer gradvis  

---

## Har du fortfarande frågor?

### **Sök först**  
- Kolla [officiell dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- Sök efter liknande problem på [GitHub-ärenden](https://github.com/Azure/azure-dev/issues)  

### **Få hjälp**  
- [GitHub-diskussioner](https://github.com/Azure/azure-dev/discussions) - Stöd från communityn  
- [Stack Overflow](https://stackoverflow.com/questions/tagged/azure-developer-cli) - Tekniska frågor  
- [Azure Discord](https://discord.gg/azure) - Realtidschatt med communityn  

### **Rapportera problem**  
- [GitHub-ärenden](https://github.com/Azure/azure-dev/issues/new) - Felrapporter och funktionsförfrågningar  
- Inkludera relevanta loggar, felmeddelanden och steg för att återskapa problemet  

### **Lär dig mer**  
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  

---

*Denna FAQ uppdateras regelbundet. Senast uppdaterad: 9 september 2025*  

---

**Navigering**  
- **Föregående lektion**: [Ordlista](glossary.md)  
- **Nästa lektion**: [Studieguide](study-guide.md)  

---

**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.