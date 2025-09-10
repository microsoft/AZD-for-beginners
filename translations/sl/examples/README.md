<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:27:48+00:00",
  "source_file": "examples/README.md",
  "language_code": "sl"
}
-->
# Primeri - Praktične predloge in konfiguracije AZD

## Uvod

Ta mapa vsebuje praktične primere, predloge in scenarije iz resničnega sveta, ki vam pomagajo pri učenju Azure Developer CLI skozi praktično vadbo. Vsak primer vključuje popolnoma delujočo kodo, infrastrukturne predloge in podrobna navodila za različne arhitekture aplikacij in vzorce uvajanja.

## Cilji učenja

Z delom na teh primerih boste:
- Vadili delovne tokove Azure Developer CLI z realističnimi aplikacijskimi scenariji
- Razumeli različne arhitekture aplikacij in njihove implementacije z azd
- Obvladali vzorce Infrastructure as Code za različne Azure storitve
- Uporabili strategije upravljanja konfiguracij in uvajanja, specifične za okolje
- Implementirali vzorce za spremljanje, varnost in skaliranje v praktičnih kontekstih
- Pridobili izkušnje z odpravljanjem težav in odpravljanjem napak pri resničnih scenarijih uvajanja

## Rezultati učenja

Po zaključku teh primerov boste sposobni:
- Z zaupanjem uvajati različne vrste aplikacij z uporabo Azure Developer CLI
- Prilagoditi predložene predloge svojim aplikacijskim zahtevam
- Oblikovati in implementirati prilagojene infrastrukturne vzorce z uporabo Bicep
- Konfigurirati kompleksne aplikacije z več storitvami in ustreznimi odvisnostmi
- Uporabiti najboljše prakse za varnost, spremljanje in zmogljivost v resničnih scenarijih
- Odpravljati težave in optimizirati uvajanja na podlagi praktičnih izkušenj

## Struktura mape

```
Azure Samples AZD Templates (linked externally):
├── todo-nodejs-mongo/       # Node.js Express with MongoDB
├── todo-csharp-sql-swa-func/ # React SPA with Static Web Apps  
├── container-apps-store-api/ # Python Flask containerized app
├── todo-csharp-sql/         # C# Web API with Azure SQL
├── todo-python-mongo-swa-func/ # Python Functions with Cosmos DB
├── java-microservices-aca-lab/ # Java microservices with Container Apps
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Hitri primeri za začetek

### Za začetnike
1. **[Preprosta spletna aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Uvajanje spletne aplikacije Node.js Express z MongoDB
2. **[Statična spletna stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Gostovanje statične spletne strani React z Azure Static Web Apps
3. **[Aplikacija v kontejnerju - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Uvajanje aplikacije Python Flask v kontejnerju

### Za uporabnike s srednjim znanjem
4. **[Aplikacija z bazo podatkov - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Spletna aplikacija z API-jem C# in bazo podatkov Azure SQL
5. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions z HTTP sprožilci in Cosmos DB
6. **[Mikrostoritve - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Večstoritevna Java aplikacija z Container Apps in API prehodom

### Predloge Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentna aplikacija za klepet z Azure OpenAI
2. **[Obdelava dokumentov z AI](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analiza dokumentov z uporabo storitev Azure AI
3. **[Strojno učenje - Pipeline](https://github.com/Azure-Samples/mlops-v2)** - Delovni tok MLOps z Azure Machine Learning

## 📋 Navodila za uporabo

### Zagon primerov lokalno

1. **Klonirajte ali kopirajte primer**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializirajte AZD okolje**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurirajte okolje**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Uvajanje**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Prilagajanje primerov

Vsak primer vključuje:
- **README.md** - Podrobna navodila za nastavitev in prilagoditev
- **azure.yaml** - AZD konfiguracija s komentarji
- **infra/** - Bicep predloge z razlagami parametrov
- **src/** - Vzorčna koda aplikacije
- **scripts/** - Pomožni skripti za pogoste naloge

## 🎯 Cilji učenja

### Kategorije primerov

#### **Osnovna uvajanja**
- Aplikacije z eno storitvijo
- Preprosti infrastrukturni vzorci
- Osnovno upravljanje konfiguracij
- Stroškovno učinkovite razvojne nastavitve

#### **Napredni scenariji**
- Arhitekture z več storitvami
- Kompleksne mrežne konfiguracije
- Vzorci integracije baz podatkov
- Implementacije varnosti in skladnosti

#### **Vzorce za produkcijo**
- Konfiguracije za visoko razpoložljivost
- Spremljanje in opazovanje
- Integracija CI/CD
- Nastavitve za obnovitev po katastrofi

## 📖 Opisi primerov

### Preprosta spletna aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Kompleksnost**: Začetnik  
**Koncepti**: Osnovno uvajanje, REST API, integracija NoSQL baze podatkov

### Statična spletna stran - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Kompleksnost**: Začetnik  
**Koncepti**: Statično gostovanje, serverless backend, sodoben spletni razvoj

### Aplikacija v kontejnerju - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry  
**Kompleksnost**: Začetnik  
**Koncepti**: Kontejnerizacija, arhitektura mikrostoritev, razvoj API-jev

### Aplikacija z bazo podatkov - C# z Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Kompleksnost**: Srednje zahtevno  
**Koncepti**: Entity Framework, povezave z bazo podatkov, razvoj spletnih API-jev

### Serverless funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Kompleksnost**: Srednje zahtevno  
**Koncepti**: Arhitektura, ki temelji na dogodkih, serverless računalništvo, razvoj celotnega sklopa

### Mikrostoritve - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Kompleksnost**: Srednje zahtevno  
**Koncepti**: Komunikacija med storitvami, porazdeljeni sistemi, vzorci za podjetja

### Primeri Azure AI Foundry

#### Azure OpenAI Chat App
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Kompleksnost**: Srednje zahtevno  
**Koncepti**: RAG arhitektura, iskanje vektorjev, integracija LLM

#### Obdelava dokumentov z AI
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Kompleksnost**: Srednje zahtevno  
**Koncepti**: Analiza dokumentov, OCR, ekstrakcija podatkov

#### Strojno učenje - Pipeline
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Kompleksnost**: Napredno  
**Koncepti**: Usposabljanje modelov, uvajanje pipeline, spremljanje

## 🛠 Konfiguracijski primeri

Mapa `configurations/` vsebuje ponovno uporabne komponente:

### Konfiguracije okolja
- Nastavitve za razvojno okolje
- Konfiguracije za testno okolje
- Konfiguracije za produkcijo
- Nastavitve za uvajanje v več regijah

### Bicep moduli
- Ponovno uporabne infrastrukturne komponente
- Pogosti vzorci virov
- Predloge z okrepljeno varnostjo
- Stroškovno optimizirane konfiguracije

### Pomožni skripti
- Avtomatizacija nastavitve okolja
- Skripti za migracijo baz podatkov
- Orodja za preverjanje uvajanja
- Pripomočki za spremljanje stroškov

## 🔧 Vodnik za prilagoditev

### Prilagajanje primerov za vaše potrebe

1. **Preglejte predpogoje**
   - Preverite zahteve za Azure storitve
   - Preverite omejitve naročnine
   - Razumite stroškovne posledice

2. **Spremenite konfiguracijo**
   - Posodobite definicije storitev v `azure.yaml`
   - Prilagodite Bicep predloge
   - Prilagodite okoljske spremenljivke

3. **Temeljito testirajte**
   - Najprej uvedite v razvojno okolje
   - Preverite funkcionalnost
   - Testirajte skaliranje in zmogljivost

4. **Pregled varnosti**
   - Preglejte nadzore dostopa
   - Implementirajte upravljanje skrivnosti
   - Omogočite spremljanje in opozarjanje

## 📊 Primerjalna tabela

| Primer | Storitve | Baza podatkov | Avtentikacija | Spremljanje | Kompleksnost |
|--------|----------|---------------|---------------|-------------|--------------|
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Polno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Polno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Polno | Polno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Polno | Polno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Polno | Polno | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Polno | Polno | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Osnovno | Polno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Polno | Polno | ⭐⭐⭐⭐ |

## 🎓 Učni načrt

### Priporočena progresija

1. **Začnite s preprosto spletno aplikacijo**
   - Naučite se osnovnih konceptov AZD
   - Razumite delovni tok uvajanja
   - Vadite upravljanje okolja

2. **Preizkusite statično spletno stran**
   - Raziščite različne možnosti gostovanja
   - Naučite se integracije CDN
   - Razumite konfiguracijo DNS

3. **Preidite na aplikacijo v kontejnerju**
   - Naučite se osnov kontejnerizacije
   - Razumite koncepte skaliranja
   - Vadite z Dockerjem

4. **Dodajte integracijo baze podatkov**
   - Naučite se zagotavljanja baz podatkov
   - Razumite povezovalne nize
   - Vadite upravljanje skrivnosti

5. **Raziščite serverless**
   - Razumite arhitekturo, ki temelji na dogodkih
   - Naučite se sprožilcev in vezav
   - Vadite z API-ji

6. **Zgradite mikrostoritve**
   - Naučite se komunikacije med storitvami
   - Razumite porazdeljene sisteme
   - Vadite kompleksna uvajanja

## 🔍 Iskanje pravega primera

### Po tehnološkem sklopu
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontejnerji**: Python Flask Container App, Java Microservices
- **Baze podatkov**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Po arhitekturnem vzorcu
- **Monolitne**: Node.js Express Todo, C# Web API + SQL
- **Statične + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrostoritve**: Java Spring Boot Microservices
- **Kontejnerizirane**: Python Flask Container App
- **AI-podprte**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Po stopnji kompleksnosti
- **Začetnik**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Srednje zahtevno**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Napredno**: ML Pipeline

## 📚 Dodatni viri

### Povezave do dokumentacije
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentacija Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primeri skupnosti
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App z C# in Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App z Python in MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App z Node.js in PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App z C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najboljše prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispevanje primerov

Imate uporaben primer za deljenje? Veseli bomo vaših prispevkov!

### Smernice za oddajo
1. Upoštevajte uveljavljeno strukturo mape
2. Vključite celovit README.md
3. Dodajte komentarje v konfiguracijske datoteke
4. Temeljito testirajte pred oddajo
5. Vključite ocene stroškov in predpogoje

### Struktura predloge za primer
```
example-name/
├── README.md           # Detailed setup instructions
├── azure.yaml          # AZD configuration
├── infra/              # Infrastructure templates
│   ├── main.bicep
│   └── modules/
├── src/                # Application source code
├── scripts/            # Helper scripts
├── .gitignore         # Git ignore rules
└── docs/              # Additional documentation
```

---

**Nasvet**: Začnite z najpreprostejšim primerom, ki ustreza vašemu tehnološkemu sklopu, nato pa postopoma preidite na bolj kompleksne scenarije. Vsak primer gradi na konceptih iz prejšnjih!

**Naslednji koraki**: 
- Izberite primer, ki ustreza vaši stopnji znanja
- Sledite navodilom za nastavitev v README datoteki primera
- Eksperimentirajte s prilagoditvami
- Delite svoje ugotovitve s skupnostjo

---

**Navigacija**
- **Prejšnja lekcija**: [Vodnik za študij](../resources/study-guide.md)
- **Vrnitev na**: [Glavni README](../README.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.