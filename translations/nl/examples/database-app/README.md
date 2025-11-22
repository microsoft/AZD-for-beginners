<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-21T18:15:29+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "nl"
}
-->
# Implementeren van een Microsoft SQL-database en webapp met AZD

⏱️ **Geschatte tijd**: 20-30 minuten | 💰 **Geschatte kosten**: ~€15-25/maand | ⭐ **Complexiteit**: Gemiddeld

Dit **volledige, werkende voorbeeld** laat zien hoe je de [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) kunt gebruiken om een Python Flask-webapplicatie met een Microsoft SQL-database naar Azure te implementeren. Alle code is inbegrepen en getest—geen externe afhankelijkheden nodig.

## Wat je leert

Door dit voorbeeld te voltooien, leer je:
- Een multi-tier applicatie (webapp + database) implementeren met infrastructure-as-code
- Veilige databaseverbindingen configureren zonder geheimen hard te coderen
- De gezondheid van de applicatie monitoren met Application Insights
- Azure-resources efficiënt beheren met de AZD CLI
- Azure best practices volgen voor beveiliging, kostenoptimalisatie en observatie

## Scenario-overzicht
- **Webapp**: Python Flask REST API met databaseconnectiviteit
- **Database**: Azure SQL-database met voorbeeldgegevens
- **Infrastructuur**: Geprovisioneerd met Bicep (modulaire, herbruikbare templates)
- **Implementatie**: Volledig geautomatiseerd met `azd`-commando's
- **Monitoring**: Application Insights voor logs en telemetrie

## Vereisten

### Benodigde tools

Controleer voordat je begint of je de volgende tools hebt geïnstalleerd:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versie 2.50.0 of hoger)
   ```sh
   az --version
   # Verwachte output: azure-cli 2.50.0 of hoger
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versie 1.0.0 of hoger)
   ```sh
   azd version
   # Verwachte output: azd versie 1.0.0 of hoger
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (voor lokale ontwikkeling)
   ```sh
   python --version
   # Verwachte output: Python 3.8 of hoger
   ```

4. **[Docker](https://www.docker.com/get-started)** (optioneel, voor lokale containerontwikkeling)
   ```sh
   docker --version
   # Verwachte output: Docker versie 20.10 of hoger
   ```

### Azure-vereisten

- Een actieve **Azure-abonnement** ([maak een gratis account aan](https://azure.microsoft.com/free/))
- Machtigingen om resources in je abonnement te maken
- **Eigenaar** of **Bijdrager**-rol op het abonnement of de resourcegroep

### Kennisvereisten

Dit is een **voorbeeld op gemiddeld niveau**. Je moet bekend zijn met:
- Basiscommando's in de terminal
- Fundamentele cloudconcepten (resources, resourcegroepen)
- Basiskennis van webapplicaties en databases

**Nieuw bij AZD?** Begin met de [Aan de slag-gids](../../docs/getting-started/azd-basics.md).

## Architectuur

Dit voorbeeld implementeert een tweelaagse architectuur met een webapplicatie en SQL-database:

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
- **Resourcegroep**: Container voor alle resources
- **App Service Plan**: Linux-gebaseerde hosting (B1-laag voor kostenbesparing)
- **Webapp**: Python 3.11 runtime met Flask-applicatie
- **SQL Server**: Beheerde databaseserver met minimaal TLS 1.2
- **SQL-database**: Basislaag (2GB, geschikt voor ontwikkeling/testen)
- **Application Insights**: Monitoring en logging
- **Log Analytics Workspace**: Gecentraliseerde logopslag

**Analogie**: Denk aan dit als een restaurant (webapp) met een koelcel (database). Klanten bestellen van het menu (API-eindpunten), en de keuken (Flask-app) haalt ingrediënten (data) uit de koelcel. De restaurantmanager (Application Insights) houdt alles bij wat er gebeurt.

## Mapstructuur

Alle bestanden zijn inbegrepen in dit voorbeeld—geen externe afhankelijkheden nodig:

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
- **azure.yaml**: Geeft AZD aan wat te implementeren en waar
- **infra/main.bicep**: Orkestreert alle Azure-resources
- **infra/resources/*.bicep**: Individuele resource-definities (modulair voor hergebruik)
- **src/web/app.py**: Flask-applicatie met databaselogica
- **requirements.txt**: Python-pakketafhankelijkheden
- **Dockerfile**: Containerisatie-instructies voor implementatie

## Snelstartgids (stap-voor-stap)

### Stap 1: Clone en navigeer

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Controle op succes**: Controleer of je `azure.yaml` en de map `infra/` ziet:
```sh
ls
# Verwacht: README.md, azure.yaml, infra/, src/
```

### Stap 2: Authenticeer met Azure

```sh
azd auth login
```

Dit opent je browser voor Azure-authenticatie. Log in met je Azure-gegevens.

**✓ Controle op succes**: Je zou moeten zien:
```
Logged in to Azure.
```

### Stap 3: Initialiseer de omgeving

```sh
azd init
```

**Wat er gebeurt**: AZD maakt een lokale configuratie voor je implementatie.

**Prompts die je ziet**:
- **Omgevingsnaam**: Voer een korte naam in (bijv. `dev`, `myapp`)
- **Azure-abonnement**: Selecteer je abonnement uit de lijst
- **Azure-locatie**: Kies een regio (bijv. `eastus`, `westeurope`)

**✓ Controle op succes**: Je zou moeten zien:
```
SUCCESS: New project initialized!
```

### Stap 4: Provisioneer Azure-resources

```sh
azd provision
```

**Wat er gebeurt**: AZD implementeert alle infrastructuur (duurt 5-8 minuten):
1. Maakt resourcegroep
2. Maakt SQL Server en database
3. Maakt App Service Plan
4. Maakt Webapp
5. Maakt Application Insights
6. Configureert netwerken en beveiliging

**Je wordt gevraagd om**:
- **SQL-beheerder gebruikersnaam**: Voer een gebruikersnaam in (bijv. `sqladmin`)
- **SQL-beheerder wachtwoord**: Voer een sterk wachtwoord in (bewaar dit!)

**✓ Controle op succes**: Je zou moeten zien:
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
1. Pakt de Python-applicatie in
2. Bouwt de Docker-container
3. Pusht naar Azure Webapp
4. Initialiseert de database met voorbeeldgegevens
5. Start de applicatie

**✓ Controle op succes**: Je zou moeten zien:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tijd**: 3-5 minuten

### Stap 6: Open de applicatie

```sh
azd browse
```

Dit opent je geïmplementeerde webapp in de browser op `https://app-<unique-id>.azurewebsites.net`

**✓ Controle op succes**: Je zou JSON-uitvoer moeten zien:
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

**Gezondheidscontrole** (controleer databaseverbinding):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Verwachte reactie**:
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

**Verwachte reactie**:
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

**✓ Controle op succes**: Alle eindpunten retourneren JSON-gegevens zonder fouten.

---

**🎉 Gefeliciteerd!** Je hebt succesvol een webapplicatie met een database naar Azure geïmplementeerd met AZD.

## Configuratiediepte

### Omgevingsvariabelen

Geheimen worden veilig beheerd via Azure App Service-configuratie—**nooit hard gecodeerd in broncode**.

**Automatisch geconfigureerd door AZD**:
- `SQL_CONNECTION_STRING`: Databaseverbinding met versleutelde inloggegevens
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Monitoring telemetrie-eindpunt
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Schakelt automatische installatie van afhankelijkheden in

**Waar geheimen worden opgeslagen**:
1. Tijdens `azd provision` geef je SQL-inloggegevens via beveiligde prompts
2. AZD slaat deze op in je lokale `.azure/<env-name>/.env`-bestand (git-ignored)
3. AZD injecteert ze in Azure App Service-configuratie (versleuteld in rust)
4. Applicatie leest ze via `os.getenv()` tijdens runtime

### Lokale ontwikkeling

Voor lokaal testen, maak een `.env`-bestand van het voorbeeld:

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

# Start de applicatie
python app.py
```

**Test lokaal**:
```sh
curl http://localhost:8000/health
# Verwacht: {"status": "gezond", "database": "verbonden"}
```

### Infrastructure-as-Code

Alle Azure-resources zijn gedefinieerd in **Bicep-templates** (map `infra/`):

- **Modulair ontwerp**: Elk resourcetype heeft zijn eigen bestand voor herbruikbaarheid
- **Geparameteriseerd**: Pas SKU's, regio's, naamgevingsconventies aan
- **Best practices**: Volgt Azure naamgevingsstandaarden en beveiligingsstandaarden
- **Versiebeheer**: Infrastructuurwijzigingen worden bijgehouden in Git

**Voorbeeld van aanpassing**:
Om de database-laag te wijzigen, bewerk `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Beveiligingsbest practices

Dit voorbeeld volgt Azure beveiligingsbest practices:

### 1. **Geen geheimen in broncode**
- ✅ Inloggegevens opgeslagen in Azure App Service-configuratie (versleuteld)
- ✅ `.env`-bestanden uitgesloten van Git via `.gitignore`
- ✅ Geheimen doorgegeven via beveiligde parameters tijdens provisioning

### 2. **Versleutelde verbindingen**
- ✅ Minimaal TLS 1.2 voor SQL Server
- ✅ Alleen HTTPS toegestaan voor Webapp
- ✅ Databaseverbindingen gebruiken versleutelde kanalen

### 3. **Netwerkbeveiliging**
- ✅ SQL Server-firewall geconfigureerd om alleen Azure-services toe te staan
- ✅ Openbare netwerktoegang beperkt (kan verder worden afgesloten met Private Endpoints)
- ✅ FTPS uitgeschakeld op Webapp

### 4. **Authenticatie en autorisatie**
- ⚠️ **Huidig**: SQL-authenticatie (gebruikersnaam/wachtwoord)
- ✅ **Aanbeveling voor productie**: Gebruik Azure Managed Identity voor wachtwoordloze authenticatie

**Om over te schakelen naar Managed Identity** (voor productie):
1. Schakel managed identity in op Webapp
2. Verleen identiteit SQL-machtigingen
3. Werk verbindingsstring bij om managed identity te gebruiken
4. Verwijder wachtwoordgebaseerde authenticatie

### 5. **Auditing en compliance**
- ✅ Application Insights logt alle verzoeken en fouten
- ✅ SQL-database auditing ingeschakeld (kan worden geconfigureerd voor compliance)
- ✅ Alle resources getagd voor governance

**Beveiligingschecklist vóór productie**:
- [ ] Schakel Azure Defender voor SQL in
- [ ] Configureer Private Endpoints voor SQL-database
- [ ] Schakel Web Application Firewall (WAF) in
- [ ] Implementeer Azure Key Vault voor geheimenrotatie
- [ ] Configureer Azure AD-authenticatie
- [ ] Schakel diagnostische logging in voor alle resources

## Kostenoptimalisatie

**Geschatte maandelijkse kosten** (vanaf november 2025):

| Resource | SKU/Laag | Geschatte kosten |
|----------|----------|------------------|
| App Service Plan | B1 (Basic) | ~€13/maand |
| SQL-database | Basis (2GB) | ~€5/maand |
| Application Insights | Pay-as-you-go | ~€2/maand (lage traffic) |
| **Totaal** | | **~€20/maand** |

**💡 Tips voor kostenbesparing**:

1. **Gebruik gratis laag voor leren**:
   - App Service: F1-laag (gratis, beperkte uren)
   - SQL-database: Gebruik Azure SQL Database serverless
   - Application Insights: 5GB/maand gratis ingestie

2. **Stop resources wanneer niet in gebruik**:
   ```sh
   # Stop de webapp (database blijft kosten genereren)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Herstart indien nodig
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Verwijder alles na testen**:
   ```sh
   azd down
   ```
   Dit verwijdert ALLE resources en stopt kosten.

4. **Ontwikkeling vs. productie SKU's**:
   - **Ontwikkeling**: Basislaag (gebruikt in dit voorbeeld)
   - **Productie**: Standaard/Premium-laag met redundantie

**Kostenmonitoring**:
- Bekijk kosten in [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Stel kostenwaarschuwingen in om verrassingen te voorkomen
- Tag alle resources met `azd-env-name` voor tracking

**Gratis laag alternatief**:
Voor leerdoeleinden kun je `infra/resources/app-service-plan.bicep` aanpassen:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Let op**: Gratis laag heeft beperkingen (60 min/dag CPU, geen always-on).

## Monitoring en observatie

### Integratie van Application Insights

Dit voorbeeld bevat **Application Insights** voor uitgebreide monitoring:

**Wat wordt gemonitord**:
- ✅ HTTP-verzoeken (latentie, statuscodes, eindpunten)
- ✅ Applicatiefouten en uitzonderingen
- ✅ Aangepaste logging vanuit Flask-app
- ✅ Gezondheid van databaseverbinding
- ✅ Prestatiestatistieken (CPU, geheugen)

**Toegang tot Application Insights**:
1. Open [Azure Portal](https://portal.azure.com)
2. Navigeer naar je resourcegroep (`rg-<env-name>`)
3. Klik op Application Insights-resource (`appi-<unique-id>`)

**Handige queries** (Application Insights → Logs):

**Bekijk alle verzoeken**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Vind fouten**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Controleer gezondheids-eindpunt**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL-database auditing

**SQL-database auditing is ingeschakeld** om te volgen:
- Database toegangspatronen
- Mislukte inlogpogingen
- Schemawijzigingen
- Data toegang (voor compliance)

**Toegang tot auditlogs**:
1. Azure Portal → SQL-database → Auditing
2. Bekijk logs in Log Analytics Workspace

### Real-time monitoring

**Bekijk live statistieken**:
1. Application Insights → Live Metrics
2. Zie verzoeken, fouten en prestaties in real-time

**Stel waarschuwingen in**:
Maak waarschuwingen voor kritieke gebeurtenissen:
- HTTP 500-fouten > 5 in 5 minuten
- Mislukte databaseverbindingen
- Hoge responstijden (>2 seconden)

**Voorbeeld van een waarschuwing maken**:
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

#### 1. `azd provision` mislukt met "Locatie niet beschikbaar"

**Symptoom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Oplossing**:
Kies een andere Azure-regio of registreer de resourceprovider:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-verbinding mislukt tijdens implementatie

**Symptoom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Oplossing**:
- Controleer of de SQL Server-firewall Azure-services toestaat (automatisch geconfigureerd)
- Controleer of het SQL-beheerderswachtwoord correct is ingevoerd tijdens `azd provision`
- Zorg ervoor dat de SQL Server volledig is ingericht (kan 2-3 minuten duren)

**Verifieer verbinding**:
```sh
# Ga vanuit Azure Portal naar SQL Database → Query-editor
# Probeer verbinding te maken met je inloggegevens
```

#### 3. Webapp toont "Applicatiefout"

**Symptoom**:
Browser toont een generieke foutpagina.

**Oplossing**:
Controleer applicatielogs:
```sh
# Bekijk recente logs
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Veelvoorkomende oorzaken**:
- Ontbrekende omgevingsvariabelen (controleer App Service → Configuratie)
- Mislukte installatie van Python-pakketten (controleer implementatielogs)
- Database-initialisatiefout (controleer SQL-connectiviteit)

#### 4. `azd deploy` mislukt met "Build Error"

**Symptoom**:
```
Error: Failed to build project
```

**Oplossing**:
- Zorg ervoor dat er geen syntaxisfouten in `requirements.txt` staan
- Controleer of Python 3.11 is gespecificeerd in `infra/resources/web-app.bicep`
- Verifieer dat Dockerfile de juiste basisimage heeft

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
Opnieuw authenticeren bij Azure:
```sh
azd auth login
az login
```

Controleer of je de juiste machtigingen hebt (Contributor-rol) op de abonnement.

#### 6. Hoge databasekosten

**Symptoom**:
Onverwachte Azure-rekening.

**Oplossing**:
- Controleer of je bent vergeten `azd down` uit te voeren na testen
- Verifieer dat SQL Database de Basic-laag gebruikt (niet Premium)
- Bekijk kosten in Azure Cost Management
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
- [AZD Troubleshooting Guide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktische oefeningen

### Oefening 1: Controleer je implementatie (Beginner)

**Doel**: Bevestig dat alle resources zijn geïmplementeerd en de applicatie werkt.

**Stappen**:
1. Lijst alle resources in je resourcegroep op:
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
   **Verwacht**: Alle eindpunten retourneren geldige JSON zonder fouten

3. Controleer Application Insights:
   - Navigeer naar Application Insights in Azure Portal
   - Ga naar "Live Metrics"
   - Vernieuw je browser op de webapp
   **Verwacht**: Verzoeken verschijnen in realtime

**Succescriteria**: Alle 6-7 resources bestaan, alle eindpunten retourneren data, Live Metrics toont activiteit.

---

### Oefening 2: Voeg een nieuw API-eindpunt toe (Gemiddeld)

**Doel**: Breid de Flask-applicatie uit met een nieuw eindpunt.

**Startcode**: Huidige eindpunten in `src/web/app.py`

**Stappen**:
1. Bewerk `src/web/app.py` en voeg een nieuw eindpunt toe na de functie `get_product()`:
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
   **Verwacht**: Retourneert producten die overeenkomen met "laptop"

**Succescriteria**: Nieuw eindpunt werkt, retourneert gefilterde resultaten, verschijnt in Application Insights-logs.

---

### Oefening 3: Voeg monitoring en waarschuwingen toe (Geavanceerd)

**Doel**: Stel proactieve monitoring in met waarschuwingen.

**Stappen**:
1. Maak een waarschuwing voor HTTP 500-fouten:
   ```sh
   # Haal resource-ID van Application Insights op
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Maak een waarschuwing
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
   # Vraag een niet-bestaand product
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Controleer of de waarschuwing is geactiveerd:
   - Azure Portal → Alerts → Alert Rules
   - Controleer je e-mail (indien geconfigureerd)

**Succescriteria**: Waarschuwingsregel is gemaakt, wordt geactiveerd bij fouten, meldingen worden ontvangen.

---

### Oefening 4: Wijzigingen in databaseschema (Geavanceerd)

**Doel**: Voeg een nieuwe tabel toe en pas de applicatie aan om deze te gebruiken.

**Stappen**:
1. Verbind met SQL Database via Azure Portal Query Editor

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

3. Werk `src/web/app.py` bij om categorie-informatie op te nemen in reacties

4. Implementeer en test

**Succescriteria**: Nieuwe tabel bestaat, producten tonen categorie-informatie, applicatie werkt nog steeds.

---

### Oefening 5: Implementeer caching (Expert)

**Doel**: Voeg Azure Redis Cache toe om de prestaties te verbeteren.

**Stappen**:
1. Voeg Redis Cache toe aan `infra/main.bicep`
2. Werk `src/web/app.py` bij om productquery's te cachen
3. Meet prestatieverbetering met Application Insights
4. Vergelijk responstijden vóór/na caching

**Succescriteria**: Redis is geïmplementeerd, caching werkt, responstijden verbeteren met >50%.

**Tip**: Begin met [Azure Cache for Redis-documentatie](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Opruimen

Om doorlopende kosten te vermijden, verwijder alle resources wanneer je klaar bent:

```sh
azd down
```

**Bevestigingsprompt**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Typ `y` om te bevestigen.

**✓ Succescontrole**: 
- Alle resources zijn verwijderd uit Azure Portal
- Geen doorlopende kosten
- Lokale `.azure/<env-name>` map kan worden verwijderd

**Alternatief** (infrastructuur behouden, gegevens verwijderen):
```sh
# Verwijder alleen de resourcegroep (behoud AZD-configuratie)
az group delete --name rg-<env-name> --yes
```
## Meer leren

### Gerelateerde documentatie
- [Azure Developer CLI-documentatie](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database-documentatie](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service-documentatie](https://learn.microsoft.com/azure/app-service/)
- [Application Insights-documentatie](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep-taalreferentie](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Volgende stappen in deze cursus
- **[Voorbeeld Container Apps](../../../../examples/container-app)**: Implementeer microservices met Azure Container Apps
- **[AI-integratiegids](../../../../docs/ai-foundry)**: Voeg AI-mogelijkheden toe aan je app
- **[Implementatie Best Practices](../../docs/deployment/deployment-guide.md)**: Productie-implementatiepatronen

### Geavanceerde onderwerpen
- **Managed Identity**: Verwijder wachtwoorden en gebruik Azure AD-authenticatie
- **Private Endpoints**: Beveilig databaseverbindingen binnen een virtueel netwerk
- **CI/CD-integratie**: Automatiseer implementaties met GitHub Actions of Azure DevOps
- **Multi-omgeving**: Stel ontwikkel-, staging- en productieomgevingen in
- **Database-migraties**: Gebruik Alembic of Entity Framework voor schema-versiebeheer

### Vergelijking met andere benaderingen

**AZD vs. ARM Templates**:
- ✅ AZD: Hogere abstractie, eenvoudigere commando's
- ⚠️ ARM: Meer gedetailleerd, fijnmazige controle

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, geïntegreerd met Azure-services
- ⚠️ Terraform: Multi-cloud ondersteuning, groter ecosysteem

**AZD vs. Azure Portal**:
- ✅ AZD: Herhaalbaar, versiebeheer, automatiseerbaar
- ⚠️ Portal: Handmatige klikken, moeilijk te reproduceren

**Denk aan AZD als**: Docker Compose voor Azure—vereenvoudigde configuratie voor complexe implementaties.

---

## Veelgestelde vragen

**V: Kan ik een andere programmeertaal gebruiken?**  
A: Ja! Vervang `src/web/` door Node.js, C#, Go of een andere taal. Werk `azure.yaml` en Bicep dienovereenkomstig bij.

**V: Hoe voeg ik meer databases toe?**  
A: Voeg een extra SQL Database-module toe in `infra/main.bicep` of gebruik PostgreSQL/MySQL van Azure Database-services.

**V: Kan ik dit gebruiken voor productie?**  
A: Dit is een startpunt. Voor productie, voeg toe: managed identity, private endpoints, redundantie, back-upstrategie, WAF en verbeterde monitoring.

**V: Wat als ik containers wil gebruiken in plaats van code-implementatie?**  
A: Bekijk het [Voorbeeld Container Apps](../../../../examples/container-app) dat volledig gebruik maakt van Docker-containers.

**V: Hoe verbind ik met de database vanaf mijn lokale machine?**  
A: Voeg je IP toe aan de SQL Server-firewall:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**V: Kan ik een bestaande database gebruiken in plaats van een nieuwe te maken?**  
A: Ja, wijzig `infra/main.bicep` om te verwijzen naar een bestaande SQL Server en werk de verbindingsparameters bij.

---

> **Opmerking:** Dit voorbeeld demonstreert best practices voor het implementeren van een webapp met een database met behulp van AZD. Het bevat werkende code, uitgebreide documentatie en praktische oefeningen om het leren te versterken. Voor productie-implementaties, bekijk beveiliging, schaalbaarheid, compliance en kostenvereisten die specifiek zijn voor jouw organisatie.

**📚 Cursusnavigatie:**
- ← Vorige: [Voorbeeld Container Apps](../../../../examples/container-app)
- → Volgende: [AI-integratiegids](../../../../docs/ai-foundry)
- 🏠 [Cursus Home](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Disclaimer**:  
Dit document is vertaald met behulp van de AI-vertalingsservice [Co-op Translator](https://github.com/Azure/co-op-translator). Hoewel we streven naar nauwkeurigheid, dient u zich ervan bewust te zijn dat geautomatiseerde vertalingen fouten of onnauwkeurigheden kunnen bevatten. Het originele document in de oorspronkelijke taal moet worden beschouwd als de gezaghebbende bron. Voor kritieke informatie wordt professionele menselijke vertaling aanbevolen. Wij zijn niet aansprakelijk voor eventuele misverstanden of verkeerde interpretaties die voortvloeien uit het gebruik van deze vertaling.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->