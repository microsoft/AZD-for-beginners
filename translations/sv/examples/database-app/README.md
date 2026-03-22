# Distribuera en Microsoft SQL-databas och webbapp med AZD

⏱️ **Beräknad tid**: 20-30 minuter | 💰 **Beräknad kostnad**: ~$15-25/månad | ⭐ **Komplexitet**: Medelsvår

Detta **kompletta, fungerande exempel** visar hur du använder [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) för att distribuera en Python Flask-webbapplikation med en Microsoft SQL-databas till Azure. All kod ingår och är testad—inga externa beroenden krävs.

## Vad du kommer att lära dig

Genom att slutföra detta exempel kommer du att:
- Distribuera en flerskiktsapplikation (webbapp + databas) med infrastruktur-som-kod
- Konfigurera säkra databasanslutningar utan att hårdkoda hemligheter
- Övervaka applikationens hälsa med Application Insights
- Hantera Azure-resurser effektivt med AZD CLI
- Följa Azures bästa praxis för säkerhet, kostnadsoptimering och observerbarhet

## Översikt av scenariot
- **Web App**: Python Flask REST-API med databasanslutning
- **Database**: Azure SQL-databas med exempeldata
- **Infrastructure**: Provisioneras med Bicep (modulära, återanvändbara mallar)
- **Distribution**: Fullt automatiserad med `azd`-kommandon
- **Monitoring**: Application Insights för loggar och telemetri

## Förutsättningar

### Nödvändiga verktyg

Innan du börjar, kontrollera att du har dessa verktyg installerade:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 eller högre)
   ```sh
   az --version
   # Förväntad utdata: azure-cli 2.50.0 eller högre
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 eller högre)
   ```sh
   azd version
   # Förväntat utdata: azd version 1.0.0 eller högre
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (för lokal utveckling)
   ```sh
   python --version
   # Förväntad utdata: Python 3.8 eller högre
   ```

4. **[Docker](https://www.docker.com/get-started)** (valfritt, för lokal containeriserad utveckling)
   ```sh
   docker --version
   # Förväntad utdata: Docker version 20.10 eller högre
   ```

### Azure-krav

- Ett aktivt **Azure-prenumeration** ([skapa ett gratiskonto](https://azure.microsoft.com/free/))
- Behörighet att skapa resurser i din prenumeration
- **Owner** eller **Contributor**-rollen i prenumerationen eller resursgruppen

### Förkunskaper

Detta är ett exempel på **medelnivå**. Du bör vara bekant med:
- Grundläggande kommandoradsoperationer
- Grundläggande molnkoncept (resurser, resursgrupper)
- Grundläggande förståelse för webbapplikationer och databaser

**Ny på AZD?** Börja med [Getting Started guide](../../docs/chapter-01-foundation/azd-basics.md) först.

## Arkitektur

Detta exempel distribuerar en tvåskiktsarkitektur med en webbapplikation och en SQL-databas:

```mermaid
graph TD
    Browser[Användarens webbläsare] <--> WebApp[Azure Webbapp<br/>Flask-API<br/>/health<br/>/products]
    WebApp -- Säker anslutning<br/>Krypterad --> SQL[Azure SQL-databas<br/>Produkttabell<br/>Exempeldata]
```
**Resursdistribution:**
- **Resource Group**: Behållare för alla resurser
- **App Service Plan**: Linux-baserad hosting (B1-tier för kostnadseffektivitet)
- **Web App**: Python 3.11-runtime med Flask-applikation
- **SQL Server**: Hanterad databasserver med minst TLS 1.2
- **SQL Database**: Basic-nivå (2GB, lämplig för utveckling/testning)
- **Application Insights**: Övervakning och loggning
- **Log Analytics Workspace**: Centraliserad logglagring

**Analogi**: Tänk på detta som en restaurang (webbapp) med ett förråd (databas). Kunder beställer från menyn (API-slutpunkter), och köket (Flask-appen) hämtar ingredienser (data) från förrådet. Restaurangchefen (Application Insights) följer allt som händer.

## Mappstruktur

Alla filer ingår i detta exempel—inga externa beroenden krävs:

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

**Vad varje fil gör:**
- **azure.yaml**: Berättar för AZD vad som ska distribueras och var
- **infra/main.bicep**: Orkestrerar alla Azure-resurser
- **infra/resources/*.bicep**: Individuella resursdefinitioner (modulära för återanvändning)
- **src/web/app.py**: Flask-applikation med databaslogik
- **requirements.txt**: Pythonpaketberoenden
- **Dockerfile**: Instruktioner för containerisering vid distribution

## Snabbstart (steg för steg)

### Steg 1: Klona och navigera

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kontroll**: Kontrollera att du ser `azure.yaml` och mappen `infra/`:
```sh
ls
# Förväntat: README.md, azure.yaml, infra/, src/
```

### Steg 2: Autentisera dig mot Azure

```sh
azd auth login
```

Detta öppnar din webbläsare för Azure-autentisering. Logga in med dina Azure-uppgifter.

**✓ Kontroll**: Du bör se:
```
Logged in to Azure.
```

### Steg 3: Initiera miljön

```sh
azd init
```

**Vad händer**: AZD skapar en lokal konfiguration för din distribution.

**Frågor du kommer att se**:
- **Miljönamn**: Ange ett kort namn (t.ex. `dev`, `myapp`)
- **Azure-prenumeration**: Välj din prenumeration från listan
- **Azure-region**: Välj en region (t.ex. `eastus`, `westeurope`)

**✓ Kontroll**: Du bör se:
```
SUCCESS: New project initialized!
```

### Steg 4: Provisionera Azure-resurser

```sh
azd provision
```

**Vad händer**: AZD distribuerar all infrastruktur (tar 5–8 minuter):
1. Skapar resursgrupp
2. Skapar SQL Server och databas
3. Skapar App Service Plan
4. Skapar Web App
5. Skapar Application Insights
6. Konfigurerar nätverk och säkerhet

**Du kommer att bli ombedd att ange**:
- **SQL admin username**: Ange ett användarnamn (t.ex. `sqladmin`)
- **SQL admin password**: Ange ett starkt lösenord (spara detta!)

**✓ Kontroll**: Du bör se:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tid**: 5–8 minuter

### Steg 5: Distribuera applikationen

```sh
azd deploy
```

**Vad händer**: AZD bygger och distribuerar din Flask-applikation:
1. Paketera Python-applikationen
2. Bygger Docker-containern
3. Pusha till Azure Web App
4. Initierar databasen med exempeldata
5. Startar applikationen

**✓ Kontroll**: Du bör se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tid**: 3–5 minuter

### Steg 6: Öppna applikationen i webbläsaren

```sh
azd browse
```

Detta öppnar din distribuerade webbapp i webbläsaren på `https://app-<unique-id>.azurewebsites.net`

**✓ Kontroll**: Du bör se JSON-utdata:
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

### Steg 7: Testa API-slutpunkterna

**Hälsokontroll** (verifiera databasanslutning):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Förväntat svar**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Lista produkter** (exempeldata):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Förväntat svar**:
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

**Hämta enskild produkt**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Kontroll**: Alla slutpunkter returnerar JSON-data utan fel.

---

**🎉 Grattis!** Du har framgångsrikt distribuerat en webbapplikation med en databas till Azure med hjälp av AZD.

## Fördjupad konfiguration

### Miljövariabler

Hemligheter hanteras säkert via Azure App Service-konfiguration—**aldrig hårdkodade i källkoden**.

**Konfigureras automatiskt av AZD**:
- `SQL_CONNECTION_STRING`: Databasanslutning med krypterade autentiseringsuppgifter
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Slutpunkt för övervakningstelemetri
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Aktiverar automatisk installation av beroenden

**Var hemligheter lagras**:
1. Under `azd provision` anger du SQL-referenser via säkra uppmaningar
2. AZD lagrar dem i din lokala `.azure/<env-name>/.env`-fil (git-ignorerad)
3. AZD injicerar dem i Azure App Service-konfigurationen (krypterade i vila)
4. Applikationen läser dem via `os.getenv()` vid körning

### Lokal utveckling

För lokal testning, skapa en `.env`-fil från exemplaret:

```sh
cp .env.sample .env
# Redigera .env med din lokala databasanslutning
```

**Arbetsflöde för lokal utveckling**:
```sh
# Installera beroenden
cd src/web
pip install -r requirements.txt

# Ställ in miljövariabler
export SQL_CONNECTION_STRING="your-local-connection-string"

# Kör applikationen
python app.py
```

**Testa lokalt**:
```sh
curl http://localhost:8000/health
# Förväntat: {"status": "healthy", "database": "connected"}
```

### Infrastruktur som kod

Alla Azure-resurser definieras i **Bicep-mallar** (`infra/`-mappen):

- **Modulär design**: Varje resurstyp har sin egen fil för återanvändbarhet
- **Parameteriserad**: Anpassa SKU:er, regioner, namngivningskonventioner
- **Bästa praxis**: Följer Azures namngivningsstandarder och säkerhetsstandarder
- **Versionshanterad**: Infrastrukturförändringar spåras i Git

**Exempel på anpassning**:
För att ändra databasnivån, redigera `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Säkerhetsbästa praxis

Detta exempel följer Azures säkerhetsbästa praxis:

### 1. **Inga hemligheter i källkoden**
- ✅ Referenser lagras i Azure App Service-konfigurationen (krypterade)
- ✅ `.env`-filer utesluts från Git via `.gitignore`
- ✅ Hemligheter skickas via säkra parametrar under provisioning

### 2. **Krypterade anslutningar**
- ✅ Minst TLS 1.2 för SQL Server
- ✅ Endast HTTPS krävs för Web App
- ✅ Databasanslutningar använder krypterade kanaler

### 3. **Nätverkssäkerhet**
- ✅ SQL Server-brandvägg konfigurerad för att bara tillåta Azure-tjänster
- ✅ Offentlig nätverksåtkomst begränsad (kan ytterligare stängas av med Private Endpoints)
- ✅ FTPS inaktiverat på Web App

### 4. **Autentisering & Auktorisation**
- ⚠️ **Aktuellt**: SQL-autentisering (användarnamn/lösenord)
- ✅ **Produktionsrekommendation**: Använd Azure Managed Identity för lösenordslös autentisering

**För att uppgradera till Managed Identity** (för produktion):
1. Aktivera managed identity på Web App
2. Ge identiteten SQL-behörigheter
3. Uppdatera anslutningssträngen för att använda managed identity
4. Ta bort autentisering baserad på lösenord

### 5. **Revision & Efterlevnad**
- ✅ Application Insights loggar alla förfrågningar och fel
- ✅ Revision för SQL-databasen aktiverad (kan konfigureras för efterlevnad)
- ✅ Alla resurser taggade för styrning

**Säkerhetschecklista innan produktion**:
- [ ] Aktivera Azure Defender för SQL
- [ ] Konfigurera Private Endpoints för SQL-databasen
- [ ] Aktivera Web Application Firewall (WAF)
- [ ] Implementera Azure Key Vault för rotation av hemligheter
- [ ] Konfigurera Azure AD-autentisering
- [ ] Aktivera diagnostisk loggning för alla resurser

## Kostnadsoptimering

**Uppskattade månadskostnader** (från och med november 2025):

| Resurs | SKU/Nivå | Uppskattad kostnad |
|----------|----------|----------------|
| App Service Plan | B1 (Basic) | ~$13/månad |
| SQL Database | Basic (2GB) | ~$5/månad |
| Application Insights | Pay-as-you-go | ~$2/månad (låg trafik) |
| **Totalt** | | **~$20/månad** |

**💡 Tips för kostnadsbesparing**:

1. **Använd gratisnivå för inlärning**:
   - App Service: F1-tier (gratis, begränsade timmar)
   - SQL Database: Använd Azure SQL Database serverless
   - Application Insights: 5GB/månad gratis ingestion

2. **Stoppa resurser när de inte används**:
   ```sh
   # Stoppa webbappen (databasen debiteras fortfarande)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Starta om vid behov
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Radera allt efter testning**:
   ```sh
   azd down
   ```
   Detta tar bort ALLA resurser och stoppar avgifter.

4. **Utveckling vs. produktion SKU:er**:
   - **Utveckling**: Basic-nivå (använd i detta exempel)
   - **Produktion**: Standard/Premium-nivå med redundans

**Kostnadsövervakning**:
- Visa kostnader i [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Ställ in kostnadsaviseringar för att undvika överraskningar
- Tagga alla resurser med `azd-env-name` för spårning

**Alternativ med gratisnivå**:
För inlärningssyfte kan du ändra `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Obs**: Gratisnivån har begränsningar (60 min/dag CPU, ingen always-on).

## Övervakning & Observerbarhet

### Integration med Application Insights

Detta exempel inkluderar **Application Insights** för omfattande övervakning:

**Vad som övervakas**:
- ✅ HTTP-förfrågningar (latens, statuskoder, slutpunkter)
- ✅ Applikationsfel och undantag
- ✅ Anpassad loggning från Flask-appen
- ✅ Databasanslutningens hälsa
- ✅ Prestandametriker (CPU, minne)

**Åtkomst till Application Insights**:
1. Öppna [Azure Portal](https://portal.azure.com)
2. Navigera till din resursgrupp (`rg-<env-name>`)
3. Klicka på Application Insights-resursen (`appi-<unique-id>`)

**Användbara frågor** (Application Insights → Logs):

**Visa alla förfrågningar**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Hitta fel**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Kontrollera hälsoslutpunkt**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### SQL-databasrevision

**Revision av SQL-databasen är aktiverad** för att spåra:
- Mönster för databasåtkomst
- Misslyckade inloggningsförsök
- Schemanändringar
- Dataåtkomst (för efterlevnad)

**Åtkomst till revisionsloggar**:
1. Azure Portal → SQL Database → Auditing
2. Visa loggar i Log Analytics-arbetsytan

### Realtidsövervakning

**Visa Live Metrics**:
1. Application Insights → Live Metrics
2. Se förfrågningar, fel och prestanda i realtid

**Ställ in aviseringar**:
Skapa aviseringar för kritiska händelser:
- HTTP 500-fel > 5 på 5 minuter
- Misslyckade databasanslutningar
- Höga responstider (>2 sekunder)

**Exempel på skapande av avisering**:
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```

## Felsökning
### Vanliga problem och lösningar

#### 1. `azd provision` misslyckas med "Plats inte tillgänglig"

**Symtom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Lösning**:
Välj en annan Azure-region eller registrera resursleverantören:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-anslutning misslyckas under distribution

**Symtom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Lösning**:
- Verifiera att SQL Servers brandvägg tillåter Azure-tjänster (konfigureras automatiskt)
- Kontrollera att SQL-administratörslösenordet angavs korrekt under `azd provision`
- Säkerställ att SQL Server är fullt provisionerad (kan ta 2-3 minuter)

**Verifiera anslutning**:
```sh
# Från Azure-portalen, gå till SQL-databas → Frågeredigeraren
# Försök att ansluta med dina inloggningsuppgifter
```

#### 3. Webbappen visar "Applikationsfel"

**Symtom**:
Webbläsaren visar en generisk felsida.

**Lösning**:
Kontrollera applikationsloggar:
```sh
# Visa de senaste loggarna
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Vanliga orsaker**:
- Saknade miljövariabler (kontrollera App Service → Konfiguration)
- Installation av Python-paket misslyckades (kontrollera distributionsloggarna)
- Fel vid databasinitialisering (kontrollera SQL-anslutningen)

#### 4. `azd deploy` misslyckas med "Byggfel"

**Symtom**:
```
Error: Failed to build project
```

**Lösning**:
- Se till att `requirements.txt` inte innehåller syntaxfel
- Kontrollera att Python 3.11 anges i `infra/resources/web-app.bicep`
- Verifiera att Dockerfile har rätt basbild

**Felsök lokalt**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Obehörig" vid körning av AZD-kommandon

**Symtom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Lösning**:
Logga in igen på Azure:
```sh
azd auth login
az login
```

Verifiera att du har korrekta behörigheter (Contributor-roll) för prenumerationen.

#### 6. Höga kostnader för databasen

**Symtom**:
Oväntad Azure-faktura.

**Lösning**:
- Kontrollera om du glömde köra `azd down` efter testning
- Kontrollera att SQL Database använder Basic-tier (inte Premium)
- Granska kostnader i Azure Cost Management
- Ställ in kostnadsvarningar

### Få hjälp

**Visa alla AZD-miljövariabler**:
```sh
azd env get-values
```

**Kontrollera distributionsstatus**:
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```

**Visa applikationsloggar**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Behöver du mer hjälp?**
- [AZD-felsökningsguide](../../docs/chapter-07-troubleshooting/common-issues.md)
- [Felsökning för Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Felsökning för Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktiska övningar

### Övning 1: Verifiera din distribution (Nybörjare)

**Mål**: Bekräfta att alla resurser är distribuerade och att applikationen fungerar.

**Steg**:
1. Lista alla resurser i din resursgrupp:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Förväntat**: 6-7 resurser (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testa alla API-endpoints:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Förväntat**: Alla returnerar giltig JSON utan fel

3. Kontrollera Application Insights:
   - Navigera till Application Insights i Azure-portalen
   - Gå till "Live Metrics"
   - Uppdatera sidan i webbläsaren för webbappen
   **Förväntat**: Se förfrågningar som visas i realtid

**Framgångskriterier**: Alla 6-7 resurser finns, alla endpoints returnerar data, Live Metrics visar aktivitet.

---

### Övning 2: Lägg till en ny API-endpoint (Medelnivå)

**Mål**: Utöka Flask-applikationen med en ny endpoint.

**Startkod**: Nuvarande endpoints i `src/web/app.py`

**Steg**:
1. Redigera `src/web/app.py` och lägg till en ny endpoint efter funktionen `get_product()`:
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

2. Distribuera den uppdaterade applikationen:
   ```sh
   azd deploy
   ```

3. Testa den nya endpointen:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Förväntat**: Returnerar produkter som matchar "laptop"

**Framgångskriterier**: Den nya endpointen fungerar, returnerar filtrerade resultat, visas i Application Insights-loggarna.

---

### Övning 3: Lägg till övervakning och aviseringar (Avancerad)

**Mål**: Konfigurera proaktiv övervakning med aviseringar.

**Steg**:
1. Skapa en varning för HTTP 500-fel:
   ```sh
   # Hämta Application Insights-resurs-ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Skapa larm
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Trigga varningen genom att orsaka fel:
   ```sh
   # Begär en icke-existerande produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Kontrollera om varningen utlöstes:
   - Azure Portal → Alerts → Alert Rules
   - Kontrollera din e-post (om konfigurerat)

**Framgångskriterier**: Varningregeln är skapad, utlöses vid fel, aviseringar tas emot.

---

### Övning 4: Ändringar i databasschema (Avancerad)

**Mål**: Lägg till en ny tabell och ändra applikationen för att använda den.

**Steg**:
1. Anslut till SQL Database via Azure Portal Query Editor

2. Skapa en ny `categories`-tabell:
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

3. Uppdatera `src/web/app.py` för att inkludera kategoriinformation i svaren

4. Distribuera och testa

**Framgångskriterier**: Den nya tabellen finns, produkter visar kategoriinformation, applikationen fungerar fortfarande.

---

### Övning 5: Implementera caching (Expert)

**Mål**: Lägg till Azure Redis Cache för att förbättra prestanda.

**Steg**:
1. Lägg till Redis Cache i `infra/main.bicep`
2. Uppdatera `src/web/app.py` för att cachea produktförfrågningar
3. Mät prestandaförbättring med Application Insights
4. Jämför svarstider före/efter caching

**Framgångskriterier**: Redis är distribuerat, caching fungerar, svarstider förbättras med >50%.

**Tips**: Börja med [Dokumentation för Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Rensa upp

För att undvika löpande kostnader, ta bort alla resurser när du är klar:

```sh
azd down
```

**Bekräftelseprompt**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Skriv `y` för att bekräfta.

**✓ Framgångskontroll**: 
- Alla resurser är borttagna från Azure-portalen
- Inga löpande kostnader
- Lokala `.azure/<env-name>`-mappen kan tas bort

**Alternativ** (behåll infrastruktur, ta bort data):
```sh
# Ta bort endast resursgruppen (behåll AZD-konfigurationen)
az group delete --name rg-<env-name> --yes
```
## Läs mer

### Relaterad dokumentation
- [Azure Developer CLI-dokumentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/)
- [Azure SQL Database-dokumentation](https://learn.microsoft.com/azure/azure-sql/database/)
- [Azure App Service-dokumentation](https://learn.microsoft.com/azure/app-service/)
- [Application Insights-dokumentation](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)
- [Bicep-språkreferens](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Nästa steg i denna kurs
- **[Exempel på Container Apps](../../../../examples/container-app)**: Distribuera mikrotjänster med Azure Container Apps
- **[AI-integrationsguide](../../../../docs/ai-foundry)**: Lägg till AI-funktioner i din app
- **[Bästa praxis för distribution](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Produktionsdistributionsmönster

### Avancerade ämnen
- **Managed Identity**: Ta bort lösenord och använd Azure AD-autentisering
- **Private Endpoints**: Säkra databasanslutningar inom ett virtuellt nätverk
- **CI/CD Integration**: Automatisera distributioner med GitHub Actions eller Azure DevOps
- **Multi-Environment**: Ställ in dev-, staging- och produktionsmiljöer
- **Database Migrations**: Använd Alembic eller Entity Framework för versionshantering av schema

### Jämförelse med andra tillvägagångssätt

**AZD vs. ARM-mallar**:
- ✅ AZD: Högre abstraktionsnivå, enklare kommandon
- ⚠️ ARM: Mer detaljerat, mer granulär kontroll

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrerat med Azure-tjänster
- ⚠️ Terraform: Multi-cloud-stöd, större ekosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Upprepbart, versionskontrollerat, automatiserbart
- ⚠️ Portal: Manuella klick, svårt att reproducera

**Tänk på AZD som**: Docker Compose för Azure—förenklad konfiguration för komplexa distributioner.

---

## Vanliga frågor

**F: Kan jag använda ett annat programmeringsspråk?**  
S: Ja! Ersätt `src/web/` med Node.js, C#, Go eller något annat språk. Uppdatera `azure.yaml` och Bicep därefter.

**F: Hur lägger jag till fler databaser?**  
S: Lägg till en annan SQL Database-modul i `infra/main.bicep` eller använd PostgreSQL/MySQL från Azure Database-tjänster.

**F: Kan jag använda detta i produktion?**  
S: Detta är en utgångspunkt. För produktion, lägg till: managed identity, private endpoints, redundans, backupstrategi, WAF och förbättrad övervakning.

**F: Vad händer om jag vill använda containers istället för koddistribution?**  
S: Se [Exempel på Container Apps](../../../../examples/container-app) som använder Docker-containrar i hela lösningen.

**F: Hur ansluter jag till databasen från min lokala dator?**  
S: Lägg till din IP i SQL Servers brandvägg:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**F: Kan jag använda en befintlig databas istället för att skapa en ny?**  
S: Ja, ändra `infra/main.bicep` för att referera till en befintlig SQL Server och uppdatera anslutningssträngsparametrarna.

---

> **Obs:** Detta exempel demonstrerar bästa praxis för att distribuera en webbapp med en databas med AZD. Den inkluderar fungerande kod, omfattande dokumentation och praktiska övningar för att förstärka inlärningen. För produktionsdistributioner, granska säkerhet, skalning, efterlevnad och kostnadskrav som är specifika för din organisation.

**📚 Kursnavigering:**
- ← Föregående: [Exempel på Container Apps](../../../../examples/container-app)
- → Nästa: [AI-integrationsguide](../../../../docs/ai-foundry)
- 🏠 [Kursens startsida](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten Co-op Translator (https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet bör du vara medveten om att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på sitt originalspråk ska betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->