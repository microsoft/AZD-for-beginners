<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "e45896a8acbafead1f195788780a4ab7",
  "translation_date": "2025-09-10T16:27:07+00:00",
  "source_file": "examples/README.md",
  "language_code": "hr"
}
-->
# Primjeri - Praktični AZD predlošci i konfiguracije

## Uvod

Ovaj direktorij sadrži praktične primjere, predloške i stvarne scenarije koji će vam pomoći da naučite Azure Developer CLI kroz praktičnu primjenu. Svaki primjer pruža kompletan radni kod, infrastrukturne predloške i detaljne upute za različite arhitekture aplikacija i obrasce implementacije.

## Ciljevi učenja

Radom na ovim primjerima, naučit ćete:
- Prakticirati Azure Developer CLI radne procese s realističnim scenarijima aplikacija
- Razumjeti različite arhitekture aplikacija i njihove azd implementacije
- Ovladati obrascima Infrastructure as Code za razne Azure usluge
- Primijeniti strategije upravljanja konfiguracijom i implementacije specifične za okruženje
- Implementirati obrasce za praćenje, sigurnost i skaliranje u praktičnim kontekstima
- Steći iskustvo u rješavanju problema i otklanjanju grešaka u stvarnim scenarijima implementacije

## Ishodi učenja

Nakon završetka ovih primjera, moći ćete:
- Pouzdano implementirati različite vrste aplikacija koristeći Azure Developer CLI
- Prilagoditi pružene predloške vlastitim zahtjevima aplikacije
- Dizajnirati i implementirati prilagođene infrastrukturne obrasce koristeći Bicep
- Konfigurirati složene aplikacije s više usluga uz pravilne ovisnosti
- Primijeniti najbolje prakse za sigurnost, praćenje i performanse u stvarnim scenarijima
- Rješavati probleme i optimizirati implementacije na temelju praktičnog iskustva

## Struktura direktorija

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

## Primjeri za brzi početak

### Za početnike
1. **[Jednostavna web aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Implementirajte Node.js Express web aplikaciju s MongoDB-om
2. **[Statistička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hostajte React statičku web stranicu s Azure Static Web Apps
3. **[Aplikacija u kontejneru - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Implementirajte Python Flask aplikaciju u kontejneru

### Za korisnike srednje razine
4. **[Aplikacija s bazom podataka - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Web aplikacija s C# API-jem i Azure SQL bazom podataka
5. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions s HTTP okidačima i Cosmos DB-om
6. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Višeslojna Java aplikacija s Container Apps i API gateway-om

### Predlošci Azure AI Foundry

1. **[Azure OpenAI Chat aplikacija](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentna chat aplikacija s Azure OpenAI
2. **[Obrada AI dokumenata](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analiza dokumenata koristeći Azure AI usluge
3. **[Strojno učenje - ML Pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps radni proces s Azure Machine Learning

## 📋 Upute za korištenje

### Pokretanje primjera lokalno

1. **Klonirajte ili kopirajte primjer**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicijalizirajte AZD okruženje**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigurirajte okruženje**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Implementirajte**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Prilagodba primjera

Svaki primjer uključuje:
- **README.md** - Detaljne upute za postavljanje i prilagodbu
- **azure.yaml** - AZD konfiguracija s komentarima
- **infra/** - Bicep predlošci s objašnjenjima parametara
- **src/** - Uzorak koda aplikacije
- **scripts/** - Pomoćni skripti za uobičajene zadatke

## 🎯 Ciljevi učenja

### Kategorije primjera

#### **Osnovne implementacije**
- Aplikacije s jednom uslugom
- Jednostavni infrastrukturni obrasci
- Osnovno upravljanje konfiguracijom
- Isplativa razvojna okruženja

#### **Napredni scenariji**
- Arhitekture s više usluga
- Složene mrežne konfiguracije
- Obrasci integracije baza podataka
- Implementacije sigurnosti i usklađenosti

#### **Obrasci spremni za produkciju**
- Konfiguracije visoke dostupnosti
- Praćenje i preglednost
- Integracija CI/CD-a
- Postavke za oporavak od katastrofe

## 📖 Opisi primjera

### Jednostavna web aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Složenost**: Početnik  
**Koncepti**: Osnovna implementacija, REST API, integracija NoSQL baze podataka

### Statistička web stranica - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složenost**: Početnik  
**Koncepti**: Statično hostanje, serverless backend, moderni web razvoj

### Aplikacija u kontejneru - Python Flask
**Tehnologije**: Python Flask, Docker, Container Apps, Container Registry  
**Složenost**: Početnik  
**Koncepti**: Kontejnerizacija, arhitektura mikroservisa, razvoj API-ja

### Aplikacija s bazom podataka - C# s Azure SQL
**Tehnologije**: C# ASP.NET Core, Azure SQL Database, App Service  
**Složenost**: Srednja razina  
**Koncepti**: Entity Framework, povezivanje s bazom podataka, razvoj web API-ja

### Serverless funkcija - Python Azure Functions
**Tehnologije**: Python, Azure Functions, Cosmos DB, Static Web Apps  
**Složenost**: Srednja razina  
**Koncepti**: Arhitektura temeljena na događajima, serverless računarstvo, full-stack razvoj

### Mikroservisi - Java Spring Boot
**Tehnologije**: Java Spring Boot, Container Apps, Service Bus, API Gateway  
**Složenost**: Srednja razina  
**Koncepti**: Komunikacija mikroservisa, distribuirani sustavi, obrasci za poduzeća

### Primjeri Azure AI Foundry

#### Azure OpenAI Chat aplikacija
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Složenost**: Srednja razina  
**Koncepti**: RAG arhitektura, vektorsko pretraživanje, integracija LLM-a

#### Obrada AI dokumenata
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Složenost**: Srednja razina  
**Koncepti**: Analiza dokumenata, OCR, ekstrakcija podataka

#### Strojno učenje - ML Pipeline
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Složenost**: Napredna razina  
**Koncepti**: Trening modela, implementacijski procesi, praćenje

## 🛠 Primjeri konfiguracije

Direktorij `configurations/` sadrži komponente koje se mogu ponovno koristiti:

### Konfiguracije okruženja
- Postavke za razvojno okruženje
- Konfiguracije za staging okruženje
- Konfiguracije spremne za produkciju
- Postavke za implementaciju u više regija

### Bicep moduli
- Komponente infrastrukture koje se mogu ponovno koristiti
- Uobičajeni obrasci resursa
- Sigurnosno ojačani predlošci
- Konfiguracije optimizirane za troškove

### Pomoćni skripti
- Automatizacija postavljanja okruženja
- Skripti za migraciju baza podataka
- Alati za validaciju implementacije
- Alati za praćenje troškova

## 🔧 Vodič za prilagodbu

### Prilagodba primjera za vaše potrebe

1. **Pregledajte preduvjete**
   - Provjerite zahtjeve za Azure uslugama
   - Provjerite ograničenja pretplate
   - Razumite implikacije troškova

2. **Izmijenite konfiguraciju**
   - Ažurirajte definicije usluga u `azure.yaml`
   - Prilagodite Bicep predloške
   - Podesite varijable okruženja

3. **Temeljito testirajte**
   - Prvo implementirajte u razvojno okruženje
   - Validirajte funkcionalnost
   - Testirajte skaliranje i performanse

4. **Pregled sigurnosti**
   - Pregledajte kontrole pristupa
   - Implementirajte upravljanje tajnama
   - Omogućite praćenje i upozorenja

## 📊 Usporedna matrica

| Primjer | Usluge | Baza podataka | Autentifikacija | Praćenje | Složenost |
|---------|----------|----------|------|------------|------------|
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Puno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Puno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Puno | Puno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Puno | Puno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Puno | Puno | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Puno | Puno | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Osnovno | Puno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Puno | Puno | ⭐⭐⭐⭐ |

## 🎓 Put učenja

### Preporučeni redoslijed

1. **Započnite s jednostavnom web aplikacijom**
   - Naučite osnovne AZD koncepte
   - Razumite radni proces implementacije
   - Prakticirajte upravljanje okruženjem

2. **Isprobajte statičku web stranicu**
   - Istražite različite opcije hostanja
   - Naučite o integraciji CDN-a
   - Razumite konfiguraciju DNS-a

3. **Prijeđite na aplikaciju u kontejneru**
   - Naučite osnove kontejnerizacije
   - Razumite koncepte skaliranja
   - Prakticirajte s Dockerom

4. **Dodajte integraciju baze podataka**
   - Naučite o provisioningu baza podataka
   - Razumite stringove za povezivanje
   - Prakticirajte upravljanje tajnama

5. **Istražite serverless**
   - Razumite arhitekturu temeljenu na događajima
   - Naučite o okidačima i vezama
   - Prakticirajte s API-jima

6. **Izgradite mikroservise**
   - Naučite komunikaciju između usluga
   - Razumite distribuirane sustave
   - Prakticirajte složene implementacije

## 🔍 Pronalaženje pravog primjera

### Prema tehnološkom stacku
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontejneri**: Python Flask Container App, Java Microservices
- **Baze podataka**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Prema arhitekturnom obrascu
- **Monolitne**: Node.js Express Todo, C# Web API + SQL
- **Statističke + Serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisi**: Java Spring Boot Microservices
- **Kontejnerizirane**: Python Flask Container App
- **AI-pogonjene**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline

### Prema razini složenosti
- **Početnik**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Srednja razina**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Napredna razina**: ML Pipeline

## 📚 Dodatni resursi

### Dokumentacija
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Bicep Dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primjeri iz zajednice
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)
- [Todo App s C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)
- [Todo App s Python i MongoDB](https://github.com/Azure-Samples/todo-python-mongo)
- [Todo App s Node.js i PostgreSQL](https://github.com/Azure-Samples/todo-nodejs-mongo)
- [React Web App s C# API](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)
- [Azure Functions s Java](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)

### Najbolje prakse
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Doprinos primjera

Imate koristan primjer za podijeliti? Pozdravljamo doprinose!

### Smjernice za podnošenje
1. Slijedite uspostavljenu strukturu direktorija
2. Uključite sveobuhvatan README.md
3. Dodajte komentare u konfiguracijske datoteke
4. Temeljito testirajte prije podnošenja
5. Uključite procjene troškova i preduvjete

### Struktura predloška primjera
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

**Savjet**: Započnite s najjednostavnijim primjerom koji odgovara vašem tehnološkom stacku, a zatim postupno prelazite na složenije scenarije. Svaki primjer nadograđuje koncepte iz prethodnih!

**Sljedeći koraci**: 
- Odaberite primjer koji odgovara vašoj razini vještine
- Slijedite upute za postavljanje u README-u primjera
- Eksperimentirajte s prilagodbama
- Podijelite svoja saznanja sa zajednicom

---

**Navigacija**
- **Prethodna lekcija**: [Vodič za učenje](../resources/study-guide.md)
- **Povratak na**: [Glavni README](../README.md)

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.