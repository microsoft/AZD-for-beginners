# Implementarea unei baze de date Microsoft SQL și a unei aplicații web cu AZD

⏱️ **Timp estimat**: 20-30 minute | 💰 **Cost estimat**: ~15-25$/lună | ⭐ **Complexitate**: Intermediar

Acest **exemplu complet și funcțional** demonstrează cum să folosiți [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) pentru a implementa o aplicație web Python Flask cu o bază de date Microsoft SQL în Azure. Tot codul este inclus și testat — nu sunt necesare dependențe externe.

## Ce veți învăța

Prin finalizarea acestui exemplu, veți:
- Implementa o aplicație multi-strat (aplicație web + bază de date) folosind infrastructură ca cod
- Configura conexiuni securizate la baza de date fără a introduce secrete în cod
- Monitoriza starea aplicației cu Application Insights
- Gestiona resurse Azure eficient cu CLI AZD
- Urma cele mai bune practici Azure pentru securitate, optimizarea costurilor și observabilitate

## Prezentarea scenariului
- **Aplicație web**: API REST Python Flask cu conectivitate la bază de date
- **Bază de date**: Azure SQL Database cu date de exemplu
- **Infrastructură**: Provisionată prin Bicep (șabloane modulare, reutilizabile)
- **Implementare**: Complet automatizată cu comenzi `azd`
- **Monitorizare**: Application Insights pentru jurnalizare și telemetrie

## Cerințe preliminare

### Unelte necesare

Înainte de a începe, verificați dacă aveți instalate aceste unelte:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versiunea 2.50.0 sau mai nouă)
   ```sh
   az --version
   # Rezultatul așteptat: azure-cli 2.50.0 sau o versiune mai nouă
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versiunea 1.0.0 sau mai nouă)
   ```sh
   azd version
   # Rezultatul așteptat: versiunea azd 1.0.0 sau mai nouă
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (pentru dezvoltare locală)
   ```sh
   python --version
   # Rezultat așteptat: Python 3.8 sau versiune mai nouă
   ```

4. **[Docker](https://www.docker.com/get-started)** (opțional, pentru dezvoltare locală containerizată)
   ```sh
   docker --version
   # Rezultat așteptat: versiunea Docker 20.10 sau mai mare
   ```

### Cerințe Azure

- Un **abonament Azure activ** ([creează un cont gratuit](https://azure.microsoft.com/free/))
- Permisiuni pentru a crea resurse în abonamentul tău
- Rol de **Proprietar** sau **Contribuitor** pe abonament sau grupul de resurse

### Cunoștințe preliminare

Acesta este un exemplu de nivel **intermediar**. Ar trebui să cunoașteți:
- Operațiuni de bază în linia de comandă
- Concepte fundamentale despre cloud (resurse, grupuri de resurse)
- Înțelegerea de bază a aplicațiilor web și a bazelor de date

**Nou în AZD?** Începeți cu [ghidul de început](../../docs/chapter-01-foundation/azd-basics.md).

## Arhitectură

Acest exemplu implementează o arhitectură în două niveluri cu o aplicație web și o bază de date SQL:

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

**Implementarea resurselor:**
- **Grup de resurse**: Container pentru toate resursele
- **Plan de serviciu App Service**: Hosting pe Linux (nivel B1 pentru eficiență cost)
- **Aplicație web**: Runtime Python 3.11 cu aplicație Flask
- **Server SQL**: Server de bază de date gestionat cu TLS 1.2 minim
- **Bază de date SQL**: Nivel de bază (2GB, potrivit pentru dezvoltare/testare)
- **Application Insights**: Monitorizare și jurnalizare
- **Workspace Log Analytics**: Stocare centralizată loguri

**Analogie**: Gândiți-vă la asta ca la un restaurant (aplicație web) cu un congelator (baza de date). Clienții comandă de pe meniu (endpoint-uri API), iar bucătarul (aplicația Flask) extrage ingredientele (datele) din congelator. Managerul restaurantului (Application Insights) urmărește tot ce se întâmplă.

## Structura folderelor

Toate fișierele sunt incluse în acest exemplu — nu sunt necesare dependențe externe:

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

**Ce face fiecare fișier:**
- **azure.yaml**: Spune AZD ce și unde să implementeze
- **infra/main.bicep**: Coordonează toate resursele Azure
- **infra/resources/*.bicep**: Definiții individuale pentru resurse (modular pentru reutilizare)
- **src/web/app.py**: Aplicația Flask cu logica bazei de date
- **requirements.txt**: Dependențe Python
- **Dockerfile**: Instrucțiuni de containerizare pentru implementare

## Quickstart (pas cu pas)

### Pasul 1: Clonați și navigați

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificare reușită**: Verificați să vedeți `azure.yaml` și folderul `infra/`:
```sh
ls
# Așteptat: README.md, azure.yaml, infra/, src/
```

### Pasul 2: Autentificare în Azure

```sh
azd auth login
```

Se va deschide browserul pentru autentificare Azure. Conectați-vă cu acreditările Azure.

**✓ Verificare reușită**: Ar trebui să vedeți:
```
Logged in to Azure.
```

### Pasul 3: Inițializați mediul

```sh
azd init
```

**Ce se întâmplă**: AZD creează o configurație locală pentru implementare.

**Prompt-urile afișate**:
- **Nume mediu**: Introduceți un nume scurt (ex.: `dev`, `myapp`)
- **Abonament Azure**: Selectați abonamentul din listă
- **Locație Azure**: Alegeți o regiune (ex.: `eastus`, `westeurope`)

**✓ Verificare reușită**: Ar trebui să vedeți:
```
SUCCESS: New project initialized!
```

### Pasul 4: Provisionați resurse Azure

```sh
azd provision
```

**Ce se întâmplă**: AZD implementează toată infrastructura (5-8 minute):
1. Creează grupul de resurse
2. Creează serverul și baza de date SQL
3. Creează planul App Service
4. Creează aplicația web
5. Creează Application Insights
6. Configurează rețea și securitate

**Veți fi întrebat**:
- **Nume utilizator admin SQL**: Introduceți un nume (ex.: `sqladmin`)
- **Parolă admin SQL**: Introduceți o parolă puternică (salvați-o!)

**✓ Verificare reușită**: Ar trebui să vedeți:
```
SUCCESS: Your application was provisioned in Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Timp**: 5-8 minute

### Pasul 5: Implementați aplicația

```sh
azd deploy
```

**Ce se întâmplă**: AZD compilează și implementează aplicația Flask:
1. Pregătește pachetul Python
2. Construiește containerul Docker
3. Trimite containerul la Azure Web App
4. Inițializează baza de date cu date de exemplu
5. Pornește aplicația

**✓ Verificare reușită**: Ar trebui să vedeți:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
You can view the resources created under the resource group rg-<env-name> in Azure Portal:
https://portal.azure.com/#@/resource/subscriptions/.../resourceGroups/rg-<env-name>
```

**⏱️ Timp**: 3-5 minute

### Pasul 6: Accesați aplicația

```sh
azd browse
```

Se va deschide în browser aplicația web la `https://app-<unique-id>.azurewebsites.net`

**✓ Verificare reușită**: Ar trebui să vedeți ieșire JSON:
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

### Pasul 7: Testați endpoint-urile API

**Verificare sănătate** (verificați conexiunea bazei de date):
```sh
curl https://app-<your-id>.azurewebsites.net/health
```

**Răspuns așteptat**:
```json
{
  "status": "healthy",
  "database": "connected"
}
```

**Listare produse** (date de exemplu):
```sh
curl https://app-<your-id>.azurewebsites.net/products
```

**Răspuns așteptat**:
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

**Obține un produs**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificare reușită**: Toate endpoint-urile returnează date JSON fără erori.

---

**🎉 Felicitări!** Ați implementat cu succes o aplicație web cu bază de date în Azure folosind AZD.

## Detalii despre configurare

### Variabile de mediu

Secretele sunt gestionate securizat prin configurația Azure App Service — **nu se codifică niciodată în sursă**.

**Configurate automat de AZD**:
- `SQL_CONNECTION_STRING`: Conexiune la baza de date cu credențiale criptate
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint de telemetrie pentru monitorizare
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Activează instalarea automată a dependențelor

**Unde sunt stocate secretele**:
1. În timpul `azd provision`, introduceți credențialele SQL prin prompturi securizate
2. AZD le salvează local în `.azure/<nume-mediu>/.env` (ignorată de Git)
3. AZD le injectează în configurația Azure App Service (criptate la stocare)
4. Aplicația le citește prin `os.getenv()` la execuție

### Dezvoltare locală

Pentru testare locală, creați un fișier `.env` din exemplul:

```sh
cp .env.sample .env
# Editează .env cu conexiunea ta locală la baza de date
```

**Fluxul de lucru pentru dezvoltare locală**:
```sh
# Instalează dependențele
cd src/web
pip install -r requirements.txt

# Configurează variabilele de mediu
export SQL_CONNECTION_STRING="your-local-connection-string"

# Rulează aplicația
python app.py
```

**Testați local**:
```sh
curl http://localhost:8000/health
# Așteptat: {"status": "sănătos", "bază de date": "conectată"}
```

### Infrastructură ca cod

Toate resursele Azure sunt definite în șabloane **Bicep** (`infra/`):

- **Design modular**: Fiecare tip de resursă are fișierul său pentru reutilizare
- **Parametrizate**: Puteți modifica SKU-uri, regiuni, convenții de nume
- **Cele mai bune practici**: Urmează standardele Azure de numire și securitate
- **Control versiuni**: Modificările infrastructurii sunt urmărite în Git

**Exemplu personalizare**:
Pentru a schimba nivelul bazei de date, editați `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Cele mai bune practici de securitate

Acest exemplu urmează cele mai bune practici Azure pentru securitate:

### 1. **Fără secrete în codul sursă**
- ✅ Credențiale stocate în configurația Azure App Service (criptate)
- ✅ Fișiere `.env` excluse din Git prin `.gitignore`
- ✅ Secrete transmise prin parametri securizați la provisioning

### 2. **Conexiuni criptate**
- ✅ TLS 1.2 minim pentru server SQL
- ✅ Aplicația web folosește HTTPS exclusiv
- ✅ Conexiunile la baza de date sunt criptate

### 3. **Securitate de rețea**
- ✅ Firewall-ul serverului SQL permite doar servicii Azure
- ✅ Accesul public restricționat (poate fi securizat suplimentar cu endpoint-uri private)
- ✅ FTPS dezactivat pe aplicația web

### 4. **Autentificare și autorizare**
- ⚠️ **În prezent**: Autentificare SQL (username/parolă)
- ✅ **Recomandare producție**: Folosiți identitate gestionată Azure pentru autentificare fără parolă

**Pentru upgrade la identitate gestionată** (în producție):
1. Activați identitatea gestionată pe aplicația web
2. Acordați permisiuni SQL identității
3. Actualizați stringul de conexiune pentru identitate gestionată
4. Înlăturați autentificarea pe bază de parolă

### 5. **Audit și conformitate**
- ✅ Application Insights înregistrează toate cererile și erorile
- ✅ Auditarea bazei de date SQL activată (configurabilă pentru conformitate)
- ✅ Toate resursele sunt etichetate pentru guvernanță

**Lista pentru securitate înainte de producție**:
- [ ] Activați Azure Defender pentru SQL
- [ ] Configurați endpoint-uri private pentru baza de date SQL
- [ ] Activați Web Application Firewall (WAF)
- [ ] Implementați Azure Key Vault pentru rotația secretelor
- [ ] Configurați autentificarea Azure AD
- [ ] Activați jurnalizarea diagnostică pentru toate resursele

## Optimizarea costurilor

**Costuri lunare estimate** (la noiembrie 2025):

| Resursă | SKU/Nivel | Cost estimat |
|----------|----------|--------------|
| Plan App Service | B1 (Basic) | ~13$/lună |
| Bază de date SQL | Basic (2GB) | ~5$/lună |
| Application Insights | Plată după consum | ~2$/lună (trafic redus) |
| **Total** | | **~20$/lună** |

**💡 Sfaturi pentru reducerea costurilor**:

1. **Folosiți nivelul gratuit pentru învățare**:
   - App Service: nivel F1 (gratuit, ore limitate)
   - Baza de date SQL: Azure SQL Database serverless
   - Application Insights: 5GB/lună ingestie gratuită

2. **Opriți resursele când nu le folosiți**:
   ```sh
   # Stop the web app (database still charges)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Restart when needed
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Ștergeți tot după testare**:
   ```sh
   azd down
   ```
   Aceasta elimină TOATE resursele și oprește taxarea.

4. **SKU-uri pentru dezvoltare vs producție**:
   - **Dezvoltare**: nivel Basic (folosit în acest exemplu)
   - **Producție**: nivel Standard/Premium cu redundanță

**Monitorizare costuri**:
- Vizualizați costurile în [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configurați alerte pentru costuri pentru a evita surprize
- Etichetați toate resursele cu `azd-env-name` pentru urmărire

**Alternativă nivel gratuit**:
Pentru învățare, puteți modifica `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Notă**: Nivelul gratuit are limitări (60 min/zi CPU, fără always-on).

## Monitorizare și observabilitate

### Integrare Application Insights

Acest exemplu include **Application Insights** pentru monitorizare completă:

**Ce se monitorizează**:
- ✅ Cereri HTTP (latență, coduri de stare, endpoint-uri)
- ✅ Erori și excepții în aplicație
- ✅ Jurnalizare personalizată din aplicația Flask
- ✅ Starea conexiunii la baza de date
- ✅ Metrice de performanță (CPU, memorie)

**Accesați Application Insights**:
1. Deschideți [Portal Azure](https://portal.azure.com)
2. Navigați la grupul de resurse (`rg-<nume-mediu>`)
3. Faceți clic pe resursa Application Insights (`appi-<unique-id>`)

**Interogări utile** (Application Insights → Logs):

**Vezi toate cererile**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Găsește erori**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Verifică endpoint-ul health**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditarea bazei de date SQL

**Auditarea bazei de date SQL este activată** pentru a urmări:
- Modelele de acces la baza de date
- Încercările eșuate de autentificare
- Modificările schemei
- Accesul la date (pentru conformitate)

**Accesați logurile de audit**:
1. Portal Azure → Baza de date SQL → Auditare
2. Vizualizați jurnalele în workspace Log Analytics

### Monitorizare în timp real

**Vizualizați metricle live**:
1. Application Insights → Live Metrics
2. Urmăriți cererile, erorile și performanța în timp real

**Configurați alerte**:
Creați alerte pentru evenimente critice:
- Erori HTTP 500 > 5 în 5 minute
- Erori conexiune la baza de date
- Timpi de răspuns mari (>2 secunde)

**Exemplu de creare alertă**:  
```sh
az monitor metrics alert create \
  --name "High-Response-Time" \
  --resource-group <rg-name> \
  --scopes <app-insights-resource-id> \
  --condition "avg requests/duration > 2000" \
  --description "Alert when response time exceeds 2 seconds"
```
  
## Depanare

### Probleme comune și soluții

#### 1. `azd provision` eșuează cu mesajul "Location not available"

**Simptom**:  
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```
  
**Soluție**:  
Alege o regiune Azure diferită sau înregistrează furnizorul de resurse:  
```sh
az provider register --namespace Microsoft.Insights
```
  
#### 2. Conexiunea SQL eșuează în timpul implementării

**Simptom**:  
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```
  
**Soluție**:  
- Verifică dacă firewall-ul SQL Server permite serviciilor Azure (configurat automat)  
- Verifică dacă parola admin SQL a fost introdusă corect în timpul `azd provision`  
- Asigură-te că SQL Server este complet provisionat (poate dura 2-3 minute)

**Verifică conexiunea**:  
```sh
# Din portalul Azure, accesați SQL Database → Query editor
# Încercați să vă conectați cu acreditările dvs.
```
  
#### 3. Aplicația Web afișează „Application Error”

**Simptom**:  
Browserul afișează o pagină generică de eroare.

**Soluție**:  
Verifică jurnalele aplicației:  
```sh
# Vizualizează jurnalele recente
az webapp log tail --name <app-name> --resource-group <rg-name>
```
  
**Cauze comune**:  
- Variabile de mediu lipsă (verifică App Service → Configurare)  
- Instalarea pachetelor Python a eșuat (verifică jurnalele de implementare)  
- Eroare la inițializarea bazei de date (verifică conectivitatea SQL)

#### 4. `azd deploy` eșuează cu mesajul "Build Error"

**Simptom**:  
```
Error: Failed to build project
```
  
**Soluție**:  
- Asigură-te că `requirements.txt` nu conține erori de sintaxă  
- Verifică dacă Python 3.11 este specificat în `infra/resources/web-app.bicep`  
- Verifică dacă Dockerfile are imaginea de bază corectă

**Depanare locală**:  
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```
  
#### 5. "Unauthorized" când rulezi comenzi AZD

**Simptom**:  
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```
  
**Soluție**:  
Reautentifică-te în Azure:  
```sh
azd auth login
az login
```
  
Verifică dacă ai permisiunile corecte (rol Contributor) pe abonament.

#### 6. Costuri mari pentru bază de date

**Simptom**:  
Factură Azure neașteptată.

**Soluție**:  
- Verifică dacă ai uitat să rulezi `azd down` după testare  
- Asigură-te că SQL Database folosește nivelul Basic (nu Premium)  
- Revizuiește costurile în Azure Cost Management  
- Configurează alerte de cost

### Obținerea ajutorului

**Vezi toate variabilele de mediu AZD**:  
```sh
azd env get-values
```
  
**Verifică starea implementării**:  
```sh
az webapp show --name <app-name> --resource-group <rg-name> --query state
```
  
**Accesează jurnalele aplicației**:  
```sh
az webapp log download --name <app-name> --resource-group <rg-name> --log-file app-logs.zip
```
  
**Ai nevoie de mai mult ajutor?**  
- [Ghid de depanare AZD](../../docs/chapter-07-troubleshooting/common-issues.md)  
- [Depanare Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)  
- [Depanare Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Exerciții practice

### Exercițiul 1: Verifică implementarea ta (Începător)

**Scop**: Confirmă că toate resursele sunt implementate și aplicația funcționează.

**Pași**:  
1. Listează toate resursele din grupul tău de resurse:  
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
  
  **Așteptat**: 6-7 resurse (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testează toate punctele finale ale API-ului:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/
   curl https://app-<your-id>.azurewebsites.net/health
   curl https://app-<your-id>.azurewebsites.net/products
   curl https://app-<your-id>.azurewebsites.net/products/1
   ```
  
  **Așteptat**: Toate returnează JSON valid fără erori

3. Verifică Application Insights:  
   - Navighează la Application Insights în Azure Portal  
   - Accesează "Live Metrics"  
   - Reîncarcă browserul pe aplicația web  
   **Așteptat**: Apar solicitările în timp real

**Criterii de succes**: Există toate cele 6-7 resurse, toate endpoint-urile returnează date, Live Metrics arată activitate.

---

### Exercițiul 2: Adaugă un nou endpoint API (Intermediar)

**Scop**: Extinde aplicația Flask cu un nou endpoint.

**Cod de pornire**: Endpoint-urile curente în `src/web/app.py`

**Pași**:  
1. Editează `src/web/app.py` și adaugă un nou endpoint după funcția `get_product()`:  
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
  
2. Implementează aplicația actualizată:  
   ```sh
   azd deploy
   ```
  
3. Testează noul endpoint:  
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
  
  **Așteptat**: Returnează produse care corespund "laptop"

**Criterii de succes**: Noul endpoint funcționează, returnează rezultate filtrate, apare în jurnalele Application Insights.

---

### Exercițiul 3: Adaugă monitorizare și alerte (Avansat)

**Scop**: Configurează monitorizare proactivă cu alerte.

**Pași**:  
1. Creează o alertă pentru erori HTTP 500:  
   ```sh
   # Obțineți ID-ul resursei Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Creați o alertă
   az monitor metrics alert create \
     --name "High-Error-Rate" \
     --resource-group rg-<env-name> \
     --scopes $AI_ID \
     --condition "count requests/failed > 5" \
     --window-size 5m \
     --evaluation-frequency 1m \
     --description "Alert when >5 failed requests in 5 minutes"
   ```
  
2. Declanșează alerta provocând erori:  
   ```sh
   # Solicitați un produs inexistent
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```
  
3. Verifică dacă alerta a fost declanșată:  
   - Azure Portal → Alerts → Alert Rules  
   - Verifică-ți emailul (dacă este configurat)

**Criterii de succes**: Regula de alertă este creată, se declanșează la erori, notificările sunt primite.

---

### Exercițiul 4: Modificări de schemă a bazei de date (Avansat)

**Scop**: Adaugă un nou tabel și modifică aplicația să îl folosească.

**Pași**:  
1. Conectează-te la SQL Database prin Query Editor din Azure Portal

2. Creează un nou tabel `categories`:  
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
  
3. Actualizează `src/web/app.py` pentru a include informații despre categorie în răspunsuri

4. Implementează și testează

**Criterii de succes**: Noul tabel există, produsele afișează informații despre categorie, aplicația funcționează în continuare.

---

### Exercițiul 5: Implementează caching (Expert)

**Scop**: Adaugă Azure Redis Cache pentru a îmbunătăți performanța.

**Pași**:  
1. Adaugă Redis Cache în `infra/main.bicep`  
2. Actualizează `src/web/app.py` pentru a face caching la interogările produselor  
3. Măsoară îmbunătățirea performanței cu Application Insights  
4. Compară timpii de răspuns înainte și după caching

**Criterii de succes**: Redis este implementat, caching-ul funcționează, timpii de răspuns se îmbunătățesc cu >50%.

**Sfat**: Începe cu [documentația Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Curățare

Pentru a evita taxe continue, șterge toate resursele când ai terminat:

```sh
azd down
```
  
**Prompt de confirmare**:  
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```
  
Tastează `y` pentru confirmare.

**✓ Verificare de succes**:  
- Toate resursele sunt șterse din Azure Portal  
- Nu există taxe continue  
- Folderul local `.azure/<env-name>` poate fi șters

**Alternativ** (păstrează infrastructura, șterge datele):  
```sh
# Șterge doar grupul de resurse (păstrează configurația AZD)
az group delete --name rg-<env-name> --yes
```
  
## Află mai multe

### Documentație relevantă  
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)  
- [Documentația Azure SQL Database](https://learn.microsoft.com/azure/azure-sql/database/)  
- [Documentația Azure App Service](https://learn.microsoft.com/azure/app-service/)  
- [Documentația Application Insights](https://learn.microsoft.com/azure/azure-monitor/app/app-insights-overview)  
- [Referință limbaj Bicep](https://learn.microsoft.com/azure/azure-resource-manager/bicep/)

### Pașii următori în acest curs  
- **[Exemplu Container Apps](../../../../examples/container-app)**: Implementează microservicii cu Azure Container Apps  
- **[Ghid Integrare AI](../../../../docs/ai-foundry)**: Adaugă capabilități AI aplicației tale  
- **[Cele mai bune practici de implementare](../../docs/chapter-04-infrastructure/deployment-guide.md)**: Modele de implementare în producție

### Subiecte avansate  
- **Identitate gestionată**: Elimină parolele și folosește autentificarea Azure AD  
- **Puncte finale private**: Securizează conexiunile bazei de date în rețea virtuală  
- **Integrare CI/CD**: Automatizează implementările cu GitHub Actions sau Azure DevOps  
- **Mediu multi-instante**: Configurează medii de dezvoltare, testare și producție  
- **Migrații baze de date**: Folosește Alembic sau Entity Framework pentru versionarea schemei

### Comparație cu alte abordări

**AZD vs. ARM Templates**:  
- ✅ AZD: Abstracție de nivel înalt, comenzi simple  
- ⚠️ ARM: Mai detaliat, control granular

**AZD vs. Terraform**:  
- ✅ AZD: Nativ Azure, integrat cu servicii Azure  
- ⚠️ Terraform: Multi-cloud, ecosistem mai mare

**AZD vs. Azure Portal**:  
- ✅ AZD: Repetabil, controlat prin versiuni, automatizabil  
- ⚠️ Portal: Click manual, greu de reprodus

**Gândește AZD ca pe**: Docker Compose pentru Azure — configurare simplificată pentru implementări complexe.

---

## Întrebări frecvente

**Î: Pot folosi un alt limbaj de programare?**  
R: Da! Înlocuiește `src/web/` cu Node.js, C#, Go sau orice limbaj. Actualizează `azure.yaml` și Bicep corespunzător.

**Î: Cum adaug mai multe baze de date?**  
R: Adaugă un alt modul SQL Database în `infra/main.bicep` sau folosește PostgreSQL/MySQL din serviciile Azure Database.

**Î: Pot folosi asta în producție?**  
R: Acesta este un punct de pornire. Pentru producție, adaugă: identitate gestionată, puncte finale private, redundanță, strategie backup, WAF și monitorizare avansată.

**Î: Ce fac dacă vreau să folosesc containere în loc de implementare cod?**  
R: Vezi [Exemplul Container Apps](../../../../examples/container-app) care folosește containere Docker pe tot parcursul.

**Î: Cum mă conectez la baza de date de pe calculatorul local?**  
R: Adaugă IP-ul tău pe firewall-ul SQL Server:  
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```
  
**Î: Pot folosi o bază de date existentă în loc să creez una nouă?**  
R: Da, modifică `infra/main.bicep` pentru a face referire la un SQL Server existent și actualizează parametrii string-ului de conexiune.

---

> **Notă:** Acest exemplu demonstrează cele mai bune practici pentru implementarea unei aplicații web cu o bază de date folosind AZD. Include cod funcțional, documentație completă și exerciții practice pentru consolidarea învățării. Pentru implementări în producție, revizuiește cerințele de securitate, scalare, conformitate și cost specifice organizației tale.

**📚 Navigare curs:**  
- ← Anterior: [Exemplu Container Apps](../../../../examples/container-app)  
- → Următor: [Ghid Integrare AI](../../../../docs/ai-foundry)  
- 🏠 [Pagina principală a cursului](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot rezulta din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->