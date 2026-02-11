# Arhitectură Microservicii - Exemplu Container App

⏱️ **Timp estimat**: 25-35 minute | 💰 **Cost estimat**: ~$50-100/lună | ⭐ **Complexitate**: Avansat

O arhitectură microservicii **simplificată, dar funcțională**, implementată în Azure Container Apps folosind AZD CLI. Acest exemplu demonstrează comunicarea între servicii, orchestrarea containerelor și monitorizarea cu o configurare practică de 2 servicii.

> **📚 Metodă de învățare**: Acest exemplu începe cu o arhitectură minimală de 2 servicii (API Gateway + Serviciu Backend) pe care o puteți implementa și din care puteți învăța efectiv. După ce stăpâniți această bază, oferim ghid pentru extinderea către un ecosistem complet de microservicii.

## Ce Veți Învăța

Finalizând acest exemplu, vei putea:
- Implementa mai multe containere în Azure Container Apps
- Implementa comunicare service-to-service cu rețea internă
- Configura scalarea bazată pe mediu și probe de sănătate
- Monitoriza aplicații distribuite cu Application Insights
- Înțelege tiparele și bunele practici de implementare microservicii
- Învăța extinderea progresivă de la arhitecturi simple la complexe

## Arhitectura

### Faza 1: Ce Construim (Inclus în acest exemplu)

```
                    ┌─────────────────────────────┐
                    │         Internet            │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTPS
                                   │
                    ┌──────────────▼──────────────┐
                    │      API Gateway            │
                    │   (Node.js Container)       │
                    │   - Routes requests         │
                    │   - Health checks           │
                    │   - Request logging         │
                    └──────────────┬──────────────┘
                                   │
                                   │ HTTP (internal)
                                   │
                    ┌──────────────▼──────────────┐
                    │    Product Service          │
                    │   (Python Container)        │
                    │   - Product CRUD            │
                    │   - In-memory data store    │
                    │   - REST API                │
                    └──────────────┬──────────────┘
                                   │
                    ┌──────────────▼──────────────┐
                    │   Application Insights      │
                    │   (Monitoring & Logs)       │
                    └─────────────────────────────┘
```

**De ce începem simplu?**
- ✅ Implementare rapidă și înțelegere facilă (25-35 minute)
- ✅ Învață tiparele de bază ale microserviciilor fără complexitate
- ✅ Cod funcțional pe care îl poți modifica și experimenta
- ✅ Cost redus pentru învățare (~$50-100/lună vs $300-1400/lună)
- ✅ Construiește încredere înainte de a adăuga baze de date și cozi de mesaje

**Analogie**: Gândește-te la asta ca la învățatul condusului. Începi cu un parcaj gol (2 servicii), stăpânești elementele de bază, apoi progresezi la traficul urban (5+ servicii cu baze de date).

### Faza 2: Extindere Viitoare (Arhitectură de Referință)

După ce stăpânești arhitectura de 2 servicii, poți extinde la:

```
Full Architecture (Not Included - For Reference)
├── API Gateway (✅ Included)
├── Product Service (✅ Included)
├── Order Service (🔜 Add next)
├── User Service (🔜 Add next)
├── Notification Service (🔜 Add last)
├── Azure Service Bus (🔜 For async communication)
├── Cosmos DB (🔜 For product persistence)
├── Azure SQL (🔜 For order management)
└── Azure Storage (🔜 For file storage)
```

Vezi secțiunea „Expansion Guide” la final pentru instrucțiuni pas cu pas.

## Funcționalități Incluse

✅ **Descoperire Servicii**: Descoperire automată bazată pe DNS între containere  
✅ **Echilibrare Sarcină**: Echilibrare încorporată între replici  
✅ **Autoscalare**: Scalare independentă pe serviciu bazată pe cereri HTTP  
✅ **Monitorizare Sănătate**: Probe de liveness și readiness pentru ambele servicii  
✅ **Jurnalizare Distribuită**: Jurnalizare centralizată cu Application Insights  
✅ **Rețea Internă**: Comunicare securizată între servicii  
✅ **Orchestrarea Containerelor**: Implementare și scalare automată  
✅ **Actualizări fără Downtime**: Actualizări continue cu managementul reviziilor  

## Cerințe Prealabile

### Instrumente Necesare

Înainte de a începe, verifică că ai instalat următoarele unelte:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versiunea 1.0.0 sau superioară)
   ```bash
   azd version
   # Ieșire așteptată: versiunea azd 1.0.0 sau mai nouă
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versiunea 2.50.0 sau superioară)
   ```bash
   az --version
   # Rezultatul așteptat: azure-cli 2.50.0 sau o versiune superioară
   ```

3. **[Docker](https://www.docker.com/get-started)** (pentru dezvoltare/testare locală - opțional)
   ```bash
   docker --version
   # Ieșire așteptată: versiunea Docker 20.10 sau mai recentă
   ```

### Cerințe Azure

- Un **abonament Azure** activ ([creează un cont gratuit](https://azure.microsoft.com/free/))
- Permisiuni pentru a crea resurse în abonament
- Rol de **Contributor** pe abonament sau grupul de resurse

### Cunoștințe Prealabile

Acesta este un exemplu de nivel **avansat**. Ar trebui să:
- Fi finalizat [exemplul Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- Ai înțelegere de bază a arhitecturii microservicii
- Cunoști REST APIs și HTTP
- Înțelegi conceptele containerelor

**Ești nou la Container Apps?** Începe cu [exemplul Simple Flask API](../../../../../examples/container-app/simple-flask-api) pentru a învăța elementele de bază.

## Începere Rapidă (Pas cu Pas)

### Pasul 1: Clonează și Navighează

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Verificare reușită**: Verifică că vezi `azure.yaml`:
```bash
ls
# Așteptat: README.md, azure.yaml, infra/, src/
```

### Pasul 2: Autentificare în Azure

```bash
azd auth login
```

Se deschide browserul pentru autentificare Azure. Autentifică-te cu datele tale Azure.

**✓ Verificare reușită**: Ar trebui să vezi:
```
Logged in to Azure.
```

### Pasul 3: Inițializează Mediul

```bash
azd init
```

**Prompterele pe care le vei vedea**:
- **Numele mediului**: Introdu un nume scurt (ex: `microservices-dev`)
- **Abonamentul Azure**: Selectează abonamentul
- **Locația Azure**: Alege o regiune (ex: `eastus`, `westeurope`)

**✓ Verificare reușită**: Ar trebui să vezi:
```
SUCCESS: New project initialized!
```

### Pasul 4: Implementarea Infrastructurii și Serviciilor

```bash
azd up
```

**Ce se întâmplă** (8-12 minute):
1. Crează mediul Container Apps
2. Crează Application Insights pentru monitorizare
3. Construiește containerul API Gateway (Node.js)
4. Construiește containerul Product Service (Python)
5. Deploy ambele containere în Azure
6. Configurează rețeaua și probele de sănătate
7. Configurează monitorizarea și logarea

**✓ Verificare reușită**: Ar trebui să vezi:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Timp**: 8-12 minute

### Pasul 5: Testează Implementarea

```bash
# Obține punctul final al gateway-ului
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testează starea de sănătate a API Gateway-ului
curl $GATEWAY_URL/health

# Output așteptat:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testează serviciul produs prin gateway**:
```bash
# Listă de produse
curl $GATEWAY_URL/api/products

# Ieșire așteptată:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Tastatură","price":79.99,"stock":150}
# ]
```

**✓ Verificare reușită**: Ambele endpoint-uri returnează JSON fără erori.

---

**🎉 Felicitări!** Ai implementat o arhitectură microservicii în Azure!

## Structura Proiectului

Toate fișierele implementării sunt incluse—acesta este un exemplu complet și funcțional:

```
microservices/
│
├── README.md                         # This file
├── azure.yaml                        # AZD configuration
├── .gitignore                        # Git ignore patterns
│
├── infra/                           # Infrastructure as Code (Bicep)
│   ├── main.bicep                   # Main orchestration
│   ├── abbreviations.json           # Naming conventions
│   ├── core/                        # Shared infrastructure
│   │   ├── container-apps-environment.bicep  # Container environment + registry
│   │   └── monitor.bicep            # Application Insights + Log Analytics
│   └── app/                         # Service definitions
│       ├── api-gateway.bicep        # API Gateway container app
│       └── product-service.bicep    # Product Service container app
│
└── src/                             # Application source code
    ├── api-gateway/                 # Node.js API Gateway
    │   ├── app.js                   # Express server with routing
    │   ├── package.json             # Node dependencies
    │   └── Dockerfile               # Container definition
    └── product-service/             # Python Product Service
        ├── main.py                  # Flask API with product data
        ├── requirements.txt         # Python dependencies
        └── Dockerfile               # Container definition
```

**Ce face fiecare componentă:**

**Infrastructură (infra/):**
- `main.bicep`: Ordonează toate resursele Azure și dependențele lor
- `core/container-apps-environment.bicep`: Creează mediul Container Apps și Azure Container Registry
- `core/monitor.bicep`: Configurează Application Insights pentru jurnalizare distribuită
- `app/*.bicep`: Definiții container apps individuale cu scalare și probe de sănătate

**API Gateway (src/api-gateway/):**
- Serviciu expus public care direcționează cererile către backend
- Implementă logare, gestionare erori și redirecționare cereri
- Demonstrează comunicarea HTTP între servicii

**Product Service (src/product-service/):**
- Serviciu intern cu catalog de produse (în memorie pentru simplitate)
- REST API cu probe de sănătate
- Exemplu de microserviciu backend

## Prezentare Servicii

### API Gateway (Node.js/Express)

**Port**: 8080  
**Acces**: Public (ingress extern)  
**Scop**: Direcționează cererile către serviciile backend  

**Endpoint-uri**:
- `GET /` - Informații serviciu
- `GET /health` - Endpoint de health check
- `GET /api/products` - Redirecționează către product service (listă)
- `GET /api/products/:id` - Redirecționează către product service (după ID)

**Caracteristici cheie**:
- Rutare cereri cu axios
- Logare centralizată
- Gestionare erori și timeout
- Descoperire servicii prin variabile de mediu
- Integrare Application Insights

**Fragment cod** (`src/api-gateway/app.js`):
```javascript
// Comunicare internă a serviciului
app.get('/api/products', async (req, res) => {
  const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
  res.json(response.data);
});
```

### Product Service (Python/Flask)

**Port**: 8000  
**Acces**: Doar intern (fără ingress extern)  
**Scop**: Gestionează catalogul de produse cu date în memorie  

**Endpoint-uri**:
- `GET /` - Informații serviciu
- `GET /health` - Endpoint de health check
- `GET /products` - Listă produse
- `GET /products/<id>` - Produs după ID

**Caracteristici cheie**:
- API RESTful cu Flask
- Magazin produse în memorie (simplu, fără bază de date)
- Monitorizare sănătate cu probe
- Logare structurat
- Integrare Application Insights

**Model date**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**De ce doar intern?**
Serviciul de produse nu este expus public. Toate cererile trebuie să treacă prin API Gateway, care oferă:
- Securitate: punct de acces controlat
- Flexibilitate: backend-ul poate fi schimbat fără a afecta clienții
- Monitorizare: logare centralizată a cererilor

## Înțelegerea Comunicației între Servicii

### Cum Comunicăm Serviciile Între Ele

În acest exemplu, API Gateway comunică cu Product Service folosind **apeluri HTTP interne**:

```javascript
// API Gateway (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Realizează o cerere HTTP internă
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Puncte cheie**:

1. **Descoperire bazată pe DNS**: Container Apps oferă automat DNS pentru serviciile interne
   - FQDN Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificat ca: `http://product-service` (rezolvat de Container Apps)

2. **Fără expunere publică**: Product Service are `external: false` în Bicep
   - Accesibil doar în mediul Container Apps
   - Nu poate fi accesat din internet

3. **Variabile de mediu**: URL-urile serviciilor sunt injectate la timp de deploy
   - Bicep trece FQDN-ul intern către gateway
   - Fără URL-uri hardcodate în codul aplicației

**Analogie**: Gândește-te la asta ca la camerele unui birou. API Gateway este recepția (expusă public), iar Product Service este o cameră internă. Vizitatorii trebuie să treacă prin recepție pentru a ajunge în orice cameră.

## Opțiuni de Implementare

### Implementare Completă (Recomandată)

```bash
# Implementați infrastructura și ambele servicii
azd up
```

Aceasta deployează:
1. Mediul Container Apps
2. Application Insights
3. Container Registry
4. Container API Gateway
5. Container Product Service

**Timp**: 8-12 minute

### Deploy Serviciu Individual

```bash
# Implementați un singur serviciu (după comanda inițială azd up)
azd deploy api-gateway

# Sau implementați serviciul de produs
azd deploy product-service
```

**Caz de utilizare**: Când ai modificat codul unui serviciu și dorești să redeployezi doar acel serviciu.

### Actualizare Configurație

```bash
# Schimbă parametrii de scalare
azd env set GATEWAY_MAX_REPLICAS 30

# Redeplasează cu noua configurație
azd up
```

## Configurație

### Configurare Scalare

Ambele servicii sunt configurate cu autoscalare bazată pe HTTP în fișierele Bicep:

**API Gateway**:
- Min replici: 2 (cel puțin 2 pentru disponibilitate)
- Max replici: 20
- Trigger scalare: 50 cereri concurente per replică

**Product Service**:
- Min replici: 1 (poate scala la zero dacă este nevoie)
- Max replici: 10
- Trigger scalare: 100 cereri concurente per replică

**Personalizare scalare** (în `infra/app/*.bicep`):
```bicep
scale: {
  minReplicas: 1
  maxReplicas: 10
  rules: [
    {
      name: 'http-scale-rule'
      http: {
        metadata: {
          concurrentRequests: '100'  // Adjust this
        }
      }
    }
  ]
}
```

### Alocare Resurse

**API Gateway**:
- CPU: 1.0 vCPU
- Memorie: 2 GiB
- Motiv: gestionează tot traficul extern

**Product Service**:
- CPU: 0.5 vCPU
- Memorie: 1 GiB
- Motiv: operațiuni ușoare în memorie

### Probe de Sănătate

Ambele servicii includ probe de liveness și readiness:

```bicep
probes: [
  {
    type: 'Liveness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 10
    periodSeconds: 30
  }
  {
    type: 'Readiness'
    httpGet: {
      path: '/health'
      port: 8080
    }
    initialDelaySeconds: 5
    periodSeconds: 10
  }
]
```

**Ce Înseamnă Asta**:
- **Liveness**: Dacă probele eșuează, Container Apps repornește containerul
- **Readiness**: Dacă serviciul nu este gata, Container Apps oprește rutarea traficului către replica respectivă

## Monitorizare și Observabilitate

### Vizualizare Jurnal Servicii

```bash
# Vizualizați jurnalele folosind azd monitor
azd monitor --logs

# Sau utilizați Azure CLI pentru aplicații de container specifice:
# Flux de jurnale din API Gateway
az containerapp logs show --name api-gateway --resource-group $RG_NAME --follow

# Vizualizați jurnalele recente ale serviciului de produs
az containerapp logs show --name product-service --resource-group $RG_NAME --tail 100
```

**Rezultat Așteptat**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Interogări Application Insights

Accesează Application Insights în Azure Portal, apoi rulează aceste interogări:

**Găsește cererile lente**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Urmărește apeluri serviciu-la-serviciu**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Rata erorilor pe serviciu**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volumul cererilor în timp**:
```kusto
requests
| where timestamp > ago(1h)
| summarize requestCount = count() by bin(timestamp, 5m), cloud_RoleName
| render timechart
```

### Accesare Dashboard Monitorizare

```bash
# Obține detalii despre Application Insights
azd env get-values | grep APPLICATIONINSIGHTS

# Deschide monitorizarea în Azure Portal
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metrici Live

1. Navighează în Application Insights în Azure Portal  
2. Click pe „Live Metrics”  
3. Vezi cererile, eșecurile și performanța în timp real  
4. Testează rulând: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exerciții Practice

[Notă: Vezi exercițiile complete în secțiunea „Practical Exercises” de mai sus, cu pași detaliați pentru verificarea implementării, modificarea datelor, teste autoscalare, gestionare erori și adăugarea unui al treilea serviciu.]

## Analiză Costuri

### Costuri Lunare Estimate (pentru acest exemplu cu 2 servicii)

| Resursă | Configurație | Cost Estimat |
|----------|--------------|--------------|
| API Gateway | 2-20 replici, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replici, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier Basic | $5 |
| Application Insights | 1-2 GB/lună | $5-10 |
| Log Analytics | 1 GB/lună | $3 |
| **Total** | | **$58-243/lună** |

**Detaliere Costuri după Utilizare**:
- **Trafic redus** (testare/învățare): ~$60/lună
- **Trafic moderat** (mic producție): ~$120/lună
- **Trafic intens** (vârfuri de activitate): ~$240/lună

### Sfaturi Optimizare Costuri

1. **Scalare la zero pentru dezvoltare**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Folosește Consumption Plan pentru Cosmos DB** (când îl adaugi):
   - Plătești doar pentru ce folosești
   - Fără taxă minimă

3. **Setează sampling în Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Eșantionare 50% din cereri
   ```

4. **Curăță resursele când nu sunt necesare**:
   ```bash
   azd down
   ```

### Opțiuni Tier Gratuit
Pentru învățare/testare, ia în considerare:
- Folosește creditele gratuite Azure (primele 30 de zile)
- Menține la minimum replicile
- Șterge după testare (fără costuri continue)

---

## Curățare

Pentru a evita costurile continue, șterge toate resursele:

```bash
azd down --force --purge
```

**Prompt de Confirmare**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Tastează `y` pentru confirmare.

**Ce se Șterge**:
- Mediul Container Apps
- Ambele Container Apps (gateway și serviciul de produs)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Grupul de Resurse

**✓ Verifică Curățarea**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Ar trebui să returneze gol.

---

## Ghid de Extindere: De la 2 la 5+ Servicii

Odată ce ai stăpânit această arhitectură cu 2 servicii, iată cum să o extinzi:

### Faza 1: Adaugă Persistență în Bază de Date (Pasul Următor)

**Adaugă Cosmos DB pentru Serviciul de Produs**:

1. Creează `infra/core/cosmos.bicep`:
   ```bicep
   resource cosmosAccount 'Microsoft.DocumentDB/databaseAccounts@2023-04-15' = {
     name: name
     location: location
     kind: 'GlobalDocumentDB'
     properties: {
       databaseAccountOfferType: 'Standard'
       locations: [{ locationName: location, failoverPriority: 0 }]
     }
   }
   ```

2. Actualizează serviciul de produs să folosească Cosmos DB în loc de date în memorie

3. Cost estimat suplimentar: ~25$/lună (serverless)

### Faza 2: Adaugă Al Treilea Serviciu (Management Comenzi)

**Creează Serviciul de Comenzi**:

1. Folder nou: `src/order-service/` (Python/Node.js/C#)
2. Bicep nou: `infra/app/order-service.bicep`
3. Actualizează API Gateway pentru ruta `/api/orders`
4. Adaugă Azure SQL Database pentru persistența comenzilor

**Arhitectura devine**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faza 3: Adaugă Comunicare Async (Service Bus)

**Implementează Arhitectura Eveniment-Driven**:

1. Adaugă Azure Service Bus: `infra/core/servicebus.bicep`
2. Serviciul de Produs publică evenimente „ProductCreated”
3. Serviciul de Comenzi se abonează la evenimentele produsului
4. Adaugă Serviciul de Notificări pentru a procesa evenimentele

**Model**: Cerere/Răspuns (HTTP) + Eveniment-Driven (Service Bus)

### Faza 4: Adaugă Autentificare Utilizator

**Implementează Serviciul de Utilizatori**:

1. Creează `src/user-service/` (Go/Node.js)
2. Adaugă Azure AD B2C sau autentificare JWT personalizată
3. API Gateway validează token-urile
4. Serviciile verifică permisiunile utilizatorului

### Faza 5: Pregătirea pentru Producție

**Adaugă Aceste Componente**:
- Azure Front Door (balansare globală a încărcării)
- Azure Key Vault (gestionare secrete)
- Azure Monitor Workbooks (tablouri de bord personalizate)
- Pipeline CI/CD (GitHub Actions)
- Deploy fără downtime (Blue-Green Deployments)
- Identitate gestionată pentru toate serviciile

**Cost total arhitectură producție**: ~300-1.400$/lună

---

## Află Mai Multe

### Documentație Relevantă
- [Documentație Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Ghid Arhitectură Microservicii](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights pentru Trace Distribuit](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentație Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Pașii Următori în Acest Curs
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Exemplu simplu cu un singur container
- → Următor: [Ghid Integrare AI](../../../../../examples/docs/ai-foundry) - Adaugă capabilități AI
- 🏠 [Pagina Principală a Cursului](../../README.md)

### Comparație: Când să Folosești Ce

**Aplicație cu Un Singur Container** (exemplu simplu Flask API):
- ✅ Aplicații simple
- ✅ Arhitectură monolitică
- ✅ Implementare rapidă
- ❌ Scalabilitate limitată
- **Cost**: ~15-50$/lună

**Microservicii** (exemplul curent):
- ✅ Aplicații complexe
- ✅ Scalare independentă per serviciu
- ✅ Autonomie echipă (servicii diferite, echipe diferite)
- ❌ Mai complex de gestionat
- **Cost**: ~60-250$/lună

**Kubernetes (AKS)**:
- ✅ Control și flexibilitate maximă
- ✅ Portabilitate multi-cloud
- ✅ Networking avansat
- ❌ Necesită expertiză Kubernetes
- **Cost**: ~150-500$/lună minim

**Recomandare**: Începe cu Container Apps (exemplul acesta), treci la AKS doar dacă ai nevoie de facilități specifice Kubernetes.

---

## Întrebări Frecvente

**Î: De ce doar 2 servicii în loc de 5+?**  
R: Progres educațional. Stăpânește elementele fundamentale (comunicare între servicii, monitorizare, scalare) cu un exemplu simplu înainte de a adăuga complexitate. Modelele învățate aici se aplică la arhitecturi de 100 de servicii.

**Î: Pot adăuga singur mai multe servicii?**  
R: Absolut! Urmează ghidul de extindere de mai sus. Fiecare serviciu nou urmează același model: creează folder src, creează fișier Bicep, actualizează azure.yaml, implementează.

**Î: Este gata pentru producție?**  
R: Este o bază solidă. Pentru producție, adaugă: identitate gestionată, Key Vault, baze de date persistente, pipeline CI/CD, alerte de monitorizare și strategie de backup.

**Î: De ce să nu folosești Dapr sau alt service mesh?**  
R: Păstrează simplitatea pentru învățare. Odată ce înțelegi rețeaua nativă Container Apps, poți adăuga Dapr pentru scenarii avansate.

**Î: Cum debugez local?**  
R: Rulează serviciile local cu Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Î: Pot folosi limbaje de programare diferite?**  
R: Da! Acest exemplu arată Node.js (gateway) + Python (serviciu produs). Poți combina orice limbaje care pot rula în containere.

**Î: Ce fac dacă nu am credite Azure?**  
R: Folosește nivelul gratuit Azure (primele 30 de zile cu conturi noi) sau implementează pentru perioade scurte de testare și șterge imediat.

---

> **🎓 Rezumat Path Învățare**: Ai învățat să implementezi o arhitectură multi-servicii cu scalare automată, rețea internă, monitorizare centralizată și modele pregătite pentru producție. Această fundație te pregătește pentru sisteme distribuite complexe și arhitecturi enterprise de microservicii.

**📚 Navigare Curs:**
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Următor: [Exemplu Integrare Bază de Date](../../../../../examples/database-app)
- 🏠 [Pagina Principală a Cursului](../../../README.md)
- 📖 [Best Practices Container Apps](../../../docs/chapter-04-infrastructure/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere automată AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original, în limba sa nativă, trebuie considerat ca sursă autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm răspunderea pentru eventualele neînțelegeri sau interpretări greșite rezultate din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->