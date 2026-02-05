# Vanliga problem och lösningar

**Kapitelnavigation:**
- **📚 Kurshem**: [AZD För Nybörjare](../../README.md)
- **📖 Nuvarande kapitel**: Kapitel 7 - Felsökning & Debugging
- **⬅️ Föregående kapitel**: [Kapitel 6: Förberedande kontroller](../pre-deployment/preflight-checks.md)
- **➡️ Nästa**: [Debugging Guide](debugging.md)
- **🚀 Nästa kapitel**: [Kapitel 8: Produktions- & Företagsmönster](../microsoft-foundry/production-ai-practices.md)

## Introduktion

Denna omfattande felsökningsguide täcker de vanligaste problemen som uppstår vid användning av Azure Developer CLI. Lär dig att diagnostisera, felsöka och lösa vanliga problem med autentisering, distribution, infrastrukturprovisionering och applikationskonfiguration. Varje problem inkluderar detaljerade symtom, grundorsaker och steg-för-steg-lösningar.

## Lärandemål

Genom att slutföra denna guide kommer du att:
- Bemästra diagnostiska tekniker för problem med Azure Developer CLI
- Förstå vanliga autentiserings- och behörighetsproblem samt deras lösningar
- Lösa distributionsfel, infrastrukturprovisioneringsfel och konfigurationsproblem
- Implementera proaktiv övervakning och debuggingstrategier
- Tillämpa systematiska felsökningsmetoder för komplexa problem
- Konfigurera korrekt loggning och övervakning för att förhindra framtida problem

## Läranderesultat

Efter att ha slutfört guiden kommer du att kunna:
- Diagnostisera problem med Azure Developer CLI med hjälp av inbyggda diagnostikverktyg
- Självständigt lösa autentiserings-, prenumerations- och behörighetsrelaterade problem
- Felsöka distributionsfel och infrastrukturprovisioneringsproblem effektivt
- Debugga applikationskonfigurationsproblem och miljöspecifika problem
- Implementera övervakning och varningar för att proaktivt identifiera potentiella problem
- Tillämpa bästa praxis för loggning, debugging och problemlösningsarbetsflöden

## Snabbdiagnostik

Innan du dyker in i specifika problem, kör dessa kommandon för att samla in diagnostisk information:

```bash
# Kontrollera azd-version och hälsa
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

### Problem: "Misslyckades med att hämta åtkomsttoken"
**Symtom:**
- `azd up` misslyckas med autentiseringsfel
- Kommandon returnerar "obehörig" eller "åtkomst nekad"

**Lösningar:**
```bash
# 1. Autentisera om med Azure CLI
az login
az account show

# 2. Rensa cachelagrade autentiseringsuppgifter
az account clear
az login

# 3. Använd enhetskodflöde (för system utan huvud)
az login --use-device-code

# 4. Ställ in explicit prenumeration
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Problem: "Otillräckliga privilegier" under distribution
**Symtom:**
- Distribution misslyckas med behörighetsfel
- Kan inte skapa vissa Azure-resurser

**Lösningar:**
```bash
# 1. Kontrollera dina Azure-rolltilldelningar
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Säkerställ att du har nödvändiga roller
# - Medverkande (för resurskapande)
# - Användaråtkomstadministratör (för rolltilldelningar)

# 3. Kontakta din Azure-administratör för korrekta behörigheter
```

### Problem: Problem med multi-tenant-autentisering
**Lösningar:**
```bash
# 1. Logga in med specifik hyresgäst
az login --tenant "your-tenant-id"

# 2. Ställ in hyresgäst i konfiguration
azd config set auth.tenantId "your-tenant-id"

# 3. Rensa hyresgästcache om du byter hyresgäster
az account clear
```

## 🏗️ Infrastrukturprovisioneringsfel

### Problem: Resursnamnskonflikter
**Symtom:**
- Felmeddelanden om att "Resursnamnet finns redan"
- Distribution misslyckas under resurskapande

**Lösningar:**
```bash
# 1. Använd unika resursnamn med tokens
# I din Bicep-mall:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Ändra miljönamn
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Rensa upp befintliga resurser
azd down --force --purge
```

### Problem: Plats/region inte tillgänglig
**Symtom:**
- "Platsen 'xyz' är inte tillgänglig för resurstypen"
- Vissa SKUs är inte tillgängliga i vald region

**Lösningar:**
```bash
# 1. Kontrollera tillgängliga platser för resurstyper
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Använd vanligt tillgängliga regioner
azd config set defaults.location eastus2
# eller
azd env set AZURE_LOCATION eastus2

# 3. Kontrollera tjänstetillgänglighet per region
# Besök: https://azure.microsoft.com/global-infrastructure/services/
```

### Problem: Kvotöverskridande fel
**Symtom:**
- "Kvot överskriden för resurstyp"
- "Maximalt antal resurser uppnått"

**Lösningar:**
```bash
# 1. Kontrollera aktuell kvotanvändning
az vm list-usage --location eastus2 -o table

# 2. Begär kvotökning via Azure-portalen
# Gå till: Prenumerationer > Användning + kvoter

# 3. Använd mindre SKU:er för utveckling
# I main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Rensa upp oanvända resurser
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Problem: Bicep-mallfel
**Symtom:**
- Valideringsfel i mallar
- Syntaxfel i Bicep-filer

**Lösningar:**
```bash
# 1. Validera Bicep-syntax
az bicep build --file infra/main.bicep

# 2. Använd Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Kontrollera syntaxen för parameterfilen
cat infra/main.parameters.json | jq '.'

# 4. Förhandsgranska distributionsändringar
azd provision --preview
```

## 🚀 Distributionsfel

### Problem: Byggfel
**Symtom:**
- Applikationen misslyckas med att byggas under distribution
- Fel vid installation av paket

**Lösningar:**
```bash
# 1. Kontrollera byggloggar
azd logs --service web
azd deploy --service web --debug

# 2. Testa bygget lokalt
cd src/web
npm install
npm run build

# 3. Kontrollera Node.js/Python versionskompatibilitet
node --version  # Bör matcha azure.yaml-inställningar
python --version

# 4. Rensa byggcache
rm -rf node_modules package-lock.json
npm install

# 5. Kontrollera Dockerfile om containrar används
docker build -t test-image .
docker run --rm test-image
```

### Problem: Fel vid containerdistribution
**Symtom:**
- Container-appar startar inte
- Fel vid hämtning av bild

**Lösningar:**
```bash
# 1. Testa Docker-build lokalt
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Kontrollera containerloggar
azd logs --service api --follow

# 3. Verifiera åtkomst till containerregister
az acr login --name myregistry

# 4. Kontrollera containerappens konfiguration
az containerapp show --name my-app --resource-group my-rg
```

### Problem: Databasanslutningsfel
**Symtom:**
- Applikationen kan inte ansluta till databasen
- Timeout-fel vid anslutning

**Lösningar:**
```bash
# 1. Kontrollera databasens brandväggsregler
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Testa anslutning från applikationen
# Lägg till i din app tillfälligt:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifiera anslutningssträngens format
azd env get-values | grep DATABASE

# 4. Kontrollera databasserverns status
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Konfigurationsproblem

### Problem: Miljövariabler fungerar inte
**Symtom:**
- Appen kan inte läsa konfigurationsvärden
- Miljövariabler verkar tomma

**Lösningar:**
```bash
# 1. Verifiera att miljövariabler är inställda
azd env get-values
azd env get DATABASE_URL

# 2. Kontrollera variabelnamn i azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Starta om applikationen
azd deploy --service web

# 4. Kontrollera appens tjänstekonfiguration
az webapp config appsettings list --name myapp --resource-group myrg
```

### Problem: SSL/TLS-certifikatproblem
**Symtom:**
- HTTPS fungerar inte
- Fel vid certifikatvalidering

**Lösningar:**
```bash
# 1. Kontrollera SSL-certifikatstatus
az webapp config ssl list --resource-group myrg

# 2. Aktivera endast HTTPS
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Lägg till anpassad domän (om det behövs)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Problem: Problem med CORS-konfiguration
**Symtom:**
- Frontend kan inte anropa API
- Cross-origin-förfrågan blockerad

**Lösningar:**
```bash
# 1. Konfigurera CORS för App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Uppdatera API för att hantera CORS
# I Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Kontrollera om det körs på rätt URL:er
azd show
```

## 🌍 Miljöhanteringsproblem

### Problem: Problem med miljöväxling
**Symtom:**
- Fel miljö används
- Konfiguration växlar inte korrekt

**Lösningar:**
```bash
# 1. Lista alla miljöer
azd env list

# 2. Välj miljö explicit
azd env select production

# 3. Verifiera aktuell miljö
azd env show

# 4. Skapa ny miljö om den är korrupt
azd env new production-new
azd env select production-new
```

### Problem: Miljökorruption
**Symtom:**
- Miljön visar ogiltigt tillstånd
- Resurser matchar inte konfigurationen

**Lösningar:**
```bash
# 1. Uppdatera miljötillståndet
azd env refresh

# 2. Återställ miljökonfigurationen
azd env new production-reset
# Kopiera över nödvändiga miljövariabler
azd env set DATABASE_URL "your-value"

# 3. Importera befintliga resurser (om möjligt)
# Uppdatera manuellt .azure/production/config.json med resurs-ID
```

## 🔍 Prestandaproblem

### Problem: Långsamma distributionstider
**Symtom:**
- Distributioner tar för lång tid
- Timeout under distribution

**Lösningar:**
```bash
# 1. Aktivera parallell distribution
azd config set deploy.parallelism 5

# 2. Använd inkrementella distributioner
azd deploy --incremental

# 3. Optimera byggprocessen
# I package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Kontrollera resursplatser (använd samma region)
azd config set defaults.location eastus2
```

### Problem: Applikationsprestandaproblem
**Symtom:**
- Långsamma svarstider
- Hög resursanvändning

**Lösningar:**
```bash
# 1. Skala upp resurser
# Uppdatera SKU i main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Aktivera Application Insights-övervakning
azd monitor

# 3. Kontrollera applikationsloggar för flaskhalsar
azd logs --service api --follow

# 4. Implementera caching
# Lägg till Redis-cache till din infrastruktur
```

## 🛠️ Felsökningsverktyg och kommandon

### Debug-kommandon
```bash
# Omfattande felsökning
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Kontrollera systeminformation
azd info

# Validera konfiguration
azd config validate

# Testa anslutning
curl -v https://myapp.azurewebsites.net/health
```

### Logganalys
```bash
# Applikationsloggar
azd logs --service web --follow
azd logs --service api --since 1h

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
- Fakturerings- eller prenumerationsrelaterade problem
- Säkerhetsproblem eller incidenter

### Supportkanaler
```bash
# 1. Kontrollera Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Skapa Azure-supportärende
# Gå till: https://portal.azure.com -> Hjälp + support

# 3. Communityresurser
# - Stack Overflow: azure-developer-cli tagg
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Information att samla in
Innan du kontaktar support, samla in:
- Utdata från `azd version`
- Utdata från `azd info`
- Felmeddelanden (fullständig text)
- Steg för att återskapa problemet
- Miljödetaljer (`azd env show`)
- Tidslinje för när problemet började

### Loggningsskript
```bash
#!/bin/bash
# samla-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
azd info >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config list >> debug-logs/config.txt
azd env show >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Recent logs:" > debug-logs/recent-logs.txt
azd logs --since 1h >> debug-logs/recent-logs.txt

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

# 5. Använd testkörningsdistributioner
azd provision --preview
```

### Övervakningsinställning
```bash
# Aktivera Application Insights
# Lägg till i main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Ställ in varningar
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

- [Debugging Guide](debugging.md) - Avancerade debuggingtekniker
- [Provisioning Resources](../deployment/provisioning.md) - Felsökning av infrastruktur
- [Capacity Planning](../pre-deployment/capacity-planning.md) - Vägledning för resursplanering
- [SKU Selection](../pre-deployment/sku-selection.md) - Rekommendationer för tjänstenivåer

---

**Tips**: Bokmärk denna guide och hänvisa till den när du stöter på problem. De flesta problem har setts tidigare och har etablerade lösningar!

---

**Navigation**
- **Föregående lektion**: [Provisioning Resources](../deployment/provisioning.md)
- **Nästa lektion**: [Debugging Guide](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör det noteras att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->