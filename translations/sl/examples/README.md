<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T13:06:57+00:00",
  "source_file": "examples/README.md",
  "language_code": "sl"
}
-->
# Primeri - Praktične predloge in konfiguracije za AZD

**Učenje s primeri - organizirano po poglavjih**
- **📚 Domača stran tečaja**: [AZD za začetnike](../README.md)
- **📖 Zemljevid poglavij**: Primeri, organizirani po stopnji zahtevnosti
- **🚀 Začnite preprosto**: [Primeri iz poglavja 1](../../../examples)
- **🤖 Primeri z AI**: [Primeri iz poglavij 2 in 5](../../../examples)

## Uvod

Ta mapa vsebuje praktične primere, predloge in scenarije iz resničnega sveta, ki vam bodo pomagali pri učenju Azure Developer CLI skozi praktično delo. Vsak primer vključuje popolnoma delujočo kodo, predloge za infrastrukturo in podrobna navodila za različne arhitekture aplikacij in vzorce uvajanja.

## Cilji učenja

Z delom na teh primerih boste:
- Vadili delovne tokove Azure Developer CLI z realističnimi scenariji aplikacij
- Razumeli različne arhitekture aplikacij in njihove implementacije z azd
- Obvladali vzorce infrastrukture kot kode za različne Azure storitve
- Uporabili strategije za upravljanje konfiguracij in uvajanje, specifično za okolje
- Implementirali vzorce za spremljanje, varnost in skaliranje v praktičnih kontekstih
- Pridobili izkušnje s odpravljanjem težav in odpravljanjem napak pri resničnih uvajanjih

## Rezultati učenja

Po zaključku teh primerov boste sposobni:
- Samozavestno uvajati različne vrste aplikacij z uporabo Azure Developer CLI
- Prilagoditi ponujene predloge svojim lastnim zahtevam aplikacij
- Načrtovati in implementirati prilagojene vzorce infrastrukture z uporabo Bicep
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

## Primeri za hiter začetek

### Za začetnike
1. **[Preprosta spletna aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Uvajanje spletne aplikacije Node.js Express z MongoDB
2. **[Statična spletna stran - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Gostovanje statične spletne strani React z Azure Static Web Apps
3. **[Aplikacija v kontejnerju - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Uvajanje Python Flask aplikacije v kontejnerju

### Za uporabnike s srednjim znanjem
4. **[Aplikacija z bazo podatkov - C# z Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Spletna aplikacija z API-jem v C# in Azure SQL bazo podatkov
5. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions z HTTP sprožilci in Cosmos DB
6. **[Mikrostoritve - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Večstoritevna Java aplikacija z Container Apps in API prehodom

### Predloge za Azure AI Foundry

1. **[Azure OpenAI Chat App](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentna klepetalna aplikacija z Azure OpenAI
2. **[AI obdelava dokumentov](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analiza dokumentov z uporabo Azure AI storitev
3. **[Strojno učenje - cevovod](https://github.com/Azure-Samples/mlops-v2)** - MLOps delovni tok z Azure Machine Learning

### Scenariji iz resničnega sveta

#### **Rešitev za maloprodajo z več agenti** 🆕
**[Celoten vodič za implementacijo](./retail-scenario.md)**

Celovita, za produkcijo pripravljena rešitev za podporo strankam z več agenti, ki prikazuje uvajanje AI aplikacij na ravni podjetja z AZD. Ta scenarij vključuje:

- **Popolna arhitektura**: Sistem z več agenti za podporo strankam in upravljanje zalog
- **Infrastruktura za produkcijo**: Uvajanja Azure OpenAI v več regijah, AI Search, Container Apps in celovito spremljanje
- **Pripravljena ARM predloga**: Uvajanje z enim klikom z več načini konfiguracije (Minimalno/Standardno/Premium)
- **Napredne funkcije**: Validacija varnosti, okvir za ocenjevanje agentov, optimizacija stroškov in vodiči za odpravljanje težav
- **Resnični poslovni kontekst**: Primer uporabe za podporo strankam v maloprodaji z nalaganjem datotek, integracijo iskanja in dinamičnim skaliranjem

**Tehnologije**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Zahtevnost**: ⭐⭐⭐⭐ (Napredno - Pripravljeno za produkcijo)

**Idealno za**: AI razvijalce, arhitekte rešitev in ekipe, ki gradijo produkcijske sisteme z več agenti

**Hiter začetek**: Uvedite celotno rešitev v manj kot 30 minutah z vključeno ARM predlogo z `./deploy.sh -g myResourceGroup`

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

4. **Uvedite**
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

## 🎯 Učni cilji

### Kategorije primerov

#### **Osnovna uvajanja**
- Aplikacije z eno storitvijo
- Preprosti vzorci infrastrukture
- Osnovno upravljanje konfiguracij
- Stroškovno učinkovite razvojne nastavitve

#### **Napredni scenariji**
- Arhitekture z več storitvami
- Kompleksne mrežne konfiguracije
- Vzorci integracije baz podatkov
- Implementacije za varnost in skladnost

#### **Vzorce za produkcijo**
- Konfiguracije za visoko razpoložljivost
- Spremljanje in opazovanje
- Integracija CI/CD
- Načrti za obnovitev po nesrečah

## 📖 Opisi primerov

### Preprosta spletna aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Zahtevnost**: Začetnik  
**Koncepti**: Osnovno uvajanje, REST API, integracija NoSQL baze podatkov

### Statična spletna stran - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Zahtevnost**: Začetnik  
**Koncepti**: Statično gostovanje, serverless backend, sodoben spletni razvoj

### Aplikacija v kontejnerju - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry  
**Zahtevnost**: Začetnik  
**Koncepti**: Kontejnerizacija, arhitektura mikrostoritev, razvoj API-jev

### Aplikacija z bazo podatkov - C# z Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Zahtevnost**: Srednje  
**Koncepti**: Entity Framework, povezave z bazo podatkov, razvoj spletnih API-jev

### Serverless funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Zahtevnost**: Srednje  
**Koncepti**: Arhitektura, ki temelji na dogodkih, serverless računalništvo, razvoj celotnega sklada

### Mikrostoritve - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Zahtevnost**: Srednje  
**Koncepti**: Komunikacija med storitvami, porazdeljeni sistemi, vzorci za podjetja

### Primeri za Azure AI Foundry

#### Azure OpenAI Chat App
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Zahtevnost**: Srednje  
**Koncepti**: RAG arhitektura, vektorsko iskanje, integracija LLM

#### AI obdelava dokumentov
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Zahtevnost**: Srednje  
**Koncepti**: Analiza dokumentov, OCR, ekstrakcija podatkov

#### Strojno učenje - cevovod
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Zahtevnost**: Napredno  
**Koncepti**: Usposabljanje modelov, uvajanje cevovodov, spremljanje

## 🛠 Primeri konfiguracij

Mapa `configurations/` vsebuje ponovno uporabne komponente:

### Konfiguracije okolja
- Nastavitve za razvojno okolje
- Konfiguracije za testno okolje
- Konfiguracije, pripravljene za produkcijo
- Uvajanja v več regijah

### Bicep moduli
- Ponovno uporabne komponente infrastrukture
- Pogosti vzorci virov
- Predloge, utrjene za varnost
- Stroškovno optimizirane konfiguracije

### Pomožni skripti
- Avtomatizacija nastavitve okolja
- Skripti za migracijo baz podatkov
- Orodja za validacijo uvajanja
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
   - Validirajte funkcionalnost
   - Testirajte skaliranje in zmogljivost

4. **Pregled varnosti**
   - Preglejte nadzore dostopa
   - Implementirajte upravljanje skrivnosti
   - Omogočite spremljanje in opozarjanje

## 📊 Primerjalna tabela

| Primer | Storitve | Baza podatkov | Avtentikacija | Spremljanje | Zahtevnost |
|---------|----------|--------------|---------------|-------------|------------|
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Polno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Polno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Polno | Polno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Polno | Polno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Polno | Polno | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Polno | Polno | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Osnovno | Polno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Polno | Polno | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Podjetniško** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Učna pot

### Priporočeni vrstni red

1. **Začnite s preprosto spletno aplikacijo**
   - Spoznajte osnovne koncepte AZD
   - Razumite delovni tok uvajanja
   - Vadite upravljanje okolja

2. **Preizkusite statično spletno stran**
   - Raziščite različne možnosti gostovanja
   - Spoznajte integracijo CDN
   - Razumite konfiguracijo DNS

3. **Preidite na aplikacijo v kontejnerju**
   - Spoznajte osnove kontejnerizacije
   - Razumite koncepte skaliranja
   - Vadite z Dockerjem

4. **Dodajte integracijo baze podatkov**
   - Naučite se zagotavljanja baz podatkov
   - Razumite povezovalne nize
   - Vadite upravljanje skrivnosti

5. **Raziščite serverless**
   - Razumite arhitekturo, ki temelji na dogodkih
   - Spoznajte sprožilce in vezave
   - Vadite z API-ji

6. **Zgradite mikrostoritve**
   - Naučite se komunikacije med storitvami
   - Razumite porazdeljene sisteme
   - Vadite kompleksna uvajanja

## 🔍 Iskanje pravega primera

### Po tehnološkem skladu
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontejnerji**: Python Flask Container App, Java Microservices
- **Baze podatkov**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sistemi z več agenti**: **Retail Multi-Agent Solution**
- **Produkcija na ravni podjetja**: **Retail Multi-Agent Solution**

### Po arhitekturnem vzorcu
- **Monolitne**: Node.js Express Todo, C# Web API + SQL
- **Statične + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikrostoritve**: Java Spring Boot Microservices
- **Kontejnerizirane**: Python Flask Container App
- **AI-podprte**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arhitektura z več agenti**: **Retail Multi-Agent Solution**
- **Večstoritevne na ravni podjetja**: **Retail Multi-Agent Solution**

### Po stopnji zahtevnosti
- **Začetnik**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Srednje**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Napredno**: ML Pipeline
- **Pripravljeno za produkcijo**: **Retail Multi-Agent Solution** (Celoten sistem z več agenti z uvajanjem prek ARM predloge)

## 📚 Dodatni viri

### Povezave do dokumentacije
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Arhitekturni center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primeri iz skupnosti
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Galerija](https://azure.github.io/awesome-azd/)
- [Aplikacija za opravila s C# in Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Aplikacija za opravila s Python in MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Aplikacija za opravila z Node.js in PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React spletna aplikacija z API-jem v C#](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions z Javo](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najboljše prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Prispevanje primerov

Imate uporaben primer, ki bi ga želeli deliti? Veseli bomo vaših prispevkov!

### Smernice za oddajo
1. Upoštevajte obstoječo strukturo imenikov
2. Vključite izčrpen README.md
3. Dodajte komentarje v konfiguracijske datoteke
4. Temeljito testirajte pred oddajo
5. Vključite ocene stroškov in predpogoje

### Primer strukture predloge
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

**Koristen nasvet**: Začnite z najpreprostejšim primerom, ki ustreza vaši tehnološki zgradbi, nato pa postopoma prehajajte na bolj zapletene scenarije. Vsak primer gradi na konceptih iz prejšnjih!

**Naslednji koraki**: 
- Izberite primer, ki ustreza vaši ravni znanja
- Sledite navodilom za nastavitev v README izbranega primera
- Eksperimentirajte s prilagoditvami
- Delite svoje ugotovitve s skupnostjo

---

**Navigacija**
- **Prejšnja lekcija**: [Vodnik za učenje](../resources/study-guide.md)
- **Nazaj na**: [Glavni README](../README.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna napačna razumevanja ali napačne interpretacije, ki bi nastale zaradi uporabe tega prevoda.