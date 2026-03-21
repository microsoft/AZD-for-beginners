# Distribuere en Microsoft SQL-database og webapp med AZD

⏱️ **Estimert tid**: 20-30 minutter | 💰 **Estimert kostnad**: ~$15-25/måned | ⭐ **Kompleksitet**: Middels

Dette **fullstendige, fungerende eksemplet** viser hvordan du bruker [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) for å distribuere en Python Flask-nettapplikasjon med en Microsoft SQL-database på Azure. All kode er inkludert og testet—ingen eksterne avhengigheter kreves.

## Hva Du Vil Lære

Ved å fullføre dette eksemplet vil du:
- Distribuere en flerlag applikasjon (webapp + database) ved bruk av infrastruktur-som-kode
- Konfigurere sikre databasetilkoblinger uten hardkoding av hemmeligheter
- Overvåke applikasjonshelse med Application Insights
- Administrere Azure-ressurser effektivt med AZD CLI
- Følge Azures beste praksis for sikkerhet, kostnadsoptimalisering og observabilitet

## Scenariooversikt
- **Webapp**: Python Flask REST API med databaseforbindelse
- **Database**: Azure SQL Database med eksempeldatasett
- **Infrastruktur**: Provisionert med Bicep (modulære, gjenbrukbare maler)
- **Distribusjon**: Fullstendig automatisert med `azd`-kommandoer
- **Overvåking**: Application Insights for logger og telemetri

## Forutsetninger

### Nødvendige verktøy

Før du starter, bekreft at du har disse verktøyene installert:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versjon 2.50.0 eller høyere)
   ```sh
   az --version
   # Forventet utdata: azure-cli 2.50.0 eller høyere
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versjon 1.0.0 eller høyere)
   ```sh
   azd version
   # Forventet utdata: azd versjon 1.0.0 eller høyere
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (for lokal utvikling)
   ```sh
   python --version
   # Forventet output: Python 3.8 eller høyere
   ```

4. **[Docker](https://www.docker.com/get-started)** (valgfritt, for lokal containerisert utvikling)
   ```sh
   docker --version
   # Forventet utdata: Docker versjon 20.10 eller høyere
   ```

### Azure-krav

- En aktiv **Azure-abonnement** ([opprett en gratis konto](https://azure.microsoft.com/free/))
- Tillatelser til å opprette ressurser i abonnementet ditt
- **Eier**- eller **Bidragsyter**-rolle på abonnementet eller ressursgruppen

### Kunnskapsforutsetninger

Dette er et **middels nivå**-eksempel. Du bør være kjent med:
- Grunnleggende kommandolinjeoperasjoner
- Grunnleggende skykonsepter (ressurser, ressursgrupper)
- Grunnleggende forståelse av webapplikasjoner og databaser

**Ny på AZD?** Start med [Kom i gang-guiden](../../docs/chapter-01-foundation/azd-basics.md) først.

## Arkitektur

Dette eksemplet distribuerer en to-lags arkitektur med en webapplikasjon og SQL-database:

```mermaid
graph TD
    Browser[Bruker Nettleser] <--> WebApp[Azure Web App<br/>Flask API<br/>/helse<br/>/produkter]
    WebApp -- Sikker tilkobling<br/>Kryptert --> SQL[Azure SQL Database<br/>Produkter tabell<br/>Eksempeld data]
```
**Ressursdistribusjon:**
- **Ressursgruppe**: Container for alle ressurser
- **App Service Plan**: Linux-basert hosting (B1-tier for kostnadseffektivitet)
- **Webapp**: Python 3.11 runtime med Flask-applikasjon
- **SQL Server**: Administrert databaseserver med TLS 1.2 minimum
- **SQL Database**: Basic tier (2GB, egnet for utvikling/testing)
- **Application Insights**: Overvåking og logging
- **Log Analytics Workspace**: Sentralisert logglagring

**Analogien**: Tenk på dette som en restaurant (webapp) med en fryser (database). Kundene bestiller fra menyen (API-endepunkter), og kjøkkenet (Flask app) henter ingredienser (data) fra fryseren. Restaurantlederen (Application Insights) sporer alt som skjer.

## Mappestruktur

Alle filer er inkludert i dette eksemplet—ingen eksterne avhengigheter nødvendig:

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

**Hva hver fil gjør:**
- **azure.yaml**: Forteller AZD hva som skal distribueres og hvor
- **infra/main.bicep**: Orkestrerer alle Azure-ressurser
- **infra/resources/*.bicep**: Individuelle ressursdefinisjoner (modulært for gjenbruk)
- **src/web/app.py**: Flask-applikasjon med databaselogikk
- **requirements.txt**: Python pakkebehov
- **Dockerfile**: Containeriseringsinstruksjoner for distribusjon

## Kom i gang (Steg for steg)

### Steg 1: Klon og Naviger

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Suksesssjekk**: Bekreft at du ser `azure.yaml` og `infra/`-mappen:
```sh
ls
# Forventet: README.md, azure.yaml, infra/, src/
```

### Steg 2: Autentiser med Azure

```sh
azd auth login
```

Dette åpner nettleseren din for Azure-autentisering. Logg inn med Azure-legitimasjonen din.

**✓ Suksesssjekk**: Du bør se:
```
Logged in to Azure.
```

### Steg 3: Initialiser miljøet

```sh
azd init
```

**Hva skjer**: AZD oppretter en lokal konfigurasjon for distribusjonen din.

**Spørsmål du vil se**:
- **Miljønavn**: Skriv inn et kort navn (f.eks. `dev`, `minapp`)
- **Azure-abonnement**: Velg abonnementet ditt fra listen
- **Azure-lokasjon**: Velg region (f.eks. `eastus`, `westeurope`)

**✓ Suksesssjekk**: Du bør se:
```
SUCCESS: New project initialized!
```

### Steg 4: Provision Azure-ressurser

```sh
azd provision
```

**Hva skjer**: AZD distribuerer all infrastruktur (tar 5-8 minutter):
1. Oppretter ressursgruppe
2. Oppretter SQL Server og Database
3. Oppretter App Service Plan
4. Oppretter Webapp
5. Oppretter Application Insights
6. Konfigurerer nettverk og sikkerhet

**Du blir spurt om**:
- **SQL administratorbrukernavn**: Skriv inn et brukernavn (f.eks. `sqladmin`)
- **SQL administratorpassord**: Skriv inn et sterkt passord (lagre dette!)

**✓ Suksesssjekk**: Du bør se:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tid**: 5-8 minutter

### Steg 5: Distribuer applikasjonen

```sh
azd deploy
```

**Hva skjer**: AZD bygger og distribuerer Flask-applikasjonen din:
1. Pakker Python-applikasjonen
2. Bygger Docker-containeren
3. Pusher til Azure Webapp
4. Initialiserer databasen med eksempeldatasett
5. Starter applikasjonen

**✓ Suksesssjekk**: Du bør se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tid**: 3-5 minutter

### Steg 6: Bla gjennom applikasjonen

```sh
azd browse
```

Dette åpner din distribuerte webapp i nettleseren ved `https://app-<unique-id>.azurewebsites.net`

**✓ Suksesssjekk**: Du bør se JSON-utdata:
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

### Steg 7: Test API-endepunktene

**Helsetest** (verifiser databaseforbindelse):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Forventet svar**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**List produkter** (eksempeldatasett):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Forventet svar**:
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

**Hent enkeltprodukt**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Suksesssjekk**: Alle endepunkter returnerer JSON-data uten feil.

---

**🎉 Gratulerer!** Du har nå distribuert en webapplikasjon med database til Azure ved hjelp av AZD.

## Konfigurasjonsdykk

### Miljøvariabler

Hemmeligheter håndteres sikkert via Azure App Service-konfigurasjon—**aldri hardkodet i kildekoden**.

**Automatisk konfigurert av AZD**:
- `SQL_CONNECTION_STRING`: Databasetilkobling med krypterte legitimasjoner
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endepunkt for overvåkningstelemetri
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Aktiverer automatisk installasjon av avhengigheter

**Hvor hemmeligheter lagres**:
1. Under `azd provision` oppgir du SQL-legitimasjon via sikre spørsmål
2. AZD lagrer disse i din lokale `.azure/<env-navn>/.env` fil (ignorert i git)
3. AZD injiserer dem i Azure App Service-konfigurasjon (kryptert i hvile)
4. Applikasjonen leser dem via `os.getenv()` ved kjøretid

### Lokal utvikling

For lokal testing, lag en `.env`-fil fra eksemplet:

```sh
cp .env.sample .env
# Rediger .env med din lokale databaseforbindelse
```

**Lokal utviklingsflyt**:
```sh
# Installer avhengigheter
cd src/web
pip install -r requirements.txt

# Sett miljøvariabler
export SQL_CONNECTION_STRING="your-local-connection-string"

# Kjør applikasjonen
python app.py
```

**Test lokalt**:
```sh
curl http://localhost:8000/health
# Forventet: {"status": "sunn", "database": "tilkoblet"}
```

### Infrastruktur som kode

Alle Azure-ressurser defineres i **Bicep-maler** (`infra/`-mappe):

- **Modulært design**: Hver ressurs-type har egen fil for gjenbruk
- **Parametrisert**: Tilpass SKUs, regioner, navnekonvensjoner
- **Beste praksis**: Følger Azures navnestandarder og sikkerhetsinnstillinger
- **Versjonskontrollert**: Infrastrukturendringer spores i Git

**Tilpasningseksempel**:
For å endre databasetier, rediger `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Sikkerhets beste praksis

Dette eksemplet følger Azures sikkerhets beste praksis:

### 1. **Ingen hemmeligheter i kildekode**
- ✅ Legitimasjon lagres i Azure App Service-konfigurasjon (kryptert)
- ✅ `.env`-filer ekskludert fra Git via `.gitignore`
- ✅ Hemmeligheter overføres via sikre parametere under provisjonering

### 2. **Krypterte forbindelser**
- ✅ TLS 1.2 minimum for SQL Server
- ✅ HTTPS-only håndhevet for Webapp
- ✅ Databaseforbindelser bruker krypterte kanaler

### 3. **Nettverkssikkerhet**
- ✅ SQL Server-brannmur konfigurert til å kun tillate Azure-tjenester
- ✅ Offentlig nettverkstilgang begrenset (kan låses ytterligere med Private Endpoints)
- ✅ FTPS deaktivert på Webapp

### 4. **Autentisering og autorisasjon**
- ⚠️ **Nåværende**: SQL-autentisering (brukernavn/passord)
- ✅ **Anbefaling for produksjon**: Bruk Azure Managed Identity for passordfri autentisering

**For å oppgradere til Managed Identity** (for produksjon):
1. Aktiver managed identity på Webapp
2. Gi identiteten SQL-tillatelser
3. Oppdater tilkoblingsstrengen for å bruke managed identity
4. Fjern passordbasert autentisering

### 5. **Revisjon og samsvar**
- ✅ Application Insights logger alle forespørsler og feil
- ✅ SQL Database revisjon aktivert (kan konfigureres for samsvar)
- ✅ Alle ressurser merkes for styring

**Sikkerhetssjekkliste før produksjon**:
- [ ] Aktiver Azure Defender for SQL
- [ ] Konfigurer Private Endpoints for SQL Database
- [ ] Aktiver Web Application Firewall (WAF)
- [ ] Implementer Azure Key Vault for hemmelighetsrotasjon
- [ ] Konfigurer Azure AD-autentisering
- [ ] Aktiver diagnostisk logging for alle ressurser

## Kostnadsoptimalisering

**Estimert månedlig kostnad** (per november 2025):

| Ressurs | SKU/Tier | Estimert kostnad |
|----------|----------|------------------|
| App Service Plan | B1 (Basic) | ~$13/måned |
| SQL Database | Basic (2GB) | ~$5/måned |
| Application Insights | Betal-per-bruk | ~$2/måned (lav trafikk) |
| **Total** | | **~$20/måned** |

**💡 Kostnadstips**:

1. **Bruk gratis tier for læring**:
   - App Service: F1-tier (gratis, begrensede timer)
   - SQL Database: Bruk Azure SQL Database serverless
   - Application Insights: 5GB/måned gratis innsamling

2. **Stopp ressurser når de ikke brukes**:
   ```sh
   # Stopp webappen (databasen belastes fortsatt)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Start på nytt ved behov
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Slett alt etter testing**:
   ```sh
   azd down
   ```
   Dette fjerner ALLE ressurser og stopper kostnader.

4. **Utvikling vs produksjons SKUs**:
   - **Utvikling**: Basic tier (brukt i dette eksemplet)
   - **Produksjon**: Standard/Premium tier med redundans

**Kostnadsovervåking**:
- Se kostnader i [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Sett opp kostnadsvarsler for å unngå overraskelser
- Merk alle ressurser med `azd-env-name` for sporing

**Gratis tier-alternativ**:
For læringsformål kan du endre `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Merk**: Gratis tier har begrensninger (60 min/dag CPU, ikke alltid på).

## Overvåking og Observabilitet

### Application Insights-integrasjon

Dette eksemplet inkluderer **Application Insights** for omfattende overvåking:

**Hva som overvåkes**:
- ✅ HTTP-forespørsler (ventetid, statuskoder, endepunkter)
- ✅ Applikasjonsfeil og unntak
- ✅ Egendefinert logging fra Flask-app
- ✅ Databaseforbindelsens helse
- ✅ Ytelsesmetrikker (CPU, minne)

**Åpne Application Insights**:
1. Åpne [Azure Portal](https://portal.azure.com)
2. Naviger til ressursgruppen din (`rg-<env-navn>`)
3. Klikk på Application Insights-ressursen (`appi-<unique-id>`)

**Nyttige spørringer** (Application Insights → Logg):

**Vis alle forespørsler**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Finn feil**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Sjekk helseendepunktet**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL Database revisjon

**SQL Database-revisjon er aktivert** for å spore:
- Mønstre for databaseaksess
- Mislykkede innloggingsforsøk
- Skjemaendringer
- Dataadgang (for samsvar)

**Åpne revisjonslogger**:
1. Azure Portal → SQL Database → Revisjon
2. Se logger i Log Analytics workspace

### Sanntidsovervåking

**Se live-metrikker**:
1. Application Insights → Live Metrics
2. Se forespørsler, feil og ytelse i sanntid

**Sett opp varsler**:
Lag varsler for kritiske hendelser:
- HTTP 500-feil > 5 på 5 minutter
- Databaseforbindelsesfeil
- Høy responstid (>2 sekunder)

**Eksempel på varselopprettelse**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Feilsøking
### Vanlige problemer og løsninger

#### 1. `azd provision` mislykkes med "Location not available"

**Symptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Løsning**:
Velg et annet Azure-område eller registrer ressursleverandøren:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-tilkobling mislykkes under utrulling

**Symptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Løsning**:
- Verifiser at SQL Server-brannmuren tillater Azure-tjenester (konfigureres automatisk)
- Sjekk at SQL-administratorpassordet ble skrevet riktig under `azd provision`
- Sørg for at SQL Server er fullstendig utplassert (kan ta 2-3 minutter)

**Verifiser tilkobling**:
```sh
# Fra Azure-portalen, gå til SQL-database → Forespørselseditor
# Prøv å koble til med dine legitimasjoner
```

#### 3. Webapp viser "Application Error"

**Symptom**:
Nettleseren viser en generell feilsiden.

**Løsning**:
Sjekk applikasjonslogger:
```sh
# Vis nylige logger
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Vanlige årsaker**:
- Manglende miljøvariabler (sjekk App Service → Configuration)
- Python-pakkeinstallasjon feilet (sjekk utrullingslogger)
- Databaseinitialiseringsfeil (sjekk SQL-tilkoblingen)

#### 4. `azd deploy` mislykkes med "Build Error"

**Symptom**:
```
Error: Failed to build project
```

**Løsning**:
- Sørg for at `requirements.txt` ikke inneholder syntaksfeil
- Sjekk at Python 3.11 er spesifisert i `infra/resources/web-app.bicep`
- Verifiser at Dockerfile bruker riktig basebilde

**Feilsøk lokalt**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Unauthorized" ved kjøring av AZD-kommandoer

**Symptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Løsning**:
Autentiser på nytt i Azure:
```sh
azd auth login
az login
```

Verifiser at du har riktige rettigheter (Contributor-rolle) på abonnementet.

#### 6. Høye databasekostnader

**Symptom**:
Uventet Azure-regning.

**Løsning**:
- Sjekk om du glemte å kjøre `azd down` etter testing
- Verifiser at SQL-databasen bruker Basic tier (ikke Premium)
- Gå gjennom kostnader i Azure Cost Management
- Sett opp kostnadsvarsler

### Få hjelp

**Se alle AZD miljøvariabler**:
```sh
azd env get-values
```

**Sjekk utrullingsstatus**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Åpne applikasjonslogger**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Trenger du mer hjelp?**
- [AZD Troubleshooting Guide](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Azure App Service Troubleshooting](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Troubleshooting](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktiske øvelser

### Øvelse 1: Verifiser utrullingen din (Nybegynner)

**Mål**: Bekreft at alle ressurser er utplassert og at applikasjonen fungerer.

**Steg**:
1. List opp alle ressurser i ressursgruppen din:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Forventet**: 6-7 ressurser (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Test alle API-endepunkter:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Forventet**: Alle returnerer gyldig JSON uten feil

3. Sjekk Application Insights:
   - Naviger til Application Insights i Azure-portalen
   - Gå til "Live Metrics"
   - Oppdater nettleseren din på webappen
   **Forventet**: Se forespørsler vises i sanntid

**Suksesskriterier**: Alle 6-7 ressurser finnes, alle endepunkter returnerer data, Live Metrics viser aktivitet.

---

### Øvelse 2: Legg til et nytt API-endepunkt (Middels)

**Mål**: Utvid Flask-applikasjonen med et nytt endepunkt.

**Startkode**: Nåværende endepunkter i `src/web/app.py`

**Steg**:
1. Rediger `src/web/app.py` og legg til et nytt endepunkt etter `get_product()`-funksjonen:
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

2. Rull ut den oppdaterte applikasjonen:
   ```sh
   azd deploy
   ```

3. Test det nye endepunktet:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Forventet**: Returnerer produkter som matcher "laptop"

**Suksesskriterier**: Det nye endepunktet fungerer, returnerer filtrerte resultater, vises i Application Insights-logger.

---

### Øvelse 3: Legg til overvåking og varsler (Avansert)

**Mål**: Sett opp proaktiv overvåking med varsler.

**Steg**:
1. Opprett et varsel for HTTP 500-feil:
   ```sh
   # Hent Application Insights ressurs-ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Opprett varsel
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Utløse varselet ved å forårsake feil:
   ```sh
   # Be om et ikke-eksisterende produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Sjekk om varselet ble utløst:
   - Azure-portalen → Alerts → Alert Rules
   - Sjekk e-posten din (hvis konfigurert)

**Suksesskriterier**: Varselregel er opprettet, trigges ved feil, varslinger mottas.

---

### Øvelse 4: Endringer i databaseskjema (Avansert)

**Mål**: Legg til en ny tabell og modifiser applikasjonen til å bruke den.

**Steg**:
1. Koble til SQL-databasen via Azure Portal Query Editor

2. Opprett en ny `categories`-tabell:
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

3. Oppdater `src/web/app.py` for å inkludere kategori-informasjon i svarene

4. Rull ut og test

**Suksesskriterier**: Ny tabell finnes, produkter viser kategori-informasjon, applikasjonen fungerer fortsatt.

---

### Øvelse 5: Implementer caching (Ekspert)

**Mål**: Legg til Azure Redis Cache for å forbedre ytelsen.

**Steg**:
1. Legg til Redis Cache i `infra/main.bicep`
2. Oppdater `src/web/app.py` for å cache produktspørringer
3. Mål ytelsesforbedring med Application Insights
4. Sammenlign responstider før/etter caching

**Suksesskriterier**: Redis er utplassert, caching fungerer, responstid forbedres med >50%.

**Tips**: Start med [Azure Cache for Redis dokumentasjon](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Opprydding

For å unngå løpende kostnader, slett alle ressurser når du er ferdig:

```sh
azd down
```

**Bekreftelsesspørsmål**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Skriv `y` for å bekrefte.

**✓ Suksesssjekk**: 
- Alle ressurser er slettet fra Azure-portalen
- Ingen løpende kostnader
- Lokal `.azure/<env-name>` mappe kan slettes

**Alternativ** (behold infrastruktur, slett data):
```sh
# Slett bare ressursgruppen (behold AZD-konfigurasjonen)
az group delete --name rg-<env-name> --yes
```
## Lær mer

### Relatert dokumentasjon
- [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Documentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Documentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Documentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Neste steg i kurset
- **[Container Apps Example](../../../../examples/container-app)**: Utrull mikro-tjenester med Azure Container Apps
- **[AI Integration Guide](../../../../docs/ai-foundry)**: Legg til AI-funksjonalitet i appen din
- **[Deployment Best Practices](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Utrullingsmønstre for produksjon

### Avanserte temaer
- **Managed Identity**: Fjern passord og bruk Azure AD-autentisering
- **Private Endpoints**: Sikre database-tilkoblinger innenfor et virtuelt nettverk
- **CI/CD Integrasjon**: Automatiser utrullinger med GitHub Actions eller Azure DevOps
- **Multi-miljø**: Sett opp dev-, staging- og produksjonsmiljøer
- **Database-migrasjoner**: Bruk Alembic eller Entity Framework for versjonering av skjema

### Sammenligning med andre metoder

**AZD vs. ARM Templates**:
- ✅ AZD: Høyere abstraksjon, enklere kommandoer
- ⚠️ ARM: Mer detaljert, finere kontroll

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrert med Azure-tjenester
- ⚠️ Terraform: Multi-cloud støtte, større økosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Repeterbart, versjonskontrollert, automatiserbart
- ⚠️ Portal: Manuelle klikk, vanskelig å gjenskape

**Tenk på AZD som**: Docker Compose for Azure—forenklet konfigurasjon for komplekse utrullinger.

---

## Ofte stilte spørsmål

**Q: Kan jeg bruke et annet programmeringsspråk?**  
A: Ja! Bytt ut `src/web/` med Node.js, C#, Go eller hvilket som helst språk. Oppdater `azure.yaml` og Bicep tilsvarende.

**Q: Hvordan legger jeg til flere databaser?**  
A: Legg til en ekstra SQL Database-modul i `infra/main.bicep` eller bruk PostgreSQL/MySQL fra Azure Database-tjenester.

**Q: Kan jeg bruke dette i produksjon?**  
A: Dette er et utgangspunkt. For produksjon, legg til: managed identity, private endpoints, redundans, backup-strategi, WAF og forbedret overvåking.

**Q: Hva om jeg vil bruke containere i stedet for kodeutrulling?**  
A: Se [Container Apps Example](../../../../examples/container-app) som bruker Docker-containere gjennom hele prosessen.

**Q: Hvordan kobler jeg til databasen fra min lokale maskin?**  
A: Legg til din IP i SQL Server-brannmuren:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Q: Kan jeg bruke en eksisterende database i stedet for å opprette en ny?**  
A: Ja, modifiser `infra/main.bicep` for å referere til en eksisterende SQL Server og oppdater forbindelsesstreng-parametrene.

---

> **Merk:** Dette eksemplet viser beste praksis for utrulling av en webapp med database ved bruk av AZD. Det inkluderer fungerende kode, omfattende dokumentasjon og praktiske øvelser for å styrke læringen. For produksjonsutrullinger, vurder sikkerhet, skalering, samsvar og kostnadskrav spesifikke for din organisasjon.

**📚 Kursnavigasjon:**
- ← Forrige: [Container Apps Example](../../../../examples/container-app)
- → Neste: [AI Integration Guide](../../../../docs/ai-foundry)
- 🏠 [Kursstart](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vennligst vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk skal anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->