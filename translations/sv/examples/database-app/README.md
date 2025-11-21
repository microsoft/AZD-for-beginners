<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-21T10:08:02+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "sv"
}
-->
# Distribuera en Microsoft SQL-databas och webbapp med AZD

⏱️ **Beräknad tid**: 20-30 minuter | 💰 **Beräknad kostnad**: ~15-25 USD/månad | ⭐ **Komplexitet**: Medel

Detta **kompletta, fungerande exempel** visar hur du använder [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) för att distribuera en Python Flask-webbapplikation med en Microsoft SQL-databas till Azure. All kod ingår och är testad – inga externa beroenden krävs.

## Vad du kommer att lära dig

Genom att slutföra detta exempel kommer du att:
- Distribuera en flerskiktsapplikation (webbapp + databas) med infrastruktur-som-kod
- Konfigurera säkra databasanslutningar utan att hårdkoda hemligheter
- Övervaka applikationens hälsa med Application Insights
- Hantera Azure-resurser effektivt med AZD CLI
- Följa Azures bästa praxis för säkerhet, kostnadsoptimering och övervakning

## Scenariobeskrivning
- **Webbapp**: Python Flask REST API med databasanslutning
- **Databas**: Azure SQL-databas med exempeldata
- **Infrastruktur**: Tillhandahålls med Bicep (modulära, återanvändbara mallar)
- **Distribution**: Fullt automatiserad med `azd`-kommandon
- **Övervakning**: Application Insights för loggar och telemetri

## Förutsättningar

### Nödvändiga verktyg

Innan du börjar, kontrollera att du har dessa verktyg installerade:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (version 2.50.0 eller högre)
   ```sh
   az --version
   # Förväntad output: azure-cli 2.50.0 eller högre
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (version 1.0.0 eller högre)
   ```sh
   azd version
   # Förväntad output: azd version 1.0.0 eller högre
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (för lokal utveckling)
   ```sh
   python --version
   # Förväntad output: Python 3.8 eller högre
   ```

4. **[Docker](https://www.docker.com/get-started)** (valfritt, för lokal containerbaserad utveckling)
   ```sh
   docker --version
   # Förväntad output: Docker version 20.10 eller högre
   ```

### Azure-krav

- Ett aktivt **Azure-abonnemang** ([skapa ett gratis konto](https://azure.microsoft.com/free/))
- Behörighet att skapa resurser i ditt abonnemang
- **Ägare** eller **Medverkande**-roll på abonnemanget eller resursgruppen

### Kunskapsförutsättningar

Detta är ett exempel på **medelnivå**. Du bör vara bekant med:
- Grundläggande kommandoradsoperationer
- Grundläggande molnkoncept (resurser, resursgrupper)
- Grundläggande förståelse för webbapplikationer och databaser

**Ny på AZD?** Börja med [Kom igång-guiden](../../docs/getting-started/azd-basics.md) först.

## Arkitektur

Detta exempel distribuerar en tvåskiktsarkitektur med en webbapplikation och SQL-databas:

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

**Resursdistribution:**
- **Resursgrupp**: Behållare för alla resurser
- **App Service Plan**: Linux-baserad hosting (B1-nivå för kostnadseffektivitet)
- **Webbapp**: Python 3.11 runtime med Flask-applikation
- **SQL Server**: Hanterad databasserver med TLS 1.2 som minimum
- **SQL-databas**: Grundläggande nivå (2GB, lämplig för utveckling/testning)
- **Application Insights**: Övervakning och loggning
- **Log Analytics Workspace**: Centraliserad logglagring

**Liknelse**: Tänk på detta som en restaurang (webbapp) med en frys (databas). Kunder beställer från menyn (API-endpoints), och köket (Flask-app) hämtar ingredienser (data) från frysen. Restaurangchefen (Application Insights) spårar allt som händer.

## Mappstruktur

Alla filer ingår i detta exempel – inga externa beroenden krävs:

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
- **azure.yaml**: Anger för AZD vad som ska distribueras och var
- **infra/main.bicep**: Orkestrerar alla Azure-resurser
- **infra/resources/*.bicep**: Individuella resursdefinitioner (modulära för återanvändning)
- **src/web/app.py**: Flask-applikation med databaslogik
- **requirements.txt**: Python-paketberoenden
- **Dockerfile**: Containeriseringsinstruktioner för distribution

## Snabbstart (steg-för-steg)

### Steg 1: Klona och navigera

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Kontrollera framgång**: Verifiera att du ser `azure.yaml` och mappen `infra/`:
```sh
ls
# Förväntat: README.md, azure.yaml, infra/, src/
```

### Steg 2: Autentisera med Azure

```sh
azd auth login
```

Detta öppnar din webbläsare för Azure-autentisering. Logga in med dina Azure-uppgifter.

**✓ Kontrollera framgång**: Du bör se:
```
Logged in to Azure.
```

### Steg 3: Initiera miljön

```sh
azd init
```

**Vad som händer**: AZD skapar en lokal konfiguration för din distribution.

**Frågor du kommer att få**:
- **Miljönamn**: Ange ett kort namn (t.ex. `dev`, `myapp`)
- **Azure-abonnemang**: Välj ditt abonnemang från listan
- **Azure-plats**: Välj en region (t.ex. `eastus`, `westeurope`)

**✓ Kontrollera framgång**: Du bör se:
```
SUCCESS: New project initialized!
```

### Steg 4: Tillhandahåll Azure-resurser

```sh
azd provision
```

**Vad som händer**: AZD distribuerar all infrastruktur (tar 5-8 minuter):
1. Skapar resursgrupp
2. Skapar SQL Server och databas
3. Skapar App Service Plan
4. Skapar webbapp
5. Skapar Application Insights
6. Konfigurerar nätverk och säkerhet

**Du kommer att bli ombedd att ange**:
- **SQL-administratörsanvändarnamn**: Ange ett användarnamn (t.ex. `sqladmin`)
- **SQL-administratörslösenord**: Ange ett starkt lösenord (spara detta!)

**✓ Kontrollera framgång**: Du bör se:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tid**: 5-8 minuter

### Steg 5: Distribuera applikationen

```sh
azd deploy
```

**Vad som händer**: AZD bygger och distribuerar din Flask-applikation:
1. Paketerar Python-applikationen
2. Bygger Docker-containern
3. Pushar till Azure Web App
4. Initierar databasen med exempeldata
5. Startar applikationen

**✓ Kontrollera framgång**: Du bör se:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Tid**: 3-5 minuter

### Steg 6: Öppna applikationen

```sh
azd browse
```

Detta öppnar din distribuerade webbapp i webbläsaren på `https://app-<unique-id>.azurewebsites.net`

**✓ Kontrollera framgång**: Du bör se JSON-utdata:
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

### Steg 7: Testa API-endpoints

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

**✓ Kontrollera framgång**: Alla endpoints returnerar JSON-data utan fel.

---

**🎉 Grattis!** Du har framgångsrikt distribuerat en webbapplikation med en databas till Azure med hjälp av AZD.

## Konfigurationsfördjupning

### Miljövariabler

Hemligheter hanteras säkert via Azure App Service-konfiguration – **aldrig hårdkodade i källkoden**.

**Konfigureras automatiskt av AZD**:
- `SQL_CONNECTION_STRING`: Databasanslutning med krypterade uppgifter
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Telemetriendpoint för övervakning
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Möjliggör automatisk installation av beroenden

**Var hemligheter lagras**:
1. Under `azd provision` anger du SQL-uppgifter via säkra frågor
2. AZD lagrar dessa i din lokala `.azure/<env-name>/.env`-fil (git-ignorerad)
3. AZD injicerar dem i Azure App Service-konfiguration (krypterade i vila)
4. Applikationen läser dem via `os.getenv()` vid körning

### Lokal utveckling

För lokal testning, skapa en `.env`-fil från exemplet:

```sh
cp .env.sample .env
# Redigera .env med din lokala databasanslutning
```

**Lokal utvecklingsarbetsflöde**:
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

Alla Azure-resurser definieras i **Bicep-mallar** (mappen `infra/`):

- **Modulär design**: Varje resurstyp har sin egen fil för återanvändning
- **Parametriserad**: Anpassa SKU:er, regioner, namngivningskonventioner
- **Bästa praxis**: Följer Azures namngivningsstandarder och säkerhetsstandarder
- **Versionskontrollerad**: Infrastrukturändringar spåras i Git

**Exempel på anpassning**:
För att ändra databastyp, redigera `infra/resources/sql-database.bicep`:
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
- ✅ Uppgifter lagras i Azure App Service-konfiguration (krypterade)
- ✅ `.env`-filer exkluderas från Git via `.gitignore`
- ✅ Hemligheter skickas via säkra parametrar under tillhandahållande

### 2. **Krypterade anslutningar**
- ✅ TLS 1.2 som minimum för SQL Server
- ✅ Endast HTTPS aktiverat för webbappen
- ✅ Databasanslutningar använder krypterade kanaler

### 3. **Nätverkssäkerhet**
- ✅ SQL Server-brandvägg konfigurerad för att endast tillåta Azure-tjänster
- ✅ Offentlig nätverksåtkomst begränsad (kan ytterligare låsas med privata slutpunkter)
- ✅ FTPS inaktiverat på webbappen

### 4. **Autentisering och auktorisering**
- ⚠️ **Nuvarande**: SQL-autentisering (användarnamn/lösenord)
- ✅ **Rekommendation för produktion**: Använd Azure Managed Identity för lösenordslös autentisering

**För att uppgradera till Managed Identity** (för produktion):
1. Aktivera hanterad identitet på webbappen
2. Ge identiteten SQL-behörigheter
3. Uppdatera anslutningssträngen för att använda hanterad identitet
4. Ta bort lösenordsbaserad autentisering

### 5. **Revision och efterlevnad**
- ✅ Application Insights loggar alla förfrågningar och fel
- ✅ SQL-databasrevision aktiverad (kan konfigureras för efterlevnad)
- ✅ Alla resurser taggade för styrning

**Säkerhetschecklista före produktion**:
- [ ] Aktivera Azure Defender för SQL
- [ ] Konfigurera privata slutpunkter för SQL-databasen
- [ ] Aktivera Web Application Firewall (WAF)
- [ ] Implementera Azure Key Vault för hemlighetsrotation
- [ ] Konfigurera Azure AD-autentisering
- [ ] Aktivera diagnostikloggning för alla resurser

## Kostnadsoptimering

**Beräknade månadskostnader** (från och med november 2025):

| Resurs | SKU/Nivå | Beräknad kostnad |
|--------|----------|------------------|
| App Service Plan | B1 (Basic) | ~13 USD/månad |
| SQL-databas | Grundläggande (2GB) | ~5 USD/månad |
| Application Insights | Betala per användning | ~2 USD/månad (låg trafik) |
| **Totalt** | | **~20 USD/månad** |

**💡 Kostnadsbesparingstips**:

1. **Använd gratisnivå för inlärning**:
   - App Service: F1-nivå (gratis, begränsade timmar)
   - SQL-databas: Använd Azure SQL Database serverless
   - Application Insights: 5GB/månad gratis insamling

2. **Stoppa resurser när de inte används**:
   ```sh
   # Stoppa webbappen (databasen debiterar fortfarande)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Starta om vid behov
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Ta bort allt efter testning**:
   ```sh
   azd down
   ```
   Detta tar bort ALLA resurser och stoppar kostnader.

4. **Utvecklings- vs. produktions-SKU:er**:
   - **Utveckling**: Grundläggande nivå (används i detta exempel)
   - **Produktion**: Standard/Premium-nivå med redundans

**Kostnadsövervakning**:
- Visa kostnader i [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Ställ in kostnadsvarningar för att undvika överraskningar
- Tagga alla resurser med `azd-env-name` för spårning

**Gratisnivåalternativ**:
För inlärningsändamål kan du ändra `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Obs**: Gratisnivån har begränsningar (60 min/dag CPU, ingen alltid-på).

## Övervakning och observabilitet

### Application Insights-integration

Detta exempel inkluderar **Application Insights** för omfattande övervakning:

**Vad som övervakas**:
- ✅ HTTP-förfrågningar (latens, statuskoder, endpoints)
- ✅ Applikationsfel och undantag
- ✅ Anpassad loggning från Flask-appen
- ✅ Databasanslutningens hälsa
- ✅ Prestandamått (CPU, minne)

**Åtkomst till Application Insights**:
1. Öppna [Azure Portal](https://portal.azure.com)
2. Navigera till din resursgrupp (`rg-<env-name>`)
3. Klicka på Application Insights-resursen (`appi-<unique-id>`)

**Användbara frågor** (Application Insights → Loggar):

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

**SQL-databasrevision är aktiverad** för att spåra:
- Databasåtkomstmönster
- Misslyckade inloggningsförsök
- Schematändringar
- Dataåtkomst (för efterlevnad)

**Åtkomst till revisionsloggar**:
1. Azure Portal → SQL-databas → Revision
2. Visa loggar i Log Analytics-arbetsytan

### Realtidsövervakning

**Visa live-mått**:
1. Application Insights → Live Metrics
2. Se förfrågningar, fel och prestanda i realtid

**Ställ in varningar**:
Skapa varningar för kritiska händelser:
- HTTP 500-fel > 5 på 5 minuter
- Databasanslutningsfel
- Höga svarstider (>2 sekunder)

**Exempel på att skapa en varning**:
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

**Symptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Lösning**:
Välj en annan Azure-region eller registrera resursleverantören:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. SQL-anslutning misslyckas under distribution

**Symptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Lösning**:
- Kontrollera att SQL Server-brandväggen tillåter Azure-tjänster (konfigureras automatiskt)
- Kontrollera att SQL-administratörslösenordet angavs korrekt under `azd provision`
- Säkerställ att SQL Server är fullt provisionerad (kan ta 2-3 minuter)

**Verifiera anslutning**:
```sh
# Från Azure Portal, gå till SQL Database → Query editor
# Försök att ansluta med dina inloggningsuppgifter
```

#### 3. Webbappen visar "Applikationsfel"

**Symptom**:
Webbläsaren visar en generisk felmeddelandesida.

**Lösning**:
Kontrollera applikationsloggar:
```sh
# Visa senaste loggar
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Vanliga orsaker**:
- Saknade miljövariabler (kontrollera App Service → Konfiguration)
- Fel vid installation av Python-paket (kontrollera distributionsloggar)
- Fel vid databasinitialisering (kontrollera SQL-anslutning)

#### 4. `azd deploy` misslyckas med "Byggfel"

**Symptom**:
```
Error: Failed to build project
```

**Lösning**:
- Kontrollera att `requirements.txt` inte har syntaxfel
- Kontrollera att Python 3.11 är angivet i `infra/resources/web-app.bicep`
- Verifiera att Dockerfile har rätt basbild

**Felsök lokalt**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Obehörig" vid körning av AZD-kommandon

**Symptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Lösning**:
Autentisera om med Azure:
```sh
azd auth login
az login
```

Verifiera att du har rätt behörigheter (Contributor-roll) på prenumerationen.

#### 6. Höga databasavgifter

**Symptom**:
Oväntad Azure-faktura.

**Lösning**:
- Kontrollera om du glömde köra `azd down` efter testning
- Verifiera att SQL-databasen använder Basic-nivå (inte Premium)
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

**Åtkomst till applikationsloggar**:
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```

**Behöver du mer hjälp?**
- [AZD Felsökningsguide](../../docs/troubleshooting/common-issues.md)
- [Azure App Service Felsökning](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Azure SQL Felsökning](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Praktiska övningar

### Övning 1: Verifiera din distribution (Nybörjare)

**Mål**: Bekräfta att alla resurser är distribuerade och att applikationen fungerar.

**Steg**:
1. Lista alla resurser i din resursgrupp:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Förväntat**: 6-7 resurser (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testa alla API-slutpunkter:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
   **Förväntat**: Alla returnerar giltig JSON utan fel

3. Kontrollera Application Insights:
   - Navigera till Application Insights i Azure Portal
   - Gå till "Live Metrics"
   - Uppdatera din webbläsare på webbappen
   **Förväntat**: Se förfrågningar visas i realtid

**Framgångskriterier**: Alla 6-7 resurser finns, alla slutpunkter returnerar data, Live Metrics visar aktivitet.

---

### Övning 2: Lägg till en ny API-slutpunkt (Mellanliggande)

**Mål**: Utöka Flask-applikationen med en ny slutpunkt.

**Startkod**: Nuvarande slutpunkter i `src/web/app.py`

**Steg**:
1. Redigera `src/web/app.py` och lägg till en ny slutpunkt efter funktionen `get_product()`:
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

3. Testa den nya slutpunkten:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Förväntat**: Returnerar produkter som matchar "laptop"

**Framgångskriterier**: Ny slutpunkt fungerar, returnerar filtrerade resultat, visas i Application Insights-loggar.

---

### Övning 3: Lägg till övervakning och varningar (Avancerad)

**Mål**: Ställ in proaktiv övervakning med varningar.

**Steg**:
1. Skapa en varning för HTTP 500-fel:
   ```sh
   # Hämta Application Insights-resurs-ID
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Skapa varning
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```

2. Utlös varningen genom att orsaka fel:
   ```sh
   # Begär en icke-existerande produkt
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Kontrollera om varningen utlösts:
   - Azure Portal → Alerts → Alert Rules
   - Kontrollera din e-post (om konfigurerad)

**Framgångskriterier**: Varningsregel är skapad, utlöses vid fel, meddelanden tas emot.

---

### Övning 4: Ändringar i databasens schema (Avancerad)

**Mål**: Lägg till en ny tabell och ändra applikationen för att använda den.

**Steg**:
1. Anslut till SQL-databasen via Azure Portal Query Editor

2. Skapa en ny tabell `categories`:
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

3. Uppdatera `src/web/app.py` för att inkludera kategorinformation i svaren

4. Distribuera och testa

**Framgångskriterier**: Ny tabell finns, produkter visar kategorinformation, applikationen fungerar fortfarande.

---

### Övning 5: Implementera caching (Expert)

**Mål**: Lägg till Azure Redis Cache för att förbättra prestandan.

**Steg**:
1. Lägg till Redis Cache i `infra/main.bicep`
2. Uppdatera `src/web/app.py` för att cachelagra produktförfrågningar
3. Mäta prestandaförbättring med Application Insights
4. Jämför svarstider före/efter caching

**Framgångskriterier**: Redis är distribuerad, caching fungerar, svarstider förbättras med >50%.

**Tips**: Börja med [Azure Cache for Redis-dokumentation](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Rensning

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
- Alla resurser är borttagna från Azure Portal
- Inga löpande kostnader
- Lokal `.azure/<env-name>`-mapp kan tas bort

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
- [Bicep Language Reference](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Nästa steg i denna kurs
- **[Exempel på Container Apps](../../../../examples/container-app)**: Distribuera mikrotjänster med Azure Container Apps
- **[AI-integrationsguide](../../../../docs/ai-foundry)**: Lägg till AI-funktioner i din app
- **[Distributionsbästa praxis](../../docs/deployment/deployment-guide.md)**: Mönster för produktionsdistribution

### Avancerade ämnen
- **Managed Identity**: Ta bort lösenord och använd Azure AD-autentisering
- **Private Endpoints**: Säkerställ databasanslutningar inom ett virtuellt nätverk
- **CI/CD Integration**: Automatisera distributioner med GitHub Actions eller Azure DevOps
- **Multi-Environment**: Ställ in utvecklings-, staging- och produktionsmiljöer
- **Database Migrations**: Använd Alembic eller Entity Framework för schemahantering

### Jämförelse med andra metoder

**AZD vs. ARM Templates**:
- ✅ AZD: Högre abstraktionsnivå, enklare kommandon
- ⚠️ ARM: Mer detaljerat, granulär kontroll

**AZD vs. Terraform**:
- ✅ AZD: Azure-native, integrerat med Azure-tjänster
- ⚠️ Terraform: Multi-cloud-stöd, större ekosystem

**AZD vs. Azure Portal**:
- ✅ AZD: Reproducerbart, versionskontrollerat, automatiserbart
- ⚠️ Portal: Manuella klick, svårt att reproducera

**Tänk på AZD som**: Docker Compose för Azure—förenklad konfiguration för komplexa distributioner.

---

## Vanliga frågor

**F: Kan jag använda ett annat programmeringsspråk?**  
S: Ja! Ersätt `src/web/` med Node.js, C#, Go eller valfritt språk. Uppdatera `azure.yaml` och Bicep därefter.

**F: Hur lägger jag till fler databaser?**  
S: Lägg till en annan SQL Database-modul i `infra/main.bicep` eller använd PostgreSQL/MySQL från Azure Database-tjänster.

**F: Kan jag använda detta för produktion?**  
S: Detta är en startpunkt. För produktion, lägg till: managed identity, private endpoints, redundans, backupstrategi, WAF och förbättrad övervakning.

**F: Vad händer om jag vill använda containrar istället för koddistribution?**  
S: Kolla in [Exempel på Container Apps](../../../../examples/container-app) som använder Docker-containrar genomgående.

**F: Hur ansluter jag till databasen från min lokala maskin?**  
S: Lägg till din IP i SQL Server-brandväggen:
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

> **Obs:** Detta exempel demonstrerar bästa praxis för att distribuera en webbapp med en databas med hjälp av AZD. Det inkluderar fungerande kod, omfattande dokumentation och praktiska övningar för att förstärka lärandet. För produktionsdistributioner, granska säkerhet, skalning, efterlevnad och kostnadskrav specifika för din organisation.

**📚 Kursnavigering:**
- ← Föregående: [Exempel på Container Apps](../../../../examples/container-app)
- → Nästa: [AI-integrationsguide](../../../../docs/ai-foundry)
- 🏠 [Kursens startsida](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:  
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, bör du vara medveten om att automatiserade översättningar kan innehålla fel eller felaktigheter. Det ursprungliga dokumentet på dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för eventuella missförstånd eller feltolkningar som uppstår vid användning av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->