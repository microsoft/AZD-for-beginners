<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "22ea3f5148517a6012d3e2771584ef87",
  "translation_date": "2025-11-23T19:19:13+00:00",
  "source_file": "examples/container-app/microservices/README.md",
  "language_code": "ro"
}
-->
# Arhitectura Microservicii - Exemplu de Aplicație Container

⏱️ **Timp Estimat**: 25-35 minute | 💰 **Cost Estimat**: ~$50-100/lună | ⭐ **Complexitate**: Avansată

O arhitectură de microservicii **simplificată, dar funcțională**, implementată pe Azure Container Apps folosind AZD CLI. Acest exemplu demonstrează comunicarea între servicii, orchestrarea containerelor și monitorizarea, cu o configurație practică de 2 servicii.

> **📚 Abordare de Învățare**: Acest exemplu începe cu o arhitectură minimă de 2 servicii (API Gateway + Backend Service) pe care o puteți implementa și învăța. După ce stăpâniți această bază, oferim îndrumări pentru extinderea către un ecosistem complet de microservicii.

## Ce Veți Învăța

Finalizând acest exemplu, veți:
- Implementa mai multe containere pe Azure Container Apps
- Realiza comunicarea între servicii prin rețele interne
- Configura scalarea bazată pe mediu și verificările de sănătate
- Monitoriza aplicații distribuite cu Application Insights
- Înțelege modelele de implementare ale microserviciilor și cele mai bune practici
- Învăța cum să extindeți progresiv de la arhitecturi simple la complexe

## Arhitectura

### Faza 1: Ce Construim (Inclus în Acest Exemplu)

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

**De ce să Începem Simplu?**
- ✅ Implementare și înțelegere rapidă (25-35 minute)
- ✅ Învățare a modelelor de bază ale microserviciilor fără complexitate
- ✅ Cod funcțional pe care îl puteți modifica și experimenta
- ✅ Costuri reduse pentru învățare (~$50-100/lună vs $300-1400/lună)
- ✅ Creșterea încrederii înainte de a adăuga baze de date și cozi de mesaje

**Analogie**: Gândiți-vă la asta ca la învățarea condusului. Începeți într-o parcare goală (2 servicii), stăpâniți elementele de bază, apoi progresați către traficul urban (5+ servicii cu baze de date).

### Faza 2: Extindere Viitoare (Arhitectură de Referință)

După ce stăpâniți arhitectura cu 2 servicii, puteți extinde către:

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

Consultați secțiunea "Ghid de Extindere" de la final pentru instrucțiuni pas cu pas.

## Funcționalități Incluse

✅ **Descoperirea Serviciilor**: Descoperire automată bazată pe DNS între containere  
✅ **Balansare de Sarcină**: Balansare de sarcină integrată între replici  
✅ **Auto-scalare**: Scalare independentă per serviciu bazată pe cereri HTTP  
✅ **Monitorizare Sănătate**: Probele de liveness și readiness pentru ambele servicii  
✅ **Logare Distribuită**: Logare centralizată cu Application Insights  
✅ **Rețea Internă**: Comunicare sigură între servicii  
✅ **Orchestrare Containere**: Implementare și scalare automată  
✅ **Actualizări Fără Timp de Nefuncționare**: Actualizări progresive cu gestionarea reviziilor  

## Cerințe Prealabile

### Instrumente Necesare

Înainte de a începe, verificați dacă aveți aceste instrumente instalate:

1. **[Azure Developer CLI (azd)](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd)** (versiunea 1.0.0 sau mai mare)
   ```bash
   azd version
   # Rezultatul așteptat: versiunea azd 1.0.0 sau mai mare
   ```

2. **[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)** (versiunea 2.50.0 sau mai mare)
   ```bash
   az --version
   # Rezultatul așteptat: azure-cli 2.50.0 sau mai mare
   ```

3. **[Docker](https://www.docker.com/get-started)** (pentru dezvoltare/testare locală - opțional)
   ```bash
   docker --version
   # Rezultatul așteptat: versiunea Docker 20.10 sau mai mare
   ```

### Cerințe Azure

- Un **abonament Azure** activ ([creați un cont gratuit](https://azure.microsoft.com/free/))
- Permisiuni pentru a crea resurse în abonamentul dvs.
- Rolul **Contributor** pe abonament sau grupul de resurse

### Cerințe de Cunoștințe

Acesta este un exemplu de **nivel avansat**. Ar trebui să aveți:
- Finalizat exemplul [Simple Flask API](../../../../../examples/container-app/simple-flask-api) 
- O înțelegere de bază a arhitecturii microserviciilor
- Familiaritate cu API-urile REST și HTTP
- Înțelegerea conceptelor de containere

**Nou în Container Apps?** Începeți cu exemplul [Simple Flask API](../../../../../examples/container-app/simple-flask-api) pentru a învăța elementele de bază.

## Ghid Rapid (Pas cu Pas)

### Pasul 1: Clonați și Navigați

```bash
git clone https://github.com/microsoft/AZD-for-beginners.git
cd AZD-for-beginners/examples/container-app/microservices
```

**✓ Verificare Succes**: Verificați dacă vedeți `azure.yaml`:
```bash
ls
# Așteptat: README.md, azure.yaml, infra/, src/
```

### Pasul 2: Autentificați-vă cu Azure

```bash
azd auth login
```

Aceasta deschide browserul pentru autentificarea Azure. Conectați-vă cu acreditările dvs. Azure.

**✓ Verificare Succes**: Ar trebui să vedeți:
```
Logged in to Azure.
```

### Pasul 3: Inițializați Mediul

```bash
azd init
```

**Prompturi pe care le veți vedea**:
- **Nume mediu**: Introduceți un nume scurt (ex.: `microservices-dev`)
- **Abonament Azure**: Selectați abonamentul dvs.
- **Locație Azure**: Alegeți o regiune (ex.: `eastus`, `westeurope`)

**✓ Verificare Succes**: Ar trebui să vedeți:
```
SUCCESS: New project initialized!
```

### Pasul 4: Implementați Infrastructura și Serviciile

```bash
azd up
```

**Ce se întâmplă** (durează 8-12 minute):
1. Creează mediul Container Apps
2. Creează Application Insights pentru monitorizare
3. Construiește containerul API Gateway (Node.js)
4. Construiește containerul Product Service (Python)
5. Implementează ambele containere pe Azure
6. Configurează rețelele și verificările de sănătate
7. Configurează monitorizarea și logarea

**✓ Verificare Succes**: Ar trebui să vedeți:
```
SUCCESS: Your application was deployed to Azure in X minutes Y seconds.
Endpoint: https://api-gateway-<unique-id>.azurecontainerapps.io
```

**⏱️ Timp**: 8-12 minute

### Pasul 5: Testați Implementarea

```bash
# Obține punctul final al gateway-ului
GATEWAY_URL=$(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')

# Testează starea de sănătate a API Gateway
curl $GATEWAY_URL/health

# Rezultatul așteptat:
# {"status":"healthy","service":"api-gateway","timestamp":"2025-11-19T10:30:00Z"}
```

**Testați serviciul de produse prin gateway**:
```bash
# Listează produsele
curl $GATEWAY_URL/api/products

# Rezultatul așteptat:
# [
#   {"id":1,"name":"Laptop","price":999.99,"stock":50},
#   {"id":2,"name":"Mouse","price":29.99,"stock":200},
#   {"id":3,"name":"Tastatură","price":79.99,"stock":150}
# ]
```

**✓ Verificare Succes**: Ambele endpoint-uri returnează date JSON fără erori.

---

**🎉 Felicitări!** Ați implementat o arhitectură de microservicii pe Azure!

## Structura Proiectului

Toate fișierele de implementare sunt incluse—acesta este un exemplu complet și funcțional:

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

**Ce Face Fiecare Componentă:**

**Infrastructură (infra/)**:
- `main.bicep`: Orchestrarea tuturor resurselor Azure și a dependențelor acestora
- `core/container-apps-environment.bicep`: Creează mediul Container Apps și Azure Container Registry
- `core/monitor.bicep`: Configurează Application Insights pentru logare distribuită
- `app/*.bicep`: Definiții individuale ale aplicațiilor container cu scalare și verificări de sănătate

**API Gateway (src/api-gateway/)**:
- Serviciu public care rutează cererile către serviciile backend
- Implementează logare, gestionarea erorilor și redirecționarea cererilor
- Demonstrează comunicarea HTTP între servicii

**Product Service (src/product-service/)**:
- Serviciu intern cu catalog de produse (în memorie pentru simplitate)
- API REST cu verificări de sănătate
- Exemplu de model backend pentru microservicii

## Prezentare Generală a Serviciilor

### API Gateway (Node.js/Express)

**Port**: 8080  
**Acces**: Public (ingress extern)  
**Scop**: Rutează cererile primite către serviciile backend corespunzătoare  

**Endpoint-uri**:
- `GET /` - Informații despre serviciu
- `GET /health` - Endpoint de verificare a sănătății
- `GET /api/products` - Redirecționează către serviciul de produse (listare toate)
- `GET /api/products/:id` - Redirecționează către serviciul de produse (obține după ID)

**Funcționalități Cheie**:
- Rutare cereri cu axios
- Logare centralizată
- Gestionarea erorilor și a timeout-urilor
- Descoperirea serviciilor prin variabile de mediu
- Integrare Application Insights

**Fragment de Cod** (`src/api-gateway/app.js`):
```javascript
// Comunicare între servicii interne
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
- `GET /` - Informații despre serviciu
- `GET /health` - Endpoint de verificare a sănătății
- `GET /products` - Listează toate produsele
- `GET /products/<id>` - Obține produsul după ID

**Funcționalități Cheie**:
- API RESTful cu Flask
- Stocare de produse în memorie (simplu, fără bază de date necesară)
- Monitorizare sănătate cu probe
- Logare structurată
- Integrare Application Insights

**Model de Date**:
```python
{
  "id": 1,
  "name": "Laptop",
  "description": "High-performance laptop",
  "price": 999.99,
  "stock": 50
}
```

**De ce Doar Intern?**
Serviciul de produse nu este expus public. Toate cererile trebuie să treacă prin API Gateway, care oferă:
- Securitate: Punct de acces controlat
- Flexibilitate: Se poate schimba backend-ul fără a afecta clienții
- Monitorizare: Logare centralizată a cererilor

## Înțelegerea Comunicării între Servicii

### Cum Comunică Serviciile Între Ele

În acest exemplu, API Gateway comunică cu Product Service folosind **apeluri HTTP interne**:

```javascript
// Gateway API (src/api-gateway/app.js)
const PRODUCT_SERVICE_URL = process.env.PRODUCT_SERVICE_URL;

// Efectuează cerere HTTP internă
const response = await axios.get(`${PRODUCT_SERVICE_URL}/products`);
```

**Puncte Cheie**:

1. **Descoperire Bazată pe DNS**: Container Apps oferă automat DNS pentru servicii interne
   - FQDN pentru Product Service: `product-service.internal.<environment>.azurecontainerapps.io`
   - Simplificat ca: `http://product-service` (Container Apps îl rezolvă)

2. **Fără Expunere Publică**: Product Service are `external: false` în Bicep
   - Accesibil doar în mediul Container Apps
   - Nu poate fi accesat de pe internet

3. **Variabile de Mediu**: URL-urile serviciilor sunt injectate la momentul implementării
   - Bicep transmite FQDN-ul intern către gateway
   - Fără URL-uri hardcodate în codul aplicației

**Analogie**: Gândiți-vă la asta ca la camerele de birou. API Gateway este recepția (publică), iar Product Service este o cameră de birou (doar internă). Vizitatorii trebuie să treacă prin recepție pentru a ajunge la orice birou.

## Opțiuni de Implementare

### Implementare Completă (Recomandată)

```bash
# Implementați infrastructura și ambele servicii
azd up
```

Aceasta implementează:
1. Mediul Container Apps
2. Application Insights
3. Container Registry
4. Containerul API Gateway
5. Containerul Product Service

**Timp**: 8-12 minute

### Implementare Serviciu Individual

```bash
# Implementați doar un serviciu (după azd up inițial)
azd deploy api-gateway

# Sau implementați serviciul de produs
azd deploy product-service
```

**Caz de Utilizare**: Când ați actualizat codul într-un serviciu și doriți să implementați doar acel serviciu.

### Actualizare Configurație

```bash
# Schimbați parametrii de scalare
azd env set GATEWAY_MAX_REPLICAS 30

# Redeployați cu noua configurație
azd up
```

## Configurație

### Configurație Scalare

Ambele servicii sunt configurate cu auto-scalare bazată pe HTTP în fișierele Bicep:

**API Gateway**:
- Min replici: 2 (mereu cel puțin 2 pentru disponibilitate)
- Max replici: 20
- Trigger scalare: 50 cereri simultane per replică

**Product Service**:
- Min replici: 1 (poate scala la zero dacă este necesar)
- Max replici: 10
- Trigger scalare: 100 cereri simultane per replică

**Personalizați Scalarea** (în `infra/app/*.bicep`):
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
- Motiv: Gestionează tot traficul extern

**Product Service**:
- CPU: 0.5 vCPU
- Memorie: 1 GiB
- Motiv: Operațiuni ușoare în memorie

### Verificări de Sănătate

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

**Ce Înseamnă Acest Lucru**:
- **Liveness**: Dacă verificarea sănătății eșuează, Container Apps repornește containerul
- **Readiness**: Dacă nu este gata, Container Apps oprește rutarea traficului către acea replică

## Monitorizare și Observabilitate

### Vizualizare Loguri Servicii

```bash
# Transmite jurnale de la API Gateway
azd logs api-gateway --follow

# Vizualizează jurnalele recente ale serviciului de produse
azd logs product-service --tail 100

# Vizualizează toate jurnalele de la ambele servicii
azd logs --follow
```

**Output Așteptat**:
```
[api-gateway] API Gateway listening on port 8080
[api-gateway] Product Service URL: http://product-service
[api-gateway] GET /api/products 200 - 45ms
[product-service] Retrieved 5 products
```

### Interogări Application Insights

Accesați Application Insights în Azure Portal, apoi rulați aceste interogări:

**Găsiți Cereri Lente**:
```kusto
requests
| where timestamp > ago(1h)
| where duration > 1000  // Requests taking >1 second
| summarize count() by name, cloud_RoleName
| order by count_ desc
```

**Urmăriți Apelurile între Servicii**:
```kusto
dependencies
| where timestamp > ago(1h)
| where type == "Http"
| project timestamp, name, target, duration, success
| order by timestamp desc
```

**Rata de Erori pe Serviciu**:
```kusto
exceptions
| where timestamp > ago(24h)
| summarize errorCount = count() by cloud_RoleName, type
| order by errorCount desc
```

**Volumul Cererilor în Timp**:
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

# Deschide monitorizarea portalului Azure
az monitor app-insights component show \
  --app $(azd env get-values | grep APPLICATIONINSIGHTS_CONNECTION_STRING | cut -d '=' -f2) \
  --resource-group $(azd env get-values | grep AZURE_RESOURCE_GROUP | cut -d '=' -f2) \
  --query "appId" -o tsv
```

### Metrice Live

1. Navigați la Application Insights în Azure Portal
2. Click pe "Live Metrics"
3. Vizualizați cererile, eșecurile și performanța în timp real
4. Testați rulând: `curl $(azd env get-values | grep API_GATEWAY_URL | cut -d '=' -f2 | tr -d '"')/api/products`

## Exerciții Practice

[Notă: Consultați exercițiile complete de mai sus în secțiunea "Exerciții Practice" pentru detalii pas cu pas, inclusiv verificarea implementării, modificarea datelor, testele de auto-scalare, gestionarea erorilor și adăugarea unui al treilea serviciu.]

## Analiza Costurilor

### Costuri Estimative Lunare (Pentru Acest Exemplu cu 2 Servicii)

| Resursă | Configurație | Cost Estimat |
|---------|--------------|--------------|
| API Gateway | 2-20 replici, 1 vCPU, 2GB RAM | $30-150 |
| Product Service | 1-10 replici, 0.5 vCPU, 1GB RAM | $15-75 |
| Container Registry | Tier Basic | $5 |
| Application Insights | 1-2 GB/lună | $5-10 |
| Log Analytics | 1 GB/lună | $3 |
| **Total** | | **$58-243/lună** |

**Defalcare Costuri pe Utilizare**:
- **Trafic redus** (testare/învățare): ~$60/lună
- **Trafic moderat** (producție mică): ~$120/lună
- **Trafic intens** (perioade aglomerate): ~$240/lună

### Sfaturi pentru Optimizarea Costurilor

1. **Scalați la Zero pentru Dezvoltare**:
   ```bicep
   scale: {
     minReplicas: 0  // Save $30-40/month when not in use
     maxReplicas: 10
   }
   ```

2. **Folosiți Planul de Consum pentru Cosmos DB** (când îl adăugați):
   - Plătiți doar pentru ceea ce utilizați
   - Fără taxe minime

3. **Setați Sampling pentru Application Insights**:
   ```javascript
   appInsights.defaultClient.config.samplingPercentage = 50; // Eșantionează 50% din cereri
   ```

4. **Curățați Resursele Când Nu Sunt Necesare**:
   ```bash
   azd down
   ```

### Opțiuni de Tier Gratuit
Pentru învățare/testare, luați în considerare:
- Utilizați creditele gratuite Azure (primele 30 de zile)
- Mențineți numărul minim de replici
- Ștergeți după testare (fără costuri continue)

---

## Curățare

Pentru a evita costurile continue, ștergeți toate resursele:

```bash
azd down --force --purge
```

**Prompt de Confirmare**:
```
? Total resources to delete: 6, are you sure you want to continue? (y/N)
```

Tastați `y` pentru a confirma.

**Ce se șterge**:
- Mediul Container Apps
- Ambele Container Apps (gateway & serviciul de produse)
- Container Registry
- Application Insights
- Log Analytics Workspace
- Resource Group

**✓ Verificați Curățarea**:
```bash
az group list --query "[?starts_with(name,'rg-microservices')]" --output table
```

Ar trebui să returneze gol.

---

## Ghid de Extindere: De la 2 la 5+ Servicii

După ce ați stăpânit această arhitectură cu 2 servicii, iată cum să o extindeți:

### Faza 1: Adăugați Persistența Bazei de Date (Pasul Următor)

**Adăugați Cosmos DB pentru Serviciul de Produse**:

1. Creați `infra/core/cosmos.bicep`:
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

2. Actualizați serviciul de produse pentru a utiliza Cosmos DB în loc de date în memorie

3. Cost estimat suplimentar: ~25 USD/lună (serverless)

### Faza 2: Adăugați al Treilea Serviciu (Managementul Comenzilor)

**Creați Serviciul de Comenzi**:

1. Folder nou: `src/order-service/` (Python/Node.js/C#)
2. Bicep nou: `infra/app/order-service.bicep`
3. Actualizați API Gateway pentru a ruta `/api/orders`
4. Adăugați Azure SQL Database pentru persistența comenzilor

**Arhitectura devine**:
```
API Gateway → Product Service (Cosmos DB)
           → Order Service (Azure SQL)
```

### Faza 3: Adăugați Comunicare Asincronă (Service Bus)

**Implementați Arhitectura Bazată pe Evenimente**:

1. Adăugați Azure Service Bus: `infra/core/servicebus.bicep`
2. Serviciul de Produse publică evenimente "ProductCreated"
3. Serviciul de Comenzi se abonează la evenimentele produselor
4. Adăugați Serviciul de Notificări pentru a procesa evenimentele

**Model**: Cerere/Răspuns (HTTP) + Bazat pe Evenimente (Service Bus)

### Faza 4: Adăugați Autentificarea Utilizatorilor

**Implementați Serviciul de Utilizatori**:

1. Creați `src/user-service/` (Go/Node.js)
2. Adăugați Azure AD B2C sau autentificare JWT personalizată
3. API Gateway validează token-urile
4. Serviciile verifică permisiunile utilizatorilor

### Faza 5: Pregătirea pentru Producție

**Adăugați Aceste Componente**:
- Azure Front Door (echilibrare globală a încărcării)
- Azure Key Vault (gestionarea secretelor)
- Azure Monitor Workbooks (dashboard-uri personalizate)
- CI/CD Pipeline (GitHub Actions)
- Implementări Blue-Green
- Managed Identity pentru toate serviciile

**Costul Arhitecturii Complete pentru Producție**: ~300-1.400 USD/lună

---

## Aflați Mai Multe

### Documentație Relatedă
- [Documentația Azure Container Apps](https://learn.microsoft.com/azure/container-apps/)
- [Ghidul Arhitecturii Microserviciilor](https://learn.microsoft.com/azure/architecture/guide/architecture-styles/microservices)
- [Application Insights pentru Tracing Distribuit](https://learn.microsoft.com/azure/azure-monitor/app/distributed-tracing)
- [Documentația Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

### Pașii Următori în Acest Curs
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api) - Exemplu simplu cu un singur container
- → Următor: [AI Integration Guide](../../../../../examples/docs/ai-foundry) - Adăugați capabilități AI
- 🏠 [Pagina Principală a Cursului](../../README.md)

### Comparație: Când să Folosiți Ce

**Single Container App** (Exemplu Simple Flask API):
- ✅ Aplicații simple
- ✅ Arhitectură monolitică
- ✅ Rapid de implementat
- ❌ Scalabilitate limitată
- **Cost**: ~15-50 USD/lună

**Microservicii** (Acest exemplu):
- ✅ Aplicații complexe
- ✅ Scalare independentă pe serviciu
- ✅ Autonomie pentru echipe (servicii diferite, echipe diferite)
- ❌ Mai complex de gestionat
- **Cost**: ~60-250 USD/lună

**Kubernetes (AKS)**:
- ✅ Control și flexibilitate maxime
- ✅ Portabilitate multi-cloud
- ✅ Rețelistică avansată
- ❌ Necesită expertiză Kubernetes
- **Cost**: ~150-500 USD/lună minim

**Recomandare**: Începeți cu Container Apps (acest exemplu), treceți la AKS doar dacă aveți nevoie de funcționalități specifice Kubernetes.

---

## Întrebări Frecvente

**Î: De ce doar 2 servicii în loc de 5+?**  
R: Progres educațional. Stăpâniți fundamentele (comunicarea între servicii, monitorizarea, scalarea) cu un exemplu simplu înainte de a adăuga complexitate. Modelele învățate aici se aplică arhitecturilor cu 100 de servicii.

**Î: Pot adăuga mai multe servicii singur?**  
R: Absolut! Urmați ghidul de extindere de mai sus. Fiecare serviciu nou urmează același model: creați folderul `src`, creați fișierul Bicep, actualizați `azure.yaml`, implementați.

**Î: Este aceasta gata pentru producție?**  
R: Este o bază solidă. Pentru producție, adăugați: identitate gestionată, Key Vault, baze de date persistente, pipeline CI/CD, alerte de monitorizare și strategie de backup.

**Î: De ce să nu folosesc Dapr sau alt service mesh?**  
R: Păstrați lucrurile simple pentru învățare. După ce înțelegeți rețelistica nativă a Container Apps, puteți adăuga Dapr pentru scenarii avansate.

**Î: Cum depanez local?**  
R: Rulați serviciile local cu Docker:
```bash
cd src/api-gateway
docker build -t local-gateway .
docker run -p 8080:8080 -e PRODUCT_SERVICE_URL=http://localhost:8000 local-gateway
```

**Î: Pot folosi limbaje de programare diferite?**  
R: Da! Acest exemplu arată Node.js (gateway) + Python (serviciul de produse). Puteți combina orice limbaje care rulează în containere.

**Î: Ce fac dacă nu am credite Azure?**  
R: Utilizați nivelul gratuit Azure (primele 30 de zile cu conturi noi) sau implementați pentru perioade scurte de testare și ștergeți imediat.

---

> **🎓 Rezumatul Căii de Învățare**: Ați învățat să implementați o arhitectură multi-servicii cu scalare automată, rețelistică internă, monitorizare centralizată și modele pregătite pentru producție. Această bază vă pregătește pentru sisteme distribuite complexe și arhitecturi de microservicii la nivel de întreprindere.

**📚 Navigare Curs**:
- ← Anterior: [Simple Flask API](../../../../../examples/container-app/simple-flask-api)
- → Următor: [Database Integration Example](../../../../../examples/database-app)
- 🏠 [Pagina Principală a Cursului](../../README.md)
- 📖 [Container Apps Best Practices](../../docs/deployment/deployment-guide.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare de responsabilitate**:  
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). Deși ne străduim să asigurăm acuratețea, vă rugăm să fiți conștienți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa maternă ar trebui considerat sursa autoritară. Pentru informații critice, se recomandă traducerea profesională realizată de un specialist uman. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care pot apărea din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->