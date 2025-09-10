<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9b7074c8a39e77d2f10fb08b3c6ce34f",
  "translation_date": "2025-09-10T07:05:41+00:00",
  "source_file": "examples/README.md",
  "language_code": "lt"
}
-->
# Pavyzdžiai - Praktiniai AZD šablonai ir konfigūracijos

## Įvadas

Šiame kataloge pateikiami praktiniai pavyzdžiai, šablonai ir realūs scenarijai, padedantys mokytis Azure Developer CLI per praktinę veiklą. Kiekvienas pavyzdys apima pilną veikiančią kodą, infrastruktūros šablonus ir išsamius nurodymus įvairioms programų architektūroms ir diegimo modeliams.

## Mokymosi tikslai

Dirbdami su šiais pavyzdžiais, jūs:
- Praktikuosite Azure Developer CLI darbo eigas su realistiniais programų scenarijais
- Suprasite skirtingas programų architektūras ir jų azd įgyvendinimus
- Įvaldysite infrastruktūros kaip kodo modelius įvairioms Azure paslaugoms
- Taikysite konfigūracijos valdymo ir aplinkai pritaikytas diegimo strategijas
- Įgyvendinsite stebėjimo, saugumo ir mastelio keitimo modelius praktiniuose kontekstuose
- Įgysite patirties sprendžiant ir derinant realius diegimo scenarijus

## Mokymosi rezultatai

Baigę šiuos pavyzdžius, jūs galėsite:
- Pasitikėdami diegti įvairių tipų programas naudodami Azure Developer CLI
- Pritaikyti pateiktus šablonus savo programų poreikiams
- Kurti ir įgyvendinti individualius infrastruktūros modelius naudodami Bicep
- Konfigūruoti sudėtingas daugiapaslaugines programas su tinkamomis priklausomybėmis
- Taikyti saugumo, stebėjimo ir našumo geriausias praktikas realiuose scenarijuose
- Spręsti problemas ir optimizuoti diegimus remiantis praktine patirtimi

## Katalogo struktūra

```
examples/
├── simple-web-app/          # Basic web application deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── microservices/           # Multi-service application
│   ├── azure.yaml
│   ├── infra/
│   ├── services/
│   └── README.md
├── database-app/            # Application with database
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── container-app/           # Containerized application
│   ├── azure.yaml
│   ├── infra/
│   ├── Dockerfile
│   ├── src/
│   └── README.md
├── serverless-function/     # Azure Functions example
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
├── static-website/          # Static website deployment
│   ├── azure.yaml
│   ├── infra/
│   ├── src/
│   └── README.md
└── configurations/          # Common configuration examples
    ├── environment-configs/
    ├── bicep-modules/
    └── scripts/
```

## Greito starto pavyzdžiai

### Pradedantiesiems
1. **[Paprasta žiniatinklio programa](../../../examples/simple-web-app)** - Diegti pagrindinę Node.js žiniatinklio programą
2. **[Statinė svetainė](../../../examples/static-website)** - Talpinti statinę svetainę Azure Storage
3. **[Konteinerinė programa](../../../examples/container-app)** - Diegti konteinerizuotą programą

### Vidutinio lygio naudotojams
4. **[Duomenų bazės programa](../../../examples/database-app)** - Žiniatinklio programa su PostgreSQL duomenų baze
5. **[Serverless funkcija](../../../examples/serverless-function)** - Azure Functions su HTTP trigeriais
6. **[Mikropaslaugos](../../../examples/microservices)** - Daugiapaslaugė programa su API vartais

## 📋 Naudojimo instrukcijos

### Pavyzdžių paleidimas lokaliai

1. **Klonuokite arba nukopijuokite pavyzdį**
   ```bash
   # Navigate to desired example
   cd examples/simple-web-app
   ```

2. **Inicializuokite AZD aplinką**
   ```bash
   # Initialize with existing template
   azd init
   
   # Or create new environment
   azd env new my-environment
   ```

3. **Konfigūruokite aplinką**
   ```bash
   # Set required variables
   azd env set AZURE_LOCATION eastus
   azd env set AZURE_SUBSCRIPTION_ID your-subscription-id
   ```

4. **Diegimas**
   ```bash
   # Deploy infrastructure and application
   azd up
   ```

### Pavyzdžių pritaikymas

Kiekvienas pavyzdys apima:
- **README.md** - Išsamūs nustatymo ir pritaikymo nurodymai
- **azure.yaml** - AZD konfigūracija su komentarais
- **infra/** - Bicep šablonai su parametrų paaiškinimais
- **src/** - Pavyzdinis programos kodas
- **scripts/** - Pagalbiniai scenarijai bendroms užduotims

## 🎯 Mokymosi tikslai

### Pavyzdžių kategorijos

#### **Pagrindiniai diegimai**
- Vienos paslaugos programos
- Paprasti infrastruktūros modeliai
- Pagrindinis konfigūracijos valdymas
- Ekonomiški kūrimo nustatymai

#### **Pažangūs scenarijai**
- Daugiapaslaugės architektūros
- Sudėtingos tinklo konfigūracijos
- Duomenų bazių integracijos modeliai
- Saugumo ir atitikties įgyvendinimai

#### **Gamybai paruošti modeliai**
- Didelio prieinamumo konfigūracijos
- Stebėjimas ir stebimumas
- CI/CD integracija
- Atsigavimo po nelaimių nustatymai

## 📖 Pavyzdžių aprašymai

### Paprasta žiniatinklio programa
**Technologijos**: Node.js, App Service, Application Insights  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Pagrindinis diegimas, aplinkos kintamieji, sveikatos patikros

### Statinė svetainė
**Technologijos**: HTML/CSS/JS, Storage Account, CDN  
**Sudėtingumas**: Pradedantysis  
**Koncepcijos**: Statinis talpinimas, CDN integracija, pasirinktiniai domenai

### Konteinerinė programa
**Technologijos**: Docker, Container Apps, Container Registry  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Konteinerizacija, mastelio keitimas, įėjimo konfigūracija

### Duomenų bazės programa
**Technologijos**: Python Flask, PostgreSQL, App Service  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Duomenų bazių jungtys, paslapčių valdymas, migracijos

### Serverless funkcija
**Technologijos**: Azure Functions, Cosmos DB, API Management  
**Sudėtingumas**: Vidutinis  
**Koncepcijos**: Įvykių valdomos architektūros, susiejimai, API valdymas

### Mikropaslaugos
**Technologijos**: Kelių paslaugų, Service Bus, API Gateway  
**Sudėtingumas**: Pažangus  
**Koncepcijos**: Paslaugų komunikacija, pranešimų eilės, apkrovos balansavimas

## 🛠 Konfigūracijos pavyzdžiai

`configurations/` kataloge pateikiami pakartotinai naudojami komponentai:

### Aplinkos konfigūracijos
- Kūrimo aplinkos nustatymai
- Testavimo aplinkos konfigūracijos
- Gamybai paruoštos konfigūracijos
- Daugiaregioniai diegimo nustatymai

### Bicep moduliai
- Pakartotinai naudojami infrastruktūros komponentai
- Bendri išteklių modeliai
- Saugumo sustiprinti šablonai
- Ekonomiškai optimizuotos konfigūracijos

### Pagalbiniai scenarijai
- Aplinkos nustatymo automatizavimas
- Duomenų bazių migracijos scenarijai
- Diegimo patikros įrankiai
- Išlaidų stebėjimo priemonės

## 🔧 Pritaikymo vadovas

### Pavyzdžių pritaikymas jūsų poreikiams

1. **Peržiūrėkite reikalavimus**
   - Patikrinkite Azure paslaugų reikalavimus
   - Patikrinkite prenumeratos limitus
   - Supraskite išlaidų pasekmes

2. **Keiskite konfigūraciją**
   - Atnaujinkite `azure.yaml` paslaugų apibrėžimus
   - Pritaikykite Bicep šablonus
   - Koreguokite aplinkos kintamuosius

3. **Išbandykite kruopščiai**
   - Pirmiausia diekite kūrimo aplinkoje
   - Patikrinkite funkcionalumą
   - Išbandykite mastelio keitimą ir našumą

4. **Saugumo peržiūra**
   - Peržiūrėkite prieigos kontrolę
   - Įgyvendinkite paslapčių valdymą
   - Įjunkite stebėjimą ir įspėjimus

## 📊 Palyginimo matrica

| Pavyzdys | Paslaugos | Duomenų bazė | Autentifikacija | Stebėjimas | Sudėtingumas |
|----------|-----------|--------------|-----------------|------------|--------------|
| Paprasta žiniatinklio programa | 1 | ❌ | Pagrindinė | Pagrindinis | ⭐ |
| Statinė svetainė | 1 | ❌ | ❌ | Pagrindinis | ⭐ |
| Konteinerinė programa | 1 | ❌ | Pagrindinė | Pilnas | ⭐⭐ |
| Duomenų bazės programa | 2 | ✅ | Pilnas | Pilnas | ⭐⭐⭐ |
| Serverless funkcija | 3 | ✅ | Pilnas | Pilnas | ⭐⭐⭐ |
| Mikropaslaugos | 5+ | ✅ | Pilnas | Pilnas | ⭐⭐⭐⭐ |

## 🎓 Mokymosi kelias

### Rekomenduojama seka

1. **Pradėkite nuo Paprastos žiniatinklio programos**
   - Sužinokite pagrindines AZD sąvokas
   - Supraskite diegimo eigą
   - Praktikuokite aplinkos valdymą

2. **Išbandykite Statinę svetainę**
   - Tyrinėkite skirtingas talpinimo galimybes
   - Sužinokite apie CDN integraciją
   - Supraskite DNS konfigūraciją

3. **Pereikite prie Konteinerinės programos**
   - Sužinokite konteinerizacijos pagrindus
   - Supraskite mastelio keitimo sąvokas
   - Praktikuokite su Docker

4. **Pridėkite Duomenų bazės integraciją**
   - Sužinokite duomenų bazių teikimą
   - Supraskite jungčių eilutes
   - Praktikuokite paslapčių valdymą

5. **Tyrinėkite Serverless**
   - Supraskite įvykių valdomą architektūrą
   - Sužinokite apie trigerius ir susiejimus
   - Praktikuokite su API

6. **Kurkite Mikropaslaugas**
   - Sužinokite paslaugų komunikaciją
   - Supraskite paskirstytas sistemas
   - Praktikuokite sudėtingus diegimus

## 🔍 Tinkamo pavyzdžio paieška

### Pagal technologijų rinkinį
- **Node.js**: Paprasta žiniatinklio programa, Mikropaslaugos
- **Python**: Duomenų bazės programa, Serverless funkcija
- **Statinės svetainės**: Statinė svetainė
- **Konteineriai**: Konteinerinė programa, Mikropaslaugos
- **Duomenų bazės**: Duomenų bazės programa, Serverless funkcija

### Pagal architektūros modelį
- **Monolitinė**: Paprasta žiniatinklio programa, Duomenų bazės programa
- **Statinė**: Statinė svetainė
- **Mikropaslaugos**: Mikropaslaugų pavyzdys
- **Serverless**: Serverless funkcija
- **Hibridinė**: Konteinerinė programa

### Pagal sudėtingumo lygį
- **Pradedantysis**: Paprasta žiniatinklio programa, Statinė svetainė
- **Vidutinis**: Konteinerinė programa, Duomenų bazės programa, Serverless funkcija  
- **Pažangus**: Mikropaslaugos

## 📚 Papildomi ištekliai

### Dokumentacijos nuorodos
- [AZD šablonų specifikacija](https://aka.ms/azd/templates)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure architektūros centras](https://learn.microsoft.com/en-us/azure/architecture/)

### Bendruomenės pavyzdžiai
- [Azure-Samples/awesome-azd](https://github.com/Azure-Samples/awesome-azd)
- [AZD šablonų galerija](https://azure.github.io/awesome-azd/)

### Geriausios praktikos
- [Azure gerai suprojektuotos architektūros pagrindai](https://learn.microsoft.com/en-us/azure/well-architected/)
- [Debesų priėmimo pagrindai](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/)

## 🤝 Pavyzdžių kūrimas

Turite naudingą pavyzdį? Laukiame jūsų indėlio!

### Pateikimo gairės
1. Laikykitės nustatytos katalogo struktūros
2. Įtraukite išsamų README.md
3. Pridėkite komentarus prie konfigūracijos failų
4. Kruopščiai išbandykite prieš pateikdami
5. Įtraukite išlaidų įvertinimus ir reikalavimus

### Pavyzdžio šablono struktūra
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

**Patarimas**: Pradėkite nuo paprasčiausio pavyzdžio, atitinkančio jūsų technologijų rinkinį, tada palaipsniui pereikite prie sudėtingesnių scenarijų. Kiekvienas pavyzdys remiasi ankstesnių sąvokomis!

**Kiti žingsniai**: 
- Pasirinkite pavyzdį, atitinkantį jūsų įgūdžių lygį
- Vadovaukitės nustatymo instrukcijomis pavyzdžio README faile
- Eksperimentuokite su pritaikymais
- Pasidalykite savo patirtimi su bendruomene

---

**Navigacija**
- **Ankstesnė pamoka**: [Mokymosi vadovas](../resources/study-guide.md)
- **Grįžti į**: [Pagrindinį README](../README.md)

---

**Atsakomybės apribojimas**:  
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, atkreipiame dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba turėtų būti laikomas autoritetingu šaltiniu. Kritinei informacijai rekomenduojama naudoti profesionalų žmogaus vertimą. Mes neprisiimame atsakomybės už nesusipratimus ar klaidingus aiškinimus, kylančius dėl šio vertimo naudojimo.