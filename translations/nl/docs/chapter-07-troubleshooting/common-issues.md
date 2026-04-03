# Veelvoorkomende problemen en oplossingen

**Hoofdstuknavigatie:**
- **📚 Cursus Startpagina**: [AZD voor Beginners](../../README.md)
- **📖 Huidig Hoofdstuk**: Hoofdstuk 7 - Problemen oplossen & Debugging
- **⬅️ Vorig hoofdstuk**: [Hoofdstuk 6: Pre-flight-controles](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Volgende**: [Foutopsporingsgids](debugging.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 8: Productie- & Enterprisepatronen](../chapter-08-production/production-ai-practices.md)

## Introductie

Deze uitgebreide gids voor probleemoplossing behandelt de meest voorkomende problemen bij het gebruik van de Azure Developer CLI. Leer hoe u problemen kunt diagnosticeren, oplossen en verhelpen met betrekking tot authenticatie, implementatie, infrastructuurprovisioning en applicatieconfiguratie. Elk probleem bevat gedetailleerde symptomen, oorzaken en stapsgewijze oplossingsprocedures.

## Leerdoelen

Door deze gids te voltooien, zult u:
- Beheersen van diagnostische technieken voor problemen met de Azure Developer CLI
- Begrijpen van veelvoorkomende authenticatie- en machtigingsproblemen en hun oplossingen
- Uitval bij implementatie, fouten bij infrastructuurprovisioning en configuratieproblemen oplossen
- Proactieve monitoring- en debugstrategieën implementeren
- Systematische probleemoplossingsmethodologieën toepassen voor complexe problemen
- De juiste logging en monitoring configureren om toekomstige problemen te voorkomen

## Leerresultaten

Na voltooiing kunt u:
- Problemen met de Azure Developer CLI diagnosticeren met ingebouwde diagnosetools
- Zelfstandig problemen oplossen die te maken hebben met authenticatie, abonnementen en machtigingen
- Implementatiefouten en fouten bij infrastructuurprovisioning effectief oplossen
- Foutopsporing van applicatieconfiguratieproblemen en omgevingsspecifieke problemen uitvoeren
- Monitoring en waarschuwingen implementeren om potentiële problemen proactief te identificeren
- Best practices toepassen voor logging, debuggen en workflows voor probleemoplossing

## Snelle diagnostiek

Voer, voordat u in specifieke problemen duikt, deze opdrachten uit om diagnostische informatie te verzamelen:

```bash
# Controleer de azd-versie en gezondheid
azd version
azd config show

# Controleer de Azure-authenticatie
az account show
az account list

# Controleer de huidige omgeving
azd env list
azd env get-values

# Schakel debuglogging in
export AZD_DEBUG=true
azd <command> --debug
```

## Authenticatieproblemen

### Probleem: "Mislukt bij ophalen van toegangstoken"
**Symptomen:**
- `azd up` faalt met authenticatiefouten
- Commando's geven "ongeautoriseerd" of "toegang geweigerd" terug

**Oplossingen:**
```bash
# 1. Meld je opnieuw aan bij de Azure CLI
az login
az account show

# 2. Gecachte inloggegevens wissen
az account clear
az login

# 3. Gebruik apparaatcode-flow (voor headless-systemen)
az login --use-device-code

# 4. Stel een expliciet abonnement in
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probleem: "Onvoldoende rechten" tijdens implementatie
**Symptomen:**
- De implementatie mislukt met machtigingsfouten
- Kan bepaalde Azure-resources niet aanmaken

**Oplossingen:**
```bash
# 1. Controleer uw roltoewijzingen in Azure
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Zorg ervoor dat u de vereiste rollen heeft
# - Contributor (voor het maken van resources)
# - User Access Administrator (voor roltoewijzingen)

# 3. Neem contact op met uw Azure-beheerder voor de juiste machtigingen
```

### Probleem: Multitenant-authenticatieproblemen
**Oplossingen:**
```bash
# 1. Inloggen met specifieke tenant
az login --tenant "your-tenant-id"

# 2. Stel de tenant in de configuratie in
azd config set auth.tenantId "your-tenant-id"

# 3. Wis de tenant-cache bij het wisselen van tenant
az account clear
```

## 🏗️ Fouten bij infrastructuurprovisioning

### Probleem: Conflicten in resourcenamen
**Symptomen:**
- Foutmeldingen "De resourcenaam bestaat al"
- Implementatie mislukt tijdens het aanmaken van resources

**Oplossingen:**
```bash
# 1. Gebruik unieke resourcenamen met tokens
# In uw Bicep-sjabloon:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Wijzig de omgevingsnaam
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ruim bestaande resources op
azd down --force --purge
```

### Probleem: Locatie/regio niet beschikbaar
**Symptomen:**
- "De locatie 'xyz' is niet beschikbaar voor het type resource"
- Bepaalde SKU's niet beschikbaar in de geselecteerde regio

**Oplossingen:**
```bash
# 1. Controleer beschikbare locaties voor resourcetypen
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gebruik algemeen beschikbare regio's
azd config set defaults.location eastus2
# of
azd env set AZURE_LOCATION eastus2

# 3. Controleer servicebeschikbaarheid per regio
# Bezoek: https://azure.microsoft.com/global-infrastructure/services/
```

### Probleem: Quotum overschreden
**Symptomen:**
- "Quotum overschreden voor resourcetype"
- "Maximum aantal resources bereikt"

**Oplossingen:**
```bash
# 1. Controleer het huidige quotagebruik
az vm list-usage --location eastus2 -o table

# 2. Vraag een verhoging van de quota aan via de Azure-portal
# Ga naar: Abonnementen > Gebruik + quota

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

### Probleem: Bicep-templatefouten
**Symptomen:**
- Validatie van template mislukt
- Syntaxfouten in Bicep-bestanden

**Oplossingen:**
```bash
# 1. Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep

# 2. Gebruik de Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Controleer de syntaxis van het parameterbestand
cat infra/main.parameters.json | jq '.'

# 4. Bekijk de wijzigingen in de implementatie
azd provision --preview
```

## 🚀 Implementatiefouten

### Probleem: Build-fouten
**Symptomen:**
- Applicatie faalt bij het bouwen tijdens implementatie
- Fouten bij het installeren van pakketten

**Oplossingen:**
```bash
# 1. Controleer de builduitvoer met de debugvlag
azd deploy --service web --debug

# 2. Bekijk de status van de gedeployde service
azd show

# 3. Test de build lokaal
cd src/web
npm install
npm run build

# 3. Controleer de compatibiliteit van Node.js- en Python-versies
node --version  # Moet overeenkomen met de instellingen in azure.yaml
python --version

# 4. Maak de buildcache leeg
rm -rf node_modules package-lock.json
npm install

# 5. Controleer de Dockerfile als je containers gebruikt
docker build -t test-image .
docker run --rm test-image
```

### Probleem: Container-implementatiefouten
**Symptomen:**
- Container-apps starten niet
- Fouten bij het ophalen van images

**Oplossingen:**
```bash
# 1. Docker-build lokaal testen
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Controleer containerlogs met de Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Bewaak de applicatie via azd
azd monitor --logs

# 3. Controleer toegang tot het containerregister
az acr login --name myregistry

# 4. Controleer de configuratie van de container-app
az containerapp show --name my-app --resource-group my-rg
```

### Probleem: Problemen met databaseverbinding
**Symptomen:**
- Applicatie kan geen verbinding maken met de database
- Time-out fouten bij verbinding

**Oplossingen:**
```bash
# 1. Controleer de firewallregels van de database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test de connectiviteit vanuit de applicatie
# Voeg dit tijdelijk aan uw app toe:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Controleer het formaat van de verbindingsreeks
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

# 3. Herstart de applicatie
azd deploy --service web

# 4. Controleer de configuratie van de App Service
az webapp config appsettings list --name myapp --resource-group myrg
```

### Probleem: SSL/TLS-certificaatproblemen
**Symptomen:**
- HTTPS werkt niet
- Fouten bij certificaatvalidatie

**Oplossingen:**
```bash
# 1. Controleer de status van het SSL-certificaat
az webapp config ssl list --resource-group myrg

# 2. Schakel alleen HTTPS in
az webapp update --name myapp --resource-group myrg --https-only true

# 3. Voeg een aangepast domein toe (indien nodig)
az webapp config hostname add --webapp-name myapp --resource-group myrg --hostname mydomain.com
```

### Probleem: CORS-configuratieproblemen
**Symptomen:**
- Frontend kan geen API-aanroepen doen
- Cross-origin-verzoek geblokkeerd

**Oplossingen:**
```bash
# 1. Configureer CORS voor App Service
az webapp cors add --name myapi --resource-group myrg --allowed-origins https://myapp.azurewebsites.net

# 2. Werk de API bij om CORS af te handelen
# In Express.js:
app.use(cors({
  origin: process.env.FRONTEND_URL,
  credentials: true
}));

# 3. Controleer of het op de juiste URL's draait
azd show
```

## 🌍 Problemen met omgevingbeheer

### Probleem: Problemen met schakelen tussen omgevingen
**Symptomen:**
- Verkeerde omgeving wordt gebruikt
- Configuratie schakelt niet correct

**Oplossingen:**
```bash
# 1. Alle omgevingen weergeven
azd env list

# 2. Expliciet een omgeving selecteren
azd env select production

# 3. Huidige omgeving verifiëren
azd env list

# 4. Nieuwe omgeving aanmaken als deze beschadigd is
azd env new production-new
azd env select production-new
```

### Probleem: Beschadigde omgeving
**Symptomen:**
- Omgeving toont een ongeldige status
- Resources komen niet overeen met de configuratie

**Oplossingen:**
```bash
# 1. Vernieuw de omgevingsstatus
azd env refresh

# 2. Reset de configuratie van de omgeving
azd env new production-reset
# Kopieer de vereiste omgevingsvariabelen
azd env set DATABASE_URL "your-value"

# 3. Importeer bestaande resources (indien mogelijk)
# Werk .azure/production/config.json handmatig bij met resource-ID's
```

## 🔍 Prestatieproblemen

### Probleem: Trage implementatietijden
**Symptomen:**
- Implementaties duren te lang
- Time-outs tijdens implementatie

**Oplossingen:**
```bash
# 1. Implementeer specifieke diensten voor snellere iteratie
azd deploy --service web
azd deploy --service api

# 2. Gebruik alleen code-deployment wanneer de infrastructuur ongewijzigd is
azd deploy  # Sneller dan azd up

# 3. Optimaliseer het buildproces
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Controleer resource-locaties (gebruik dezelfde regio)
azd config set defaults.location eastus2
```

### Probleem: Prestatieproblemen van applicatie
**Symptomen:**
- Trage responstijden
- Hoog resourcegebruik

**Oplossingen:**
```bash
# 1. Schaal resources op
# Werk SKU bij in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Schakel Application Insights-monitoring in
azd monitor --overview

# 3. Controleer applicatielogboeken in Azure
az webapp log tail --name myapp --resource-group myrg
# of voor Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementeer caching
# Voeg een Redis-cache toe aan uw infrastructuur
```

## 🛠️ Hulpmiddelen en opdrachten voor probleemoplossing

### Debug-opdrachten
```bash
# Uitgebreide foutopsporing
export AZD_DEBUG=true
azd up --debug 2>&1 | tee debug.log

# Controleer azd-versie
azd version

# Bekijk huidige configuratie
azd config show

# Test connectiviteit
curl -v https://myapp.azurewebsites.net/health
```

### Loganalyse
```bash
# Applicatielogs via Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Applicatie monitoren met azd
azd monitor --logs
azd monitor --live

# Logboeken van Azure-resources
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogs (voor Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Resource-onderzoek
```bash
# Alle bronnen weergeven
az resource list --resource-group myrg -o table

# Controleer de status van de bron
az webapp show --name myapp --resource-group myrg --query state

# Netwerkdiagnostiek
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Extra hulp krijgen

### Wanneer escaleren
- Authenticatieproblemen blijven bestaan nadat alle oplossingen zijn geprobeerd
- Infrastructuurproblemen met Azure-services
- Facturerings- of abonnementsgerelateerde problemen
- Beveiligingsproblemen of incidenten

### Ondersteuningskanalen
```bash
# 1. Controleer Azure Service Health
az rest --method get --uri "https://management.azure.com/subscriptions/{subscription-id}/providers/Microsoft.ResourceHealth/availabilityStatuses?api-version=2020-05-01"

# 2. Maak een Azure-supportticket aan
# Ga naar: https://portal.azure.com -> Help + ondersteuning

# 3. Communitybronnen
# - Stack Overflow: tag azure-developer-cli
# - GitHub Issues: https://github.com/Azure/azure-dev/issues
# - Microsoft Q&A: https://learn.microsoft.com/en-us/answers/
```

### Informatie om te verzamelen
Voordat u contact opneemt met support, verzamel:
- `azd version` uitvoer
- `azd config show` uitvoer
- `azd show` uitvoer (huidige implementatiestatus)
- Foutmeldingen (volledige tekst)
- Stappen om het probleem te reproduceren
- Omgevingsdetails (`azd env get-values`)
- Tijdlijn van wanneer het probleem is begonnen

### Script voor logverzameling
```bash
#!/bin/bash
# verzamel-debug-info.sh

echo "Collecting azd debug information..."
mkdir -p debug-logs

echo "System Information:" > debug-logs/system-info.txt
azd version >> debug-logs/system-info.txt
az --version >> debug-logs/system-info.txt

echo "Configuration:" > debug-logs/config.txt
azd config show >> debug-logs/config.txt
azd env list >> debug-logs/config.txt
azd env get-values >> debug-logs/config.txt

echo "Current deployment status:" > debug-logs/status.txt
azd show >> debug-logs/status.txt

echo "Debug information collected in debug-logs/"
```

## 📊 Voorkomen van problemen

### Pre-deployment-checklist
```bash
# 1. Valideer authenticatie
az account show

# 2. Controleer quota en limieten
az vm list-usage --location eastus2

# 3. Valideer sjablonen
az bicep build --file infra/main.bicep

# 4. Test eerst lokaal
npm run build
npm run test

# 5. Gebruik proefimplementaties
azd provision --preview
```

### Monitoringconfiguratie
```bash
# Schakel Application Insights in
# Voeg toe aan main.bicep:
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

### Regelmatig onderhoud
```bash
# Wekelijkse gezondheidscontroles
./scripts/health-check.sh

# Maandelijkse kostenbeoordeling
az consumption usage list --billing-period-name 202401

# Kwartaalgewijze beveiligingsbeoordeling
az security assessment list --resource-group myrg
```

## Gerelateerde bronnen

- [Foutopsporingsgids](debugging.md) - Geavanceerde technieken voor foutopsporing
- [Resources provisionen](../chapter-04-infrastructure/provisioning.md) - Infrastructuurfoutoplossing
- [Capaciteitsplanning](../chapter-06-pre-deployment/capacity-planning.md) - Richtlijnen voor resourceplanning
- [SKU-selectie](../chapter-06-pre-deployment/sku-selection.md) - Aanbevelingen voor servicetiers

---

**Tip**: Bewaar deze gids als bladwijzer en raadpleeg hem wanneer u problemen tegenkomt. De meeste problemen zijn eerder gezien en hebben beproefde oplossingen!

---

**Navigatie**
- **Vorige les**: [Resources provisionen](../chapter-04-infrastructure/provisioning.md)
- **Volgende les**: [Foutopsporingsgids](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, wees u ervan bewust dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het oorspronkelijke document in de originele taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->