# Veelvoorkomende problemen en oplossingen

**Hoofdstuknavigatie:**
- **📚 Cursus startpagina**: [AZD voor beginners](../../README.md)
- **📖 Huidig hoofdstuk**: Hoofdstuk 7 - Probleemoplossing & Debuggen
- **⬅️ Vorige hoofdstuk**: [Hoofdstuk 6: Preflight-controles](../chapter-06-pre-deployment/preflight-checks.md)
- **➡️ Volgende**: [Debuggengids](debugging.md)
- **🚀 Volgend Hoofdstuk**: [Hoofdstuk 8: Productie- & Enterprise-patronen](../chapter-08-production/production-ai-practices.md)

## Inleiding

Deze uitgebreide handleiding voor probleemoplossing behandelt de meest voorkomende problemen bij het gebruik van Azure Developer CLI. Leer problemen met authenticatie, deployment, infrastructuurprovisie en applicatieconfiguratie te diagnosticeren, op te lossen en te verhelpen. Elk probleem bevat gedetailleerde symptomen, hoofdoorzaken en stapsgewijze oplossingsprocedures.

## Leerdoelen

Door deze gids te voltooien, zul je:
- Diagnosetechnieken voor Azure Developer CLI-problemen beheersen
- Veelvoorkomende authenticatie- en toestemmingsproblemen en hun oplossingen begrijpen
- Deployment-fouten, fouten bij infrastructuurprovisie en configuratieproblemen oplossen
- Proactieve monitoring- en debugstrategieën implementeren
- Systematische probleemoplossingsmethodologieën toepassen voor complexe problemen
- Juiste logging en monitoring configureren om toekomstige problemen te voorkomen

## Leeruitkomsten

Na voltooiing kun je:
- Azure Developer CLI-problemen diagnosticeren met ingebouwde diagnostische tools
- Authenticatie-, abonnement- en toestemmingsgerelateerde problemen zelfstandig oplossen
- Deployment-fouten en fouten bij infrastructuurprovisie effectief verhelpen
- Problemen met applicatieconfiguratie en omgevingsspecifieke problemen debuggen
- Monitoring en alerting implementeren om potentiële problemen proactief te identificeren
- Best practices voor logging, debugging en probleemoplossingsworkflows toepassen

## Snelle diagnostiek

Voer voordat je in specifieke problemen duikt deze opdrachten uit om diagnostische informatie te verzamelen:

```bash
# Controleer azd-versie en gezondheid
azd version
azd config list

# Controleer Azure-authenticatie
az account show
az account list

# Controleer huidige omgeving
azd env show
azd env get-values

# Schakel debug-logging in
export AZD_DEBUG=true
azd <command> --debug
```

## Authenticatieproblemen

### Probleem: "Failed to get access token"
**Symptomen:**
- `azd up` faalt met authenticatiefouten
- Opdrachten geven "unauthorized" of "access denied" terug

**Oplossingen:**
```bash
# 1. Opnieuw authenticeren met de Azure CLI
az login
az account show

# 2. Gecachte referenties wissen
az account clear
az login

# 3. Gebruik device code flow (voor headless-systemen)
az login --use-device-code

# 4. Stel een expliciet abonnement in
az account set --subscription "your-subscription-id"
azd config set defaults.subscription "your-subscription-id"
```

### Probleem: "Insufficient privileges" tijdens deployment
**Symptomen:**
- Deployment faalt met machtigingsfouten
- Bepaalde Azure-resources kunnen niet worden gemaakt

**Oplossingen:**
```bash
# 1. Controleer uw Azure-roltoewijzingen
az role assignment list --assignee $(az account show --query user.name -o tsv)

# 2. Zorg dat u de vereiste rollen hebt
# - Contributor (voor het aanmaken van resources)
# - User Access Administrator (voor roltoewijzingen)

# 3. Neem contact op met uw Azure-beheerder voor de juiste machtigingen
```

### Probleem: Multi-tenant authenticatieproblemen
**Oplossingen:**
```bash
# 1. Inloggen met een specifieke tenant
az login --tenant "your-tenant-id"

# 2. Stel de tenant in de configuratie in
azd config set auth.tenantId "your-tenant-id"

# 3. Maak de tenant-cache leeg als er van tenant gewisseld wordt
az account clear
```

## 🏗️ Fouten bij infrastructuurvoorziening

### Probleem: Conflicterende resource-namen
**Symptomen:**
- Fouten "The resource name already exists"
- Deployment faalt tijdens het aanmaken van resources

**Oplossingen:**
```bash
# 1. Gebruik unieke resource-namen met tokens
# In je Bicep-sjabloon:
var resourceToken = toLower(uniqueString(subscription().id, environmentName, location))
name: '${applicationName}-${resourceToken}'

# 2. Wijzig de omgevingsnaam
azd env new my-app-dev-$(whoami)-$(date +%s)

# 3. Ruim bestaande resources op
azd down --force --purge
```

### Probleem: Locatie/Regio niet beschikbaar
**Symptomen:**
- "The location 'xyz' is not available for resource type"
- Bepaalde SKUs niet beschikbaar in de geselecteerde regio

**Oplossingen:**
```bash
# 1. Controleer beschikbare locaties voor resourcetypen
az provider show --namespace Microsoft.Web --query "resourceTypes[?resourceType=='sites'].locations" -o table

# 2. Gebruik algemeen beschikbare regio's
azd config set defaults.location eastus2
# of
azd env set AZURE_LOCATION eastus2

# 3. Controleer de beschikbaarheid van services per regio
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

# 2. Vraag een verhoging van de quota aan via het Azure-portal
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

### Probleem: Bicep-template fouten
**Symptomen:**
- Template-validatiefouten
- Syntaxfouten in Bicep-bestanden

**Oplossingen:**
```bash
# 1. Valideer Bicep-syntaxis
az bicep build --file infra/main.bicep

# 2. Gebruik de Bicep-linter
az bicep lint --file infra/main.bicep

# 3. Controleer syntaxis van het parameterbestand
cat infra/main.parameters.json | jq '.'

# 4. Bekijk de uitrolwijzigingen
azd provision --preview
```

## 🚀 Deployment-fouten

### Probleem: Build-fouten
**Symptomen:**
- Applicatie faalt bij het bouwen tijdens deployment
- Fouten bij het installeren van pakketten

**Oplossingen:**
```bash
# 1. Controleer de build-uitvoer met de debugvlag
azd deploy --service web --debug

# 2. Bekijk de status van de uitgerolde service
azd show

# 3. Test de build lokaal
cd src/web
npm install
npm run build

# 3. Controleer de compatibiliteit van Node.js- en Python-versies
node --version  # Moet overeenkomen met de instellingen in azure.yaml
python --version

# 4. Wis de build-cache
rm -rf node_modules package-lock.json
npm install

# 5. Controleer de Dockerfile als er containers worden gebruikt
docker build -t test-image .
docker run --rm test-image
```

### Probleem: Container-deploymentfouten
**Symptomen:**
- Container-apps starten niet
- Fouten bij het ophalen van images

**Oplossingen:**
```bash
# 1. Test de Docker-build lokaal
docker build -t my-app:latest .
docker run --rm -p 3000:3000 my-app:latest

# 2. Controleer containerlogs met de Azure CLI
az containerapp logs show --name my-app --resource-group my-rg --follow

# 3. Monitor de applicatie via azd
azd monitor --logs

# 3. Controleer de toegang tot het containerregister
az acr login --name myregistry

# 4. Controleer de configuratie van de container-app
az containerapp show --name my-app --resource-group my-rg
```

### Probleem: Databaseverbindingen falen
**Symptomen:**
- Applicatie kan geen verbinding maken met database
- Time-out fouten bij verbinding

**Oplossingen:**
```bash
# 1. Controleer de firewallregels van de database
az postgres flexible-server firewall-rule list --name mydb --resource-group myrg

# 2. Test de connectiviteit vanuit de applicatie
# Voeg dit tijdelijk aan je app toe:
curl -v telnet://mydb.postgres.database.azure.com:5432

# 3. Controleer het formaat van de verbindingsreeks
azd env get-values | grep DATABASE

# 4. Controleer de status van de databaseserver
az postgres flexible-server show --name mydb --resource-group myrg --query state
```

## 🔧 Configuratieproblemen

### Probleem: Omgevingsvariabelen werken niet
**Symptomen:**
- App kan configwaarden niet lezen
- Omgevingsvariabelen lijken leeg

**Oplossingen:**
```bash
# 1. Controleer of omgevingsvariabelen zijn ingesteld
azd env get-values
azd env get DATABASE_URL

# 2. Controleer de variabelenamen in azure.yaml
cat azure.yaml | grep -A 5 env:

# 3. Start de applicatie opnieuw
azd deploy --service web

# 4. Controleer de configuratie van de app-service
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
- Frontend kan de API niet aanroepen
- Cross-origin verzoek geblokkeerd

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

## 🌍 Omgevingsbeheerproblemen

### Probleem: Problemen met het wisselen van omgevingen
**Symptomen:**
- Verkeerde omgeving wordt gebruikt
- Configuratie schakelt niet correct

**Oplossingen:**
```bash
# 1. Lijst alle omgevingen
azd env list

# 2. Selecteer expliciet de omgeving
azd env select production

# 3. Controleer de huidige omgeving
azd env show

# 4. Maak een nieuwe omgeving aan als deze beschadigd is
azd env new production-new
azd env select production-new
```

### Probleem: Omgevingscorruptie
**Symptomen:**
- Omgeving toont een ongeldige status
- Resources komen niet overeen met de configuratie

**Oplossingen:**
```bash
# 1. Vernieuw de status van de omgeving
azd env refresh

# 2. Stel de configuratie van de omgeving opnieuw in
azd env new production-reset
# Kopieer de benodigde omgevingsvariabelen
azd env set DATABASE_URL "your-value"

# 3. Importeer bestaande resources (indien mogelijk)
# Werk .azure/production/config.json handmatig bij met resource-IDs
```

## 🔍 Prestatieproblemen

### Probleem: Trage deploytijden
**Symptomen:**
- Deployments duren te lang
- Time-outs tijdens deployment

**Oplossingen:**
```bash
# 1. Implementeer specifieke services voor snellere iteratie
azd deploy --service web
azd deploy --service api

# 2. Gebruik alleen-code-implementatie wanneer de infrastructuur ongewijzigd blijft
azd deploy  # Sneller dan azd up

# 3. Optimaliseer het buildproces
# In package.json:
"scripts": {
  "build": "webpack --mode=production --optimize-minimize"
}

# 4. Controleer de locaties van resources (gebruik dezelfde regio)
azd config set defaults.location eastus2
```

### Probleem: Prestatieproblemen van applicatie
**Symptomen:**
- Trage responstijden
- Hoog resourcegebruik

**Oplossingen:**
```bash
# 1. Schaal resources op
# Werk de SKU bij in main.parameters.json:
"appServiceSku": {
  "value": "S2"  // Scale up from B1
}

# 2. Schakel Application Insights-monitoring in
azd monitor --overview

# 3. Controleer de applicatielogs in Azure
az webapp log tail --name myapp --resource-group myrg
# of voor Container Apps:
az containerapp logs show --name myapp --resource-group myrg --follow

# 4. Implementeer caching
# Voeg Redis-cache toe aan uw infrastructuur
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
azd config list

# Test connectiviteit
curl -v https://myapp.azurewebsites.net/health
```

### Loganalyse
```bash
# Applicatielogs via de Azure CLI
az webapp log tail --name myapp --resource-group myrg

# Monitor de applicatie met azd
azd monitor --logs
azd monitor --live

# Logs van Azure-resources
az monitor activity-log list --resource-group myrg --start-time 2024-01-01 --max-events 50

# Containerlogs (voor Container Apps)
az containerapp logs show --name myapp --resource-group myrg --follow
```

### Onderzoek van resources
```bash
# Alle bronnen weergeven
az resource list --resource-group myrg -o table

# Controleer de status van de bron
az webapp show --name myapp --resource-group myrg --query state

# Netwerkdiagnose
az network watcher test-connectivity --source-resource myvm --dest-address myapp.azurewebsites.net --dest-port 443
```

## 🆘 Extra hulp krijgen

### Wanneer escaleren
- Authenticatieproblemen blijven bestaan na het proberen van alle oplossingen
- Infrastructuurproblemen met Azure-services
- Facturering of abonnementgerelateerde problemen
- Beveiligingszorgen of incidenten

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
Voordat je contact opneemt met ondersteuning, verzamel:
- `azd version` output
- `azd config list` output
- `azd show` output (huidige deploymentstatus)
- Foutmeldingen (volledige tekst)
- Stappen om het probleem te reproduceren
- Omgevingsdetails (`azd env show`)
- Tijdlijn van wanneer het probleem begon

### Logverzamelingsscript
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

## 📊 Probleempreventie

### Checklist vóór implementatie
```bash
# 1. Controleer authenticatie
az account show

# 2. Controleer quota en limieten
az vm list-usage --location eastus2

# 3. Controleer sjablonen
az bicep build --file infra/main.bicep

# 4. Test eerst lokaal
npm run build
npm run test

# 5. Gebruik dry-run-implementaties
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

# Driemaandelijkse beveiligingsbeoordeling
az security assessment list --resource-group myrg
```

## Gerelateerde bronnen

- [Debuggengids](debugging.md) - Geavanceerde debugtechnieken
- [Provisioning van resources](../chapter-04-infrastructure/provisioning.md) - Problemen met infrastructuur
- [Capaciteitsplanning](../chapter-06-pre-deployment/capacity-planning.md) - Richtlijnen voor resourceplanning
- [SKU-selectie](../chapter-06-pre-deployment/sku-selection.md) - Aanbevelingen voor servicetiers

---

**Tip**: Sla deze gids als bladwijzer op en raadpleeg hem wanneer je problemen tegenkomt. De meeste problemen zijn eerder gezien en hebben vastgestelde oplossingen!

---

**Navigatie**
- **Vorige les**: [Provisioning van resources](../chapter-04-infrastructure/provisioning.md)
- **Volgende les**: [Debuggengids](debugging.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:
Dit document is vertaald met behulp van de AI-vertalingsdienst [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel wij naar nauwkeurigheid streven, wees u ervan bewust dat automatische vertalingen fouten of onjuistheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet als de gezaghebbende bron worden beschouwd. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->