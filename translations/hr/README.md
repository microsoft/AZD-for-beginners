# AZD za početnike: Strukturirano putovanje učenja

![AZD-za-početnike](../../translated_images/hr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub promatrači](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://github.com/microsoft/AZD-for-beginners)
[![GitHub forkovi](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub zvjezdice](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://github.com/microsoft/AZD-for-beginners)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatski prijevodi (Uvijek ažurno)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arapski](../ar/README.md) | [Bengalski](../bn/README.md) | [Bugarski](../bg/README.md) | [Burmanski (Myanmar)](../my/README.md) | [Kineski (pojednostavljeni)](../zh-CN/README.md) | [Kineski (tradicionalni, Hong Kong)](../zh-HK/README.md) | [Kineski (tradicionalni, Macau)](../zh-MO/README.md) | [Kineski (tradicionalni, Tajvan)](../zh-TW/README.md) | [Hrvatski](./README.md) | [Češki](../cs/README.md) | [Danski](../da/README.md) | [Nizozemski](../nl/README.md) | [Estonski](../et/README.md) | [Finski](../fi/README.md) | [Francuski](../fr/README.md) | [Njemački](../de/README.md) | [Grčki](../el/README.md) | [Hebrejski](../he/README.md) | [Hindi](../hi/README.md) | [Mađarski](../hu/README.md) | [Indonezijski](../id/README.md) | [Talijanski](../it/README.md) | [Japanski](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korejski](../ko/README.md) | [Litvanski](../lt/README.md) | [Malajski](../ms/README.md) | [Malajalamski](../ml/README.md) | [Maratski](../mr/README.md) | [Nepalski](../ne/README.md) | [Nigerijski pidžin](../pcm/README.md) | [Norveški](../no/README.md) | [Perzijski (Farsi)](../fa/README.md) | [Poljski](../pl/README.md) | [Portugalski (Brazil)](../pt-BR/README.md) | [Portugalski (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Rumunjski](../ro/README.md) | [Ruski](../ru/README.md) | [Srpski (ćirilica)](../sr/README.md) | [Slovački](../sk/README.md) | [Slovenski](../sl/README.md) | [Španjolski](../es/README.md) | [Svahili](../sw/README.md) | [Švedski](../sv/README.md) | [Tagalog (Filipinski)](../tl/README.md) | [Tamilski](../ta/README.md) | [Telugu](../te/README.md) | [Tajlandski](../th/README.md) | [Turski](../tr/README.md) | [Ukrajinski](../uk/README.md) | [Urdu](../ur/README.md) | [Vijetnamski](../vi/README.md)

> **Želite li radije lokalno klonirati?**
>
> Ovaj repozitorij sadrži prijevode na više od 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, upotrijebite sparse checkout:
>
> **Bash / macOS / Linux:**
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
>
> **CMD (Windows):**
> ```cmd
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone "/*" "!translations" "!translated_images"
> ```
>
> Ovo vam daje sve što vam treba za dovršetak tečaja uz puno brže preuzimanje.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Što je novo u azd danas

> 📌 **Pregled izdanja AI CLI (2026-11-04):** Upute su provjerene u odnosu na objavljenu **`azd 1.37.2`**, **agente `1.0.0-beta.23`** i **evaluacije `1.0.0-beta.2`** dokumentaciju/izvor. Koristite `azd >= 1.37.0` za kombinirani tijek rada. Pokrenite `azd version` i [ažurirajte osnovni CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/install-azd) prije proširenja. Pogledajte [promjene i popravke izdanja](docs/chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Ovo nije provjera uživo cijelog tečaja.

Azure Developer CLI podržava mnoge vrste aplikacija, uključujući web aplikacije, API-je i AI agente, kroz podržane hostove, predloške i proširenja.

Evo što to znači za vas:

- **AI agenti su sada punopravni radni zadaci azd-a.** Možete inicijalizirati, implementirati i upravljati AI agent projektima koristeći isti `azd init` → `azd up` tijek rada koji već poznajete.
- **Životni ciklus agenta kroz dva proširenja.** Koristite `azure.ai.agents` za inicijalizaciju, pozivanje, optimizaciju i povlačenje agenata. Instalirajte **`azure.ai.evaluations`** zasebno za `azd ai eval init`, `generate` i `run start`. Beta verzija agenata 22 zamijenila je staru radnu proceduru evaluacije i promijenila konfiguraciju optimizacije; slijedite [vodič za migraciju](docs/chapter-08-production/production-ai-practices.md#evaluation-migration-and-quality-checks).
- **Još više sastavnih dijelova AI.** Novi pregledni predlošci—`azure.ai.skills` i `azure.ai.connections`—omogućuju upravljanje ponovno upotrebljivim vještinama agenata i Foundry vezama izravno s azd-om.
- **Integracija Microsoft Foundry** dovodi implementaciju modela, hostanje agenata i konfiguraciju AI usluga izravno u azd ekosustav predložaka.
- **Glavne dnevne operacije su jednostavnije.** Nedavna izdanja učinila su `azd init` idempotentnim (sigurnim za ponovni raspored), automatski očistila zastarjele tokene u `azd auth login` te dodala korisnički prijateljski `azd tool` prompt prilikom prvog pokretanja.
- **Osnovni tijek rada nije promijenjen.** Bilo da implementirate todo aplikaciju, mikroservis ili multi-agent AI rješenje, naredbe su iste.

> **Napomena za Aspire korisnike:** Microsoft sada proizvod naziva jednostavno **Aspire** (prije ".NET Aspire"). Podrška za azd Aspire je nepromijenjena – samo je naziv ažuriran.

Ako ste prije koristili azd, AI podrška je prirodno proširenje—ne poseban alat ili napredni smjer. Ako počinjete iz početka, naučit ćete jedan tijek rada koji radi za sve.

---

## 🚀 Što je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je alat za naredbeni redak prijateljski programerima koji olakšava implementaciju aplikacija na Azure. Umjesto ručnog stvaranja i povezivanja desetaka Azure resursa, možete implementirati cijele aplikacije jednom naredbom.

### Čarolija `azd up`

```bash
# This single command does everything:
# ✅ Creates all Azure resources  
# ✅ Configures networking and security
# ✅ Builds your application code
# ✅ Deploys to Azure
# ✅ Gives you a working URL
azd up
```

Predložak pruža konfiguraciju aplikacije i infrastrukture. Uspješna implementacija i dalje zahtijeva podržane usluge/modele, dovoljan kvotu i dopuštenja, točne ulaze i provjeru implementirane aplikacije. `azd up` ne čini automatski predložak sigurnim, usklađenim ili spremnim za proizvodnju.

---

## ❓ Azure Developer CLI vs Azure CLI: Koja je razlika?

Ovo je najčešće pitanje koje početnici postavljaju. Evo jednostavnog odgovora:

| Značajka | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Svrha** | Upravljanje pojedinačnim Azure resursima | Implementacija cjelovitih aplikacija |
| **Pristup** | Fokus na infrastrukturi | Fokus na aplikaciji |
| **Primjer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Morate znati Azure usluge | Samo poznajte svoju aplikaciju |
| **Najbolje za** | DevOps, infrastruktura | Programeri, prototipiranje |

### Jednostavna analogija

- **Azure CLI** je kao da imate sve alate za izgradnju kuće - čekiće, pile, čavle. Možete sagraditi bilo što, ali morate znati građevinu.
- **Azure Developer CLI** je kao da angažirate izvođača radova - vi opisujete što želite, a oni se brinu o gradnji.

### Kada koristiti svaki

| Scenarij | Koristite ovo |
|----------|----------|
| "Želim brzo implementirati svoju web aplikaciju" | `azd up` |
| "Trebam samo napraviti račun za pohranu" | `az storage account create` |
| "Gradim potpunu AI aplikaciju" | `azd init --template azure-search-openai-demo` |
| "Trebam otkloniti pogrešku na određenom Azure resursu" | `az resource show` |
| "Želim implementirati u svoj konfigurirani produkcijski okoliš" | Pregledajte konfiguraciju, pristup, troškove i operativne kontrole prije `azd up --environment production` |

### Oni rade zajedno!

AZD i Azure CLI imaju zasebnu autentifikaciju i konfiguraciju. Koristite `azd auth login` za AZD, i `az login` kada je kukac ili dijagnostička naredba eksplicitno Azure CLI. Možete koristiti oba:
```bash
# Deploy your app with AZD
azd up

# Then fine-tune specific resources with Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pronađite predloške u Awesome AZD

Nemojte krenuti od nule! **Awesome AZD** je zajednička zbirka predložaka spremnih za implementaciju:

| Resurs | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Pregledajte 200+ predložaka s jednim klikom implementacije |
| 🔗 [**Pošaljite predložak**](https://github.com/Azure/awesome-azd/issues) | Doprinijetite svoj predložak zajednici |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Označite zvjezdicom i istražite izvor |

### Popularni AI predlošci iz Awesome AZD

Odaberite jedan predložak u vlastitom praznom direktoriju; naredbe dolje su alternative. Završni `.` inicijalizira taj direktorij.

```bash
# RAG Chat with Microsoft Foundry Models + AI Search
azd init --template azure-search-openai-demo .

# Quick AI Chat Application
azd init --template openai-chat-app-quickstart .

# AI Agents with Foundry Agents
azd init --template get-started-with-ai-agents .
```

---

## 🎯 Početak u 3 koraka

Prije nego što počnete, provjerite da je vaš stroj spreman za predložak koji želite implementirati:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako neki potrebni test ne uspije, prvo ga popravite, a zatim nastavite s brzim početkom.

### Korak 1: Instalirajte AZD (2 minute)

**Windows:**
```powershell
winget install microsoft.azd
```

**macOS:**
```bash
brew tap azure/azd && brew install azd
```

**Linux:**
```bash
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Korak 2: Autentificirajte se za AZD

```bash
# Optional if you plan to use Azure CLI commands directly in this course
az login

# Required for AZD workflows
azd auth login
```

Ako niste sigurni koji trebate, slijedite puni tok postavljanja u [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Implementirajte svoju prvu aplikaciju

```bash
# Initialize from a template
azd init --template todo-nodejs-mongo .

# Deploy to Azure (creates everything!)
azd up
```

**🎉 To je to!** Vaša je aplikacija sada uživo na Azureu.

### Očistite resurse (Nemojte zaboraviti!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako koristiti ovaj tečaj

Ovaj je tečaj dizajniran za **postupno učenje** – počnite gdje vam je ugodno i napredujte:

| Vaše iskustvo | Počnite ovdje |
|-----------------|------------|
| **Potpuni početnik na Azureu** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznajete Azure, novi ste u AZD-u** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite implementirati AI aplikacije** | [Poglavlje 2: AI-prvo razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktičnu vježbu** | [🎓 Interaktivna radionica](workshop/README.md) - vođeni laboratorij od 3-4 sata |
| **Trebate uzorke za produkciju** | [Poglavlje 8: Produkcija i poduzeće](#-chapter-8-production--enterprise-patterns) |

### Brzo postavljanje

1. **Forkajte ovaj repozitorij**: [![GitHub forkovi](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Potražite pomoć**: [Azure Discord zajednica](https://discord.com/invite/ByRwuEEgH4)

> **Želite li radije lokalno klonirati?**

> Ovaj repozitorij sadrži prijevode na više od 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, upotrijebite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Ovo vam daje sve što vam treba za dovršetak tečaja uz puno brže preuzimanje.


## Pregled tečaja

Ovladajte Azure Developer CLI (azd) kroz strukturirane poglavlja dizajnirana za progresivno učenje. **Poseban fokus na implementaciju AI aplikacija s integracijom Microsoft Foundry.**

### Zašto je ovaj tečaj ključan za suvremene developere

Developeri koji implementiraju AI radne zadatke često trebaju smjernice o:
- Složenim višeservisnim AI arhitekturama
- Najboljim praksama proizvodnog implementiranja AI-ja  
- Integraciji i konfiguraciji Azure AI usluga
- Optimizaciji troškova AI radnih zadataka
- Rješavanju problema specifičnih za implementaciju AI-ja

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja ćete:
- **Ovladati AZD temeljima**: Osnovni koncepti, instalacija i konfiguracija
- **Implementirati AI aplikacije**: Koristiti AZD s Microsoft Foundry uslugama
- **Implementirati infrastrukturu kao kod**: Upravljati Azure resursima s Bicep predlošcima
- **Otklanjati pogreške implementacije**: Riješiti uobičajene probleme i debugirati poteškoće
- **Optimizirati za produkciju**: Sigurnost, skaliranje, nadzor i upravljanje troškovima
- **Izgraditi višesložena multi-agent rješenja**: Implementirati složene AI arhitekture

## Prije nego počnete: računi, pristupi i pretpostavke

Prije nego započnete Poglavlje 1, provjerite imate li sljedeće. Koraci instalacije kasnije u ovom vodiču pretpostavljaju da su ove osnove već riješene.

- **Pretplata na Azure**: Možete koristiti postojeću pretplatu s posla ili vlastiti račun, ili kreirati [besplatnu probu](https://aka.ms/azurefreetrial) za početak.
- **Dozvola za stvaranje Azure resursa**: Za većinu vježbi trebate imati barem **Contributor** pristup ciljanoj pretplati ili grupi resursa. Neka poglavlja također mogu pretpostaviti da možete kreirati grupe resursa, upravljane identitete i RBAC dodjele.
- [**GitHub račun**](https://github.com): Korisno za forkanje repozitorija, praćenje vlastitih promjena i korištenje GitHub Codespaces za radionicu.
- **Potrebni alati za izvršavanje predložaka**: Neki predlošci zahtijevaju lokalne alate poput Node.js, Python, Java ili Docker. Pokrenite validator postavki prije početka da na vrijeme otkrijete nedostajuće alate.
- **Osnovno poznavanje terminala**: Nije potrebno biti ekspert, ali trebate biti ugodni s izvođenjem naredbi kao što su `git clone`, `azd auth login` i `azd up`.

> **Radite u korporativnoj pretplati?**
> Ako vaš Azure okoliš upravlja administrator, unaprijed potvrdite možete li implementirati resurse u pretplati ili grupi resursa koju planirate koristiti. Ako ne, zatražite sandbox pretplatu ili Contributor pristup prije početka.

> **Novi ste u Azure?**
> Počnite s vlastitom Azure probnom pretplatom ili pretplatom prema potrošnji na https://aka.ms/azurefreetrial kako biste mogli dovršiti vježbe od početka do kraja bez čekanja na odobrenja na razini najmodavca.

## 🗺️ Karta tečaja: Brza navigacija po poglavljima

Svako poglavlje ima vlastiti README s ciljevima učenja, brzim početcima i vježbama:

| Poglavlje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[Poglavlje 1: Osnove](docs/chapter-01-foundation/README.md)** | Početak | [AzD osnove](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacija](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavlje 2: AI razvoj](docs/chapter-02-ai-development/README.md)** | AI-prvi aplikacije | [Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Implementacija modela](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 sata | ⭐⭐ |
| **[Poglavlje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Autentikacija & Sigurnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentikacija & sigurnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavlje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC & implementacija | [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 sati | ⭐⭐⭐ |
| **[Poglavlje 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI agent rješenja | [Scenarij maloprodaje](examples/retail-scenario.md) &#124; [Koordinacijski obrasci](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[Poglavlje 6: Priprema za implementaciju](docs/chapter-06-pre-deployment/README.md)** | Planiranje & validacija | [Preflight provjere](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Odabir SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 sat | ⭐⭐ |
| **[Poglavlje 7: Rješavanje problema](docs/chapter-07-troubleshooting/README.md)** | Debug & popravak | [Uobičajeni problemi](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemi](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 sati | ⭐⭐ |
| **[Poglavlje 8: Produkcija](docs/chapter-08-production/README.md)** | Korporativni obrasci | [Proizvodne prakse](docs/chapter-08-production/production-ai-practices.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[🎓 Radionica](workshop/README.md)** | Praktični rad | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Odabir](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Deconstruct](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagodbe](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Rasplet](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključenje](workshop/docs/instructions/7-Wrap-up.md) | 3-4 sata | ⭐⭐ |

**Ukupno trajanje tečaja:** ~10-14 sati | **Razina vještina:** Početnik → Spreman za produkciju

---

## 📚 Poglavlja za učenje

*Odaberite svoj put učenja prema razini iskustva i ciljevima*

### 🚀 Poglavlje 1: Temelj & Brzi početak
**Preduvjeti**: Azure pretplata, osnovno poznavanje naredbenog retka  
**Trajanje**: 30-45 minuta  
**Kompleksnost**: ⭐

#### Što ćete naučiti
- Razumijevanje temeljnih koncepata Azure Developer CLI-a
- Instalacija AZD na vašoj platformi
- Vaša prva uspješna implementacija

#### Resursi za učenje
- **🎯 Početak ovdje**: [Što je Azure Developer CLI?](#-what-is-azure-developer-cli-azd)
- **📖 Teorija**: [AZD osnove](docs/chapter-01-foundation/azd-basics.md) - Osnovni koncepti i terminologija
- **⚙️ Postavljanje**: [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md) - Vodiči specifični za platformu
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Korak-po-korak tutorial
- **📋 Brzi pregled naredbi**: [Prečac naredbi](resources/cheat-sheet.md)

#### Praktične vježbe
```bash
# Quick installation check
azd version

# Deploy your first application
azd init --template todo-nodejs-mongo .
azd up
```

**💡 Ishod poglavlja**: Uspješno implementirajte jednostavnu web aplikaciju na Azure koristeći AZD

**✅ Provjera uspješnosti:**
```bash
# After completing Chapter 1, you should be able to:
azd version              # Shows installed version
azd init --template todo-nodejs-mongo  # Initializes project
azd up                  # Deploys to Azure
azd show                # Displays running app URL
# Application opens in browser and works
azd down --force --purge  # Cleans up resources
```

**📊 Vrijeme ulaganja:** 30-45 minuta  
**📈 Razina vještine nakon:** Mogućnost samostalne implementacije osnovnih aplikacija

---

### 🤖 Poglavlje 2: AI-prvi razvoj (Preporučeno za AI developere)
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 1-2 sata  
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti
- Integracija Microsoft Foundry s AZD
- Implementacija AI-pogonjenih aplikacija
- Razumijevanje konfiguracija AI usluga

#### Resursi za učenje
- **🎯 Početak ovdje**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI agenti**: [Vodič za AI agente](docs/chapter-02-ai-development/agents.md) - Implementacija inteligentnih agenata s AZD-om
- **📖 Obrasci**: [Implementacija AI modela](docs/chapter-02-ai-development/ai-model-deployment.md) - Primjena i upravljanje AI modelima
- **🛠️ Radionica**: [AI radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Priprema AI rješenja za AZD
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Učenje u pregledniku s MkDocs * DevContainer okruženje
- **📋 Predlošci**: [Microsoft Foundry predlošci](#featured-microsoft-foundry-templates)
- **📝 Primjeri**: [Primjeri AZD implementacija](examples/README.md)

#### Praktične vježbe
```bash
# Deploy your first AI application
azd init --template azure-search-openai-demo .
azd up

# Try additional AI templates
azd init --template openai-chat-app-quickstart .
azd init --template agent-openai-python-prompty .
```

**💡 Ishod poglavlja**: Implementirajte i konfigurirajte AI-pogonjenu chat aplikaciju s RAG mogućnostima

**✅ Provjera uspješnosti:**
```bash
# After Chapter 2, you should be able to:
azd init --template azure-search-openai-demo .
azd up
# Test the AI chat interface
# Ask questions and get AI-powered responses with sources
# Verify search integration works
azd monitor  # Check Application Insights shows telemetry
azd down --force --purge
```

**📊 Vrijeme ulaganja:** 1-2 sata  
**📈 Razina vještine nakon:** Mogućnost implementacije AI aplikacija za učenje i identifikacija dodatnih zahtjeva za produkcijsku spremnost
**💰 Svijest o troškovima:** Razumijevanje troškova razvoja od 80 do 150 USD/mj, te troškova produkcije od 300 do 3500 USD/mj

#### 💰 Razmatranja troškova za AI implementacije

**Razvojno okruženje (Procjena 80-150 USD/mj):**
- Microsoft Foundry modeli (plaćanje po korištenju): 0-50 USD/mj (ovisno o tokenima)
- AI Search (osnovni nivo): 75 USD/mj
- Container Apps (potrošnja): 0-20 USD/mj
- Pohrana (standard): 1-5 USD/mj

**Produkcijsko okruženje (Procjena 300-3500+ USD/mj):**
- Microsoft Foundry modeli (PTU za stabilne performanse): 3000+ USD/mj ILI plaćanje po korištenju uz veliki volumen
- AI Search (standardni nivo): 250 USD/mj
- Container Apps (dedicirani): 50-100 USD/mj
- Application Insights: 5-50 USD/mj
- Pohrana (premium): 10-50 USD/mj

**💡 Savjeti za optimizaciju troškova:**
- Provjerite cijene za inferenciju modela i računske kredite; Azure OpenAI ne uključuje univerzalni mjesečni besplatni limit od 50,000 tokena
- Pokrenite `azd down` za brisanje resursa kad više nisu potrebni, nakon što pregledate odabrano okruženje
- Počnite s naplatom po potrošnji, nadogradite na PTU samo za produkciju
- Koristite `azd provision --preview` za pregled planirane infrastrukture, zatim procijenite cijenu resursa s Azure kalkulatorom cijena
- Omogućite automatsko skaliranje: plaćajte samo za stvarnu potrošnju

**Praćenje troškova:**
```bash
# Inspect planned resources (this does not calculate prices)
azd provision --preview

# Monitor actual costs in Azure Portal
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Poglavlje 3: Konfiguracija i autentikacija
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 45-60 minuta  
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti
- Konfiguriranje i upravljanje okruženjima
- Najbolje prakse autentikacije i sigurnosti
- Imenovanje i organizacija resursa

#### Resursi za učenje
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/chapter-03-configuration/configuration.md) - Postavljanje okruženja
- **🔐 Sigurnost**: [Obrasci autentikacije i upravljani identiteti](docs/chapter-03-configuration/authsecurity.md) - Obrasci autentikacije
- **📝 Primjeri**: [Primjer aplikacije s bazom podataka](examples/database-app/README.md) - AZD primjeri s bazom podataka

#### Praktične vježbe
- Konfigurirajte više okruženja (dev, staging, prod)
- Postavite autentikaciju s upravljanim identitetom
- Implementirajte konfiguracije specifične za okruženje

**💡 Ishod poglavlja**: Upravljajte s više okruženja uz pravilnu autentikaciju i sigurnost

---

### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija
**Preduvjeti**: Završena Poglavlja 1-3  
**Trajanje**: 1-1.5 sati  
**Kompleksnost**: ⭐⭐⭐

#### Što ćete naučiti
- Napredni obrasci implementacije
- Infrastruktura kao kod s Bicep predlošcima
- Strategije provisioninga resursa

#### Resursi za učenje
- **📖 Implementacija**: [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) - Cjeloviti tijekovi rada
- **🏗️ Provisioning**: [Provisioning resursa](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure resursima
- **📝 Primjeri**: [Primjer Container Aplikacije](../../examples/container-app) - Implementacije s kontejnerima

#### Praktične vježbe
- Kreirajte prilagođene Bicep predloške
- Implementirajte višeservisne aplikacije
- Primijenite blue-green strategije implementacije

**💡 Ishod poglavlja**: Implementirajte složene višeservisne aplikacije koristeći prilagođene infrastrukturne predloške

---

### 🎯 Poglavlje 5: Multi-Agent AI rješenja (Napredno)
**Preduvjeti**: Završena Poglavlja 1-2  
**Trajanje**: 2-3 sata  
**Kompleksnost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Obrasci arhitekture višestrukih agenata
- Orkestracija i koordinacija agenata
- Produkcijski spremna AI rješenja

#### Resursi za učenje
- **🤖 Istaknuti dizajn**: [Retail Multi-Agent rješenje](examples/retail-scenario.md) - Arhitektonski nacrt, nije potpuna aplikacija
- **🛠️ ARM predlošci**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Infrastrukturna osnova; pregled preduvjeta i nedostajućih komponenti aplikacije
- **📖 Arhitektura**: [Višekorisnički koordinacijski obrasci](docs/chapter-06-pre-deployment/coordination-patterns.md) - Obrasci

#### Praktične vježbe
```bash
# Inspect the retail infrastructure scaffold before choosing to deploy it
cd examples/retail-multiagent-arm-template
cat README.md

# After an intentional deployment, inspect infrastructure state
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ishod poglavlja**: Razumjeti dizajn višekorisničkog sustava i identificirati potrebne radove implementacije, provjere i rada izvan infrastrukturne osnove

---

### 🔍 Poglavlje 6: Provjera i planiranje prije implementacije
**Preduvjeti**: Završeno Poglavlje 4  
**Trajanje**: 1 sat  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i provjera resursa
- Strategije odabira SKU
- Provjere prije leta i automatizacija

#### Izvori učenja
- **📊 Planiranje**: [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) - Provjera resursa
- **💰 Odabir**: [Odabir SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Isplative opcije
- **✅ Provjera**: [Provjere prije leta](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizirani skripti

#### Praktične vježbe
- Pokrenite skripte za provjeru kapaciteta
- Optimizirajte odabir SKU za troškove
- Implementirajte automatizirane provjere prije implementacije

**💡 Ishod poglavlja**: Validirajte i optimizirajte implementacije prije izvođenja

---

### 🚨 Poglavlje 7: Otklanjanje poteškoća i ispravljanje pogrešaka
**Preduvjeti**: Završeno bilo koje poglavlje o implementaciji  
**Trajanje**: 1-1.5 sati  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sistematski pristupi otklanjanju pogrešaka
- Uobičajeni problemi i rješenja
- Otklanjanje poteškoća specifičnih za AI

#### Izvori učenja
- **🔧 Uobičajeni problemi**: [Uobičajeni problemi](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rješenja
- **🕵️ Otklanjanje pogrešaka**: [Vodič za otklanjanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak-po-korak
- **🤖 AI problemi**: [Specifično otklanjanje poteškoća AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi s AI uslugama

#### Praktične vježbe
- Dijagnosticirajte neuspjehe implementacije
- Riješite probleme autentifikacije
- Otklonite poteškoće u povezivanju AI usluga

**💡 Ishod poglavlja**: Samostalno dijagnosticirajte i riješite uobičajene probleme s implementacijom

---

### 🏢 Poglavlje 8: Obrasci za produkciju i poduzeća
**Preduvjeti**: Završena poglavlja 1-4  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije implementacije za produkciju
- Obrasci sigurnosti za poduzeća
- Praćenje i optimizacija troškova

#### Izvori učenja
- **🏭 Produkcija**: [Najbolje prakse za AI u produkciji](docs/chapter-08-production/production-ai-practices.md) - Obrasci za poduzeća
- **📝 Primjeri**: [Primjer mikroservisa](../../examples/microservices) - Kompleksne arhitekture
- **📊 Praćenje**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Praćenje

#### Praktične vježbe
- Implementirajte sigurnosne obrasce za poduzeća
- Postavite sveobuhvatno praćenje
- Implementirajte u produkciju s odgovarajućim upravljanjem

**💡 Ishod poglavlja**: Implementirajte aplikacije spremne za poduzeće s punim produkcijskim mogućnostima

---

## 🎓 Pregled radionice: Praktično iskustvo učenja

> **⚠️ STATUS RADIONICE: Aktivni razvoj**  
> Materijali radionice su u tijeku izrade i dorade. Glavni moduli su funkcionalni, no neki napredni dijelovi još nisu kompletni. Aktivno radimo na dovršetku sadržaja. [Pratite napredak →](workshop/README.md)

### Interaktivni materijali radionice
**Sveobuhvatno praktično učenje pomoću alata u pregledniku i vođenih vježbi**

Materijali radionice pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje gore navedeni kurikulum po poglavljima. Radionica je dizajnirana i za samostalno učenje i za učenje pod vodstvom instruktora.

#### 🛠️ Značajke radionice
- **Sučelje u pregledniku**: Cjelokupna radionica pokretana putem MkDocs s pretraživanjem, kopiranjem i značajkama teme
- **Integracija GitHub Codespaces**: Postavljanje razvojne okoline jednim klikom
- **Strukturirani put učenja**: 8-modulske vođene vježbe (ukupno 3-4 sata)
- **Progresivna metodologija**: Uvod → Odabir → Validacija → Razgradnja → Konfiguracija → Prilagodba → Raskid → Zaključak
- **Interaktivno DevContainer okruženje**: Unaprijed konfigurirani alati i ovisnosti

#### 📚 Struktura modula radionice
Radionica slijedi **8-modulski progresivni pristup** koji vas vodi od otkrivanja do savladavanja implementacije:

| Modul | Tema | Što ćete raditi | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled radionice | Razumjeti ciljeve učenja, preduvjete i strukturu radionice | 15 min |
| **1. Odabir** | Otkrivanje predložaka | Istražiti AZD predloške i odabrati odgovarajući AI predložak za svoj scenarij | 20 min |
| **2. Validacija** | Implementacija i provjera | Implementirati predložak s `azd up` i potvrditi rad infrastrukture | 30 min |
| **3. Razgradnja** | Razumijevanje strukture | Koristiti GitHub Copilot za istraživanje arhitekture predloška, Bicep datoteka i organizacije koda | 30 min |
| **4. Konfiguracija** | Detaljno o azure.yaml | Savladati `azure.yaml` konfiguraciju, životni ciklus i varijable okoline | 30 min |
| **5. Prilagodba** | Prilagodite sebi | Omogućiti AI pretraživanje, praćenje, evaluaciju i prilagodbu vašem scenariju | 45 min |
| **6. Raskid** | Čišćenje | Sigurno ukloniti resurse s `azd down --purge` | 15 min |
| **7. Zaključak** | Sljedeći koraci | Pregled postignuća, ključnih pojmova i nastavak puta učenja | 15 min |

**Tijek radionice:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Početak radionice
```bash
# Option 1: GitHub Codespaces (Recommended)
# Click "Code" → "Create codespace on main" in the repository

# Option 2: Local Development
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Follow the setup instructions in workshop/README.md
```

#### 🎯 Ishodi učenja radionice
Nakon završetka radionice sudionici će:
- **Implementirati produkcijske AI aplikacije**: Koristiti AZD s Microsoft Foundry uslugama
- **Savladati višekorisničke arhitekture**: Implementirati koordinirane AI agentske rješenja
- **Primijeniti sigurnosne najbolje prakse**: Konfigurirati autentifikaciju i kontrolu pristupa
- **Optimizirati za skaliranje**: Dizajnirati isplative i učinkovite implementacije
- **Otklanjati probleme implementacije**: Samostalno rješavati uobičajene probleme

#### 📖 Resursi radionice
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Okruženje za učenje u pregledniku
- **📋 Upute po modulima**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled radionice i ciljevi
  - [1. Odabir](workshop/docs/instructions/1-Select-AI-Template.md) - Pronalaženje i odabir AI predložaka
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementacija i potvrda predložaka
  - [3. Razgradnja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Istraživanje arhitekture predložaka
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Savladavanje azure.yaml
  - [5. Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodba za vaš scenarij
  - [6. Raskid](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Čišćenje resursa
  - [7. Zaključak](workshop/docs/instructions/7-Wrap-up.md) - Pregled i sljedeći koraci
- **🛠️ AI laboratorij radionice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI fokusirane vježbe
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#browser-based-guide) - Konfiguracija okoline

**Idealno za**: Korporativnu obuku, sveučilišne tečajeve, samostalno učenje i bootcampove za developere.

---

## 📖 Dubinski pregled: Mogućnosti AZD-a

Uz osnove, AZD pruža snažne značajke za produkcijske implementacije:

- **Implementacije temeljene na predlošcima** - Koristite unaprijed izrađene predloške za uobičajene obrasce aplikacija
- **Infrastruktura kao kod** - Upravljajte Azure resursima koristeći Bicep ili Terraform  
- **Integrirani tijekovi rada** - Besprijekorno pružanje, implementacija i praćenje aplikacija
- **Prilagođeno developerima** - Optimizirano za produktivnost i iskustvo developera

### **AZD + Microsoft Foundry: Idealno za AI implementacije**

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se AI developeri susreću:

- **AI-pripremljeni predlošci** - Unaprijed konfigurirani predlošci za Microsoft Foundry modele, Azure AI usluge i ML radna opterećenja
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI usluge, API ključeve i krajnje točke modela  
- **Produkcijski AI obrasci** - Najbolje prakse za skalabilne i isplative AI aplikacije
- **End-to-End AI tijekovi rada** - Od razvoja modela do produkcijske implementacije s adekvatnim praćenjem
- **Optimizacija troškova** - Pametne strategije dodjele resursa i skaliranja za AI radna opterećenja
- **Integracija s Microsoft Foundryjem** - Besprijekorna veza s katalogom modela i krajnjim točkama Microsoft Foundryja

---

## 🎯 Biblioteka predložaka i primjera

### Istaknuto: Microsoft Foundry predlošci
**Počnite ovdje ako implementirate AI aplikacije!**

> **Napomena:** Ovi predlošci prikazuju različite AI obrasce. Neki su vanjski Azure uzorci, drugi su lokalne implementacije.

| Predložak | Poglavlje | Složenost | Usluge | Tip |
|----------|---------|------------|----------|------|
| [**Početak s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Početak s AI agentima**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Vanjski |
| [**Demonstracija Azure Search + OpenAI**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | Azure OpenAI + Azure AI Search + Container Apps (zadano) + Storage | Vanjski |
| [**OpenAI Chat App Brzi početak**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Vanjski |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Vanjski |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Vanjski |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Predložena arhitektura i infrastrukturna osnova; potrebna implementacija aplikacije | **Lokalni nacrt** |

### Istaknuto: Kompleti scenarija učenja
**Predlošci aplikacija spremnih za produkciju mapirani na poglavlja za učenje**

| Predložak | Poglavlje za učenje | Složenost | Ključna lekcija |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni AI obrasci implementacije |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | RAG implementacija s Azure AI Search |
| [**get-started-with-ai-agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Chat s agentima i testovi evaluacije specifični za uzorak |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Agentski okvir i pozivanje funkcija |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Orkestracija AI u poduzeću |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Višekorisnička arhitektura s agentima za korisnike i skladište |

### Učenje po tipu primjera

> **📌 Lokalni vs. vanjski primjeri:**  
> **Lokalni primjeri** (u ovom spremištu) = Provjerite README primjera za status implementacije i preduvjete
> **Vanjski primjeri** (Azure uzorci) = Klonirajte iz povezanih spremišta

#### Lokalni primjeri (spremni za upotrebu)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Arhitektonski nacrt s ARM infrastrukturnom osnovom
  - Predložene uloge agenata za korisnike i skladište
  - Monitoring, evaluacija i kod aplikacije moraju se implementirati i verificirati
  - Samo postavljanje resursa ne stvara funkcionalnu maloprodajnu aplikaciju

#### Lokalni primjeri - kontejnerske aplikacije (Poglavlja 2-5)
**Sveobuhvatni primjeri implementacije kontejnera u ovom spremištu:**
- [**Primjeri kontejnerskih aplikacija**](examples/container-app/README.md) - Cjelovit vodič kroz implementaciju kontejnera
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API sa skaliranjem na nulu
  - [Arhitektura mikroservisa](../../examples/container-app/microservices) - Uzorak učenja s dvije usluge; dodatni rad za produkcijsko učvršćivanje
  - Uzorci brzog početka, produkcije i naprednih implementacija
  - Upute za praćenje, sigurnost i optimizaciju troškova

#### Vanjski primjeri - jednostavne aplikacije (Poglavlja 1-2)
**Klonirajte ova Azure uzorci spremišta za početak:**
- [Jednostavna web aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni obrasci implementacije
- [Statistična web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementacija statičkog sadržaja
- [Kontejnerska aplikacija - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementacija REST API-ja

#### Vanjski primjeri - integracija baze podataka (Poglavlje 3-4)  
- [Aplikacija s bazom podataka - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Obrasci povezivanja s bazom podataka
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless podatkovni tijek rada

#### Vanjski primjeri - Napredni obrasci (Poglavlja 4-8)
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Višeservisne arhitekture
- [Poslovi s Container Apps](https://github.com/Azure-Samples/container-apps-jobs) - Obrada u pozadini  
- [Enterprise ML pipeline](https://github.com/Azure/mlops-v2) - MLOps referentni obrasci; nije ravno upotrebljiv AZD predložak

### Vanjske zbirke predložaka
- [**Službena galerija AZD predložaka**](https://azure.github.io/awesome-azd/) - Kurirana zbirka službenih i zajedničkih predložaka
- [**Azure Developer CLI predlošci**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija Microsoft Learn predložaka
- [**Direktorij primjera**](examples/README.md) - Lokalni primjeri za učenje s detaljnim objašnjenjima

---

## 📚 Resursi za učenje i reference

### Brze reference
- [**Prečac naredbi**](resources/cheat-sheet.md) - Ključne azd naredbe organizirane po poglavljima
- [**Rječnik**](resources/glossary.md) - Terminologija Azure i azd  
- [**Često postavljana pitanja**](resources/faq.md) - Uobičajena pitanja organizirana po poglavljima
- [**Vodič za učenje**](resources/study-guide.md) - Sveobuhvatne praktične vježbe

### Radionice s praktičnim radom
- [**AI radiona**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Omogućite svoju AI rješenja za AZD implementaciju (2-3 sata)
- [**Interaktivna radionica**](workshop/README.md) - 8-modulne vođene vježbe s MkDocs i GitHub Codespaces
  - Slijedi: Uvod → Odabir → Potvrda → Raščlanjivanje → Konfiguracija → Prilagodba → Razgradnja → Zaključak

### Vanjski resursi za učenje
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure arhitektonski centar](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure kalkulator cijena](https://azure.microsoft.com/pricing/calculator/)
- [Status Azure](https://status.azure.com/)

### AI vještine za vaš uređivač
- [**Microsoft Azure Skills na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorenih vještina za agente za Azure AI, Foundry, implementaciju, dijagnostiku, optimizaciju troškova i još mnogo toga. Instalirajte ih u GitHub Copilot, Cursor, Claude Code ili bilo kojeg podržanog agenta:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Brzi vodič za rješavanje problema

**Uobičajeni problemi s kojima se početnici susreću i njihova trenutna rješenja:**

<details>
<summary><strong>❌ "azd: naredba nije pronađena"</strong></summary>

```bash
# Install AZD first
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Verify installation
azd version
```
</details>

<details>
<summary><strong>❌ "Pretplata nije pronađena" ili "Pretplata nije postavljena"</strong></summary>

```bash
# List available subscriptions
az account list --output table

# Set default subscription
az account set --subscription "<subscription-id-or-name>"

# Set for AZD environment
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Verify
az account show
```
</details>

<details>
<summary><strong>❌ "Nedovoljna kvota" ili "Kvota premašena"</strong></summary>

```bash
# Try different Azure region
azd env set AZURE_LOCATION "westus2"
azd up

# Or use smaller SKUs in development
# Edit infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ne uspijeva na pola puta</strong></summary>

```bash
# Option 1: Inspect the error and retry after correcting its cause
azd show
azd up --debug

# Option 2: Just fix infrastructure
azd provision

# Option 3: Check detailed status
azd show

# Option 4: Check logs in Azure Monitor
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentifikacija nije uspjela" ili "Token je istekao"</strong></summary>

```bash
# Re-authenticate for AZD
azd auth logout
azd auth login

# Optional: refresh Azure CLI too if you are running az commands
az logout
az login

# Verify authentication
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs već postoji" ili sukobi u imenovanju</strong></summary>

```bash
# Inspect the conflicting resource before changing or deleting anything.
# For an isolated new deployment, create a separate environment:
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implementacija predloška traje predugo</strong></summary>

**Normalna vremena čekanja:**
- Jednostavna web aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (Provisioniranje OpenAI-ja je sporo)

```bash
# Check progress
azd show

# If stuck >30 minutes, check Azure Portal:
azd monitor --overview
# Look for failed deployments
```
</details>

<details>
<summary><strong>❌ "Dozvola odbijena" ili "Zabranjeno"</strong></summary>

```bash
# Check your Azure role
az role assignment list --assignee $(az account show --query user.name -o tsv)

# You need at least "Contributor" role
# Ask your Azure admin to grant:
# - Contributor (for resources)
# - User Access Administrator (for role assignments)
```
</details>

<details>
<summary><strong>❌ Ne mogu pronaći URL implementirane aplikacije</strong></summary>

```bash
# Show all service endpoints
azd show

# Or open Azure Portal
azd monitor

# Check specific service
azd env get-values
# Look for *_URL variables
```
</details>

### 📚 Potpuni resursi za rješavanje problema

- **Vodič za uobičajene probleme:** [Detaljna rješenja](docs/chapter-07-troubleshooting/common-issues.md)
- **AI specifični problemi:** [Rješavanje problema za AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodič za otklanjanje pogrešaka:** [Korak po korak otklanjanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md)
- **Potražite pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Završetak tečaja i certifikacija

### Praćenje napretka
Pratite svoj napredak kroz svako poglavlje:

- [ ] **Poglavlje 1**: Osnove i brzi početak ✅
- [ ] **Poglavlje 2**: AI-prvo razvoj ✅  
- [ ] **Poglavlje 3**: Konfiguracija i autentikacija ✅
- [ ] **Poglavlje 4**: Infrastruktura kao kod i implementacija ✅
- [ ] **Poglavlje 5**: Više-agentna AI rješenja ✅
- [ ] **Poglavlje 6**: Validacija i planiranje prije implementacije ✅
- [ ] **Poglavlje 7**: Rješavanje problema i otklanjanje pogrešaka ✅
- [ ] **Poglavlje 8**: Obrazci za produkciju i poduzeća ✅

### Provjera znanja
Nakon završetka svakog poglavlja, provjerite svoje znanje:
1. **Praktična vježba**: Završite praktičnu implementaciju poglavlja
2. **Provjera znanja**: Pregledajte FAQ odjeljak za svoje poglavlje
3. **Zajednički razgovor**: Podijelite svoja iskustva na Azure Discordu
4. **Sljedeće poglavlje**: Nastavite na sljedeću razinu složenosti

### Prednosti završetka tečaja
Nakon završetka svih poglavlja, imat ćete:
- **Iskustvo u produkciji**: Implementirane stvarne AI aplikacije u Azure
- **Profesionalne vještine**: Sposobnosti implementacije spremne za poduzeća  
- **Priznanje zajednice**: Aktivni član zajednice Azure developera
- **Napredovanje u karijeri**: Traženo znanje za AZD i AI implementaciju

---

## 🤝 Zajednica i podrška

### Dobivanje pomoći i podrške
- **Tehnički problemi**: [Prijavite pogreške i zatražite značajke](https://github.com/microsoft/azd-for-beginners/issues)
- **Pitanja za učenje**: [Microsoft Azure Discord zajednica](https://discord.gg/microsoft-azure) i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI specifična pomoć**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Uvidi zajednice iz Microsoft Foundry Discorda

**Teme koje zajednica raspravlja:**
- Višeservisne implementacije, upravljanje vjerodajnicama i spremnost za produkciju
- AI specifični predlošci, vodiči za rješavanje problema i najbolje prakse

**Pridružite se našoj zajednici da:**
- Podijelite svoja AZD + AI iskustva i dobijete pomoć
- Pristupite ranom uvidu novih AI predložaka
- Doprinesete najboljim praksama za AI implementacije
- Utječete na budući razvoj funkcionalnosti AI + AZD

### Doprinos tečaju
Dobrodošli su doprinosi! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:
- **Poboljšanja sadržaja**: Unaprijedite postojeća poglavlja i primjere
- **Novi primjeri**: Dodajte stvarne scenarije i predloške  
- **Prijevod**: Pomozite održavati višerazinsku podršku
- **Prijave pogrešaka**: Poboljšajte točnost i jasnoću
- **Standardi zajednice**: Pridržavajte se naših inkluzivnih smjernica zajednice

---

## 📄 Informacije o tečaju

### Licenca
Ovaj projekt je licenciran pod MIT licencom - pogledajte datoteku [LICENSE](../../LICENSE) za detalje.

### Povezani Microsoft Learning resursi

Naš tim proizvodi druge sveobuhvatne edukacijske tečajeve:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j za početnike](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js za početnike](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain za početnike](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agenti
[![AZD za početnike](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI za početnike](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP za početnike](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI agenti za početnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija o generativnoj AI
[![Generativna AI za početnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativna AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativna AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativna AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML za početnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science za početnike](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI za početnike](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity za početnike](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web razvoj za početnike](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT za početnike](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR razvoj za početnike](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot za AI programsko uparivanje](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot za C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot avantura](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija kroz tečaj

**🚀 Spremni za početak učenja?**

**Početnici**: Počnite s [Poglavlje 1: Osnove i brzi početak](#-chapter-1-foundation--quick-start)  
**AI developeri**: Pređite na [Poglavlje 2: AI-prvo razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Iskusni developeri**: Započnite s [Poglavlje 3: Konfiguracija i autentikacija](#️-chapter-3-configuration--authentication)

**Sljedeći koraci**: [Započni Poglavlje 1 - Osnove AZD-a](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->