<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "0fd083f39ef5508994526bb18e9fcd78",
  "translation_date": "2025-09-18T12:06:15+00:00",
  "source_file": "examples/README.md",
  "language_code": "hr"
}
-->
# Primjeri - Praktični AZD predlošci i konfiguracije

**Učenje kroz primjere - Organizirano po poglavljima**
- **📚 Početna stranica tečaja**: [AZD za početnike](../README.md)
- **📖 Mapa poglavlja**: Primjeri organizirani prema složenosti učenja
- **🚀 Početak s osnovama**: [Primjeri iz poglavlja 1](../../../examples)
- **🤖 AI Primjeri**: [Primjeri iz poglavlja 2 i 5 - AI rješenja](../../../examples)

## Uvod

Ovaj direktorij sadrži praktične primjere, predloške i scenarije iz stvarnog svijeta kako bi vam pomogao u učenju Azure Developer CLI-a kroz praktičan rad. Svaki primjer uključuje potpuno funkcionalan kod, infrastrukturne predloške i detaljne upute za različite arhitekture aplikacija i obrasce implementacije.

## Ciljevi učenja

Radom na ovim primjerima, naučit ćete:
- Prakticirati Azure Developer CLI radne procese s realističnim scenarijima aplikacija
- Razumjeti različite arhitekture aplikacija i njihove AZD implementacije
- Savladati obrasce infrastrukture kao koda za razne Azure usluge
- Primijeniti strategije upravljanja konfiguracijom i implementacije specifične za okruženje
- Implementirati obrasce za praćenje, sigurnost i skaliranje u praktičnim kontekstima
- Steći iskustvo u rješavanju problema i otklanjanju pogrešaka u stvarnim scenarijima implementacije

## Ishodi učenja

Nakon završetka ovih primjera, moći ćete:
- Samouvjereno implementirati različite vrste aplikacija koristeći Azure Developer CLI
- Prilagoditi pružene predloške vlastitim zahtjevima aplikacija
- Dizajnirati i implementirati prilagođene infrastrukturne obrasce koristeći Bicep
- Konfigurirati složene aplikacije s više usluga i odgovarajućim ovisnostima
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
1. **[Jednostavna web aplikacija - Node.js Express](https://github.com/Azure-Samples/todo-nodejs-mongo)** - Implementacija Node.js Express web aplikacije s MongoDB-om
2. **[Statistička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func)** - Hosting React statičke web stranice s Azure Static Web Apps
3. **[Kontejnerska aplikacija - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice)** - Implementacija kontejnerske Python Flask aplikacije

### Za korisnike srednje razine
4. **[Aplikacija s bazom podataka - C# s Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)** - Web aplikacija s C# API-jem i Azure SQL bazom podataka
5. **[Serverless funkcija - Python Azure Functions](https://github.com/Azure-Samples/todo-python-mongo-swa-func)** - Python Azure Functions s HTTP okidačima i Cosmos DB-om
6. **[Mikroservisi - Java Spring Boot](https://github.com/Azure-Samples/java-microservices-aca-lab)** - Višeservisna Java aplikacija s Container Apps i API gateway-om

### Azure AI Foundry predlošci

1. **[Azure OpenAI Chat aplikacija](https://github.com/Azure-Samples/azure-search-openai-demo)** - Inteligentna chat aplikacija s Azure OpenAI
2. **[AI obrada dokumenata](https://github.com/Azure-Samples/azure-ai-document-processing)** - Analiza dokumenata koristeći Azure AI usluge
3. **[Strojno učenje - ML pipeline](https://github.com/Azure-Samples/mlops-v2)** - MLOps radni proces s Azure Machine Learning

### Scenariji iz stvarnog svijeta

#### **Maloprodajno rješenje s više agenata** 🆕
**[Kompletan vodič za implementaciju](./retail-scenario.md)**

Sveobuhvatno, proizvodno spremno rješenje za korisničku podršku s više agenata koje demonstrira implementaciju AI aplikacija na razini poduzeća pomoću AZD-a. Ovaj scenarij uključuje:

- **Kompletna arhitektura**: Sustav s više agenata za korisničku podršku i upravljanje zalihama
- **Proizvodna infrastruktura**: Višeregionalne Azure OpenAI implementacije, AI pretraživanje, Container Apps i sveobuhvatno praćenje
- **Spreman za implementaciju ARM predložak**: Jednostavna implementacija s više načina konfiguracije (Minimal/Standard/Premium)
- **Napredne značajke**: Sigurnosna validacija, okvir za evaluaciju agenata, optimizacija troškova i vodiči za otklanjanje problema
- **Stvarni poslovni kontekst**: Scenarij korisničke podrške za maloprodaju s prijenosom datoteka, integracijom pretraživanja i dinamičkim skaliranjem

**Tehnologije**: Azure OpenAI (GPT-4o, GPT-4o-mini), Azure AI Search, Container Apps, Cosmos DB, Application Insights, Document Intelligence, Bing Search API

**Složenost**: ⭐⭐⭐⭐ (Napredno - Spremno za proizvodnju)

**Idealno za**: AI programere, arhitekte rješenja i timove koji grade proizvodne sustave s više agenata

**Brzi početak**: Implementirajte kompletno rješenje za manje od 30 minuta koristeći priloženi ARM predložak s `./deploy.sh -g myResourceGroup`

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

#### **Obrasci spremni za proizvodnju**
- Konfiguracije visoke dostupnosti
- Praćenje i preglednost
- Integracija CI/CD-a
- Postavke za oporavak od katastrofa

## 📖 Opisi primjera

### Jednostavna web aplikacija - Node.js Express
**Tehnologije**: Node.js, Express, MongoDB, Container Apps  
**Složenost**: Početnik  
**Koncepti**: Osnovna implementacija, REST API, integracija NoSQL baze podataka

### Statistička web stranica - React SPA
**Tehnologije**: React, Azure Static Web Apps, Azure Functions, Cosmos DB  
**Složenost**: Početnik  
**Koncepti**: Statički hosting, serverless backend, moderni web razvoj

### Kontejnerska aplikacija - Python Flask
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

### Azure AI Foundry primjeri

#### Azure OpenAI Chat aplikacija
**Tehnologije**: Azure OpenAI, Cognitive Search, App Service  
**Složenost**: Srednja razina  
**Koncepti**: RAG arhitektura, vektorsko pretraživanje, integracija LLM-a

#### AI obrada dokumenata
**Tehnologije**: Azure AI Document Intelligence, Storage, Functions  
**Složenost**: Srednja razina  
**Koncepti**: Analiza dokumenata, OCR, ekstrakcija podataka

#### Strojno učenje - ML pipeline
**Tehnologije**: Azure ML, MLOps, Container Registry  
**Složenost**: Napredno  
**Koncepti**: Trening modela, implementacijski procesi, praćenje

## 🛠 Primjeri konfiguracije

Direktorij `configurations/` sadrži višekratne komponente:

### Konfiguracije okruženja
- Postavke za razvojno okruženje
- Konfiguracije za testno okruženje
- Konfiguracije spremne za proizvodnju
- Postavke za višeregionalne implementacije

### Bicep moduli
- Višekratne infrastrukturne komponente
- Uobičajeni obrasci resursa
- Sigurnosno ojačani predlošci
- Isplative konfiguracije

### Pomoćni skripti
- Automatizacija postavljanja okruženja
- Skripte za migraciju baza podataka
- Alati za validaciju implementacije
- Alati za praćenje troškova

## 🔧 Vodič za prilagodbu

### Prilagodba primjera za vaše potrebe

1. **Pregledajte preduvjete**
   - Provjerite zahtjeve za Azure usluge
   - Provjerite ograničenja pretplate
   - Razumijte troškovne implikacije

2. **Izmijenite konfiguraciju**
   - Ažurirajte definicije usluga u `azure.yaml`
   - Prilagodite Bicep predloške
   - Prilagodite varijable okruženja

3. **Temeljito testirajte**
   - Prvo implementirajte u razvojno okruženje
   - Validirajte funkcionalnost
   - Testirajte skaliranje i performanse

4. **Sigurnosni pregled**
   - Pregledajte kontrole pristupa
   - Implementirajte upravljanje tajnama
   - Omogućite praćenje i upozorenja

## 📊 Usporedna matrica

| Primjer | Usluge | Baza podataka | Autentifikacija | Praćenje | Složenost |
|---------|--------|---------------|-----------------|----------|-----------|
| Node.js Express Todo | 2 | ✅ | Osnovno | Osnovno | ⭐ |
| React SPA + Functions | 3 | ✅ | Osnovno | Puno | ⭐ |
| Python Flask Container | 2 | ❌ | Osnovno | Puno | ⭐ |
| C# Web API + SQL | 2 | ✅ | Puno | Puno | ⭐⭐ |
| Python Functions + SPA | 3 | ✅ | Puno | Puno | ⭐⭐ |
| Java Microservices | 5+ | ✅ | Puno | Puno | ⭐⭐ |
| Azure OpenAI Chat | 3 | ✅ | Puno | Puno | ⭐⭐⭐ |
| AI Document Processing | 2 | ❌ | Osnovno | Puno | ⭐⭐ |
| ML Pipeline | 4+ | ✅ | Puno | Puno | ⭐⭐⭐⭐ |
| **Retail Multi-Agent** | **8+** | **✅** | **Enterprise** | **Napredno** | **⭐⭐⭐⭐** |

## 🎓 Put učenja

### Preporučeni redoslijed

1. **Počnite s jednostavnom web aplikacijom**
   - Naučite osnovne AZD koncepte
   - Razumijte tijek implementacije
   - Vježbajte upravljanje okruženjem

2. **Isprobajte statičku web stranicu**
   - Istražite različite opcije hostinga
   - Naučite o integraciji CDN-a
   - Razumijte konfiguraciju DNS-a

3. **Prijeđite na kontejnersku aplikaciju**
   - Naučite osnove kontejnerizacije
   - Razumijte koncepte skaliranja
   - Vježbajte s Dockerom

4. **Dodajte integraciju baze podataka**
   - Naučite kako postaviti bazu podataka
   - Razumijte veze s bazom podataka
   - Vježbajte upravljanje tajnama

5. **Istražite serverless arhitekturu**
   - Razumijte arhitekturu temeljenu na događajima
   - Naučite o okidačima i vezama
   - Vježbajte s API-jima

6. **Izgradite mikroservise**
   - Naučite komunikaciju između usluga
   - Razumijte distribuirane sustave
   - Vježbajte složene implementacije

## 🔍 Pronalaženje pravog primjera

### Prema tehnološkom stogu
- **Node.js**: Node.js Express Todo App
- **Python**: Python Flask Container App, Python Functions + SPA
- **C#**: C# Web API + SQL Database, Azure OpenAI Chat App, ML Pipeline
- **Java**: Java Spring Boot Microservices
- **React**: React SPA + Functions
- **Kontejneri**: Python Flask Container App, Java Microservices
- **Baze podataka**: Node.js + MongoDB, C# + Azure SQL, Python + Cosmos DB
- **AI/ML**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Sustavi s više agenata**: **Retail Multi-Agent Solution**
- **Proizvodnja na razini poduzeća**: **Retail Multi-Agent Solution**

### Prema arhitekturnom obrascu
- **Monolitne**: Node.js Express Todo, C# Web API + SQL
- **Statičke + serverless**: React SPA + Functions, Python Functions + SPA
- **Mikroservisi**: Java Spring Boot Microservices
- **Kontejnerizirane**: Python Flask Container App
- **AI-pokretane**: Azure OpenAI Chat App, AI Document Processing, ML Pipeline, **Retail Multi-Agent Solution**
- **Arhitektura s više agenata**: **Retail Multi-Agent Solution**
- **Višeservisne za poduzeća**: **Retail Multi-Agent Solution**

### Prema razini složenosti
- **Početnik**: Node.js Express Todo, React SPA + Functions, Python Flask Container App
- **Srednja razina**: C# Web API + SQL, Python Functions + SPA, Java Microservices, Azure OpenAI Chat App, AI Document Processing
- **Napredno**: ML Pipeline
- **Spremno za proizvodnju**: **Retail Multi-Agent Solution** (Kompletan sustav s više agenata s ARM predloškom za implementaciju)

## 📚 Dodatni resursi

### Poveznice na dokumentaciju
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [Azure AI Foundry AZD predlošci](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure arhitekturni centar](https://learn.microsoft.com/en-us/azure/architecture/)

### Primjeri iz zajednice
- [Azure primjeri AZD predložaka](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry predlošci](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI galerija](https://azure.github.io/awesome-azd/)
- [Todo App s C# i Azure SQL](https://github.com/Azure-Samples/todo-csharp-sql)  
- [Todo App s Pythonom i MongoDB-om](https://github.com/Azure-Samples/todo-python-mongo)  
- [Todo App s Node.js i PostgreSQL-om](https://github.com/Azure-Samples/todo-nodejs-mongo)  
- [React Web App s C# API-jem](https://github.com/Azure-Samples/todo-csharp-cosmos-sql)  
- [Azure Container Apps Job](https://github.com/Azure-Samples/container-apps-jobs)  
- [Azure Functions s Javom](https://github.com/Azure-Samples/azure-functions-java-flex-consumption-azd)  

### Najbolje prakse  
- [Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
- [Cloud Adoption Framework](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)  

## 🤝 Primjeri doprinosa  

Imate koristan primjer za podijeliti? Pozdravljamo vaše doprinose!  

### Smjernice za predaju  
1. Pratite uspostavljenu strukturu direktorija  
2. Uključite sveobuhvatan README.md  
3. Dodajte komentare u konfiguracijske datoteke  
4. Temeljito testirajte prije predaje  
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
- Slijedite upute za postavljanje u README datoteci primjera  
- Eksperimentirajte s prilagodbama  
- Podijelite svoja iskustva s zajednicom  

---  

**Navigacija**  
- **Prethodna lekcija**: [Vodič za učenje](../resources/study-guide.md)  
- **Povratak na**: [Glavni README](../README.md)  

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane ljudskog prevoditelja. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.