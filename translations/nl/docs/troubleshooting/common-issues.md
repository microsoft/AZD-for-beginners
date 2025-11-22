<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "94de06ce1e81ee964b067f118211612f",
  "translation_date": "2025-11-21T16:36:24+00:00",
  "source_file": "docs/troubleshooting/common-issues.md",
  "language_code": "nl"
}
-->
# Veelvoorkomende Problemen en Oplossingen

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD Voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 7 - Problemen Oplossen & Debuggen
- **⬅️ Vorig Hoofdstuk**: [Hoofdstuk 6: Pre-flight Checks](../pre-deployment/preflight-checks.md)
- **➡️ Volgende**: [Debugging Gids](debugging.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 8: Productie & Enterprise Patronen](../microsoft-foundry/production-ai-practices.md)

## Inleiding

Deze uitgebreide gids voor probleemoplossing behandelt de meest voorkomende problemen bij het gebruik van Azure Developer CLI. Leer hoe je problemen met authenticatie, implementatie, infrastructuurvoorziening en applicatieconfiguratie kunt diagnosticeren, oplossen en voorkomen. Elk probleem bevat gedetailleerde symptomen, oorzaken en stapsgewijze oplossingen.

## Leerdoelen

Na het doorlopen van deze gids kun je:
- Diagnosetechnieken voor Azure Developer CLI-problemen beheersen
- Veelvoorkomende authenticatie- en machtigingsproblemen begrijpen en oplossen
- Implementatiefouten, infrastructuurvoorzieningsfouten en configuratieproblemen oplossen
- Proactieve monitoring- en debugstrategieën implementeren
- Systematische probleemoplossingsmethodologieën toepassen voor complexe problemen
- Juiste logging en monitoring configureren om toekomstige problemen te voorkomen

## Leerresultaten

Na voltooiing ben je in staat om:
- Azure Developer CLI-problemen te diagnosticeren met ingebouwde diagnostische tools
- Authenticatie-, abonnement- en machtigingsproblemen zelfstandig op te lossen
- Implementatiefouten en infrastructuurvoorzieningsproblemen effectief op te lossen
- Applicatieconfiguratieproblemen en omgevingsspecifieke problemen te debuggen
- Monitoring en waarschuwingen te implementeren om potentiële problemen proactief te identificeren
- Best practices toe te passen voor logging, debugging en workflows voor probleemoplossing

## Snelle Diagnostiek

Voordat je in specifieke problemen duikt, voer deze opdrachten uit om diagnostische informatie te verzamelen:

```bash
# Controleer azd-versie en gezondheid
azd version
azd config list

# Verifieer Azure-authenticatie
az account show
az account list

# Controleer huidige omgeving
azd env show
azd env get-values

# Schakel debug-logboekregistratie in
export AZD_DEBUG=true
azd <command> --debug
```

## Authenticatieproblemen

### Probleem: "Failed to get access token"
**Symptomen:**
- `azd up` mislukt met authenticatiefouten
- Opdrachten geven "unauthorized" of "access denied" terug

**Oplossingen:**
```bash
# 1. Opnieuw authenticeren met Azure CLI
az login
az account show

# 2. Gecachte referenties wissen
az account clear
az login

# 3. Gebruik apparaatcodeflow (voor systemen zonder scherm)
az login --use-device-code

# 4. Stel expliciete abonnement in
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probleem: "Insufficient privileges" tijdens implementatie
**Symptomen:**
- Implementatie mislukt met machtigingsfouten
- Kan bepaalde Azure-resources niet aanmaken

**Oplossingen:**
```bash
# 1. Controleer uw Azure-roltoewijzingen
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Zorg ervoor dat u de vereiste rollen heeft
# - Bijdrager (voor het maken van resources)
# - Gebruikerstoegangbeheerder (voor roltoewijzingen)

# 3. Neem contact op met uw Azure-beheerder voor de juiste machtigingen
```

### Probleem: Problemen met multi-tenant authenticatie
**Oplossingen:**
```bash
# 1. Inloggen met specifieke tenant
az login --tenant "your-tenant-id"

# 2. Stel tenant in de configuratie in
azd config set auth.tenantId "your-tenant-id"

# 3. Wis tenant cache bij het wisselen van tenants
az account clear
```

## 🏗️ Fouten bij Infrastructuurvoorziening

### Probleem: Conflicten met resourcenaam
**Symptomen:**
- Fouten zoals "The resource name already exists"
- Implementatie mislukt tijdens het aanmaken van resources

**Oplossingen:**
```bash
# 1. Gebruik unieke resource namen met tokens
# In uw Bicep-sjabloon:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Verander de omgevingsnaam
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ruim bestaande resources op
azd down --force --purge
```

### Probleem: Locatie/regio niet beschikbaar
**Symptomen:**
- "The location 'xyz' is not available for resource type"
- Bepaalde SKUs niet beschikbaar in de geselecteerde regio

**Oplossingen:**
```bash
# 1. Controleer beschikbare locaties voor hulpbrontypen
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gebruik algemeen beschikbare regio's
azd config set defaults.location eastus2
# of
azd env set AZURE_LOCATION eastus2

# 3. Controleer de beschikbaarheid van diensten per regio
# Bezoek: https://azure.microsoft.com/global-infrastructure/services/
```

### Probleem: Quota overschreden fouten
**Symptomen:**
- "Quota exceeded for resource type"
- "Maximum number of resources reached"

**Oplossingen:**
```bash
# 1. Controleer het huidige quotagebruik
az vm list-usage --location eastus2 -o table

# 2. Vraag een quotaverhoging aan via het Azure-portaal
# Ga naar: Abonnementen > Gebruik + quota's

# 3. Gebruik kleinere SKU's voor ontwikkeling
# In main.parameters.json:
{
  "appServiceSku": {
    "value": "B1"  // Instead of P1v3
  }
}

# 4. Ruim ongebruikte resources op
az resource list --query "[?contains(name, 'unused')]" -o table
```

### Probleem: Bicep template fouten
**Symptomen:**
- Validatiefouten in templates
- Syntaxisfouten in Bicep-bestanden

**Oplossingen:**
```bash
# 1. Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep

# 2. Gebruik Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Controleer parameterbestand-syntaxis
cat infra/main.parameters.json | jq '.'

# 4. Bekijk een voorbeeld van implementatiewijzigingen
azd provision --preview
```

## 🚀 Implementatiefouten

### Probleem: Buildfouten
**Symptomen:**
- Applicatie bouwt niet tijdens implementatie
- Fouten bij het installeren van pakketten

**Oplossingen:**
```bash
# 1. Controleer bouwlogboeken
azd logs --service web
azd deploy --service web --debug

# 2. Test de build lokaal
cd src/web
npm install
npm run build

# 3. Controleer Node.js/Python versiecompatibiliteit
node --version  # Moet overeenkomen met azure.yaml instellingen
python --version

# 4. Wis de buildcache
rm -rf node_modules package-lock.json
npm install

# 5. Controleer Dockerfile als containers worden gebruikt
docker build -t test-image .
docker run --rm test-image
```

### Probleem: Container implementatiefouten
**Symptomen:**
- Container-apps starten niet
- Fouten bij het ophalen van afbeeldingen

**Oplossingen:**
```bash
# 1. Test Docker-build lokaal
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Controleer containerlogs
azd logs --service api --follow

# 3. Verifieer toegang tot containerregister
az acr login --name myregistry

# 4. Controleer containerapp-configuratie
az containerapp show --name my-app --resource-group my-rg
```

### Probleem: Database verbindingsfouten
**Symptomen:**
- Applicatie kan geen verbinding maken met de database
- Time-out fouten bij verbinding

**Oplossingen:**
```bash
# 1. Controleer firewallregels van de database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test connectiviteit vanuit de applicatie
# Voeg tijdelijk toe aan je app:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Verifieer de opmaak van de verbindingsreeks
azd env get-values | grep DATABASE

# 4. Controleer de status van de databaseserver
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Configuratieproblemen

### Probleem: Omgevingsvariabelen werken niet
**Symptomen:**
- App kan configuratiewaarden niet lezen
- Omgevingsvariabelen lijken leeg

**Oplossingen:**
```bash
# 1. Controleer of omgevingsvariabelen zijn ingesteld
azd env get-values
azd env get DATABASE_URL

# 2. Controleer variabelenamen in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Start de applicatie opnieuw
azd deploy --service web

# 4. Controleer de configuratie van de app-service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probleem: SSL/TLS certificaatproblemen
**Symptomen:**
- HTTPS werkt niet
- Fouten bij certificaatvalidatie

**Oplossingen:**
```bash
# 1. Controleer de status van het SSL-certificaat
az webapp config ssl list --resource-group myrg

# 2. Schakel alleen HTTPS in
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Voeg een aangepaste domein toe (indien nodig)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probleem: CORS configuratieproblemen
**Symptomen:**
- Frontend kan API niet aanroepen
- Cross-origin verzoek geblokkeerd

**Oplossingen:**
```bash
# 1. Configureer CORS voor App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Update API om CORS te verwerken
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Controleer of het op de juiste URL's draait
azd show
```

## 🌍 Problemen met Omgevingsbeheer

### Probleem: Problemen met omgevingswisseling
**Symptomen:**
- Verkeerde omgeving wordt gebruikt
- Configuratie schakelt niet correct

**Oplossingen:**
```bash
# 1. Lijst alle omgevingen op
azd env list

# 2. Selecteer expliciet een omgeving
azd env select production

# 3. Verifieer huidige omgeving
azd env show

# 4. Maak een nieuwe omgeving aan als deze beschadigd is
azd env new production-new
azd env select production-new
```

### Probleem: Beschadigde omgeving
**Symptomen:**
- Omgeving toont een ongeldige status
- Resources komen niet overeen met configuratie

**Oplossingen:**
```bash
# 1. Vernieuw de status van de omgeving
azd env refresh

# 2. Reset de configuratie van de omgeving
azd env new production-reset
# Kopieer de vereiste omgevingsvariabelen
azd env set DATABASE_URL "your-value"

# 3. Importeer bestaande resources (indien mogelijk)
# Werk handmatig .azure/production/config.json bij met resource-ID's
```

## 🔍 Prestatieproblemen

### Probleem: Trage implementatietijden
**Symptomen:**
- Implementaties duren te lang
- Time-outs tijdens implementatie

**Oplossingen:**
```bash
# 1. Parallelle implementatie inschakelen
azd config set deploy.parallelism 5

# 2. Gebruik incrementele implementaties
azd deploy --incremental

# 3. Optimaliseer het bouwproces
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Controleer de locaties van bronnen (gebruik dezelfde regio)
azd config set defaults.location eastus2
```

### Probleem: Applicatieprestatieproblemen
**Symptomen:**
- Trage responstijden
- Hoog resourcegebruik

**Oplossingen:**
```bash
# 1. Schaal middelen op
# Werk SKU bij in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Schakel Application Insights monitoring in
azd monitor

# 3. Controleer applicatielogs op knelpunten
azd logs --service api --follow

# 4. Implementeer caching
# Voeg Redis-cache toe aan je infrastructuur
```

## 🛠️ Probleemoplossingstools en -opdrachten

### Debugopdrachten
```bash
# Uitgebreid debuggen
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Controleer systeeminformatie
azd info

# Valideer configuratie
azd config validate

# Test connectiviteit
curl -v https://myapp.azurewebsites.net/health
```

### Loganalyse
```bash
# Applicatielogs
azd logs --service web --follow
azd logs --service api --since 1h

# Azure-resourcelogs
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogs (voor Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resourceonderzoek
```bash
# Lijst alle bronnen
az resource list --resource-group myrg -o table

# Controleer de status van de bron
az webapp show --name myapp --resource-group myrg --query state

# Netwerkdiagnostiek
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Extra Hulp Inroepen

### Wanneer Escaleren
- Authenticatieproblemen blijven bestaan na het proberen van alle oplossingen
- Infrastructuurproblemen met Azure-services
- Problemen met facturering of abonnementen
- Beveiligingsproblemen of incidenten

### Ondersteuningskanalen
```bash
# 1. Controleer Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Maak een Azure-ondersteuningsticket
# Ga naar: https://portal.azure.com -> Help + ondersteuning

# 3. Communitybronnen
# - Stack Overflow: azure-developer-cli tag
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informatie om te Verzamelen
Voordat je contact opneemt met ondersteuning, verzamel:
- Uitvoer van `azd version`
- Uitvoer van `azd info`
- Foutmeldingen (volledige tekst)
- Stappen om het probleem te reproduceren
- Omgevingsdetails (`azd env show`)
- Tijdlijn van wanneer het probleem begon

### Script voor Logverzameling
```bash
#!/bin/bash
# verzamel-debug-info.sh

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

## 📊 Voorkomen van Problemen

### Checklist voor Implementatie
```bash
# 1. Valideer authenticatie
az account show

# 2. Controleer quota's en limieten
az vm list-usage --location eastus2

# 3. Valideer sjablonen
az bicep build --file infra/main.bicep

# 4. Test eerst lokaal
npm run build
npm run test

# 5. Gebruik dry-run implementaties
azd provision --preview
```

### Monitoring Instellen
```bash
# Inschakelen Application Insights
# Toevoegen aan main.bicep:
resource appInsights 'Microsoft.Insights/components@2020-02-02' = {
  // ... configuration
}

# Stel waarschuwingen in
az monitor metrics alert create \
  --name "High CPU Usage" \
  --resource-group myrg \
  --scopes /subscriptions/{id}/resourceGroups/myrg/providers/Microsoft.Web/sites/myapp \
  --condition "avg Percentage CPU > 80"
```

### Regelmatig Onderhoud
```bash
# Wekelijkse gezondheidscontroles
./scripts/health-check.sh

# Maandelijkse kostenoverzicht
az consumption usage list --billing-period-name 202401

# Driemaandelijkse beveiligingscontrole
az security assessment list --resource-group myrg
```

## Gerelateerde Bronnen

- [Debugging Gids](debugging.md) - Geavanceerde debuggingtechnieken
- [Resources Voorzien](../deployment/provisioning.md) - Problemen met infrastructuur oplossen
- [Capaciteitsplanning](../pre-deployment/capacity-planning.md) - Richtlijnen voor resourceplanning
- [SKU Selectie](../pre-deployment/sku-selection.md) - Aanbevelingen voor servicetiers

---

**Tip**: Bewaar deze gids als bladwijzer en raadpleeg hem wanneer je problemen tegenkomt. De meeste problemen zijn al eerder gezien en hebben bewezen oplossingen!

---

**Navigatie**
- **Vorige Les**: [Resources Voorzien](../deployment/provisioning.md)
- **Volgende Les**: [Debugging Gids](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->