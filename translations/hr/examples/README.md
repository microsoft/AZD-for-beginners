<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:27:22+00:00",
  "source_file": "examples/README.md",
  "language_code": "hr"
}
-->
# Primjeri - Praktični AZD predlošci i konfiguracije

## Uvod

Ovaj direktorij sadrži praktične primjere, predloške i stvarne scenarije koji će vam pomoći da naučite Azure Developer CLI kroz praktičnu primjenu. Svaki primjer pruža kompletan radni kod, infrastrukturne predloške i detaljne upute za različite arhitekture aplikacija i obrasce implementacije.

## Ciljevi učenja

Radom na ovim primjerima, naučit ćete:
- Prakticirati Azure Developer CLI radne procese kroz realne scenarije aplikacija
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

## Primjeri za brzi početak

### Za početnike
1. **[Jednostavna web aplikacija](../../../examples/simple-web-app)** - Implementacija osnovne Node.js web aplikacije
2. **[Statistička web stranica](../../../examples/static-website)** - Hosting statične web stranice na Azure Storage
3. **[Aplikacija u kontejneru](../../../examples/container-app)** - Implementacija aplikacije u kontejneru

### Za korisnike srednje razine
4. **[Aplikacija s bazom podataka](../../../examples/database-app)** - Web aplikacija s PostgreSQL bazom podataka
5. **[Serverless funkcija](../../../examples/serverless-function)** - Azure Functions s HTTP okidačima
6. **[Mikroservisi](../../../examples/microservices)** - Aplikacija s više usluga i API gatewayom

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
- Integracija CI/CD
- Postavke za oporavak od katastrofe

## 📖 Opisi primjera

### Jednostavna web aplikacija
**Tehnologije**: Node.js, App Service, Application Insights  
**Složenost**: Početnik  
**Koncepti**: Osnovna implementacija, varijable okruženja, provjere zdravlja

### Statistička web stranica
**Tehnologije**: HTML/CSS/JS, Storage Account, CDN  
**Složenost**: Početnik  
**Koncepti**: Statički hosting, integracija CDN-a, prilagođene domene

### Aplikacija u kontejneru
**Tehnologije**: Docker, Container Apps, Container Registry  
**Složenost**: Srednja razina  
**Koncepti**: Kontejnerizacija, skaliranje, konfiguracija ulaza

### Aplikacija s bazom podataka
**Tehnologije**: Python Flask, PostgreSQL, App Service  
**Složenost**: Srednja razina  
**Koncepti**: Povezivanje s bazom podataka, upravljanje tajnama, migracije

### Serverless funkcija
**Tehnologije**: Azure Functions, Cosmos DB, API Management  
**Složenost**: Srednja razina  
**Koncepti**: Arhitektura vođena događajima, vezanja, upravljanje API-jem

### Mikroservisi
**Tehnologije**: Više usluga, Service Bus, API Gateway  
**Složenost**: Napredno  
**Koncepti**: Komunikacija između usluga, redovi poruka, balansiranje opterećenja

## 🛠 Primjeri konfiguracije

Direktorij `configurations/` sadrži komponente koje se mogu ponovno koristiti:

### Konfiguracije okruženja
- Postavke za razvojno okruženje
- Konfiguracije za testno okruženje
- Konfiguracije spremne za produkciju
- Postavke za implementaciju u više regija

### Bicep moduli
- Komponente infrastrukture koje se mogu ponovno koristiti
- Uobičajeni obrasci resursa
- Predlošci s pojačanom sigurnošću
- Konfiguracije optimizirane za troškove

### Pomoćni skripti
- Automatizacija postavljanja okruženja
- Skripti za migraciju baza podataka
- Alati za provjeru implementacije
- Alati za praćenje troškova

## 🔧 Vodič za prilagodbu

### Prilagodba primjera za vaše potrebe

1. **Pregledajte preduvjete**
   - Provjerite zahtjeve za Azure usluge
   - Provjerite ograničenja pretplate
   - Razumite implikacije troškova

2. **Izmijenite konfiguraciju**
   - Ažurirajte definicije usluga u `azure.yaml`
   - Prilagodite Bicep predloške
   - Prilagodite varijable okruženja

3. **Temeljito testirajte**
   - Prvo implementirajte u razvojno okruženje
   - Provjerite funkcionalnost
   - Testirajte skaliranje i performanse

4. **Pregled sigurnosti**
   - Pregledajte kontrole pristupa
   - Implementirajte upravljanje tajnama
   - Omogućite praćenje i upozorenja

## 📊 Usporedna matrica

| Primjer | Usluge | Baza podataka | Autentifikacija | Praćenje | Složenost |
|---------|----------|----------|------|------------|------------|
| Jednostavna web aplikacija | 1 | ❌ | Osnovno | Osnovno | ⭐ |
| Statistička web stranica | 1 | ❌ | ❌ | Osnovno | ⭐ |
| Aplikacija u kontejneru | 1 | ❌ | Osnovno | Puno | ⭐⭐ |
| Aplikacija s bazom podataka | 2 | ✅ | Puno | Puno | ⭐⭐⭐ |
| Serverless funkcija | 3 | ✅ | Puno | Puno | ⭐⭐⭐ |
| Mikroservisi | 5+ | ✅ | Puno | Puno | ⭐⭐⭐⭐ |

## 🎓 Put učenja

### Preporučeni redoslijed

1. **Započnite s Jednostavnom web aplikacijom**
   - Naučite osnovne AZD koncepte
   - Razumite radni proces implementacije
   - Prakticirajte upravljanje okruženjem

2. **Isprobajte Statističku web stranicu**
   - Istražite različite opcije hostinga
   - Naučite o integraciji CDN-a
   - Razumite konfiguraciju DNS-a

3. **Prijeđite na Aplikaciju u kontejneru**
   - Naučite osnove kontejnerizacije
   - Razumite koncepte skaliranja
   - Prakticirajte s Dockerom

4. **Dodajte integraciju baze podataka**
   - Naučite o provisioningu baza podataka
   - Razumite stringove za povezivanje
   - Prakticirajte upravljanje tajnama

5. **Istražite Serverless**
   - Razumite arhitekturu vođenu događajima
   - Naučite o okidačima i vezanjima
   - Prakticirajte s API-ima

6. **Izgradite Mikroservise**
   - Naučite komunikaciju između usluga
   - Razumite distribuirane sustave
   - Prakticirajte složene implementacije

## 🔍 Pronalaženje pravog primjera

### Prema tehnološkom stacku
- **Node.js**: Jednostavna web aplikacija, Mikroservisi
- **Python**: Aplikacija s bazom podataka, Serverless funkcija
- **Statičke stranice**: Statistička web stranica
- **Kontejneri**: Aplikacija u kontejneru, Mikroservisi
- **Baze podataka**: Aplikacija s bazom podataka, Serverless funkcija

### Prema arhitekturnom obrascu
- **Monolitne**: Jednostavna web aplikacija, Aplikacija s bazom podataka
- **Statičke**: Statistička web stranica
- **Mikroservisi**: Primjer Mikroservisa
- **Serverless**: Serverless funkcija
- **Hibridne**: Aplikacija u kontejneru

### Prema razini složenosti
- **Početnik**: Jednostavna web aplikacija, Statistička web stranica
- **Srednja razina**: Aplikacija u kontejneru, Aplikacija s bazom podataka, Serverless funkcija  
- **Napredno**: Mikroservisi

## 📚 Dodatni resursi

### Dokumentacija
- [Azure AI Foundry AZD predlošci](https://github.com/Azure/ai-foundry-templates)
- [Bicep dokumentacija](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primjeri iz zajednice
- [Azure Samples AZD predlošci](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry predlošci](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI galerija](https://azure.github.io/awesome-azd/)

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
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja mogu proizaći iz korištenja ovog prijevoda.