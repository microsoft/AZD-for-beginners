# Vanliga problem och lösningar

**Chapter Navigation:**
- **📚 Course Home**: [AZD För nybörjare](../../README.md)
- **📖 Current Chapter**: Kapitel 7 - Felsökning & Debugging
- **⬅️ Previous Chapter**: [Kapitel 6: Förkontroller](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Next**: [Felsökningsguide](debugging.md)
- **🚀 Next Chapter**: [Kapitel 8: Produktions- & Företagsmönster](../chapter-08-production/production-ai-practices.md)

## Introduktion

Denna omfattande felsökningsguide täcker de vanligaste problemen som uppstår vid användning av Azure Developer CLI. Lär dig att diagnostisera, felsöka och åtgärda vanliga problem med autentisering, distribution, infrastrukturprovisionering och applikationskonfiguration. Varje problem innehåller detaljerade symptom, grundorsaker och steg-för-steg-lösningar.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra diagnostiktekniker för problem med Azure Developer CLI
- Förstå vanliga autentiserings- och behörighetsproblem och deras lösningar
- Åtgärda distributionsfel, fel vid infrastrukturprovisionering och konfigurationsproblem
- Implementera proaktiva övervaknings- och felsökningsstrategier
- Tillämpa systematiska felsökningsmetoder för komplexa problem
- Konfigurera korrekt loggning och övervakning för att förebygga framtida problem

## Läranderesultat

Vid slutförande kommer du att kunna:
- Diagnostisera Azure Developer CLI-problem med inbyggda diagnostikverktyg
- Åtgärda autentiserings-, prenumerations- och behörighetsrelaterade problem självständigt
- Felsöka distributionsfel och fel vid infrastrukturprovisionering effektivt
- Debugga applikationskonfigurationsproblem och miljöspecifika problem
- Implementera övervakning och larm för att proaktivt identifiera potentiella problem
- Tillämpa bästa praxis för loggning, debugging och arbetsflöden för problemåtgärd

## Snabbdiagnostik

Innan du går in på specifika problem, kör dessa kommandon för att samla diagnostikinformation:

```bash
# Kontrollera azd-versionen och hälsotillståndet
azd version
azd config list

# Verifiera Azure-autentisering
az account show
az account list

# Kontrollera aktuell miljö
azd env show
azd env get-values

# Aktivera felsökningsloggning
export AZD_DEBUG=true
azd <command> --debug
```

## Autentiseringsproblem

### Problem: "Failed to get access token"
**Symptom:**
- `azd up` misslyckas med autentiseringsfel
- Kommandon returnerar "unauthorized" eller "access denied"

**Lösningar:**
```bash
# Autentisera om med Azure CLI
az login
az account show

# Rensa cachelagrade autentiseringsuppgifter
az account clear
az login

# Använd device code-flöde (för system utan grafiskt gränssnitt)
az login --use-device-code

# Ange specifik prenumeration
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Insufficient privileges" under distribution
**Symptom:**
- Distribution misslyckas med behörighetsfel
- Kan inte skapa vissa Azure-resurser

**Lösningar:**
```bash
# 1. Kontrollera dina Azure-rolltilldelningar
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Se till att du har de nödvändiga rollerna
# - Contributor (för att skapa resurser)
# - User Access Administrator (för rolltilldelningar)

# 3. Kontakta din Azure-administratör för rätt behörigheter
```

### Problem: Problem med multi-tenant-autentisering
**Lösningar:**
```bash
# 1. Logga in med en specifik hyresgäst
az login --tenant "your-tenant-id"

# 2. Ange hyresgäst i konfigurationen
azd config set auth.tenantId "your-tenant-id"

# 3. Rensa hyresgästens cache om du byter hyresgäst
az account clear
```

## 🏗️ Fel vid infrastrukturprovisionering

### Problem: Resursnamnskonflikter
**Symptom:**
- "The resource name already exists" fel
- Distribution misslyckas under skapande av resurser

**Lösningar:**
```bash
# 1. Använd unika resursnamn med tokens
# I din Bicep-mall:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Ändra miljönamnet
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Rensa upp befintliga resurser
azd down --force --purge
```

### Problem: Plats/region ej tillgänglig
**Symptom:**
- "The location 'xyz' is not available for resource type"
- Vissa SKUs inte tillgängliga i vald region

**Lösningar:**
```bash
# 1. Kontrollera tillgängliga platser för resurstyper
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Använd vanligt förekommande regioner
azd config set defaults.location eastus2
# eller
azd env set AZURE_LOCATION eastus2

# 3. Kontrollera tjänsters tillgänglighet per region
# Besök: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kvot överskriden
**Symptom:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Lösningar:**
```bash
# 1. Kontrollera aktuell kvotanvändning
az vm list-usage --location eastus2 -o table

# 2. Begär kvotökning via Azure-portalen
# Gå till: Prenumerationer > Användning + kvoter

# 3. Använd mindre SKU:er för utveckling
# I filen main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Ta bort oanvända resurser
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Fel i Bicep-mallar
**Symptom:**
- Mallvalidering misslyckas
- Syntaxfel i Bicep-filer

**Lösningar:**
```bash
# 1. Validera Bicep-syntax
az bicep build --file infra/main.bicep

# 2. Använd Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Kontrollera syntaxen i parameterfilen
cat infra/main.parameters.json | jq '.'

# 4. Förhandsgranska distributionsändringar
azd provision --preview
```

## 🚀 Driftsättningsfel

### Problem: Byggfel
**Symptom:**
- Applikationen kunde inte byggas under distribution
- Fel vid paketinstallation

**Lösningar:**
```bash
# 1. Kontrollera byggutdata med felsökningsflaggan
azd deploy --service web --debug

# 2. Visa status för den utplacerade tjänsten
azd show

# 3. Testa bygget lokalt
cd src/web
npm install
npm run build

# 3. Kontrollera kompatibilitet mellan Node.js- och Python-versioner
node --version  # Bör matcha inställningarna i azure.yaml
python --version

# 4. Rensa byggcachen
rm -rf node_modules package-lock.json
npm install

# 5. Kontrollera Dockerfile om du använder containrar
docker build -t test-image .
docker run --rm test-image
```

### Problem: Fel vid containerdistribution
**Symptom:**
- Container-appar startar inte
- Fel vid hämtning av image

**Lösningar:**
```bash
# 1. Testa Docker-bygget lokalt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kontrollera containerloggar med Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Övervaka applikationen via azd
azd monitor --logs

# 3. Verifiera åtkomst till containerregistret
az acr login --name myregistry

# 4. Kontrollera konfigurationen för containerappen
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Databasanslutningsfel
**Symptom:**
- Applikationen kan inte ansluta till databasen
- Timeout-fel vid anslutning

**Lösningar:**
```bash
# 1. Kontrollera databasens brandväggsregler
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testa anslutning från applikationen
# Lägg till i din app tillfälligt:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifiera formatet på anslutningssträngen
azd env get-values | grep DATABASE

# 4. Kontrollera databasserverns status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurationsproblem

### Problem: Miljövariabler fungerar inte
**Symptom:**
- Appen kan inte läsa konfigurationsvärden
- Miljövariabler verkar vara tomma

**Lösningar:**
```bash
# 1. Verifiera att miljövariablerna är inställda
azd env get-values
azd env get DATABASE_URL

# 2. Kontrollera variabelnamnen i azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Starta om applikationen
azd deploy --service web

# 4. Kontrollera App Service-konfigurationen
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: Problem med SSL/TLS-certifikat
**Symptom:**
- HTTPS fungerar inte
- Certifikatvalideringsfel

**Lösningar:**
```bash
# 1. Kontrollera SSL-certifikatets status
az webapp config ssl list --resource-group myrg

# 2. Aktivera endast HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lägg till anpassad domän (om nödvändigt)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: CORS-konfigurationsproblem
**Symptom:**
- Frontend kan inte anropa API
- Cross-origin request blocked

**Lösningar:**
```bash
# 1. Konfigurera CORS för App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Uppdatera API:t för att hantera CORS
# I Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kontrollera att det körs på korrekta URL:er
azd show
```

## 🌍 Problem med miljöhantering

### Problem: Problem med att byta miljö
**Symptom:**
- Fel miljö används
- Konfiguration byts inte korrekt

**Lösningar:**
```bash
# 1. Lista alla miljöer
azd env list

# 2. Välj miljö uttryckligen
azd env select production

# 3. Verifiera aktuell miljö
azd env show

# 4. Skapa ny miljö om den är korrupt
azd env new production-new
azd env select production-new
```

### Problem: Korrupt miljö
**Symptom:**
- Miljön visar ogiltigt tillstånd
- Resurser stämmer inte överens med konfigurationen

**Lösningar:**
```bash
# 1. Uppdatera miljötillståndet
azd env refresh

# 2. Återställ miljökonfigurationen
azd env new production-reset
# Kopiera över nödvändiga miljövariabler
azd env set DATABASE_URL "your-value"

# 3. Importera befintliga resurser (om möjligt)
# Uppdatera manuellt .azure/production/config.json med resurs-ID:er
```

## 🔍 Prestandaproblem

### Problem: Långa distributionstider
**Symptom:**
- Distributioner tar för lång tid
- Timeouts under distribution

**Lösningar:**
```bash
# 1. Distribuera specifika tjänster för snabbare iteration
azd deploy --service web
azd deploy --service api

# 2. Använd distribution av enbart kod när infrastrukturen är oförändrad
azd deploy  # Snabbare än azd up

# 3. Optimera byggprocessen
# I package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kontrollera resursplaceringar (använd samma region)
azd config set defaults.location eastus2
```

### Problem: Applikationens prestandaproblem
**Symptom:**
- Långa svarstider
- Högt resursutnyttjande

**Lösningar:**
```bash
# 1. Skala upp resurser
# Uppdatera SKU i main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktivera Application Insights-övervakning
azd monitor --overview

# 3. Kontrollera applikationsloggar i Azure
az webapp log tail --name myapp --resource-group myrg
# eller för Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementera caching
# Lägg till Redis-cache i din infrastruktur
```

## 🛠️ Felsökningsverktyg och kommandon

### Debugkommandon
```bash
# Omfattande felsökning
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kontrollera azd-versionen
azd version

# Visa aktuell konfiguration
azd config list

# Testa anslutning
curl -v https://myapp.azurewebsites.net/health
```

### Logganalys
```bash
# Applikationsloggar via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Övervaka applikationen med azd
azd monitor --logs
azd monitor --live

# Azure-resursloggar
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerloggar (för Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resursundersökning
```bash
# Lista alla resurser
az resource list --resource-group myrg -o table

# Kontrollera resursstatus
az webapp show --name myapp --resource-group myrg --query state

# Nätverksdiagnostik
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Få ytterligare hjälp

### När ska man eskalera
- Autentiseringsproblem kvarstår efter att ha provat alla lösningar
- Infrastrukturproblem med Azure-tjänster
- Fakturering- eller prenumerationsrelaterade problem
- Säkerhetsproblem eller incidenter

### Supportkanaler
```bash
# 1. Kontrollera Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Skapa ett supportärende för Azure
# Go to: https://portal.azure.com -> Hjälp och support

# 3. Gemenskapsresurser
# - Stack Overflow: taggen azure-developer-cli
# - GitHub-ärenden: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Information att samla in
Innan du kontaktar support, samla ihop:
- `azd version` output
- `azd config list` output
- `azd show` output (nuvarande distributionsstatus)
- Felmeddelanden (full text)
- Steg för att reproducera problemet
- Miljödetaljer (`azd env show`)
- Tidslinje för när problemet började

### Skript för loggsamling
```bash
#!/bin/bash
# collect-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Förebyggande av problem

### Checklista före distribution
```bash
# 1. Validera autentisering
az account show

# 2. Kontrollera kvoter och gränser
az vm list-usage --location eastus2

# 3. Validera mallar
az bicep build --file infra/main.bicep

# 4. Testa lokalt först
npm run build
npm run test

# 5. Använd torrkörning vid driftsättning
azd provision --preview
```

### Övervakningsinställning
```bash
# Aktivera Application Insights
# Lägg till i main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Konfigurera aviseringar
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regelbundet underhåll
```bash
# Veckovisa hälsokontroller
./scripts/health-check.sh

# Månatlig kostnadsöversyn
az consumption usage list --billing-period-name 202401

# Kvartalsvis säkerhetsgranskning
az security assessment list --resource-group myrg
```

## Relaterade resurser

- [Felsökningsguide](debugging.md) - Avancerade felsökningstekniker
- [Provisionering av resurser](../chapter-04-infrastructure/provisioning.md) - Felsökning av infrastruktur
- [Kapacitetsplanering](../chapter-06-pre-deployment/capacity-planning.md) - Råd för resursplanering
- [SKU-val](../chapter-06-pre-deployment/sku-selection.md) - Rekommendationer för servicelager

---

**Tips**: Bokmärk denna guide och hänvisa till den när du stöter på problem. De flesta problem har inträffat tidigare och har etablerade lösningar!

---

**Navigation**
- **Previous Lesson**: [Provisionering av resurser](../chapter-04-infrastructure/provisioning.md)
- **Next Lesson**: [Felsökningsguide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår genom användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->