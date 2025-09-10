<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9a24ebb49f185f0864813ce1178a3d8b",
  "translation_date": "2025-09-10T15:27:56+00:00",
  "source_file": "examples/README.md",
  "language_code": "sl"
}
-->
# Primeri - Praktične predloge in konfiguracije za AZD

## Uvod

Ta mapa vsebuje praktične primere, predloge in scenarije iz resničnega sveta, ki vam pomagajo pri učenju Azure Developer CLI skozi praktično vadbo. Vsak primer vključuje popolnoma delujočo kodo, infrastrukturne predloge in podrobna navodila za različne arhitekture aplikacij in vzorce uvajanja.

## Cilji učenja

Z delom na teh primerih boste:
- Vadili delovne tokove Azure Developer CLI z realističnimi scenariji aplikacij
- Razumeli različne arhitekture aplikacij in njihove implementacije z azd
- Obvladali vzorce Infrastructure as Code za različne Azure storitve
- Uporabili strategije upravljanja konfiguracij in uvajanja, specifične za okolje
- Implementirali vzorce za spremljanje, varnost in skaliranje v praktičnih kontekstih
- Pridobili izkušnje pri odpravljanju težav in odpravljanju napak v resničnih scenarijih uvajanja

## Rezultati učenja

Po zaključku teh primerov boste sposobni:
- Z zaupanjem uvajati različne vrste aplikacij z uporabo Azure Developer CLI
- Prilagoditi podane predloge svojim zahtevam aplikacije
- Oblikovati in implementirati prilagojene infrastrukturne vzorce z uporabo Bicep
- Konfigurirati kompleksne aplikacije z več storitvami in ustreznimi odvisnostmi
- Uporabiti najboljše prakse za varnost, spremljanje in zmogljivost v resničnih scenarijih
- Odpravljati težave in optimizirati uvajanja na podlagi praktičnih izkušenj

## Struktura mape

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

## Hitri primeri

### Za začetnike
1. **[Preprosta spletna aplikacija](../../../examples/simple-web-app)** - Uvajanje osnovne Node.js spletne aplikacije
2. **[Statično spletno mesto](../../../examples/static-website)** - Gostovanje statičnega spletnega mesta na Azure Storage
3. **[Aplikacija v kontejnerju](../../../examples/container-app)** - Uvajanje aplikacije v kontejnerju

### Za uporabnike s srednjim znanjem
4. **[Aplikacija z bazo podatkov](../../../examples/database-app)** - Spletna aplikacija s PostgreSQL bazo podatkov
5. **[Serverless funkcija](../../../examples/serverless-function)** - Azure Functions z HTTP sprožilci
6. **[Mikrostoritve](../../../examples/microservices)** - Aplikacija z več storitvami in API prehodom

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
- **infra/** - Bicep predloge s pojasnili parametrov
- **src/** - Vzorčna koda aplikacije
- **scripts/** - Pomožni skripti za običajne naloge

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

### Preprosta spletna aplikacija
**Tehnologije**: Node.js, App Service, Application Insights  
**Kompleksnost**: Začetnik  
**Koncepti**: Osnovno uvajanje, okoljske spremenljivke, preverjanje stanja

### Statično spletno mesto
**Tehnologije**: HTML/CSS/JS, Storage Account, CDN  
**Kompleksnost**: Začetnik  
**Koncepti**: Statično gostovanje, integracija CDN, prilagojene domene

### Aplikacija v kontejnerju
**Tehnologije**: Docker, Container Apps, Container Registry  
**Kompleksnost**: Srednje  
**Koncepti**: Kontejnerizacija, skaliranje, konfiguracija dostopa

### Aplikacija z bazo podatkov
**Tehnologije**: Python Flask, PostgreSQL, App Service  
**Kompleksnost**: Srednje  
**Koncepti**: Povezave z bazo podatkov, upravljanje skrivnosti, migracije

### Serverless funkcija
**Tehnologije**: Azure Functions, Cosmos DB, API Management  
**Kompleksnost**: Srednje  
**Koncepti**: Arhitektura, ki temelji na dogodkih, povezave, upravljanje API-jev

### Mikrostoritve
**Tehnologije**: Več storitev, Service Bus, API Gateway  
**Kompleksnost**: Napredno  
**Koncepti**: Komunikacija med storitvami, sporočilne vrste, uravnavanje obremenitve

## 🛠 Primeri konfiguracij

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
| Preprosta spletna aplikacija | 1 | ❌ | Osnovno | Osnovno | ⭐ |
| Statično spletno mesto | 1 | ❌ | ❌ | Osnovno | ⭐ |
| Aplikacija v kontejnerju | 1 | ❌ | Osnovno | Polno | ⭐⭐ |
| Aplikacija z bazo podatkov | 2 | ✅ | Polno | Polno | ⭐⭐⭐ |
| Serverless funkcija | 3 | ✅ | Polno | Polno | ⭐⭐⭐ |
| Mikrostoritve | 5+ | ✅ | Polno | Polno | ⭐⭐⭐⭐ |

## 🎓 Učni načrt

### Priporočena pot

1. **Začnite s preprosto spletno aplikacijo**
   - Naučite se osnovnih konceptov AZD
   - Razumite delovni tok uvajanja
   - Vadite upravljanje okolja

2. **Preizkusite statično spletno mesto**
   - Raziščite različne možnosti gostovanja
   - Naučite se integracije CDN
   - Razumite konfiguracijo DNS

3. **Preidite na aplikacijo v kontejnerju**
   - Naučite se osnov kontejnerizacije
   - Razumite koncept skaliranja
   - Vadite z Dockerjem

4. **Dodajte integracijo baze podatkov**
   - Naučite se zagotavljanja baz podatkov
   - Razumite povezovalne nize
   - Vadite upravljanje skrivnosti

5. **Raziščite serverless**
   - Razumite arhitekturo, ki temelji na dogodkih
   - Naučite se sprožilcev in povezav
   - Vadite z API-ji

6. **Zgradite mikrostoritve**
   - Naučite se komunikacije med storitvami
   - Razumite porazdeljene sisteme
   - Vadite kompleksna uvajanja

## 🔍 Iskanje pravega primera

### Po tehnološkem skladu
- **Node.js**: Preprosta spletna aplikacija, Mikrostoritve
- **Python**: Aplikacija z bazo podatkov, Serverless funkcija
- **Statična mesta**: Statično spletno mesto
- **Kontejnerji**: Aplikacija v kontejnerju, Mikrostoritve
- **Baze podatkov**: Aplikacija z bazo podatkov, Serverless funkcija

### Po arhitekturnem vzorcu
- **Monolitne**: Preprosta spletna aplikacija, Aplikacija z bazo podatkov
- **Statične**: Statično spletno mesto
- **Mikrostoritve**: Primer mikrostoritev
- **Serverless**: Serverless funkcija
- **Hibridne**: Aplikacija v kontejnerju

### Po stopnji kompleksnosti
- **Začetnik**: Preprosta spletna aplikacija, Statično spletno mesto
- **Srednje**: Aplikacija v kontejnerju, Aplikacija z bazo podatkov, Serverless funkcija  
- **Napredno**: Mikrostoritve

## 📚 Dodatni viri

### Povezave do dokumentacije
- [Azure AI Foundry AZD Templates](https://github.com/Azure/ai-foundry-templates)
- [Dokumentacija za Bicep](https://learn.microsoft.com/en-us/azure/azure-resource-manager/bicep/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)

### Primeri skupnosti
- [Azure Samples AZD Templates](https://github.com/Azure-Samples/azd-templates)
- [Azure AI Foundry Templates](https://github.com/Azure/ai-foundry-templates)
- [Azure Developer CLI Gallery](https://azure.github.io/awesome-azd/)

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

### Struktura predloge primerov
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

**Nasvet**: Začnite z najpreprostejšim primerom, ki ustreza vašemu tehnološkemu skladu, nato pa postopoma napredujte do bolj kompleksnih scenarijev. Vsak primer gradi na konceptih iz prejšnjih!

**Naslednji koraki**: 
- Izberite primer, ki ustreza vaši stopnji znanja
- Sledite navodilom za nastavitev v README datoteki primera
- Eksperimentirajte s prilagoditvami
- Delite svoje izkušnje s skupnostjo

---

**Navigacija**
- **Prejšnja lekcija**: [Vodnik za študij](../resources/study-guide.md)
- **Nazaj na**: [Glavni README](../README.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za strojno prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da se zavedate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo strokovno človeško prevajanje. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki izhajajo iz uporabe tega prevoda.