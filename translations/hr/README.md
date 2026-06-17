# AZD za početnike: Strukturirano putovanje učenjem

![AZD-for-beginners](../../translated_images/hr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatski prijevodi (Uvijek ažurirano)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](./README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferirate lokalno klonirati?**
>
> Ovaj repozitorij uključuje prevode na više od 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
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
> Time dobivate sve što vam je potrebno za završetak tečaja uz puno brže preuzimanje.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Što je novo u azd danas

> 📌 Ovaj tečaj je verificiran za **`azd 1.25.6`** (lipanj 2026). Pokrenite `azd version` da provjerite verziju, a `azd upgrade` za najnoviju.

Azure Developer CLI je narasao izvan tradicionalnih web aplikacija i API-ja. Danas je azd jedini alat za implementaciju **bilo koje** aplikacije u Azure—uključujući AI-aplikacije i inteligentne agente.

Evo što to znači za vas:

- **AI agenti su sada prioritetni azd workloadi.** Možete inicijalizirati, implementirati i upravljati AI agent projektima koristeći isti `azd init` → `azd up` tijek rada koji već znate.
- **Potpun životni ciklus agenta iz CLI-ja.** Ekstenzija `azure.ai.agents` sada pokriva cijelo putovanje—`azd ai agent init` za scaffolding, `azd ai agent invoke` za testiranje (s prikazom vremena odgovora), `azd ai agent eval generate` i `azd ai agent optimize` za mjerenje i poboljšanje kvalitete, te `azd ai agent delete` za čišćenje.
- **Više AI građevnih blokova.** Nove verzije u preview-u—`azure.ai.skills` i `azure.ai.connections`—omogućavaju upravljanje višekratno upotrebljivim agent vještinama i Foundry vezama direktno preko azd.
- **Microsoft Foundry integracija** donosi implementaciju modela, hostanje agenata i konfiguraciju AI servisa direktno u azd ekosustav predložaka.
- **Gladka svakodnevna osnovna upotreba.** Nedavna izdanja su učinila `azd init` idempotentnim (sigurno za ponovni poziv), `azd auth login` automatski čisti zastarjele tokene, i dodala prijateljski `azd tool` prvi pokret za podešavanje.
- **Temeljni tijek rada nije se promijenio.** Bez obzira implementirate li todo aplikaciju, mikroservis ili multi-agent AI rješenje, naredbe su iste.

> **Napomena za Aspire korisnike:** Microsoft sada proizvod jednostavno naziva **Aspire** (prije ".NET Aspire"). azd podrška za Aspire je nepromijenjena—samo je ime ažurirano.

Ako ste već koristili azd, AI podrška je prirodni dodatak, a ne zaseban alat ili napredni smjer. Ako počinjete iznova, naučit ćete jedan tijek rada koji funkcionira za sve.

---

## 🚀 Što je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je korisnički prijateljski alat naredbenog retka koji čini jednostavnim implementaciju aplikacija u Azure. Umjesto da ručno stvarate i povezujete desetke Azure resursa, možete implementirati cijele aplikacije jednom naredbom.

### Magija `azd up`

```bash
# Ova jedina naredba radi sve:
# ✅ Stvara sve Azure resurse
# ✅ Konfigurira umrežavanje i sigurnost
# ✅ Gradi kod vaše aplikacije
# ✅ Raspoređuje u Azure
# ✅ Daje vam radni URL
azd up
```

**To je to!** Nema klikanja po Azure portalu, nema kompliciranih ARM predložaka za učenje, nema ručne konfiguracije - samo radne aplikacije na Azureu.

---

## ❓ Azure Developer CLI nasuprot Azure CLI: Koja je razlika?

Ovo je najčešće pitanje koje početnici postavljaju. Evo jednostavnog odgovora:

| Značajka | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Svrha** | Upravljati pojedinačnim Azure resursima | Implementirati kompletne aplikacije |
| **Način razmišljanja** | Fokus na infrastrukturi | Fokus na aplikaciji |
| **Primjer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Potrebno znati Azure servise | Samo znati vašu aplikaciju |
| **Najbolje za** | DevOps, infrastruktura | Programere, prototipiranje |

### Jednostavna analogija

- **Azure CLI** je kao imati sve alate za izgradnju kuće - čekiće, pile, čavle. Možete graditi bilo što, ali morate znati građevinu.
- **Azure Developer CLI** je kao unajmiti izvođača radova - vi kažete što želite, a on izgradi.

### Kada koristiti koji

| Scenarij | Koristite ovo |
|----------|---------------|
| "Želim brzo implementirati svoju web aplikaciju" | `azd up` |
| "Trebam samo napraviti storage račun" | `az storage account create` |
| "Gradim kompletnu AI aplikaciju" | `azd init --template azure-search-openai-demo` |
| "Trebam debugirati određeni Azure resurs" | `az resource show` |
| "Želim produkcijski deployment za minute" | `azd up --environment production` |

### Zajedno rade!

AZD koristi Azure CLI "ispod haube". Možete koristiti oba:
```bash
# Rasporedite svoju aplikaciju pomoću AZD
azd up

# Zatim fino podesite određene resurse pomoću Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pronađite predloške u Awesome AZD

Nemojte počinjati od nule! **Awesome AZD** je zajednička kolekcija predložaka spremnih za implementaciju:

| Resurs | Opis |
|---------|------|
| 🔗 [**Awesome AZD galerija**](https://azure.github.io/awesome-azd/) | Pregledajte 200+ predložaka s implementacijom jednim klikom |
| 🔗 [**Pošaljite predložak**](https://github.com/Azure/awesome-azd/issues) | Doprinesite vlastitim predloškom zajednici |
| 🔗 [**GitHub repozitorij**](https://github.com/Azure/awesome-azd) | Zvijezda i istražite izvore |

### Popularni AI predlošci iz Awesome AZD

```bash
# RAG Chat s Microsoft Foundry modelima + AI pretraživanje
azd init --template azure-search-openai-demo

# Brza AI chat aplikacija
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agentima
azd init --template get-started-with-ai-agents
```

---

## 🎯 Početak u 3 koraka

Prije nego započnete, provjerite je li vaše računalo spremno za predložak koji želite implementirati:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako neki od zahtjeva nije zadovoljen, prvo ga riješite pa nastavite s brzom instalacijom.

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

### Korak 2: Autentifikacija za AZD

```bash
# Opcionalno ako planirate koristiti Azure CLI naredbe izravno u ovom tečaju
az login

# Potreban za AZD tokove rada
azd auth login
```

Ako niste sigurni koji vam treba, slijedite cjelokupni postupak postavljanja u [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Implementirajte svoju prvu aplikaciju

```bash
# Inicijalizirajte iz predloška
azd init --template todo-nodejs-mongo

# Rasporedite u Azure (kreira sve!)
azd up
```

**🎉 To je to!** Vaša je aplikacija sada aktivna na Azureu.

### Čišćenje (Nemojte zaboraviti!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako koristiti ovaj tečaj

Ovaj tečaj je dizajniran za **postepeno učenje** - započnite tamo gdje vam je najugodnije i napredujte dalje:

| Vaše iskustvo | Počnite ovdje |
|----------------|--------------|
| **Potpuni početnik u Azureu** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Znate Azure, novi ste u AZD-u** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite implementirati AI aplikacije** | [Poglavlje 2: AI-prvo razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktične vježbe** | [🎓 Interaktivna radionica](workshop/README.md) - 3-4 sata vođenog laboratorija |
| **Trebate produkcijske obrasce** | [Poglavlje 8: Produkcija & Enterprise](#-chapter-8-production--enterprise-patterns) |

### Brzo postavljanje

1. **Forkajte ovaj repozitorij**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Potražite pomoć**: [Azure Discord zajednica](https://discord.com/invite/ByRwuEEgH4)

> **Preferirate lokalno klonirati?**

> Ovaj repozitorij uključuje prevode na više od 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Time dobivate sve što vam je potrebno za završetak tečaja uz puno brže preuzimanje.


## Pregled tečaja

Savladajte Azure Developer CLI (azd) kroz strukturirana poglavlja dizajnirana za postepeno učenje. **Posebni fokus na implementaciju AI aplikacija s integracijom Microsoft Foundry.**
### Zašto je ovaj tečaj bitan za suvremene developere

Na temelju uvida iz Microsoft Foundry Discord zajednice, **45% developera želi koristiti AZD za AI radne zadatke** ali nailaze na izazove s:
- Složenim višeservisnim AI arhitekturama
- Najboljim praksama za produkcijsko postavljanje AI
- Integracijom i konfiguracijom Azure AI servisa
- Optimizacijom troškova za AI radne zadatke
- Otklanjanjem poteškoća specifičnih za AI implementacije

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja ćete:
- **Savladati osnove AZD-a**: Temeljni koncepti, instalacija i konfiguracija
- **Implementirati AI aplikacije**: Korištenje AZD-a s Microsoft Foundry servisima
- **Primijeniti infrastrukturu kao kod**: Upravljanje Azure resursima s Bicep predlošcima
- **Dijagnosticirati implementacije**: Rješavanje uobičajenih problema i debugiranje
- **Optimizirati za produkciju**: Sigurnost, skaliranje, nadzor i upravljanje troškovima
- **Izgraditi rješenja s više agenata**: Postavljanje složenih AI arhitektura

## Prije početka: računi, pristupi i pretpostavke

Prije nego što započnete Poglavlje 1, provjerite da imate sljedeće. Koraci instalacije kasnije u ovom vodiču pretpostavljaju da su ove osnove već riješene.

- **Azure pretplata**: Možete koristiti postojeću pretplatu s posla ili svoj račun, ili kreirati [besplatno probno razdoblje](https://aka.ms/azurefreetrial) za početak.
- **Dozvola za kreiranje Azure resursa**: Za većinu vježbi trebali biste imati barem **Contributor** ulogu na ciljanoj pretplati ili grupi resursa. Neka poglavlja također pretpostavljaju da možete kreirati grupe resursa, upravljane identitete i RBAC dodjele.
- [**GitHub račun**](https://github.com): Koristan za forkanje repozitorija, praćenje vlastitih promjena i korištenje GitHub Codespaces za radionicu.
- **Preduvjeti za izvršavanje predložaka**: Neki predlošci trebaju lokalne alate poput Node.js, Python, Java ili Docker. Pokrenite validator postavki prije početka kako biste rano uočili nedostatke alata.
- **Osnovno poznavanje terminala**: Ne morate biti stručnjak, ali trebali biste biti ugodni u pokretanju naredbi poput `git clone`, `azd auth login` i `azd up`.

> **Radite na enterprise pretplati?**  
> Ako vaš Azure okoliš upravlja administrator, unaprijed potvrdite možete li postavljati resurse u pretplatu ili grupu resursa koju planirate koristiti. Ako ne, zatražite sandbox pretplatu ili Contributor pristup prije početka.

> **Novi ste u Azureu?**  
> Započnite s vlastitom Azure probnom ili plaćenom pretplatom po potrošnji na https://aka.ms/azurefreetrial kako biste mogli dovršiti vježbe bez čekanja na odobrenja na nivou najma.

## 🗺️ Karta tečaja: brza navigacija po poglavljima

Svako poglavlje ima svoju README datoteku s ciljevima učenja, brzih početaka i vježbi:

| Poglavlje | Tema | Lekcije | Trajanje | Kompleksnost |
|-----------|-------|---------|----------|--------------|
| **[Pog 1: Osnove](docs/chapter-01-foundation/README.md)** | Početak rada | [AZD osnove](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacija](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Pog 2: AI razvoj](docs/chapter-02-ai-development/README.md)** | AI-prvo aplikacije | [Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Model implementacija](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Pog 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Autentikacija i sigurnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentikacija i sigurnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Pog 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i implementacija | [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 h | ⭐⭐⭐ |
| **[Pog 5: Multi-Agent](docs/chapter-05-multi-agent/README.md)** | AI agentska rješenja | [Scenarij maloprodaje](examples/retail-scenario.md) &#124; [Koordinacijski obrasci](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[Pog 6: Priprema za implementaciju](docs/chapter-06-pre-deployment/README.md)** | Planiranje i validacija | [Preflight provjere](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Izbor SKU](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 h | ⭐⭐ |
| **[Pog 7: Otklanjanje poteškoća](docs/chapter-07-troubleshooting/README.md)** | Debug & popravak | [Česti problemi](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [Problemi s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 h | ⭐⭐ |
| **[Pog 8: Produkcija](docs/chapter-08-production/README.md)** | Enterprise obrasci | [Prakse produkcijskog AI](docs/chapter-08-production/production-ai-practices.md) | 2-3 h | ⭐⭐⭐⭐ |
| **[🎓 Radionica](workshop/README.md)** | Praktična laboratorija | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Izbor](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Analiza](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Zatvaranje infrastrukture](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključak](workshop/docs/instructions/7-Wrap-up.md) | 3-4 h | ⭐⭐ |

**Ukupno trajanje tečaja:** ~10-14 sati | **Napredak u vještinama:** Početnik → Spreman za produkciju

---

## 📚 Poglavlja za učenje

*Odaberite svoj put učenja prema razini iskustva i ciljevima*

### 🚀 Poglavlje 1: Osnove i brzi početak  
**Preduvjeti**: Azure pretplata, osnovno poznavanje komandne linije  
**Trajanje**: 30-45 minuta  
**Kompleksnost**: ⭐

#### Što ćete naučiti  
- Razumijevanje osnova Azure Developer CLI  
- Instalacija AZD-a na vašoj platformi  
- Vaša prva uspješna implementacija

#### Resursi za učenje  
- **🎯 Početak ovdje**: [Što je Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Teorija**: [AZD osnove](docs/chapter-01-foundation/azd-basics.md) - osnovni koncepti i terminologija  
- **⚙️ Postavljanje**: [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md) - vodiči za platformu  
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - korak po korak tutorijal  
- **📋 Brzi vodič**: [Kratka komanda](resources/cheat-sheet.md)

#### Praktične vježbe  
```bash
# Brza provjera instalacije
azd version

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Ishod poglavlja**: Uspješno implementirati jednostavnu web aplikaciju na Azure koristeći AZD

**✅ Potvrda uspjeha:**  
```bash
# Nakon završetka Poglavlja 1, trebali biste biti u mogućnosti:
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                  # Postavlja na Azure
azd show                # Prikazuje URL pokrenute aplikacije
# Aplikacija se otvara u pregledniku i radi
azd down --force --purge  # Čisti resurse
```
  
**📊 Vrijeme ulaganja:** 30-45 minuta  
**📈 Razina vještine nakon:** Samostalna implementacija osnovnih aplikacija  

---

### 🤖 Poglavlje 2: AI-prvi razvoj (Preporučeno za AI developere)  
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 1-2 sata  
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti  
- Microsoft Foundry integracija s AZD-om  
- Implementacija AI-pokretanih aplikacija  
- Razumijevanje konfiguracije AI servisa

#### Resursi za učenje  
- **🎯 Početak ovdje**: [Microsoft Foundry integracija](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI agenti**: [Vodič za AI agente](docs/chapter-02-ai-development/agents.md) - implementacija inteligentnih agenata s AZD-om  
- **📖 Obrasci**: [Implementacija AI modela](docs/chapter-02-ai-development/ai-model-deployment.md) - implementacija i upravljanje AI modelima  
- **🛠️ Radionica**: [AI Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) - pripremite AI rješenja za AZD  
- **🎥 Interaktivni vodič**: [Materijali za radionicu](workshop/README.md) - učenje u pregledniku s MkDocs * DevContainer okruženje  
- **📋 Predlošci**: [Predlošci Microsoft Foundry](#resursi-radionice)  
- **📝 Primjeri**: [AZD primjeri implementacija](examples/README.md)

#### Praktične vježbe  
```bash
# Objavite svoju prvu AI aplikaciju
azd init --template azure-search-openai-demo
azd up

# Isprobajte dodatne AI predloške
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Ishod poglavlja**: Implementirati i konfigurirati AI-pokretan chat aplikaciju s RAG mogućnostima

**✅ Potvrda uspjeha:**  
```bash
# Nakon Poglavlja 2, trebali biste moći:
azd init --template azure-search-openai-demo
azd up
# Testirati AI chat sučelje
# Postavljati pitanja i dobivati odgovore s AI-jem uz izvore
# Provjeriti radi li integracija pretraživanja
azd monitor  # Provjeriti prikazuje li Application Insights telemetriju
azd down --force --purge
```
  
**📊 Vrijeme ulaganja:** 1-2 sati  
**📈 Razina vještine nakon:** Mogućnost implementacije i konfiguracije produkcijski spremnih AI aplikacija  
**💰 Svijest o troškovima:** Razumijevanje troškova razvoja od $80-150/mjesečno, produkcijskih troškova od $300-3500/mjesečno

#### 💰 Razmatranje troškova AI implementacija

**Razvojno okruženje (procjena $80-150/mjesečno):**  
- Microsoft Foundry modeli (plaćanje po potrošnji): $0-50/mjesečno (ovisno o korištenju tokena)  
- AI Search (osnovni nivo): $75/mjesečno  
- Container Apps (potrošnja): $0-20/mjesečno  
- Spremište (standard): $1-5/mjesečno  

**Produkcijsko okruženje (procjena $300-3,500+/mjesečno):**  
- Microsoft Foundry modeli (PTU za dosljedne performanse): $3,000+/mjesečno ILI plaćanje po potrošnji pri velikom volumenu  
- AI Search (standardni nivo): $250/mjesečno  
- Container Apps (posvećeni): $50-100/mjesečno  
- Application Insights: $5-50/mjesečno  
- Spremište (premium): $10-50/mjesečno

**💡 Savjeti za optimizaciju troškova:**  
- Koristite **besplatan nivo** Microsoft Foundry modela za učenje (uključeno 50,000 tokena mjesečno za Azure OpenAI)  
- Pokrenite `azd down` kako biste oslobodili resurse kad ne razvijate aktivno  
- Počnite s naplatom prema potrošnji, PTU nadogradite samo za produkciju  
- Koristite `azd provision --preview` za procjenu troškova prije implementacije  
- Omogućite automatsko skaliranje: plaćate samo za stvarnu upotrebu

**Praćenje troškova:**  
```bash
# Provjerite procijenjene mjesečne troškove
azd provision --preview

# Pratite stvarne troškove u Azure Portalu
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Poglavlje 3: Konfiguracija i autentikacija  
**Preduvjeti**: Završeno Poglavlje 1  
**Trajanje**: 45-60 minuta  
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti  
- Konfiguracija i upravljanje okruženjima  
- Najbolje prakse za autentikaciju i sigurnost  
- Imenovanje i organizacija resursa

#### Resursi za učenje  
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/chapter-03-configuration/configuration.md) - postavljanje okruženja  
- **🔐 Sigurnost**: [Obrasci za autentikaciju i managed identity](docs/chapter-03-configuration/authsecurity.md)  
- **📝 Primjeri**: [Primjer baze podataka](examples/database-app/README.md) - AZD primjeri za baze podataka

#### Praktične vježbe  
- Konfigurirati više okruženja (razvoj, testiranje, produkcija)  
- Postaviti autentikaciju s managed identity  
- Primijeniti konfiguracije specifične za okruženje

**💡 Ishod poglavlja**: Upravljati višestrukim okruženjima sa pravilnom autentikacijom i sigurnošću

---

### 🏗️ Poglavlje 4: Infrastruktur kao kod i implementacija  
**Preduvjeti**: Završena Poglavlja 1-3  
**Trajanje**: 1-1.5 sati  
**Kompleksnost**: ⭐⭐⭐

#### Što ćete naučiti  
- Napredni obrasci implementacije  
- Infrastruktur kao kod koristeći Bicep  
- Strategije za provisioniranje resursa

#### Resursi za učenje  
- **📖 Implementacija**: [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) - kompletni tijekovi rada  
- **🏗️ Provisioning**: [Provisioning resursa](docs/chapter-04-infrastructure/provisioning.md) - upravljanje Azure resursima  
- **📝 Primjeri**: [Primjer Container App](../../examples/container-app) - implementacije u kontejnerima

#### Praktične vježbe  
- Kreirati vlastite Bicep predloške  
- Postaviti višeservisne aplikacije  
- Implementirati strategije blue-green implementacije

**💡 Ishod poglavlja**: Implementirati složene višeservisne aplikacije koristeći prilagođene infrastrukturne predloške

---
### 🎯 Poglavlje 5: Rješenja za višestruke AI agente (Napredno)
**Preduvjeti**: završena poglavlja 1-2  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Obrasci arhitekture za višestruke agente
- Orkestracija i koordinacija agenata
- Implementacije AI spremne za produkciju

#### Izvori za učenje
- **🤖 Istaknuti projekt**: [Rješenje za maloprodaju s više agenata](examples/retail-scenario.md) - Kompletna implementacija
- **🛠️ ARM predlošci**: [Paket ARM predložaka](../../examples/retail-multiagent-arm-template) - Jednim klikom implementacija
- **📖 Arhitektura**: [Obrasci koordinacije višestrukih agenata](docs/chapter-06-pre-deployment/coordination-patterns.md) - Obrasci

#### Praktične vježbe
```bash
# Implementirajte potpuno maloprodajno višekorisničko rješenje
cd examples/retail-multiagent-arm-template
./deploy.sh

# Istražite konfiguracije agenata
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Ishod poglavlja**: Implementirati i upravljati proizvodnim rješenjem za više agenata s agentima za kupce i inventar

---

### 🔍 Poglavlje 6: Validacija i planiranje prije implementacije
**Preduvjeti**: završeno poglavlje 4  
**Trajanje**: 1 sat  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Planiranje kapaciteta i validacija resursa
- Strategije odabira SKU-a
- Provjere prije implementacije i automatizacija

#### Izvori za učenje
- **📊 Planiranje**: [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) - Validacija resursa
- **💰 Odabir**: [Odabir SKU-a](docs/chapter-06-pre-deployment/sku-selection.md) - Isplative opcije
- **✅ Validacija**: [Provjere prije implementacije](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatizirani skripti

#### Praktične vježbe
- Pokrenite skripte za validaciju kapaciteta
- Optimizirajte odabire SKU-a za troškove
- Implementirajte automatizirane pre-implementacijske provjere

**💡 Ishod poglavlja**: Validirati i optimizirati implementacije prije izvršenja

---

### 🚨 Poglavlje 7: Otklanjanje poteškoća i otklanjanje pogrešaka
**Preduvjeti**: završeno bilo koje poglavlje o implementaciji  
**Trajanje**: 1-1,5 sati  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sistematski pristupi otklanjanju pogrešaka
- Uobičajeni problemi i rješenja
- Otklanjanje poteškoća specifičnih za AI

#### Izvori za učenje
- **🔧 Uobičajeni problemi**: [Uobičajeni problemi](docs/chapter-07-troubleshooting/common-issues.md) - Često postavljana pitanja i rješenja
- **🕵️ Otklanjanje pogrešaka**: [Vodič za otklanjanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak po korak
- **🤖 AI problemi**: [Otklanjanje poteškoća AI servisa](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi AI servisa

#### Praktične vježbe
- Dijagnosticirajte neuspjehe implementacije
- Riješite probleme s autentifikacijom
- Otklonite pogreške u povezivanju AI servisa

**💡 Ishod poglavlja**: Samostalno dijagnosticirati i riješiti uobičajene probleme implementacije

---

### 🏢 Poglavlje 8: Obrasci za produkciju i poduzeća
**Preduvjeti**: završena poglavlja 1-4  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije implementacije u produkciji
- Sigurnosni obrasci za poduzeća
- Nadzor i optimizacija troškova

#### Izvori za učenje
- **🏭 Produkcija**: [Najbolje prakse AI u produkciji](docs/chapter-08-production/production-ai-practices.md) - Obrasci za poduzeća
- **📝 Primjeri**: [Primjer mikrousloga](../../examples/microservices) - Složene arhitekture
- **📊 Nadzor**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Nadzor

#### Praktične vježbe
- Implementirajte sigurnosne obrasce za poduzeća
- Postavite sveobuhvatan nadzor
- Implementirajte u produkciju s odgovarajućim upravljanjem

**💡 Ishod poglavlja**: Implementirati aplikacije spremne za poduzeća s punim produkcijskim sposobnostima

---

## 🎓 Pregled radionice: Interaktivno iskustvo učenja

> **⚠️ STATUS RADIONICE: Aktivni razvoj**  
> Materijali radionice trenutno se razvijaju i usavršavaju. Osnovni moduli su funkcionalni, no neki napredni dijelovi su nepotpuni. Intenzivno radimo na dovršetku cjelokupnog sadržaja. [Pratite napredak →](workshop/README.md)

### Interaktivni materijali radionice
**Sveobuhvatno praktično učenje s alatima u pregledniku i vođenim vježbama**

Materijali radionice pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje gore navedene lekcije po poglavljima. Radionica je dizajnirana za samostalno učenje i vođene sesije instruktorom.

#### 🛠️ Značajke radionice
- **Sučelje u pregledniku**: Kompletna radionica temeljena na MkDocs s pretraživanjem, kopiranjem i tematskim opcijama
- **Integracija GitHub Codespaces**: Jednim klikom uspostavljanje razvojnog okruženja
- **Strukturirani put učenja**: 8 modula s vođenim vježbama (ukupno 3-4 sata)
- **Postepena metodologija**: Uvod → Odabir → Validacija → Razlaganje → Konfiguracija → Prilagodba → Čišćenje → Zaključak
- **Interaktivno DevContainer okruženje**: Prekonfigurirani alati i ovisnosti

#### 📚 Struktura modula radionice
Radionica prati **8-modulnu progresivnu metodologiju** koja vas vodi od otkrivanja do majstorstva implementacije:

| Modul | Tema | Što ćete raditi | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled radionice | Razumjeti ciljeve učenja, preduvjete i strukturu radionice | 15 min |
| **1. Odabir** | Otkrivanje predložaka | Istražiti AZD predloške i odabrati pravi AI predložak za svoj scenarij | 20 min |
| **2. Validacija** | Implementacija i provjera | Implementirati predložak s `azd up` i provjeriti funkcioniranje infrastrukture | 30 min |
| **3. Razlaganje** | Razumjeti strukturu | Koristiti GitHub Copilot za istraživanje arhitekture predloška, Bicep datoteka i organizaciju koda | 30 min |
| **4. Konfiguracija** | Detaljna analiza azure.yaml | Ovladati konfiguracijom `azure.yaml`, lifecycle hooks i varijablama okruženja | 30 min |
| **5. Prilagodba** | Prilagodite sebi | Omogućiti AI pretraživanje, praćenje, evaluaciju i prilagoditi scenarij | 45 min |
| **6. Čišćenje** | Uklanjanje | Sigurno ukloniti resurse s `azd down --purge` | 15 min |
| **7. Zaključak** | Sljedeći koraci | Pregledati postignuća, ključne pojmove i nastaviti put učenja | 15 min |

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
# Opcija 1: GitHub Codespaces (Preporučeno)
# Kliknite "Code" → "Create codespace on main" u spremištu

# Opcija 2: Lokalni razvoj
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Slijedite upute za postavljanje u workshop/README.md
```
  
#### 🎯 Ishodi učenja radionice  
Završetkom radionice, sudionici će:  
- **Implementirati produkcijske AI aplikacije**: Koristiti AZD s Microsoft Foundry servisima  
- **Ovladati arhitekturama za više agenata**: Implementirati koordinirane AI agentske solucije  
- **Primijeniti vrhunske sigurnosne prakse**: Konfigurirati autentifikaciju i kontrolu pristupa  
- **Optimizirati za skalabilnost**: Dizajnirati isplative i učinkovite implementacije  
- **Otklanjati poteškoće implementacije**: Samostalno rješavati uobičajene probleme  

#### 📖 Resursi radionice  
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Okruženje za učenje u pregledniku  
- **📋 Upute modul po modul**:  
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled i ciljevi radionice  
  - [1. Odabir](workshop/docs/instructions/1-Select-AI-Template.md) - Pronađi i odaberi AI predloške  
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementacija i provjera predložaka  
  - [3. Razlaganje](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Istraži arhitekturu predloška  
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Ovladavanje azure.yaml  
  - [5. Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodi za svoj scenarij  
  - [6. Čišćenje](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Čišćenje resursa  
  - [7. Zaključak](workshop/docs/instructions/7-Wrap-up.md) - Pregled i sljedeći koraci  
- **🛠️ AI Laboratorij Radionice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Vježbe usmjerene na AI  
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#quick-start) - Konfiguracija okruženja  

**Savršeno za**: korporativnu edukaciju, sveučilišne tečajeve, samostalno učenje i developerske bootcampove.

---

## 📖 Detaljan pregled: AZD mogućnosti

Osim osnovnog, AZD nudi moćne značajke za produkcijske implementacije:

- **Implementacije temeljene na predlošcima** - Koristi unaprijed izrađene predloške za uobičajene aplikacije  
- **Infrastruktura kao kod** - Upravljanje Azure resursima koristeći Bicep ili Terraform  
- **Integrirani radni tokovi** - Besprijekorno provisioning, implementacija i nadzor aplikacija  
- **Prijateljsko za developere** - Optimizirano za produktivnost i iskustvo developera

### **AZD + Microsoft Foundry: Savršeno za AI implementacije**

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se susreću AI developeri:

- **Predlošci spremni za AI** - Prekonfigurirani predlošci za Microsoft Foundry modele, Azure AI servise i ML radna opterećenja  
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI servise, API ključeve i krajnje točke modela  
- **Produkcijski AI obrasci** - Najbolje prakse za skalabilne, isplative implementacije AI aplikacija  
- **End-to-end AI radni tokovi** - Od razvoja modela do produkcijske implementacije s pravim nadzorom  
- **Optimizacija troškova** - Pametno dodjeljivanje resursa i strategije skaliranja za AI radna opterećenja  
- **Integracija Microsoft Foundry** - Besprijekorna povezanost s katalogom modela i krajnjim točkama Microsoft Foundry

---

## 🎯 Knjižnica predložaka i primjera

### Istaknuto: Microsoft Foundry predlošci
**Počnite ovdje ako implementirate AI aplikacije!**

> **Napomena:** Ovi predlošci demonstriraju različite AI obrasce. Neki su vanjski Azure primjeri, drugi su lokalne implementacije.

| Predložak | Poglavlje | složenost | Servisi | Vrsta |
|----------|---------|------------|----------|------|
| [**Get started with AI chat**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Get started with AI agents**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Vanjski |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Vanjski |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Vanjski |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Vanjski |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Vanjski |
| [**Retail Multi-Agent Solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Istaknuto: Kompletni scenariji za učenje
**Predlošci aplikacija spremni za produkciju povezani s poglavljima za učenje**

| Predložak | Poglavlje za učenje | složenost | Ključna lekcija |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni obrasci AI implementacije |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | Implementacija RAG-a s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavlje 4 | ⭐⭐ | Integracija za inteligenciju dokumenata |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Framework agenata i pozivanje funkcija |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Orkestracija AI za poduzeća |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Arhitektura više agenata s agentima za kupce i inventar |

### Učenje kroz primjere po tipu

> **📌 Lokalni nasuprot vanjskim primjerima:**  
> **Lokalni primjeri** (u ovom repozitoriju) = odmah spremni za korištenje  
> **Vanjski primjeri** (Azure primjeri) = kloniranje s povezanih repozitorija

#### Lokalni primjeri (spremni za korištenje)
- [**Retail Multi-Agent Solution**](examples/retail-scenario.md) - Kompletna produkcijska implementacija s ARM predlošcima  
  - Arhitektura više agenata (Kupac + Inventar)  
  - Sveobuhvatan nadzor i evaluacija  
  - Jednim klikom implementacija putem ARM predloška

#### Lokalni primjeri - aplikacije u kontejnerima (Poglavlja 2-5)  
**Sveobuhvatni primjeri implementacije kontejnera u ovom repozitoriju:**
- [**Primjeri aplikacija u kontejneru**](examples/container-app/README.md) - Cjeloviti vodič za implementacije u kontejnerima
  - [Jednostavni Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s automatskim smanjenjem na nulu
  - [Mikroservisna arhitektura](../../examples/container-app/microservices) - Pripremljena produkcijska implementacija s više servisa
  - Brzi početak, produkcija i napredni obrasci implementacije
  - Smjernice za nadzor, sigurnost i optimizaciju troškova

#### Vanjski primjeri - Jednostavne aplikacije (poglavlja 1-2)
**Klonirajte ove Azure Samples repozitorije za početak:**
- [Jednostavna web aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni obrasci implementacije
- [Statistička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementacija statičkog sadržaja
- [Aplikacija u kontejneru - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementacija REST API-ja

#### Vanjski primjeri - Integracija baze podataka (poglavlja 3-4)  
- [Aplikacija s bazom podataka - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Obrasci povezivanja s bazom podataka
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverless tijek podataka

#### Vanjski primjeri - Napredni obrasci (poglavlja 4-8)
- [Java mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture s više servisa
- [Poslovi u aplikacijama kontejnera](https://github.com/Azure-Samples/container-apps-jobs) - Obrada u pozadini  
- [Poduzećni ML pipeline](https://github.com/Azure-Samples/mlops-v2) - Produkcijski pripremljeni ML obrasci

### Vanjske kolekcije predložaka
- [**Službena galerija AZD predložaka**](https://azure.github.io/awesome-azd/) - Kurirana kolekcija službenih i zajedničkih predložaka
- [**Predlošci Azure Developer CLI**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija za Microsoft Learn predloške
- [**Direktorij primjera**](examples/README.md) - Lokalni primjeri učenja s detaljnim objašnjenjima

---

## 📚 Resursi za učenje i reference

### Brzi referenti
- [**Prečac naredbi**](resources/cheat-sheet.md) - Osnovne azd naredbe organizirane po poglavljima
- [**Rječnik**](resources/glossary.md) - Terminologija Azure i azd  
- [**Često postavljana pitanja**](resources/faq.md) - Česta pitanja organizirana po poglavljima učenja
- [**Vodič za učenje**](resources/study-guide.md) - Sveobuhvatne vježbe prakse

### Praktične radionice
- [**AI radionica**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Napravite AZD-implementabilna AI rješenja (2-3 sata)
- [**Interaktivna radionica**](workshop/README.md) - 8-modulne vođene vježbe s MkDocs i GitHub Codespaces
  - Slijedi: Uvod → Odabir → Validacija → Razgradnja → Konfiguracija → Prilagodba → Rastavljanje → Završetak

### Vanjski resursi za učenje
- Dokumentacija za Azure Developer CLI
- Centar za arhitekturu Azure
- Kalkulator cijena Azure
- Status Azure

### Vještine AI agenta za vaš uređivač
- [**Microsoft Azure vještine na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorenih vještina agenta za Azure AI, Foundry, implementaciju, dijagnostiku, optimizaciju troškova i drugo. Instalirajte ih u GitHub Copilot, Cursor, Claude Code ili bilo koji podržani agent:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Brzi vodič za otklanjanje poteškoća

**Uobičajeni problemi početnika i trenutna rješenja:**

<details>
<summary><strong>❌ "azd: naredba nije pronađena"</strong></summary>

```bash
# Prvo instalirajte AZD
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Provjerite instalaciju
azd version
```
</details>

<details>
<summary><strong>❌ "Nema pronađene pretplate" ili "Pretplata nije postavljena"</strong></summary>

```bash
# Popis dostupnih pretplata
az account list --output table

# Postavi zadanu pretplatu
az account set --subscription "<subscription-id-or-name>"

# Postavi za AZD okruženje
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Provjeri
az account show
```
</details>

<details>
<summary><strong>❌ "Nedovoljna kvota" ili "Kvota premašena"</strong></summary>

```bash
# Isprobajte različitu Azure regiju
azd env set AZURE_LOCATION "westus2"
azd up

# Ili koristite manje SKU-ove u razvoju
# Uredite infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" ne uspijeva na pola puta</strong></summary>

```bash
# Opcija 1: Očistiti i pokušati ponovno
azd down --force --purge
azd up

# Opcija 2: Samo popraviti infrastrukturu
azd provision

# Opcija 3: Provjeriti detaljni status
azd show

# Opcija 4: Provjeriti zapise u Azure Monitoru
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentifikacija nije uspjela" ili "Token je istekao"</strong></summary>

```bash
# Ponovno se autentificirajte za AZD
azd auth logout
azd auth login

# Opcionalno: osvježite i Azure CLI ako pokrećete az naredbe
az logout
az login

# Provjerite autentifikaciju
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs već postoji" ili sukobi u imenima</strong></summary>

```bash
# AZD generira jedinstvena imena, ali ako dođe do sukoba:
azd down --force --purge

# Zatim pokušajte ponovno s novim okruženjem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implementacija predloška traje predugo</strong></summary>

**Uobičajena vremena čekanja:**
- Jednostavna web aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (provisioniranje OpenAI usluge je sporo)

```bash
# Provjeri napredak
azd show

# Ako je zapelo >30 minuta, provjeri Azure Portal:
azd monitor --overview
# Potraži neuspjele implementacije
```
</details>

<details>
<summary><strong>❌ "Dozvola odbijena" ili "Zabranjeno"</strong></summary>

```bash
# Provjerite svoju Azure ulogu
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Potrebna vam je najmanje uloga "Contributor"
# Zamolite svog Azure administratora da dodijeli:
# - Contributor (za resurse)
# - User Access Administrator (za dodjelu uloga)
```
</details>

<details>
<summary><strong>❌ Ne mogu pronaći URL implementirane aplikacije</strong></summary>

```bash
# Prikaži sve krajnje točke usluge
azd show

# Ili otvorite Azure portal
azd monitor

# Provjerite određenu uslugu
azd env get-values
# Potražite varijable *_URL
```
</details>

### 📚 Cjeloviti resursi za otklanjanje poteškoća

- **Vodič za uobičajene probleme:** [Detaljna rješenja](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi specifični za AI:** [Otklanjanje problema s AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodič za otklanjanje pogrešaka:** [Korak-po-korak otklanjanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md)
- **Potražite pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Završetak tečaja i certifikacija

### Praćenje napretka
Pratite svoj napredak učenja kroz svako poglavlje:

- [ ] **Poglavlje 1**: Osnove i brzi početak ✅
- [ ] **Poglavlje 2**: AI-prvi razvoj ✅  
- [ ] **Poglavlje 3**: Konfiguracija i autentifikacija ✅
- [ ] **Poglavlje 4**: Infrastruktura kao kod i implementacija ✅
- [ ] **Poglavlje 5**: AI rješenja s više agenata ✅
- [ ] **Poglavlje 6**: Validacija i planiranje prije implementacije ✅
- [ ] **Poglavlje 7**: Otklanjanje problema i otklanjanje pogrešaka ✅
- [ ] **Poglavlje 8**: Produkcijski i poduzećni obrasci ✅

### Verifikacija učenja
Nakon dovršetka svakog poglavlja, provjerite znanje:
1. **Praktična vježba**: Završite praktičnu implementaciju tog poglavlja
2. **Provjera znanja**: Pregledajte sekciju FAQ za svoje poglavlje
3. **Zajednički razgovor**: Podijelite svoja iskustva na Azure Discordu
4. **Sljedeće poglavlje**: Prijeđite na sljedeću razinu složenosti

### Prednosti završetka tečaja
Nakon završetka svih poglavlja, imat ćete:
- **Iskustvo u produkciji**: Implementirane stvarne AI aplikacije u Azure
- **Profesionalne vještine**: Kapacitete za produkcijsku implementaciju  
- **Prepoznavanje zajednice**: Aktivno članstvo u zajednici Azure developera
- **Napredak u karijeri**: Tražene stručnosti za AZD i AI implementaciju

---

## 🤝 Zajednica i podrška

### Dobijte pomoć i podršku
- **Tehnički problemi**: [Prijavite greške i zatražite značajke](https://github.com/microsoft/azd-for-beginners/issues)
- **Pitanja učenja**: [Microsoft Azure Discord zajednica](https://discord.gg/microsoft-azure) i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoć vezana za AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Uvidi zajednice iz Microsoft Foundry Discorda

**Nedavni rezultati ankete s kanala #Azure:**
- **45%** developera želi koristiti AZD za AI radne zadatke
- **Glavni izazovi**: Implementacije s više servisa, upravljanje vjerodajnicama, spremnost za produkciju  
- **Najtraženije**: Predlošci specifični za AI, vodiči za otklanjanje problema, najbolje prakse

**Pridružite se našoj zajednici da:**
- Podijelite svoja AZD + AI iskustva i dobijete pomoć
- Pristupite ranim verzijama novih AI predložaka
- Doprinosete najboljim praksama za AI implementaciju
- Utječete na budući razvoj AI + AZD značajki

### Doprinos tečaju
Dobrodošli su svi doprinosi! Pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:
- **Poboljšanjima sadržaja**: Unaprijedite postojeća poglavlja i primjere
- **Novim primjerima**: Dodajte primjere iz stvarnog svijeta i predloške  
- **Prijevodu**: Pomozite održavati podršku za više jezika
- **Prijavama grešaka**: Poboljšajte točnost i jasnoću
- **Standardima zajednice**: Slijedite naše inkluzivne smjernice zajednice

---

## 📄 Informacije o tečaju

### Licenca
Ovaj projekt je licenciran pod MIT licencom - pogledajte datoteku [LICENSE](../../LICENSE) za detalje.

### Povezani Microsoft Learning resursi

Naš tim proizvodi i druge cjelovite obrazovne tečajeve:

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
 
### Serija generativnog AI
[![Generativni AI za početnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generative AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno učenje
[![ML for Beginners](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serija Copilot
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija tečajem

**🚀 Spremni za početak učenja?**

**Početnici**: Počnite s [Poglavlje 1: Osnove i brz početak](#-chapter-1-foundation--quick-start)  
**AI programeri**: Prijeđite na [Poglavlje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Iskusni programeri**: Počnite s [Poglavlje 3: Konfiguracija i autentifikacija](#️-chapter-3-configuration--authentication)

**Sljedeći koraci**: [Započni Poglavlje 1 - Osnove AZD-a](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->