<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "10bf998e2d70c35d713fbe6905841b95",
  "translation_date": "2025-11-23T19:31:48+00:00",
  "source_file": "examples/database-app/README.md",
  "language_code": "ro"
}
-->
# Implementarea unei baze de date Microsoft SQL și a unei aplicații web cu AZD

⏱️ **Timp estimat**: 20-30 minute | 💰 **Cost estimat**: ~15-25$/lună | ⭐ **Complexitate**: Intermediar

Acest **exemplu complet și funcțional** demonstrează cum să utilizați [Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/) pentru a implementa o aplicație web Python Flask cu o bază de date Microsoft SQL în Azure. Tot codul este inclus și testat—nu sunt necesare dependențe externe.

## Ce veți învăța

Finalizând acest exemplu, veți:
- Implementa o aplicație multi-tier (aplicație web + bază de date) folosind infrastructura ca cod
- Configura conexiuni securizate la baza de date fără a codifica direct secretele
- Monitoriza sănătatea aplicației cu Application Insights
- Gestiona eficient resursele Azure cu AZD CLI
- Urma cele mai bune practici Azure pentru securitate, optimizarea costurilor și observabilitate

## Prezentare generală a scenariului
- **Aplicație web**: API REST Python Flask cu conectivitate la baza de date
- **Bază de date**: Azure SQL Database cu date de exemplu
- **Infrastructură**: Provisionată folosind Bicep (șabloane modulare, reutilizabile)
- **Implementare**: Complet automatizată cu comenzi `azd`
- **Monitorizare**: Application Insights pentru loguri și telemetrie

## Cerințe preliminare

### Instrumente necesare

Înainte de a începe, verificați dacă aveți aceste instrumente instalate:

1. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versiunea 2.50.0 sau mai recentă)
   ```sh
   az --version
   # Rezultatul așteptat: azure-cli 2.50.0 sau mai mare
   ```

2. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versiunea 1.0.0 sau mai recentă)
   ```sh
   azd version
   # Rezultatul așteptat: versiunea azd 1.0.0 sau mai mare
   ```

3. **[Python 3.8+](https://www.python.org/downloads/)** (pentru dezvoltare locală)
   ```sh
   python --version
   # Rezultatul așteptat: Python 3.8 sau mai mare
   ```

4. **[Docker](https://www.docker.com/get-started)** (opțional, pentru dezvoltare locală containerizată)
   ```sh
   docker --version
   # Rezultatul așteptat: Versiunea Docker 20.10 sau mai mare
   ```

### Cerințe Azure

- Un **abonament Azure** activ ([creați un cont gratuit](https://azure.microsoft.com/free/))
- Permisiuni pentru a crea resurse în abonamentul dvs.
- Rolul **Owner** sau **Contributor** pe abonament sau grupul de resurse

### Cerințe de cunoștințe

Acesta este un exemplu de **nivel intermediar**. Ar trebui să fiți familiarizat cu:
- Operațiuni de bază în linia de comandă
- Concepte fundamentale de cloud (resurse, grupuri de resurse)
- Înțelegerea de bază a aplicațiilor web și bazelor de date

**Nou în AZD?** Începeți cu [Ghidul de introducere](../../docs/getting-started/azd-basics.md) mai întâi.

## Arhitectură

Acest exemplu implementează o arhitectură pe două niveluri cu o aplicație web și o bază de date SQL:

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
- **Plan de servicii App**: Găzduire bazată pe Linux (nivel B1 pentru eficiență de cost)
- **Aplicație web**: Runtime Python 3.11 cu aplicație Flask
- **Server SQL**: Server de baze de date gestionat cu TLS 1.2 minim
- **Bază de date SQL**: Nivel de bază (2GB, potrivit pentru dezvoltare/testare)
- **Application Insights**: Monitorizare și logare
- **Log Analytics Workspace**: Stocare centralizată a logurilor

**Analogie**: Gândiți-vă la aceasta ca la un restaurant (aplicație web) cu un congelator (bază de date). Clienții comandă din meniu (endpoint-uri API), iar bucătăria (aplicația Flask) preia ingredientele (datele) din congelator. Managerul restaurantului (Application Insights) urmărește tot ce se întâmplă.

## Structura folderului

Toate fișierele sunt incluse în acest exemplu—nu sunt necesare dependențe externe:

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
- **azure.yaml**: Indică AZD ce să implementeze și unde
- **infra/main.bicep**: Orchestrarea tuturor resurselor Azure
- **infra/resources/*.bicep**: Definiții individuale ale resurselor (modulare pentru reutilizare)
- **src/web/app.py**: Aplicație Flask cu logică pentru baza de date
- **requirements.txt**: Dependențe ale pachetelor Python
- **Dockerfile**: Instrucțiuni de containerizare pentru implementare

## Ghid rapid (pas cu pas)

### Pasul 1: Clonați și navigați

```sh
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/database-app
```

**✓ Verificare succes**: Verificați dacă vedeți `azure.yaml` și folderul `infra/`:
```sh
ls
# Așteptat: README.md, azure.yaml, infra/, src/
```

### Pasul 2: Autentificați-vă cu Azure

```sh
azd auth login
```

Aceasta deschide browserul pentru autentificarea Azure. Conectați-vă cu acreditările dvs. Azure.

**✓ Verificare succes**: Ar trebui să vedeți:
```
Logged in to Azure.
```

### Pasul 3: Inițializați mediul

```sh
azd init
```

**Ce se întâmplă**: AZD creează o configurație locală pentru implementarea dvs.

**Mesaje afișate**:
- **Nume mediu**: Introduceți un nume scurt (ex.: `dev`, `myapp`)
- **Abonament Azure**: Selectați abonamentul dvs. din listă
- **Locație Azure**: Alegeți o regiune (ex.: `eastus`, `westeurope`)

**✓ Verificare succes**: Ar trebui să vedeți:
```
SUCCESS: New project initialized!
```

### Pasul 4: Provisionați resursele Azure

```sh
azd provision
```

**Ce se întâmplă**: AZD implementează toată infrastructura (durează 5-8 minute):
1. Creează grupul de resurse
2. Creează serverul SQL și baza de date
3. Creează planul de servicii App
4. Creează aplicația web
5. Creează Application Insights
6. Configurează rețelele și securitatea

**Vi se va solicita**:
- **Nume utilizator admin SQL**: Introduceți un nume de utilizator (ex.: `sqladmin`)
- **Parolă admin SQL**: Introduceți o parolă puternică (salvați-o!)

**✓ Verificare succes**: Ar trebui să vedeți:
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

**Ce se întâmplă**: AZD construiește și implementează aplicația Flask:
1. Creează pachetul aplicației Python
2. Construiește containerul Docker
3. Îl trimite către Azure Web App
4. Inițializează baza de date cu date de exemplu
5. Pornește aplicația

**✓ Verificare succes**: Ar trebui să vedeți:
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

Aceasta deschide aplicația web implementată în browser la `https://app-<unique-id>.azurewebsites.net`

**✓ Verificare succes**: Ar trebui să vedeți un output JSON:
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

**Verificare sănătate** (verificați conexiunea la baza de date):
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

**Lista produselor** (date de exemplu):
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

**Obțineți un singur produs**:
```sh
curl https://app-<your-id>.azurewebsites.net/products/1
```

**✓ Verificare succes**: Toate endpoint-urile returnează date JSON fără erori.

---

**🎉 Felicitări!** Ați implementat cu succes o aplicație web cu o bază de date în Azure folosind AZD.

## Detalii despre configurație

### Variabile de mediu

Secretele sunt gestionate în siguranță prin configurația Azure App Service—**niciodată codificate direct în sursă**.

**Configurate automat de AZD**:
- `SQL_CONNECTION_STRING`: Conexiune la baza de date cu acreditări criptate
- `APPLICATIONINSIGHTS_CONNECTION_STRING`: Endpoint de telemetrie pentru monitorizare
- `SCM_DO_BUILD_DURING_DEPLOYMENT`: Activează instalarea automată a dependențelor

**Unde sunt stocate secretele**:
1. În timpul `azd provision`, furnizați acreditările SQL prin solicitări securizate
2. AZD le stochează în fișierul local `.azure/<env-name>/.env` (ignorate de git)
3. AZD le injectează în configurația Azure App Service (criptate la repaus)
4. Aplicația le citește prin `os.getenv()` la runtime

### Dezvoltare locală

Pentru testare locală, creați un fișier `.env` din exemplul:
```sh
cp .env.sample .env
# Editează .env cu conexiunea ta locală la baza de date
```

**Flux de lucru pentru dezvoltare locală**:
```sh
# Instalați dependențele
cd src/web
pip install -r requirements.txt

# Setați variabilele de mediu
export SQL_CONNECTION_STRING="your-local-connection-string"

# Rulați aplicația
python app.py
```

**Testați local**:
```sh
curl http://localhost:8000/health
# Așteptat: {"status": "sănătos", "database": "conectat"}
```

### Infrastructura ca cod

Toate resursele Azure sunt definite în **șabloane Bicep** (folderul `infra/`):

- **Design modular**: Fiecare tip de resursă are propriul fișier pentru reutilizare
- **Parametrizat**: Personalizați SKU-uri, regiuni, convenții de denumire
- **Cele mai bune practici**: Urmează standardele de denumire și securitate Azure
- **Controlat prin versiuni**: Modificările infrastructurii sunt urmărite în Git

**Exemplu de personalizare**:
Pentru a schimba nivelul bazei de date, editați `infra/resources/sql-database.bicep`:
```bicep
sku: {
  name: 'Standard'  // Changed from 'Basic'
  tier: 'Standard'
  capacity: 10
}
```

## Cele mai bune practici de securitate

Acest exemplu urmează cele mai bune practici de securitate Azure:

### 1. **Fără secrete în codul sursă**
- ✅ Acreditările sunt stocate în configurația Azure App Service (criptate)
- ✅ Fișierele `.env` sunt excluse din Git prin `.gitignore`
- ✅ Secretele sunt transmise prin parametri securizați în timpul provisionării

### 2. **Conexiuni criptate**
- ✅ TLS 1.2 minim pentru serverul SQL
- ✅ HTTPS obligatoriu pentru aplicația web
- ✅ Conexiunile la baza de date utilizează canale criptate

### 3. **Securitatea rețelei**
- ✅ Firewall-ul serverului SQL configurat pentru a permite doar serviciile Azure
- ✅ Accesul la rețea publică restricționat (poate fi blocat complet cu Private Endpoints)
- ✅ FTPS dezactivat pe aplicația web

### 4. **Autentificare și autorizare**
- ⚠️ **Actual**: Autentificare SQL (nume utilizator/parolă)
- ✅ **Recomandare pentru producție**: Utilizați Azure Managed Identity pentru autentificare fără parolă

**Pentru a trece la Managed Identity** (pentru producție):
1. Activați identitatea gestionată pe aplicația web
2. Acordați identității permisiuni SQL
3. Actualizați string-ul de conexiune pentru a utiliza identitatea gestionată
4. Eliminați autentificarea bazată pe parolă

### 5. **Audit și conformitate**
- ✅ Application Insights loghează toate cererile și erorile
- ✅ Auditarea bazei de date SQL este activată (poate fi configurată pentru conformitate)
- ✅ Toate resursele sunt etichetate pentru guvernanță

**Lista de verificare pentru securitate înainte de producție**:
- [ ] Activați Azure Defender pentru SQL
- [ ] Configurați Private Endpoints pentru baza de date SQL
- [ ] Activați Web Application Firewall (WAF)
- [ ] Implementați Azure Key Vault pentru rotația secretelor
- [ ] Configurați autentificarea Azure AD
- [ ] Activați logarea diagnostică pentru toate resursele

## Optimizarea costurilor

**Costuri lunare estimate** (noiembrie 2025):

| Resursă | SKU/Nivel | Cost estimat |
|---------|-----------|--------------|
| Plan de servicii App | B1 (Basic) | ~13$/lună |
| Bază de date SQL | Basic (2GB) | ~5$/lună |
| Application Insights | Pay-as-you-go | ~2$/lună (trafic redus) |
| **Total** | | **~20$/lună** |

**💡 Sfaturi pentru economisirea costurilor**:

1. **Utilizați nivelul gratuit pentru învățare**:
   - App Service: Nivel F1 (gratuit, ore limitate)
   - Bază de date SQL: Utilizați Azure SQL Database serverless
   - Application Insights: 5GB/lună ingestie gratuită

2. **Opriți resursele când nu sunt utilizate**:
   ```sh
   # Oprește aplicația web (baza de date încă taxează)
   az webapp stop --name <app-name> --resource-group <rg-name>
   
   # Repornește când este necesar
   az webapp start --name <app-name> --resource-group <rg-name>
   ```

3. **Ștergeți totul după testare**:
   ```sh
   azd down
   ```
   Aceasta elimină TOATE resursele și oprește taxele.

4. **SKU-uri pentru dezvoltare vs. producție**:
   - **Dezvoltare**: Nivel de bază (utilizat în acest exemplu)
   - **Producție**: Nivel Standard/Premium cu redundanță

**Monitorizarea costurilor**:
- Vizualizați costurile în [Azure Cost Management](https://portal.azure.com/#view/Microsoft_Azure_CostManagement)
- Configurați alerte de cost pentru a evita surprizele
- Etichetați toate resursele cu `azd-env-name` pentru urmărire

**Alternativă nivel gratuit**:
Pentru scopuri educative, puteți modifica `infra/resources/app-service-plan.bicep`:
```bicep
sku: {
  name: 'F1'  // Free tier
  tier: 'Free'
}
```
**Notă**: Nivelul gratuit are limitări (60 min/zi CPU, fără always-on).

## Monitorizare și observabilitate

### Integrarea Application Insights

Acest exemplu include **Application Insights** pentru monitorizare cuprinzătoare:

**Ce este monitorizat**:
- ✅ Cereri HTTP (latență, coduri de stare, endpoint-uri)
- ✅ Erori și excepții ale aplicației
- ✅ Logare personalizată din aplicația Flask
- ✅ Sănătatea conexiunii la baza de date
- ✅ Metrici de performanță (CPU, memorie)

**Accesați Application Insights**:
1. Deschideți [Portalul Azure](https://portal.azure.com)
2. Navigați la grupul dvs. de resurse (`rg-<env-name>`)
3. Faceți clic pe resursa Application Insights (`appi-<unique-id>`)

**Interogări utile** (Application Insights → Logs):

**Vizualizați toate cererile**:
```kusto
requests
| where timestamp > ago(1h)
| order by timestamp desc
| project timestamp, name, url, resultCode, duration
```

**Găsiți erori**:
```kusto
exceptions
| where timestamp > ago(24h)
| order by timestamp desc
| project timestamp, type, outerMessage, operation_Name
```

**Verificați endpoint-ul de sănătate**:
```kusto
requests
| where name contains "health"
| summarize count() by resultCode, bin(timestamp, 1h)
```

### Auditarea bazei de date SQL

**Auditarea bazei de date SQL este activată** pentru a urmări:
- Modele de acces la baza de date
- Încercări de autentificare eșuate
- Modificări ale schemei
- Acces la date (pentru conformitate)

**Accesați logurile de audit**:
1. Portal Azure → Bază de date SQL → Audit
2. Vizualizați logurile în Log Analytics workspace

### Monitorizare în timp real

**Vizualizați metrici live**:
1. Application Insights → Live Metrics
2. Vizualizați cererile, eșecurile și performanța în timp real

**Configurați alerte**:
Creați alerte pentru evenimente critice:
- Erori HTTP 500 > 5 în 5 minute
- Eșecuri ale conexiunii la baza de date
- Timp de răspuns ridicat (>2 secunde)

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

#### 1. `azd provision` eșuează cu "Locația nu este disponibilă"

**Simptom**:
```
Error: The subscription is not registered for the resource type 'components' in the location 'centralus'.
```

**Soluție**:
Alege o altă regiune Azure sau înregistrează furnizorul de resurse:
```sh
az provider register --namespace Microsoft.Insights
```

#### 2. Conexiunea SQL eșuează în timpul implementării

**Simptom**:
```
pyodbc.OperationalError: ('08001', '[08001] [Microsoft][ODBC Driver 18 for SQL Server]TCP Provider...')
```

**Soluție**:
- Verifică dacă firewall-ul serverului SQL permite serviciile Azure (configurat automat)
- Asigură-te că parola de administrator SQL a fost introdusă corect în timpul `azd provision`
- Asigură-te că serverul SQL este complet provisionat (poate dura 2-3 minute)

**Verifică conexiunea**:
```sh
# Din Portalul Azure, accesați SQL Database → Editor de interogări
# Încercați să vă conectați cu acreditările dvs.
```

#### 3. Aplicația web afișează "Eroare aplicație"

**Simptom**:
Browserul afișează o pagină generică de eroare.

**Soluție**:
Verifică jurnalele aplicației:
```sh
# Vizualizați jurnalele recente
az webapp log tail --name <app-name> --resource-group <rg-name>
```

**Cauze comune**:
- Variabile de mediu lipsă (verifică App Service → Configuration)
- Instalarea pachetelor Python a eșuat (verifică jurnalele de implementare)
- Eroare de inițializare a bazei de date (verifică conectivitatea SQL)

#### 4. `azd deploy` eșuează cu "Eroare de construire"

**Simptom**:
```
Error: Failed to build project
```

**Soluție**:
- Asigură-te că `requirements.txt` nu are erori de sintaxă
- Verifică dacă Python 3.11 este specificat în `infra/resources/web-app.bicep`
- Asigură-te că Dockerfile are imaginea de bază corectă

**Depanare locală**:
```sh
cd src/web
docker build -t test-app .
docker run -p 8000:8000 test-app
```

#### 5. "Neautorizat" la rularea comenzilor AZD

**Simptom**:
```
ERROR: (Unauthorized) The client '<id>' with object id '<id>' does not have authorization
```

**Soluție**:
Reautentifică-te cu Azure:
```sh
azd auth login
az login
```

Verifică dacă ai permisiunile corecte (rolul Contributor) pe abonament.

#### 6. Costuri ridicate ale bazei de date

**Simptom**:
Factură Azure neașteptată.

**Soluție**:
- Verifică dacă ai uitat să rulezi `azd down` după testare
- Asigură-te că baza de date SQL folosește nivelul Basic (nu Premium)
- Revizuiește costurile în Azure Cost Management
- Configurează alerte de cost

### Obținerea ajutorului

**Vizualizează toate variabilele de mediu AZD**:
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
- [Ghid de depanare AZD](../../docs/troubleshooting/common-issues.md)
- [Depanare Azure App Service](https://learn.microsoft.com/azure/app-service/troubleshoot-diagnostic-logs)
- [Depanare Azure SQL](https://learn.microsoft.com/azure/azure-sql/database/troubleshoot-common-errors-issues)

## Exerciții practice

### Exercițiul 1: Verifică implementarea ta (Începător)

**Obiectiv**: Confirmă că toate resursele sunt implementate și aplicația funcționează.

**Pași**:
1. Listează toate resursele din grupul tău de resurse:
   ```sh
   az resource list --resource-group rg-<env-name> --output table
   ```
   **Așteptat**: 6-7 resurse (Web App, SQL Server, SQL Database, App Service Plan, Application Insights, Log Analytics)

2. Testează toate punctele API:
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
   - Reîmprospătează browserul pe aplicația web
   **Așteptat**: Vezi cereri apărând în timp real

**Criterii de succes**: Toate cele 6-7 resurse există, toate punctele API returnează date, Live Metrics arată activitate.

---

### Exercițiul 2: Adaugă un nou punct API (Intermediar)

**Obiectiv**: Extinde aplicația Flask cu un nou punct API.

**Cod de început**: Punctele API curente în `src/web/app.py`

**Pași**:
1. Editează `src/web/app.py` și adaugă un nou punct API după funcția `get_product()`:
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

3. Testează noul punct API:
   ```sh
   curl https://app-<your-id>.azurewebsites.net/products/search/laptop
   ```
   **Așteptat**: Returnează produse care corespund "laptop"

**Criterii de succes**: Noul punct API funcționează, returnează rezultate filtrate, apare în jurnalele Application Insights.

---

### Exercițiul 3: Adaugă monitorizare și alerte (Avansat)

**Obiectiv**: Configurează monitorizarea proactivă cu alerte.

**Pași**:
1. Creează o alertă pentru erori HTTP 500:
   ```sh
   # Obține ID-ul resursei Application Insights
   AI_ID=$(az monitor app-insights component show \
     --app appi-<your-id> \
     --resource-group rg-<env-name> \
     --query id -o tsv)
   
   # Creează alertă
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
   # Solicită un produs inexistent
   for i in {1..10}; do curl https://app-<your-id>.azurewebsites.net/products/999; done
   ```

3. Verifică dacă alerta s-a declanșat:
   - Azure Portal → Alerts → Alert Rules
   - Verifică emailul tău (dacă este configurat)

**Criterii de succes**: Regula de alertă este creată, se declanșează la erori, notificările sunt primite.

---

### Exercițiul 4: Modificări ale schemei bazei de date (Avansat)

**Obiectiv**: Adaugă un nou tabel și modifică aplicația pentru a-l utiliza.

**Pași**:
1. Conectează-te la baza de date SQL prin Editorul de interogări din Azure Portal

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

3. Actualizează `src/web/app.py` pentru a include informații despre categorii în răspunsuri

4. Implementează și testează

**Criterii de succes**: Noul tabel există, produsele afișează informații despre categorii, aplicația funcționează în continuare.

---

### Exercițiul 5: Implementarea caching-ului (Expert)

**Obiectiv**: Adaugă Azure Redis Cache pentru a îmbunătăți performanța.

**Pași**:
1. Adaugă Redis Cache în `infra/main.bicep`
2. Actualizează `src/web/app.py` pentru a memora în cache interogările produselor
3. Măsoară îmbunătățirea performanței cu Application Insights
4. Compară timpii de răspuns înainte/după caching

**Criterii de succes**: Redis este implementat, caching-ul funcționează, timpii de răspuns se îmbunătățesc cu >50%.

**Sugestie**: Începe cu [documentația Azure Cache for Redis](https://learn.microsoft.com/azure/azure-cache-for-redis/).

---

## Curățare

Pentru a evita costuri continue, șterge toate resursele la final:

```sh
azd down
```

**Prompt de confirmare**:
```
? Total resources to delete: 7, are you sure you want to continue? (y/N)
```

Tastează `y` pentru a confirma.

**✓ Verificare succes**: 
- Toate resursele sunt șterse din Azure Portal
- Fără costuri continue
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

### Următorii pași în acest curs
- **[Exemplu Container Apps](../../../../examples/container-app)**: Implementează microservicii cu Azure Container Apps
- **[Ghid de integrare AI](../../../../docs/ai-foundry)**: Adaugă capabilități AI aplicației tale
- **[Cele mai bune practici de implementare](../../docs/deployment/deployment-guide.md)**: Modele de implementare pentru producție

### Subiecte avansate
- **Identitate gestionată**: Elimină parolele și folosește autentificarea Azure AD
- **Puncte finale private**: Securizează conexiunile bazei de date în cadrul unei rețele virtuale
- **Integrare CI/CD**: Automatizează implementările cu GitHub Actions sau Azure DevOps
- **Mediu multi**: Configurează medii de dezvoltare, testare și producție
- **Migrații baze de date**: Folosește Alembic sau Entity Framework pentru versiuni de schemă

### Comparație cu alte abordări

**AZD vs. Șabloane ARM**:
- ✅ AZD: Abstracție de nivel înalt, comenzi mai simple
- ⚠️ ARM: Mai detaliat, control granular

**AZD vs. Terraform**:
- ✅ AZD: Nativ Azure, integrat cu serviciile Azure
- ⚠️ Terraform: Suport multi-cloud, ecosistem mai mare

**AZD vs. Azure Portal**:
- ✅ AZD: Configurabil, controlat prin versiuni, automatizabil
- ⚠️ Portal: Clickuri manuale, dificil de reprodus

**Gândește-te la AZD ca**: Docker Compose pentru Azure—configurare simplificată pentru implementări complexe.

---

## Întrebări frecvente

**Î: Pot folosi un alt limbaj de programare?**  
R: Da! Înlocuiește `src/web/` cu Node.js, C#, Go sau orice limbaj. Actualizează `azure.yaml` și Bicep corespunzător.

**Î: Cum adaug mai multe baze de date?**  
R: Adaugă un alt modul SQL Database în `infra/main.bicep` sau folosește PostgreSQL/MySQL din serviciile Azure Database.

**Î: Pot folosi acest lucru pentru producție?**  
R: Acesta este un punct de plecare. Pentru producție, adaugă: identitate gestionată, puncte finale private, redundanță, strategie de backup, WAF și monitorizare avansată.

**Î: Ce fac dacă vreau să folosesc containere în loc de implementare cod?**  
R: Consultă [Exemplul Container Apps](../../../../examples/container-app) care folosește containere Docker pe tot parcursul.

**Î: Cum mă conectez la baza de date de pe mașina mea locală?**  
R: Adaugă IP-ul tău la firewall-ul serverului SQL:
```sh
az sql server firewall-rule create \
  --resource-group rg-<env-name> \
  --server sql-<unique-id> \
  --name AllowMyIP \
  --start-ip-address <your-ip> \
  --end-ip-address <your-ip>
```

**Î: Pot folosi o bază de date existentă în loc să creez una nouă?**  
R: Da, modifică `infra/main.bicep` pentru a face referire la un server SQL existent și actualizează parametrii stringului de conexiune.

---

> **Notă:** Acest exemplu demonstrează cele mai bune practici pentru implementarea unei aplicații web cu o bază de date folosind AZD. Include cod funcțional, documentație cuprinzătoare și exerciții practice pentru consolidarea învățării. Pentru implementări de producție, revizuiește cerințele de securitate, scalare, conformitate și cost specifice organizației tale.

**📚 Navigare curs:**
- ← Anterior: [Exemplu Container Apps](../../../../examples/container-app)
- → Următor: [Ghid de integrare AI](../../../../docs/ai-foundry)
- 🏠 [Pagina principală a cursului](../../README.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->