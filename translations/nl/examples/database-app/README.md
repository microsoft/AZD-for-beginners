# Implementeren van een Microsoft SQL-database en web-app met AZD

⏱️ **Geschatte tijd**: 20-30 minuten | 💰 **Geschatte kosten**: ~$15-25/month | ⭐ **Complexiteit**: Gemiddeld

Dit **volledige, werkende voorbeeld** toont hoe je de [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) gebruikt om een Python Flask-webapplicatie met een Microsoft SQL-database naar Azure te implementeren. Alle code is inbegrepen en getest—geen externe afhankelijkheden vereist.

## Wat je zult leren

Door dit voorbeeld te doorlopen, zul je:
- Een applicatie met meerdere lagen (web-app + database) implementeren met infrastructuur-als-code
- Beveiligde databaseverbindingen configureren zonder geheimen in de broncode te hardcoderen
- De gezondheid van de applicatie monitoren met Application Insights
- Azure-resources efficiënt beheren met de AZD CLI
- Azure-best practices volgen voor beveiliging, kostenoptimalisatie en observeerbaarheid

## Overzicht van het scenario
- **Web App**: Python Flask REST API met databaseconnectiviteit
- **Database**: Azure SQL Database met voorbeeldgegevens
- **Infrastructuur**: Geprovisioned met Bicep (modulair, herbruikbare sjablonen)
- **Deployment**: Volledig geautomatiseerd met `azd`-commando's
- **Monitoring**: Application Insights voor logs en telemetrie

## Vereisten

### Vereiste tools

Controleer voordat je begint of je deze tools geïnstalleerd hebt:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versie 2.50.0 of hoger)
   ```sh
   az --version
   # Verwachte uitvoer: azure-cli 2.50.0 of hoger
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versie 1.0.0 of hoger)
   ```sh
   azd version
   # Verwachte uitvoer: azd versie 1.0.0 of hoger
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (voor lokale ontwikkeling)
   ```sh
   python --version
   # Verwachte uitvoer: Python 3.8 of hoger
   ```

4. **[Docker](https://www.docker.com/get-started)** (optioneel, voor lokale gecontaineriseerde ontwikkeling)
   ```sh
   docker --version
   # Verwachte uitvoer: Docker-versie 20.10 of hoger
   ```

### Azure-vereisten

- Een actief **Azure-abonnement** ([create a free account](https://azure.microsoft.com/free/))
- Machtigingen om resources in je subscription te maken
- **Owner** of **Contributor**-rol op het abonnement of de resource group

### Vereiste kennis

Dit is een **voorbeeld op gemiddeld niveau**. Je zou bekend moeten zijn met:
- Basisbewerkingen op de opdrachtregel
- Fundamentele cloudconcepten (resources, resource groups)
- Basiskennis van webapplicaties en databases

**Nieuw met AZD?** Begin eerst met de [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md).

## Architectuur

Dit voorbeeld implementeert een tweelaagse architectuur met een webapplicatie en een SQL-database:

```
┌─────────────────┐        ┌──────────────────────┐
│  User Browser   │◄──────►│   Azure Web App      │
└─────────────────┘        │   (Flask API)        │
                           │   - /health          │
                           │   - /products        │
                           └──────────┬───────────┘
                                      │
                                      │ Secure Connection
                                      │ (Encrypted)
                                      │
                           ┌──────────▼───────────┐
                           │ Azure SQL Database   │
                           │   - Products table   │
                           │   - Sample data      │
                           └──────────────────────┘
```

**Resource-implementatie:**
- **Resource Group**: Container voor alle resources
- **App Service Plan**: Linux-gebaseerde hosting (B1-tier voor kostenefficiëntie)
- **Web App**: Python 3.11-runtime met Flask-applicatie
- **SQL Server**: Beheerde databaseserver met minimaal TLS 1.2
- **SQL Database**: Basic-tier (2GB, geschikt voor ontwikkeling/testen)
- **Application Insights**: Monitoring en logging
- **Log Analytics Workspace**: Gecentraliseerde logopslag

**Analogie**: Zie dit als een restaurant (web-app) met een inloopvriezer (database). Klanten bestellen van het menu (API-eindpunten), en de keuken (Flask-app) haalt ingrediënten (gegevens) uit de vriezer. De restaurantmanager (Application Insights) volgt alles wat er gebeurt.

## Mappenstructuur

Alle bestanden zijn opgenomen in dit voorbeeld—geen externe afhankelijkheden vereist:

```
examples/database-app/
│
├── README.md                    # This file
├── azure.yaml                   # AZD configuration file
├── .env.sample                  # Sample environment variables
├── .gitignore                   # Git ignore patterns
│
├── infra/                       # Infrastructure as Code (Bicep)
│   ├── main.bicep              # Main orchestration template
│   ├── abbreviations.json      # Azure naming conventions
│   └── resources/              # Modular resource templates
│       ├── sql-server.bicep    # SQL Server configuration
│       ├── sql-database.bicep  # Database configuration
│       ├── app-service-plan.bicep  # Hosting plan
│       ├── app-insights.bicep  # Monitoring setup
│       └── web-app.bicep       # Web application
│
└── src/
    └── web/                    # Application source code
        ├── app.py              # Flask REST API
        ├── requirements.txt    # Python dependencies
        └── Dockerfile          # Container definition
```

**Wat elk bestand doet:**
- **azure.yaml**: Geeft aan wat AZD moet implementeren en waar
- **infra/main.bicep**: Orkestreert alle Azure-resources
- **infra/resources/*.bicep**: Individuele resourcedefinities (modulair voor hergebruik)
- **src/web/app.py**: Flask-applicatie met databaselogica
- **requirements.txt**: Python-pakketafhankelijkheden
- **Dockerfile**: Instructies voor containerisatie voor implementatie

## Quickstart (Stap-voor-stap)

### Stap 1: Klonen en navigeren

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Controle**: Controleer of je `azure.yaml` en de map `infra/` ziet:
```sh
ls
# Verwacht: README.md, azure.yaml, infra/, src/
```

### Stap 2: Authenticeren bij Azure

```sh
azd auth login
```

Dit opent je browser voor Azure-authenticatie. Meld je aan met je Azure-aanmeldgegevens.

**✓ Succescontrole**: Je zou het volgende moeten zien:
```
Logged in to Azure.
```

### Stap 3: Initialiseer de omgeving

```sh
azd init
```

**Wat er gebeurt**: AZD maakt een lokale configuratie voor je implementatie.

**Prompts die je zult zien**:
- **Omgevingsnaam**: Voer een korte naam in (bijv. `dev`, `myapp`)
- **Azure-abonnement**: Selecteer je abonnement uit de lijst
- **Azure-locatie**: Kies een regio (bijv. `eastus`, `westeurope`)

**✓ Succescontrole**: Je zou het volgende moeten zien:
```
SUCCESS: New project initialized!
```

### Stap 4: Provisioneer Azure-resources

```sh
azd provision
```

**Wat er gebeurt**: AZD zet alle infrastructuur neer (duurt 5-8 minuten):
1. Maakt resource group aan
2. Maakt SQL Server en database aan
3. Maakt App Service Plan aan
4. Maakt Web App aan
5. Maakt Application Insights aan
6. Configureert netwerken en beveiliging

**Je wordt gevraagd om**:
- **SQL admin username**: Voer een gebruikersnaam in (bijv. `sqladmin`)
- **SQL admin password**: Voer een sterk wachtwoord in (sla dit op!)

**✓ Succescontrole**: Je zou het volgende moeten zien:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tijd**: 5-8 minuten

### Stap 5: Implementeer de applicatie

```sh
azd deploy
```

**Wat er gebeurt**: AZD bouwt en implementeert je Flask-applicatie:
1. Verpakt de Python-applicatie
2. Bouwt de Docker-container
3. Uploadt naar Azure Web App
4. Initialiseert de database met voorbeeldgegevens
5. Start de applicatie

**✓ Succescontrole**: Je zou het volgende moeten zien:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tijd**: 3-5 minuten

### Stap 6: Open de applicatie in de browser

```sh
azd browse
```

Dit opent je gedeployde web-app in de browser op `https://app-<unique-id>.azurewebsites.net`

**✓ Succescontrole**: Je zou JSON-uitvoer moeten zien:
```json
{
  "message": "Welcome to the Database App API",
  "endpoints": {
    "/": "This help message",
    "/health": "Health check endpoint",
    "/products": "List all products",
    "/products/<id>": "Get product by ID"
  }
}
```

### Stap 7: Test de API-eindpunten

**Health Check** (verifieer databaseverbinding):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Verwacht antwoord**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Lijst producten** (voorbeeldgegevens):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Verwacht antwoord**:
```json
[
  {
    "id": 1,
    "name": "Laptop",
    "description": "High-performance laptop",
    "price": 1299.99,
    "created_at": "2025-11-19T10:30:00"
  },
  ...
]
```

**Haal één product op**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Succescontrole**: Alle eindpunten geven JSON-gegevens terug zonder fouten.

---

**🎉 Gefeliciteerd!** Je hebt succesvol een webapplicatie met een database naar Azure geïmplementeerd met AZD.

## Diepgaande configuratie

### Omgevingsvariabelen

Geheimen worden veilig beheerd via de configuratie van Azure App Service—**nooit in de broncode hardcoderen**.

**Automatisch geconfigureerd door AZD**:
- `SQL_CONNECTION_STRING`: Databaseverbinding met versleutelde referenties
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetrie-endpoint voor monitoring
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Schakelt automatische dependency-installatie in

**Waar geheimen worden opgeslagen**:
1. Tijdens `azd provision` geef je SQL-referenties via beveiligde prompts op
2. AZD slaat deze op in je lokale `.azure/<env-name>/.env`-bestand (git-ignored)
3. AZD injecteert ze in de configuratie van Azure App Service (versleuteld in rust)
4. Applicatie leest ze via `os.getenv()` tijdens runtime

### Lokale ontwikkeling

Voor lokaal testen: maak een `.env`-bestand aan op basis van het voorbeeld:

```sh
cp .env.sample .env
# Bewerk .env met je lokale databaseverbinding
```

**Workflow voor lokale ontwikkeling**:
```sh
# Installeer afhankelijkheden
cd src/web
pip install -r requirements.txt

# Stel omgevingsvariabelen in
export SQL_CONNECTION_STRING="your-local-connection-string"

# Voer de applicatie uit
python app.py
```

**Lokaal testen**:
```sh
curl http://localhost:8000/health
# Verwacht: {"status": "gezond", "database": "verbonden"}
```

### Infrastructuur als code

Alle Azure-resources zijn gedefinieerd in **Bicep-sjablonen** (`infra/` map):

- **Modulaire opzet**: Elk type resource heeft zijn eigen bestand voor herbruikbaarheid
- **Geparametriseerd**: Pas SKUs, regio's en naamgevingsconventies aan
- **Best practices**: Volgt Azure-naamgevingsstandaarden en beveiligingsstandaarden
- **Versiebeheerd**: Infrastructuurwijzigingen worden in Git bijgehouden

**Aanpassingsvoorbeeld**:
Om de databaselaag te wijzigen, bewerk `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Beste beveiligingspraktijken

Dit voorbeeld volgt Azure-beveiligingsbest practices:

### 1. **Geen geheimen in de broncode**
- ✅ Referenties opgeslagen in de configuratie van Azure App Service (versleuteld)
- ✅ `.env`-bestanden uitgesloten van Git via `.gitignore`
- ✅ Geheimen via beveiligde parameters doorgegeven tijdens provisioning

### 2. **Versleutelde verbindingen**
- ✅ TLS 1.2 minimum voor SQL Server
- ✅ Alleen HTTPS afgedwongen voor Web App
- ✅ Databaseverbindingen gebruiken versleutelde kanalen

### 3. **Netwerkbeveiliging**
- ✅ SQL Server-firewall geconfigureerd om alleen Azure-services toe te staan
- ✅ Openbare netwerktoegang beperkt (kan verder worden afgesloten met Private Endpoints)
- ✅ FTPS uitgeschakeld op Web App

### 4. **Authenticatie & Autorisatie**
- ⚠️ **Huidig**: SQL-authenticatie (gebruikersnaam/wachtwoord)
- ✅ **Aanbeveling voor productie**: Gebruik Azure Managed Identity voor wachtwoordloze authenticatie

**Om te upgraden naar Managed Identity** (voor productie):
1. Schakel managed identity in op de Web App
2. Verleen de identity SQL-machtigingen
3. Werk de verbindingsreeks bij om managed identity te gebruiken
4. Verwijder wachtwoordgebaseerde authenticatie

### 5. **Auditing & Naleving**
- ✅ Application Insights logt alle verzoeken en fouten
- ✅ SQL Database-auditing ingeschakeld (kan worden geconfigureerd voor compliance)
- ✅ Alle resources voorzien van tags voor governance

**Beveiligingschecklist voor productie**:
- [ ] Schakel Azure Defender voor SQL in
- [ ] Configureer Private Endpoints voor SQL Database
- [ ] Schakel Web Application Firewall (WAF) in
- [ ] Implementeer Azure Key Vault voor geheimrotatie
- [ ] Configureer Azure AD-authenticatie
- [ ] Schakel diagnostische logging in voor alle resources

## Kostenoptimalisatie

**Geschatte maandelijkse kosten** (per november 2025):

| Resource | SKU/Tier | Geschatte kosten |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/month |
| SQL Database | Basic (2GB) | ~$5/month |
| Application Insights | Pay-as-you-go | ~$2/month (low traffic) |
| **Totaal** | | **~$20/month** |

**💡 Tips om kosten te besparen**:

1. **Gebruik de gratis laag voor leren**:
   - App Service: F1-tier (gratis, beperkte uren)
   - SQL Database: Gebruik Azure SQL Database serverless
   - Application Insights: 5GB/maand gratis inname

2. **Stop resources wanneer ze niet in gebruik zijn**:
   ```sh
   # Stop de webapp (de database brengt nog steeds kosten in rekening)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Herstart wanneer nodig
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Verwijder alles na het testen**:
   ```sh
   azd down
   ```
   Dit verwijdert ALLE resources en stopt de kosten.

4. **Ontwikkeling vs. Productie SKUs**:
   - **Ontwikkeling**: Basic-tier (gebruikt in dit voorbeeld)
   - **Productie**: Standard/Premium-tier met redundantie

**Kostenmonitoring**:
- Bekijk kosten in [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Stel kostenwaarschuwingen in om verrassingen te voorkomen
- Tag alle resources met `azd-env-name` voor tracking

**Gratis-laag alternatief**:
Voor leermogelijkheden kun je `infra/resources/app-service-plan.bicep` aanpassen:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Opmerking**: De gratis laag heeft beperkingen (60 min/dag CPU, geen always-on).

## Monitoring & Observeerbaarheid

### Integratie van Application Insights

Dit voorbeeld omvat **Application Insights** voor uitgebreide monitoring:

**Wat wordt bewaakt**:
- ✅ HTTP-verzoeken (latentie, statuscodes, eindpunten)
- ✅ Applicatiefouten en uitzonderingen
- ✅ Aangepaste logging vanuit de Flask-app
- ✅ Gezondheid van databaseverbindingen
- ✅ Prestatiestatistieken (CPU, geheugen)

**Toegang tot Application Insights**:
1. Open [Azure Portal](https://portal.azure.com)
2. Navigeer naar je resource group (`rg-<env-name>`)
3. Klik op het Application Insights-resource (`appi-<unique-id>`)

**Nuttige queries** (Application Insights → Logs):

**Bekijk alle verzoeken**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Zoek fouten**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Controleer health endpoint**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database-auditing

**SQL Database-auditing is ingeschakeld** om bij te houden:
- Databasetoegangspatronen
- Mislukte inlogpogingen
- Schemawijzigingen
- Gegevensaccess (voor compliance)

**Toegang tot auditlogs**:
1. Azure Portal → SQL Database → Auditing
2. Bekijk logs in de Log Analytics-workspace

### Realtime-monitoring

**Bekijk live statistieken**:
1. Application Insights → Live Metrics
2. Zie verzoeken, fouten en prestaties in realtime

**Stel waarschuwingen in**:
Maak waarschuwingen aan voor kritieke gebeurtenissen:
- HTTP 500-fouten > 5 in 5 minuten
- Databaseverbindingsfouten
- Hoge responstijden (>2 seconden)

**Voorbeeldmelding aanmaken**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Problemen oplossen

### Veelvoorkomende problemen en oplossingen

#### 1. `azd provision` faalt met "Location not available"

**Symptoom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Oplossing**:
Kies een andere Azure-regio of registreer de resource provider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-verbinding mislukt tijdens implementatie

**Symptoom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Oplossing**:
- Controleer of de firewall van de SQL Server Azure-services toestaat (automatisch geconfigureerd)
- Controleer of het SQL-beheerderswachtwoord correct is ingevoerd tijdens `azd provision`
- Zorg dat de SQL Server volledig is ingericht (kan 2-3 minuten duren)

**Verbinding verifiëren**:
```sh
# Ga in het Azure-portaal naar SQL Database → Query-editor
# Probeer verbinding te maken met uw inloggegevens
```

#### 3. Web-app toont "Application Error"

**Symptoom**:
Browser toont een algemene foutpagina.

**Oplossing**:
Controleer applicatielogs:
```sh
# Bekijk recente logs
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Veelvoorkomende oorzaken**:
- Ontbrekende omgevingsvariabelen (controleer App Service → Configuratie)
- Installatie van Python-pakketten mislukt (controleer de implementatielogs)
- Fout bij initialisatie van de database (controleer SQL-connectiviteit)

#### 4. `azd deploy` faalt met "Build Error"

**Symptoom**:
```
Error: Failed to build project
```

**Oplossing**:
- Zorg dat `requirements.txt` geen syntaxisfouten bevat
- Controleer of Python 3.11 is opgegeven in `infra/resources/web-app.bicep`
- Controleer of de Dockerfile de juiste basisafbeelding heeft

**Lokaal debuggen**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" bij het uitvoeren van AZD-commando's

**Symptoom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Oplossing**:
Log opnieuw in bij Azure:
```sh
azd auth login
az login
```

Controleer of u de juiste machtigingen hebt (rol Contributor) op het abonnement.

#### 6. Hoge databasekosten

**Symptoom**:
Onverwachte Azure-factuur.

**Oplossing**:
- Controleer of u vergeten bent `azd down` uit te voeren na het testen
- Controleer of de SQL-database het Basic-tier gebruikt (niet Premium)
- Controleer de kosten in Azure Cost Management
- Stel kostenwaarschuwingen in

### Hulp krijgen

**Bekijk alle AZD-omgevingsvariabelen**:
```sh
azd env get-values
```

**Controleer implementatiestatus**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Toegang tot applicatielogs**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Meer hulp nodig?**
- [AZD-probleemoplossingsgids](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Probleemoplossing Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Probleemoplossing Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktische oefeningen

### Oefening 1: Verifieer uw implementatie (Beginner)

**Doel**: Bevestig dat alle resources zijn uitgerold en dat de applicatie werkt.

**Stappen**:
1. Geef alle resources in uw resourcegroep weer:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Verwacht**: 6-7 resources (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Test alle API-eindpunten:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Verwacht**: Alle geven geldige JSON terug zonder fouten

3. Controleer Application Insights:
   - Navigeer naar Application Insights in de Azure-portal
   - Ga naar "Live Metrics"
   - Vernieuw uw browser op de web-app
   **Verwacht**: Zie verzoeken in realtime verschijnen

**Succescriteria**: Alle 6-7 resources bestaan, alle eindpunten geven data terug, Live Metrics toont activiteit.

---

### Oefening 2: Voeg een nieuw API-eindpunt toe (Gevorderd)

**Doel**: Breid de Flask-applicatie uit met een nieuw eindpunt.

**Startcode**: Huidige eindpunten in `src/web/app.py`

**Stappen**:
1. Bewerk `src/web/app.py` en voeg een nieuw eindpunt toe na de `get_product()`-functie:
   ```python
   @app.route('/products/search/<keyword>')
   def search_products(keyword):
       """Search products by name or description."""
       try:
           conn = get_db_connection()
           cursor = conn.cursor()
           cursor.execute(
               "SELECT id, name, description, price, created_at FROM products WHERE name LIKE ? OR description LIKE ?",
               (f'%{keyword}%', f'%{keyword}%')
           )
           
           products = []
           for row in cursor.fetchall():
               products.append({
                   'id': row[0],
                   'name': row[1],
                   'description': row[2],
                   'price': float(row[3]) if row[3] else None,
                   'created_at': row[4].isoformat() if row[4] else None
               })
           
           cursor.close()
           conn.close()
           
           logger.info(f"Search for '{keyword}' returned {len(products)} results")
           return jsonify(products), 200
           
       except Exception as e:
           logger.error(f"Error searching products: {str(e)}")
           return jsonify({'error': str(e)}), 500
   ```

2. Implementeer de bijgewerkte applicatie:
   ```sh
   azd deploy
   ```

3. Test het nieuwe eindpunt:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Verwacht**: Geeft producten terug die overeenkomen met "laptop"

**Succescriteria**: Nieuw eindpunt werkt, geeft gefilterde resultaten terug, verschijnt in de Application Insights-logs.

---

### Oefening 3: Voeg monitoring en waarschuwingen toe (Geavanceerd)

**Doel**: Stel proactieve monitoring met waarschuwingen in.

**Stappen**:
1. Maak een waarschuwing aan voor HTTP 500-fouten:
   ```sh
   # Haal de Application Insights-resource-id op
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Maak een waarschuwing aan
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Activeer de waarschuwing door fouten te veroorzaken:
   ```sh
   # Vraag een niet-bestaand product aan
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Controleer of de waarschuwing is afgevuurd:
   - Azure Portal → Alerts → Alert Rules
   - Controleer uw e-mail (indien geconfigureerd)

**Succescriteria**: Waarschuwingregel is aangemaakt, wordt geactiveerd bij fouten, notificaties worden ontvangen.

---

### Oefening 4: Wijzigingen in databaseschema (Geavanceerd)

**Doel**: Voeg een nieuwe tabel toe en pas de applicatie aan om deze te gebruiken.

**Stappen**:
1. Verbind met de SQL-database via de Query Editor in de Azure-portal

2. Maak een nieuwe `categories`-tabel:
   ```sql
   CREATE TABLE categories (
       id INT PRIMARY KEY IDENTITY(1,1),
       name NVARCHAR(50) NOT NULL,
       description NVARCHAR(200)
   );
   
   INSERT INTO categories (name, description) VALUES
   ('Electronics', 'Electronic devices and accessories'),
   ('Office Supplies', 'Office equipment and supplies');
   
   -- Add category to products table
   ALTER TABLE products ADD category_id INT;
   UPDATE products SET category_id = 1; -- Set all to Electronics
   ```

3. Werk `src/web/app.py` bij om categorie-informatie op te nemen in de responses

4. Implementeer en test

**Succescriteria**: Nieuwe tabel bestaat, producten tonen categorie-informatie, applicatie werkt nog steeds.

---

### Oefening 5: Implementeer caching (Expert)

**Doel**: Voeg Azure Redis Cache toe om de prestaties te verbeteren.

**Stappen**:
1. Voeg Redis Cache toe aan `infra/main.bicep`
2. Werk `src/web/app.py` bij om productqueries te cachen
3. Meet prestatieverbetering met Application Insights
4. Vergelijk responstijden voor en na caching

**Succescriteria**: Redis is uitgerold, caching werkt, responstijden verbeteren met >50%.

**Tip**: Begin met de [Documentatie Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Opruimen

Om doorlopende kosten te voorkomen, verwijder alle resources wanneer u klaar bent:

```sh
azd down
```

**Bevestigingsprompt**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Typ `y` om te bevestigen.

**✓ Succescontrole**: 
- Alle resources zijn verwijderd uit de Azure-portal
- Geen doorlopende kosten
- Lokale `.azure/<env-name>`-map kan worden verwijderd

**Alternatief** (infrastructuur behouden, gegevens verwijderen):
```sh
# Verwijder alleen de resourcegroep (AZD-config behouden)
az group delete --name rg-<env-name> --yes
```
## Meer informatie

### Gerelateerde documentatie
- [Azure Developer CLI-documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database-documentatie](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service-documentatie](https://learn.microsoft.com/azure/app-service/)
- [Application Insights-documentatie](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep-taalreferentie](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Volgende stappen in deze cursus
- **[Container Apps-voorbeeld](../../../../examples/container-app)**: Implementeer microservices met Azure Container Apps
- **[AI-integratiehandleiding](../../../../docs/ai-foundry)**: Voeg AI-mogelijkheden toe aan uw app
- **[Beste implementatiepraktijken](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Patronen voor productie-implementatie

### Geavanceerde onderwerpen
- **Managed Identity**: Verwijder wachtwoorden en gebruik Azure AD-authenticatie
- **Private Endpoints**: Beveilig databaseverbindingen binnen een virtueel netwerk
- **CI/CD-integratie**: Automatiseer implementaties met GitHub Actions of Azure DevOps
- **Multi-Environment**: Stel dev-, staging- en productieomgevingen in
- **Database-migraties**: Gebruik Alembic of Entity Framework voor schema-versionering

### Vergelijking met andere benaderingen

**AZD vs. ARM-templates**:
- ✅ AZD: Abstractie op hoger niveau, eenvoudigere commando's
- ⚠️ ARM: Meer omslachtig, fijnmazige controle

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, geïntegreerd met Azure-services
- ⚠️ Terraform: Multi-cloud-ondersteuning, groter ecosysteem

**AZD vs. Azure-portal**:
- ✅ AZD: Herhaalbaar, versiebeheerd, automatiseerbaar
- ⚠️ Portal: Handmatige klikken, moeilijk te reproduceren

**Zie AZD als**: Docker Compose voor Azure—vereenvoudigde configuratie voor complexe implementaties.

---

## Veelgestelde vragen

**Q: Kan ik een andere programmeertaal gebruiken?**  
A: Ja! Vervang `src/web/` door Node.js, C#, Go of een andere taal. Werk `azure.yaml` en Bicep dienovereenkomstig bij.

**Q: Hoe voeg ik meer databases toe?**  
A: Voeg een extra SQL Database-module toe in `infra/main.bicep` of gebruik PostgreSQL/MySQL van Azure Database-services.

**Q: Kan ik dit in productie gebruiken?**  
A: Dit is een startpunt. Voor productie, voeg toe: managed identity, private endpoints, redundantie, back-upstrategie, WAF en verbeterde monitoring.

**Q: Wat als ik containers wil gebruiken in plaats van code-implementatie?**  
A: Bekijk het [Container Apps-voorbeeld](../../../../examples/container-app) dat overal Docker-containers gebruikt.

**Q: Hoe maak ik vanaf mijn lokale machine verbinding met de database?**  
A: Voeg uw IP toe aan de firewall van de SQL Server:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Kan ik een bestaande database gebruiken in plaats van een nieuwe te maken?**  
A: Ja, wijzig `infra/main.bicep` om te verwijzen naar een bestaande SQL Server en werk de connection-stringparameters bij.

---

> **Opmerking:** Dit voorbeeld toont best practices voor het implementeren van een web-app met een database met AZD. Het bevat werkende code, uitgebreide documentatie en praktische oefeningen om het leren te versterken. Voor productie-implementaties, bekijk beveiliging, schaalbaarheid, compliance en kostenvereisten die specifiek zijn voor uw organisatie.

**📚 Cursusnavigatie:**
- ← Vorige: [Container Apps-voorbeeld](../../../../examples/container-app)
- → Volgende: [AI-integratiehandleiding](../../../../docs/ai-foundry)
- 🏠 [Cursusstartpagina](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Disclaimer:
Dit document is vertaald met behulp van de AI-vertalingsdienst Co-op Translator (https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, kunnen automatische vertalingen fouten of onnauwkeurigheden bevatten. Het oorspronkelijke document in de originele taal moet worden beschouwd als de gezaghebbende bron. Voor cruciale informatie wordt een professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->