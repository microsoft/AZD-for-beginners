<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-21T18:09:06+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "no"
}
-->
# Distribuere en Microsoft SQL-database og webapp med AZD

⏱️ **Estimert tid**: 20-30 minutter | 💰 **Estimert kostnad**: ~15-25 kr/måned | ⭐ **Kompleksitet**: Middels

Dette **komplette, fungerende eksempelet** viser hvordan du bruker [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) til å distribuere en Python Flask-webapplikasjon med en Microsoft SQL-database til Azure. All kode er inkludert og testet—ingen eksterne avhengigheter kreves.

## Hva du vil lære

Ved å fullføre dette eksempelet vil du:
- Distribuere en flerlag-applikasjon (webapp + database) ved hjelp av infrastruktur-som-kode
- Konfigurere sikre databaseforbindelser uten å hardkode hemmeligheter
- Overvåke applikasjonshelse med Application Insights
- Administrere Azure-ressurser effektivt med AZD CLI
- Følge Azure beste praksis for sikkerhet, kostnadsoptimalisering og observabilitet

## Scenariooversikt
- **Webapp**: Python Flask REST API med databaseforbindelse
- **Database**: Azure SQL-database med eksempeldata
- **Infrastruktur**: Klargjort med Bicep (modulære, gjenbrukbare maler)
- **Distribusjon**: Fullt automatisert med `azd`-kommandoer
- **Overvåking**: Application Insights for logger og telemetri

## Forutsetninger

### Nødvendige verktøy

Før du starter, bekreft at du har disse verktøyene installert:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versjon 2.50.0 eller nyere)
   ```sh
   az --version
   # Forventet output: azure-cli 2.50.0 eller høyere
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versjon 1.0.0 eller nyere)
   ```sh
   azd version
   # Forventet output: azd versjon 1.0.0 eller høyere
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (for lokal utvikling)
   ```sh
   python --version
   # Forventet output: Python 3.8 eller høyere
   ```

4. **[Docker](https://www.docker.com/get-started)** (valgfritt, for lokal containerbasert utvikling)
   ```sh
   docker --version
   # Forventet output: Docker versjon 20.10 eller høyere
   ```

### Azure-krav

- Et aktivt **Azure-abonnement** ([opprett en gratis konto](https://azure.microsoft.com/free/))
- Tillatelser til å opprette ressurser i abonnementet ditt
- **Eier** eller **Bidragsyter**-rolle på abonnementet eller ressursgruppen

### Kunnskapsforutsetninger

Dette er et eksempel på **middels nivå**. Du bør være kjent med:
- Grunnleggende kommandoer i kommandolinjen
- Grunnleggende sky-konsepter (ressurser, ressursgrupper)
- Grunnleggende forståelse av webapplikasjoner og databaser

**Ny til AZD?** Start med [Kom i gang-guiden](../../docs/getting-started/azd-basics.md) først.

## Arkitektur

Dette eksempelet distribuerer en to-lags arkitektur med en webapplikasjon og SQL-database:

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

**Ressursdistribusjon:**
- **Ressursgruppe**: Beholder for alle ressurser
- **App Service Plan**: Linux-basert hosting (B1-nivå for kostnadseffektivitet)
- **Webapp**: Python 3.11 runtime med Flask-applikasjon
- **SQL Server**: Administrert databaseserver med TLS 1.2 minimum
- **SQL-database**: Grunnleggende nivå (2GB, egnet for utvikling/testing)
- **Application Insights**: Overvåking og logging
- **Log Analytics Workspace**: Sentralisert logglagring

**Analogi**: Tenk på dette som en restaurant (webapp) med en fryseboks (database). Kundene bestiller fra menyen (API-endepunkter), og kjøkkenet (Flask-app) henter ingredienser (data) fra fryseboksen. Restaurantsjefen (Application Insights) sporer alt som skjer.

## Mappestruktur

Alle filer er inkludert i dette eksempelet—ingen eksterne avhengigheter kreves:

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
- **infra/resources/*.bicep**: Individuelle ressursdefinisjoner (modulære for gjenbruk)
- **src/web/app.py**: Flask-applikasjon med databaselogikk
- **requirements.txt**: Python-pakkeavhengigheter
- **Dockerfile**: Instruksjoner for containerisering for distribusjon

## Hurtigstart (Steg-for-steg)

### Steg 1: Klon og naviger

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Suksesskontroll**: Bekreft at du ser `azure.yaml` og `infra/`-mappen:
```sh
ls
# Forventet: README.md, azure.yaml, infra/, src/
```

### Steg 2: Autentiser med Azure

```sh
azd auth login
```

Dette åpner nettleseren din for Azure-autentisering. Logg inn med dine Azure-legitimasjoner.

**✓ Suksesskontroll**: Du bør se:
```
Logged in to Azure.
```

### Steg 3: Initialiser miljøet

```sh
azd init
```

**Hva skjer**: AZD oppretter en lokal konfigurasjon for distribusjonen din.

**Spørsmål du vil se**:
- **Miljønavn**: Skriv inn et kort navn (f.eks. `dev`, `myapp`)
- **Azure-abonnement**: Velg abonnementet ditt fra listen
- **Azure-plassering**: Velg en region (f.eks. `eastus`, `westeurope`)

**✓ Suksesskontroll**: Du bør se:
```
SUCCESS: New project initialized!
```

### Steg 4: Klargjør Azure-ressurser

```sh
azd provision
```

**Hva skjer**: AZD distribuerer all infrastruktur (tar 5-8 minutter):
1. Oppretter ressursgruppe
2. Oppretter SQL Server og database
3. Oppretter App Service Plan
4. Oppretter Webapp
5. Oppretter Application Insights
6. Konfigurerer nettverk og sikkerhet

**Du vil bli bedt om**:
- **SQL admin brukernavn**: Skriv inn et brukernavn (f.eks. `sqladmin`)
- **SQL admin passord**: Skriv inn et sterkt passord (lagre dette!)

**✓ Suksesskontroll**: Du bør se:
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
3. Skyver til Azure Webapp
4. Initialiserer databasen med eksempeldata
5. Starter applikasjonen

**✓ Suksesskontroll**: Du bør se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tid**: 3-5 minutter

### Steg 6: Åpne applikasjonen

```sh
azd browse
```

Dette åpner den distribuerte webappen din i nettleseren på `https://app-<unik-id>.azurewebsites.net`

**✓ Suksesskontroll**: Du bør se JSON-utdata:
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

**Helsesjekk** (verifiser databaseforbindelse):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Forventet respons**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**List produkter** (eksempeldata):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Forventet respons**:
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

**Hent enkelt produkt**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Suksesskontroll**: Alle endepunkter returnerer JSON-data uten feil.

---

**🎉 Gratulerer!** Du har vellykket distribuert en webapplikasjon med en database til Azure ved hjelp av AZD.

## Konfigurasjonsdybde

### Miljøvariabler

Hemmeligheter administreres sikkert via Azure App Service-konfigurasjon—**aldri hardkodet i kildekoden**.

**Automatisk konfigurert av AZD**:
- `SQL_CONNECTION_STRING`: Databaseforbindelse med krypterte legitimasjoner
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Overvåking telemetri-endepunkt
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Aktiverer automatisk installasjon av avhengigheter

**Hvor hemmeligheter lagres**:
1. Under `azd provision` gir du SQL-legitimasjoner via sikre spørsmål
2. AZD lagrer disse i din lokale `.azure/<env-name>/.env`-fil (git-ignorert)
3. AZD injiserer dem i Azure App Service-konfigurasjon (kryptert i ro)
4. Applikasjonen leser dem via `os.getenv()` ved kjøring

### Lokal utvikling

For lokal testing, opprett en `.env`-fil fra eksempelet:

```sh
cp .env.sample .env
# Rediger .env med din lokale databaseforbindelse
```

**Lokal utviklingsarbeidsflyt**:
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
# Forventet: {"status": "frisk", "database": "tilkoblet"}
```

### Infrastruktur som kode

Alle Azure-ressurser er definert i **Bicep-maler** (`infra/`-mappen):

- **Modulær design**: Hver ressurs har sin egen fil for gjenbruk
- **Parameterisert**: Tilpass SKUs, regioner, navnekonvensjoner
- **Beste praksis**: Følger Azure-navnestandarder og sikkerhetsstandarder
- **Versjonskontrollert**: Infrastrukturendringer spores i Git

**Tilpasningseksempel**:
For å endre databasenivået, rediger `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Sikkerhetsbeste praksis

Dette eksempelet følger Azure sikkerhetsbeste praksis:

### 1. **Ingen hemmeligheter i kildekoden**
- ✅ Legitimasjoner lagret i Azure App Service-konfigurasjon (kryptert)
- ✅ `.env`-filer ekskludert fra Git via `.gitignore`
- ✅ Hemmeligheter sendt via sikre parametere under klargjøring

### 2. **Krypterte forbindelser**
- ✅ TLS 1.2 minimum for SQL Server
- ✅ Kun HTTPS aktivert for Webapp
- ✅ Databaseforbindelser bruker krypterte kanaler

### 3. **Nettverkssikkerhet**
- ✅ SQL Server-brannmur konfigurert til kun å tillate Azure-tjenester
- ✅ Offentlig nettverkstilgang begrenset (kan ytterligere låses med Private Endpoints)
- ✅ FTPS deaktivert på Webapp

### 4. **Autentisering og autorisasjon**
- ⚠️ **Nåværende**: SQL-autentisering (brukernavn/passord)
- ✅ **Produksjonsanbefaling**: Bruk Azure Managed Identity for passordløs autentisering

**For å oppgradere til Managed Identity** (for produksjon):
1. Aktiver administrert identitet på Webapp
2. Gi identiteten SQL-tillatelser
3. Oppdater tilkoblingsstrengen til å bruke administrert identitet
4. Fjern passordbasert autentisering

### 5. **Revisjon og samsvar**
- ✅ Application Insights logger alle forespørsler og feil
- ✅ SQL Database-revisjon aktivert (kan konfigureres for samsvar)
- ✅ Alle ressurser tagget for styring

**Sikkerhetssjekkliste før produksjon**:
- [ ] Aktiver Azure Defender for SQL
- [ ] Konfigurer Private Endpoints for SQL-database
- [ ] Aktiver Web Application Firewall (WAF)
- [ ] Implementer Azure Key Vault for hemmelighetsrotasjon
- [ ] Konfigurer Azure AD-autentisering
- [ ] Aktiver diagnostisk logging for alle ressurser

## Kostnadsoptimalisering

**Estimerte månedlige kostnader** (per november 2025):

| Ressurs | SKU/Nivå | Estimert kostnad |
|---------|----------|------------------|
| App Service Plan | B1 (Grunnleggende) | ~13 kr/måned |
| SQL-database | Grunnleggende (2GB) | ~5 kr/måned |
| Application Insights | Betal-per-bruk | ~2 kr/måned (lav trafikk) |
| **Totalt** | | **~20 kr/måned** |

**💡 Kostnadsbesparende tips**:

1. **Bruk gratisnivå for læring**:
   - App Service: F1-nivå (gratis, begrensede timer)
   - SQL-database: Bruk Azure SQL Database serverless
   - Application Insights: 5GB/måned gratis inntak

2. **Stopp ressurser når de ikke er i bruk**:
   ```sh
   # Stopp webappen (databasen belaster fortsatt)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Start på nytt når det er nødvendig
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Slett alt etter testing**:
   ```sh
   azd down
   ```
   Dette fjerner ALLE ressurser og stopper kostnader.

4. **Utvikling vs. produksjons-SKUs**:
   - **Utvikling**: Grunnleggende nivå (brukt i dette eksempelet)
   - **Produksjon**: Standard/Premium nivå med redundans

**Kostnadsmonitorering**:
- Se kostnader i [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Sett opp kostnadsvarsler for å unngå overraskelser
- Tagg alle ressurser med `azd-env-name` for sporing

**Gratisnivåalternativ**:
For læringsformål kan du endre `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Merk**: Gratisnivå har begrensninger (60 min/dag CPU, ingen alltid-på).

## Overvåking og observabilitet

### Application Insights-integrasjon

Dette eksempelet inkluderer **Application Insights** for omfattende overvåking:

**Hva som overvåkes**:
- ✅ HTTP-forespørsler (latens, statuskoder, endepunkter)
- ✅ Applikasjonsfeil og unntak
- ✅ Tilpasset logging fra Flask-app
- ✅ Databaseforbindelseshelse
- ✅ Ytelsesmetrikker (CPU, minne)

**Tilgang til Application Insights**:
1. Åpne [Azure Portal](https://portal.azure.com)
2. Naviger til ressursgruppen din (`rg-<env-name>`)
3. Klikk på Application Insights-ressursen (`appi-<unik-id>`)

**Nyttige spørringer** (Application Insights → Logger):

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

**Sjekk helseendepunkt**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL-database revisjon

**SQL-database revisjon er aktivert** for å spore:
- Database tilgangsmønstre
- Mislykkede innloggingsforsøk
- Skjemaendringer
- Data tilgang (for samsvar)

**Tilgang til revisjonslogger**:
1. Azure Portal → SQL-database → Revisjon
2. Se logger i Log Analytics-arbeidsområdet

### Sanntidsovervåking

**Vis Live Metrics**:
1. Application Insights → Live Metrics
2. Se forespørsler, feil og ytelse i sanntid

**Sett opp varsler**:
Opprett varsler for kritiske hendelser:
- HTTP 500-feil > 5 på 5 minutter
- Databaseforbindelsesfeil
- Høye responstider (>2 sekunder)

**Eksempel på opprettelse av varsel**:
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

#### 1. `azd provision` feiler med "Location not available"

**Symptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Løsning**:
Velg en annen Azure-region eller registrer ressursleverandøren:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-tilkobling feiler under utrulling

**Symptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Løsning**:
- Verifiser at SQL Server-brannmuren tillater Azure-tjenester (konfigurert automatisk)
- Sjekk at SQL-administratorpassordet ble skrevet inn korrekt under `azd provision`
- Sørg for at SQL Server er fullt utrullet (kan ta 2-3 minutter)

**Verifiser tilkobling**:
```sh
# Fra Azure Portal, gå til SQL Database → Spørringsredaktør
# Prøv å koble til med dine legitimasjoner
```

#### 3. Webappen viser "Application Error"

**Symptom**:
Nettleseren viser en generell feilsiden.

**Løsning**:
Sjekk applikasjonslogger:
```sh
# Vis nylige logger
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Vanlige årsaker**:
- Manglende miljøvariabler (sjekk App Service → Konfigurasjon)
- Feil under installasjon av Python-pakker (sjekk utrullingslogger)
- Feil ved databaseinitialisering (sjekk SQL-tilkobling)

#### 4. `azd deploy` feiler med "Build Error"

**Symptom**:
```
Error: Failed to build project
```

**Løsning**:
- Sørg for at `requirements.txt` ikke har syntaksfeil
- Sjekk at Python 3.11 er spesifisert i `infra/resources/web-app.bicep`
- Verifiser at Dockerfile har korrekt basebilde

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
Re-autentiser med Azure:
```sh
azd auth login
az login
```

Verifiser at du har riktige tillatelser (Contributor-rolle) på abonnementet.

#### 6. Høye databasekostnader

**Symptom**:
Uventet Azure-regning.

**Løsning**:
- Sjekk om du glemte å kjøre `azd down` etter testing
- Verifiser at SQL-databasen bruker Basic-nivå (ikke Premium)
- Gå gjennom kostnader i Azure Cost Management
- Sett opp kostnadsvarsler

### Få hjelp

**Vis alle AZD-miljøvariabler**:
```sh
azd env get-values
```

**Sjekk utrullingsstatus**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Få tilgang til applikasjonslogger**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Trenger du mer hjelp?**
- [AZD Feilsøkingsguide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Feilsøking](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Feilsøking](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktiske øvelser

### Øvelse 1: Verifiser din utrulling (Nybegynner)

**Mål**: Bekreft at alle ressurser er utrullet og applikasjonen fungerer.

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
   - Naviger til Application Insights i Azure Portal
   - Gå til "Live Metrics"
   - Oppdater nettleseren på webappen
   **Forventet**: Se forespørsler vises i sanntid

**Suksesskriterier**: Alle 6-7 ressurser eksisterer, alle endepunkter returnerer data, Live Metrics viser aktivitet.

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

2. Utrull den oppdaterte applikasjonen:
   ```sh
   azd deploy
   ```

3. Test det nye endepunktet:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Forventet**: Returnerer produkter som matcher "laptop"

**Suksesskriterier**: Nytt endepunkt fungerer, returnerer filtrerte resultater, vises i Application Insights-logger.

---

### Øvelse 3: Legg til overvåking og varsler (Avansert)

**Mål**: Sett opp proaktiv overvåking med varsler.

**Steg**:
1. Opprett et varsel for HTTP 500-feil:
   ```sh
   # Hent ressurs-ID for Application Insights
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

2. Utløse varslet ved å forårsake feil:
   ```sh
   # Be om et ikke-eksisterende produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Sjekk om varslet ble utløst:
   - Azure Portal → Alerts → Alert Rules
   - Sjekk e-posten din (hvis konfigurert)

**Suksesskriterier**: Varselregel er opprettet, utløses ved feil, varsler mottas.

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

3. Oppdater `src/web/app.py` til å inkludere kategoriinformasjon i svarene

4. Utrull og test

**Suksesskriterier**: Ny tabell eksisterer, produkter viser kategoriinformasjon, applikasjonen fungerer fortsatt.

---

### Øvelse 5: Implementer caching (Ekspert)

**Mål**: Legg til Azure Redis Cache for å forbedre ytelsen.

**Steg**:
1. Legg til Redis Cache i `infra/main.bicep`
2. Oppdater `src/web/app.py` til å cache produktforespørsler
3. Mål ytelsesforbedring med Application Insights
4. Sammenlign responstider før/etter caching

**Suksesskriterier**: Redis er utrullet, caching fungerer, responstider forbedres med >50%.

**Hint**: Start med [Azure Cache for Redis-dokumentasjon](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Opprydding

For å unngå løpende kostnader, slett alle ressurser når du er ferdig:

```sh
azd down
```

**Bekreftelsesprompt**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Skriv `y` for å bekrefte.

**✓ Suksesssjekk**: 
- Alle ressurser er slettet fra Azure Portal
- Ingen løpende kostnader
- Lokal `.azure/<env-name>`-mappe kan slettes

**Alternativ** (behold infrastruktur, slett data):
```sh
# Slett bare ressursgruppen (behold AZD-konfigurasjonen)
az group delete --name rg-<env-name> --yes
```
## Lær mer

### Relatert dokumentasjon
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database Dokumentasjon](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service Dokumentasjon](https://learn.microsoft.com/azure/app-service/)
- [Application Insights Dokumentasjon](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep Språkreferanse](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Neste steg i dette kurset
- **[Container Apps Eksempel](../../../../examples/container-app)**: Utrull mikrotjenester med Azure Container Apps
- **[AI Integrasjonsguide](../../../../docs/ai-foundry)**: Legg til AI-funksjonalitet i appen din
- **[Utrullingsbeste praksis](../../docs/deployment/deployment-guide.md)**: Mønstre for produksjonsutrulling

### Avanserte emner
- **Administrert identitet**: Fjern passord og bruk Azure AD-autentisering
- **Private endepunkter**: Sikre databasetilkoblinger innenfor et virtuelt nettverk
- **CI/CD-integrasjon**: Automatiser utrullinger med GitHub Actions eller Azure DevOps
- **Multi-miljø**: Sett opp utvikling, staging og produksjonsmiljøer
- **Database-migreringer**: Bruk Alembic eller Entity Framework for skjema-versjonering

### Sammenligning med andre tilnærminger

**AZD vs. ARM-maler**:
- ✅ AZD: Høyere nivå av abstraksjon, enklere kommandoer
- ⚠️ ARM: Mer detaljert, granulær kontroll

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrert med Azure-tjenester
- ⚠️ Terraform: Multi-cloud-støtte, større økosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Reproduserbart, versjonskontrollert, automatiserbart
- ⚠️ Portal: Manuelle klikk, vanskelig å reprodusere

**Tenk på AZD som**: Docker Compose for Azure—forenklet konfigurasjon for komplekse utrullinger.

---

## Ofte stilte spørsmål

**Spørsmål: Kan jeg bruke et annet programmeringsspråk?**  
Svar: Ja! Bytt ut `src/web/` med Node.js, C#, Go eller et annet språk. Oppdater `azure.yaml` og Bicep deretter.

**Spørsmål: Hvordan legger jeg til flere databaser?**  
Svar: Legg til en ny SQL Database-modul i `infra/main.bicep` eller bruk PostgreSQL/MySQL fra Azure Database-tjenester.

**Spørsmål: Kan jeg bruke dette i produksjon?**  
Svar: Dette er et utgangspunkt. For produksjon, legg til: administrert identitet, private endepunkter, redundans, backup-strategi, WAF og forbedret overvåking.

**Spørsmål: Hva hvis jeg vil bruke containere i stedet for kodeutrulling?**  
Svar: Sjekk ut [Container Apps Eksempel](../../../../examples/container-app) som bruker Docker-containere gjennomgående.

**Spørsmål: Hvordan kobler jeg til databasen fra min lokale maskin?**  
Svar: Legg til din IP i SQL Server-brannmuren:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Spørsmål: Kan jeg bruke en eksisterende database i stedet for å opprette en ny?**  
Svar: Ja, modifiser `infra/main.bicep` for å referere til en eksisterende SQL Server og oppdater tilkoblingsstrengparametere.

---

> **Merk:** Dette eksempelet demonstrerer beste praksis for utrulling av en webapp med en database ved bruk av AZD. Det inkluderer fungerende kode, omfattende dokumentasjon og praktiske øvelser for å styrke læringen. For produksjonsutrullinger, vurder sikkerhet, skalering, samsvar og kostnadskrav spesifikke for din organisasjon.

**📚 Kursnavigasjon:**
- ← Forrige: [Container Apps Eksempel](../../../../examples/container-app)
- → Neste: [AI Integrasjonsguide](../../../../docs/ai-foundry)
- 🏠 [Kursoversikt](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->