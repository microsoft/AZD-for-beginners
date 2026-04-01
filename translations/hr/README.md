# AZD za početnike: Strukturirano putovanje učenjem

![AZD-for-beginners](../../translated_images/hr/azdbeginners.5527441dd9f74068.webp) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/nkVh3dp)](https://discord.com/invite/nkVh3dp)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automatski prijevodi (Uvijek ažurirani)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabic](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgarian](../bg/README.md) | [Burmese (Myanmar)](../my/README.md) | [Chinese (Simplified)](../zh-CN/README.md) | [Chinese (Traditional, Hong Kong)](../zh-HK/README.md) | [Chinese (Traditional, Macau)](../zh-MO/README.md) | [Chinese (Traditional, Taiwan)](../zh-TW/README.md) | [Croatian](./README.md) | [Czech](../cs/README.md) | [Danish](../da/README.md) | [Dutch](../nl/README.md) | [Estonian](../et/README.md) | [Finnish](../fi/README.md) | [French](../fr/README.md) | [German](../de/README.md) | [Greek](../el/README.md) | [Hebrew](../he/README.md) | [Hindi](../hi/README.md) | [Hungarian](../hu/README.md) | [Indonesian](../id/README.md) | [Italian](../it/README.md) | [Japanese](../ja/README.md) | [Kannada](../kn/README.md) | [Khmer](../km/README.md) | [Korean](../ko/README.md) | [Lithuanian](../lt/README.md) | [Malay](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norwegian](../no/README.md) | [Persian (Farsi)](../fa/README.md) | [Polish](../pl/README.md) | [Portuguese (Brazil)](../pt-BR/README.md) | [Portuguese (Portugal)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romanian](../ro/README.md) | [Russian](../ru/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Slovak](../sk/README.md) | [Slovenian](../sl/README.md) | [Spanish](../es/README.md) | [Swahili](../sw/README.md) | [Swedish](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamil](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkish](../tr/README.md) | [Ukrainian](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnamese](../vi/README.md)

> **Preferirate lokalno kloniranje?**
>
> Ovaj repozitorij uključuje prevode na preko 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
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
> Time dobivate sve što vam treba za dovršetak tečaja s puno bržim preuzimanjem.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🆕 Što je novo u azd danas

Azure Developer CLI je narasla izvan tradicionalnih web aplikacija i API-ja. Danas je azd jedinstveni alat za implementaciju **bilo koje** aplikacije u Azure—uključujući AI-pokretane aplikacije i inteligentne agente.

Evo što to znači za vas:

- **AI agenti su sada primarni radni zadaci azd-a.** Možete inicijalizirati, implementirati i upravljati AI agent projektima koristeći isti tijek rada `azd init` → `azd up` koji već poznajete.
- **Integracija s Microsoft Foundry** donosi implementaciju modela, hostiranje agenata i konfiguraciju AI servisa izravno u azd ekosustav predložaka.
- **Osnovni tijek rada nije promijenjen.** Bilo da implementirate todo aplikaciju, mikrouslugu ili višestruku AI agent rješenje, naredbe su iste.

Ako ste prije koristili azd, podrška za AI je prirodan nastavak—a ne zaseban alat ili napredni tečaj. Ako počinjete iznova, naučit ćete jedan tijek rada koji radi za sve.

---

## 🚀 Što je Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** je komandni alat prilagođen programerima koji olakšava implementaciju aplikacija u Azure. Umjesto ručnog stvaranja i povezivanja desetaka Azure resursa, možete implementirati cijele aplikacije s jednom naredbom.

### Čarolija `azd up`

```bash
# Ova jedina naredba radi sve:
# ✅ Stvara sve Azure resurse
# ✅ Konfigurira mrežu i sigurnost
# ✅ Gradi kod vaše aplikacije
# ✅ Raspoređuje na Azure
# ✅ Daje vam radni URL
azd up
```

**To je to!** Nema klikanja po Azure Portalu, nema učenja složenih ARM predložaka, nema ručne konfiguracije - samo funkcionalne aplikacije na Azureu.

---

## ❓ Azure Developer CLI vs Azure CLI: Koja je razlika?

Ovo je najčešće pitanje koje početnici postavljaju. Evo jednostavnog odgovora:

| Značajka | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Svrha** | Upravljanje pojedinačnim Azure resursima | Implementacija kompletnih aplikacija |
| **Način razmišljanja** | Fokus na infrastrukturi | Fokus na aplikaciji |
| **Primjer** | `az webapp create --name myapp...` | `azd up` |
| **Krivulja učenja** | Mora poznavati Azure servise | Samo poznajte svoju aplikaciju |
| **Najbolje za** | DevOps, Infrastruktura | Programeri, Prototipiranje |

### Jednostavna analogija

- **Azure CLI** je kao imati sve alate za izgradnju kuće - čekiće, pile, čavle. Možete izgraditi bilo što, ali morate znati graditeljstvo.
- **Azure Developer CLI** je kao unajmiti izvođača radova - opišete što želite i on se brine o izgradnji.

### Kada koristiti koji alat

| Scenarij | Koristite ovaj alat |
|----------|---------------------|
| "Želim brzo implementirati svoju web aplikaciju" | `azd up` |
| "Trebam samo stvoriti račun za pohranu" | `az storage account create` |
| "Gradim kompletnu AI aplikaciju" | `azd init --template azure-search-openai-demo` |
| "Trebam debugirati specifični Azure resurs" | `az resource show` |
| "Želim produkcijsku implementaciju za nekoliko minuta" | `azd up --environment production` |

### Oni rade zajedno!

AZD koristi Azure CLI ispod haube. Možete koristiti oba:
```bash
# Implementirajte svoju aplikaciju pomoću AZD
azd up

# Zatim fino podesite određene resurse pomoću Azure CLI
az webapp config set --name myapp --always-on true
```

---

## 🌟 Pronađite predloške u Awesome AZD

Nemojte počinjati od nule! **Awesome AZD** je zajednički skup spremnih za implementaciju predložaka:

| Resurs | Opis |
|----------|-------------|
| 🔗 [**Awesome AZD Galerija**](https://azure.github.io/awesome-azd/) | Pregledajte 200+ predložaka s implementacijom jednim klikom |
| 🔗 [**Pošaljite predložak**](https://github.com/Azure/awesome-azd/issues) | Doprinesite vlastitim predloškom zajednici |
| 🔗 [**GitHub Repozitorij**](https://github.com/Azure/awesome-azd) | Zapratite i istražite izvor |

### Popularni AI predlošci iz Awesome AZD

```bash
# RAG chat s Microsoft Foundry modelima + AI pretraživanje
azd init --template azure-search-openai-demo

# Brza aplikacija za AI chat
azd init --template openai-chat-app-quickstart

# AI agenti s Foundry agentima
azd init --template get-started-with-ai-agents
```

---

## 🎯 Početak u 3 koraka

Prije nego što počnete, provjerite je li vaše računalo spremno za predložak koji želite implementirati:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Ako bilo koja potrebna provjera ne uspije, najprije ispravite problem, a zatim nastavite s brzim startom.

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
# Opcionalno ako planirate izravno koristiti Azure CLI naredbe u ovom tečaju
az login

# Potreban za AZD tokove rada
azd auth login
```

Ako niste sigurni koji vam je potreban, pratite cijeli tijek postavljanja u [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md#authentication-setup).

### Korak 3: Implementirajte svoju prvu aplikaciju

```bash
# Inicijalizirajte iz predloška
azd init --template todo-nodejs-mongo

# Postavi na Azure (stvara sve!)
azd up
```

**🎉 To je to!** Vaša je aplikacija sada uživo na Azureu.

### Čišćenje (Nemojte zaboraviti!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Kako koristiti ovaj tečaj

Ovaj tečaj je dizajniran za **postupno učenje** - počnite gdje vam je najugodnije i napredujte korak po korak:

| Vaše iskustvo | Počnite ovdje |
|-----------------|------------|
| **Potpuni početnik s Azureom** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Poznajete Azure, novi ste u AZD-u** | [Poglavlje 1: Osnove](#-chapter-1-foundation--quick-start) |
| **Želite implementirati AI aplikacije** | [Poglavlje 2: AI-prvo razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers) |
| **Želite praktičnu radionicu** | [🎓 Interaktivna radionica](workshop/README.md) - 3-4 sata vođenog laboratorija |
| **Trebate produkcijske obrasce** | [Poglavlje 8: Produkcija i poduzeće](#-chapter-8-production--enterprise-patterns) |

### Brzo postavljanje

1. **Forkajte ovaj repozitorij**: [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte ga**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Potražite pomoć**: [Azure Discord zajednica](https://discord.com/invite/ByRwuEEgH4)

> **Preferirate lokalno kloniranje?**

> Ovaj repozitorij uključuje prevode na preko 50 jezika što značajno povećava veličinu preuzimanja. Za kloniranje bez prijevoda, koristite sparse checkout:
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Time dobivate sve što vam treba za dovršetak tečaja s puno bržim preuzimanjem.


## Pregled tečaja

Ovladavajte Azure Developer CLI (azd) kroz strukturirana poglavlja dizajnirana za postupno učenje. **Poseban fokus na implementaciju AI aplikacija s Microsoft Foundry integracijom.**

### Zašto je ovaj tečaj bitan za moderne programere

Prema uvidima Microsoft Foundry Discord zajednice, **45% programera želi koristiti AZD za AI radne zadatke** ali nailaze na izazove:

- Složene AI arhitekture s više servisa  
- Najbolje prakse implementacije AI u produkciju  
- Integracija i konfiguracija Azure AI servisa  
- Optimizacija troškova AI radnih zadataka  
- Rješavanje problema specifičnih za AI implementaciju

### Ciljevi učenja

Završetkom ovog strukturiranog tečaja, naučit ćete:

- **Ovladati osnovama AZD-a**: osnovni koncepti, instalacija i konfiguracija  
- **Implementirati AI aplikacije**: koristiti AZD s Microsoft Foundry servisima  
- **Implementirati infrastrukturu kao kod**: upravljati Azure resursima pomoću Bicep predložaka  
- **Otkloniti poteškoće pri implementaciji**: riješiti česte probleme i debugirati  
- **Optimizirati za produkciju**: sigurnost, skaliranje, nadzor i upravljanje troškovima  
- **Izgraditi rješenja s više agenata**: implementirati složene AI arhitekture

## Prije nego što počnete: računi, pristup i pretpostavke

Prije početka poglavlja 1, provjerite imate li sljedeće pripremljeno. Koraci instalacije kasnije u ovom vodiču pretpostavljaju da su ove osnove već riješene.
- **Pretplata na Azure**: Možete koristiti postojeću pretplatu s posla ili vlastiti račun, ili kreirati [besplatno probno razdoblje](https://aka.ms/azurefreetrial) za početak.
- **Dozvola za kreiranje Azure resursa**: Za većinu vježbi trebali biste imati barem **Contributor** pristup na ciljanoj pretplati ili grupi resursa. Neki poglavlja također mogu pretpostaviti da možete kreirati grupe resursa, upravljane identitete i RBAC dodjele.
- [**GitHub račun**](https://github.com): Korisno za raspolaganje repozitorijem, praćenje vlastitih promjena i korištenje GitHub Codespaces za radionicu.
- **Preduvjeti za izvršavanje predložaka**: Neki predlošci zahtijevaju lokalne alate kao što su Node.js, Python, Java ili Docker. Pokrenite validator postava prije početka da pravovremeno uočite nedostatak alata.
- **Osnovno poznavanje terminala**: Ne morate biti stručnjak, ali trebali biste se osjećati ugodno pri izvršavanju naredbi kao što su `git clone`, `azd auth login` i `azd up`.

> **Radite u poslovnoj pretplati?**  
> Ako vaš Azure okoliš upravlja administrator, unaprijed potvrdite da možete postavljati resurse u pretplatu ili grupu resursa koju planirate koristiti. Ako ne, zamolite za sandbox pretplatu ili Contributor pristup prije početka.

> **Novi ste u Azure?**  
> Počnite s vlastitom Azure probnom ili plaćajte prema korištenju na https://aka.ms/azurefreetrial kako biste mogli završiti vježbe do kraja bez čekanja na odobrenja na razini najma.

## 🗺️ Mapa tečaja: Brza navigacija po poglavljima

Svako poglavlje ima namjenski README s ciljevima učenja, brzim početcima i vježbama:

| Poglavlje | Tema | Lekcije | Trajanje | Kompleksnost |
|---------|-------|---------|----------|------------|
| **[Poglavlje 1: Temelj](docs/chapter-01-foundation/README.md)** | Početak | [AZD Osnove](docs/chapter-01-foundation/azd-basics.md) &#124; [Instalacija](docs/chapter-01-foundation/installation.md) &#124; [Prvi projekt](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Poglavlje 2: Razvoj AI-a](docs/chapter-02-ai-development/README.md)** | Aplikacije s fokusom na AI | [Integracija Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI agenti](docs/chapter-02-ai-development/agents.md) &#124; [Postavljanje modela](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 sata | ⭐⭐ |
| **[Poglavlje 3: Konfiguracija](docs/chapter-03-configuration/README.md)** | Autentifikacija i sigurnost | [Konfiguracija](docs/chapter-03-configuration/configuration.md) &#124; [Autentifikacija i sigurnost](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Poglavlje 4: Infrastruktura](docs/chapter-04-infrastructure/README.md)** | IaC i implementacija | [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisioning](docs/chapter-04-infrastructure/provisioning.md) | 1-1.5 sati | ⭐⭐⭐ |
| **[Poglavlje 5: Više agenata](docs/chapter-05-multi-agent/README.md)** | AI agentska rješenja | [Scenarij maloprodaje](examples/retail-scenario.md) &#124; [Koordinacijski obrasci](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[Poglavlje 6: Priprema za implementaciju](docs/chapter-06-pre-deployment/README.md)** | Planiranje i validacija | [Preflight provjere](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [Odabir SKU-a](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [App Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 sat | ⭐⭐ |
| **[Poglavlje 7: Rješavanje problema](docs/chapter-07-troubleshooting/README.md)** | Debugiranje i ispravljanje | [Česti problemi](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Debugging](docs/chapter-07-troubleshooting/debugging.md) &#124; [AI problemi](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1.5 sati | ⭐⭐ |
| **[Poglavlje 8: Produkcija](docs/chapter-08-production/README.md)** | Poslovni obrasci | [Prakse za produkciju](docs/chapter-08-production/production-ai-practices.md) | 2-3 sata | ⭐⭐⭐⭐ |
| **[🎓 Radionica](workshop/README.md)** | Praktični laboratorij | [Uvod](workshop/docs/instructions/0-Introduction.md) &#124; [Odabir](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Dekonstrukcija](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Odbacivanje](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Zaključak](workshop/docs/instructions/7-Wrap-up.md) | 3-4 sata | ⭐⭐ |

**Ukupno trajanje tečaja:** ~10-14 sati | **Razina vještina:** Početnik → Pripremljen za produkciju

---

## 📚 Poglavlja za učenje

*Odaberite svoj put učenja prema razini iskustva i ciljevima*

### 🚀 Poglavlje 1: Temelj i brz početak
**Preduvjeti**: Pretplata na Azure, osnovno znanje komandne linije  
**Trajanje**: 30-45 minuta  
**Kompleksnost**: ⭐

#### Što ćete naučiti  
- Razumjeti osnove Azure Developer CLI-a  
- Instalirati AZD na svom sustavu  
- Vašu prvu uspješnu implementaciju

#### Izvori za učenje  
- **🎯 Početak ovdje**: [Što je Azure Developer CLI?](#what-is-azure-developer-cli)  
- **📖 Teorija**: [AZD Osnove](docs/chapter-01-foundation/azd-basics.md) - Ključni koncepti i terminologija  
- **⚙️ Instalacija**: [Instalacija i postavljanje](docs/chapter-01-foundation/installation.md) - Vodiči za platforme  
- **🛠️ Praktično**: [Vaš prvi projekt](docs/chapter-01-foundation/first-project.md) - Korak po korak tutorijal  
- **📋 Kratki pregled**: [Komandni cheat sheet](resources/cheat-sheet.md)

#### Praktične vježbe  
```bash
# Brza provjera instalacije
azd version

# Postavite svoju prvu aplikaciju
azd init --template todo-nodejs-mongo
azd up
```
  
**💡 Ishod poglavlja**: Uspješno implementirati jednostavnu web aplikaciju na Azure koristeći AZD

**✅ Validacija uspjeha:**  
```bash
# Nakon dovršetka poglavlja 1 trebali biste moći:
azd version              # Prikazuje instaliranu verziju
azd init --template todo-nodejs-mongo  # Inicijalizira projekt
azd up                  # Distribuira na Azure
azd show                # Prikazuje URL pokrenute aplikacije
# Aplikacija se otvara u pregledniku i radi
azd down --force --purge  # Čisti resurse
```
  
**📊 Uloženo vrijeme:** 30-45 minuta  
**📈 Razina vještina nakon:** Mogućnost samostalnog postavljanja osnovnih aplikacija

---

### 🤖 Poglavlje 2: Razvoj fokusiran na AI (Preporučeno za AI developere)  
**Preduvjeti**: Poglavlje 1 završeno  
**Trajanje**: 1-2 sata  
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti  
- Integracija Microsoft Foundry s AZD-om  
- Postavljanje AI-pokretanih aplikacija  
- Razumijevanje konfiguracija AI servisa

#### Izvori za učenje  
- **🎯 Početak ovdje**: [Integracija Microsoft Foundry](docs/chapter-02-ai-development/microsoft-foundry-integration.md)  
- **🤖 AI agenti**: [Vodič za AI agente](docs/chapter-02-ai-development/agents.md) - Postavite inteligentne agente s AZD-om  
- **📖 Obrasci**: [Implementacija AI modela](docs/chapter-02-ai-development/ai-model-deployment.md) - Postavljanje i upravljanje AI modelima  
- **🛠️ Radionica**: [AI radionica](docs/chapter-02-ai-development/ai-workshop-lab.md) - Pripremite AI rješenja za AZD  
- **🎥 Interaktivni vodič**: [Materijali za radionicu](workshop/README.md) - Učenje preko preglednika s MkDocs * DevContainer okruženje  
- **📋 Predlošci**: [Microsoft Foundry predlošci](#resursi-radionice)  
- **📝 Primjeri**: [Primjeri AZD implementacija](examples/README.md)

#### Praktične vježbe  
```bash
# Implementirajte svoju prvu AI aplikaciju
azd init --template azure-search-openai-demo
azd up

# Isprobajte dodatne AI predloške
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```
  
**💡 Ishod poglavlja**: Postaviti i konfigurirati AI-chat aplikaciju s RAG mogućnostima

**✅ Validacija uspjeha:**  
```bash
# Nakon poglavlja 2, trebali biste moći:
azd init --template azure-search-openai-demo
azd up
# Testirati AI chat sučelje
# Postavljati pitanja i dobivati AI-pokretane odgovore sa izvorima
# Provjeriti radi li integracija pretrage
azd monitor  # Provjeriti prikazuje li Application Insights telemetriju
azd down --force --purge
```
  
**📊 Uloženo vrijeme:** 1-2 sata  
**📈 Razina vještina nakon:** Mogućnost postavljanja i konfiguriranja AI aplikacija spremnih za produkciju  
**💰 Svijest o troškovima:** Razumijevanje troškova razvoja od 80-150$/mjesec, troškova produkcije od 300-3500$/mjesec

#### 💰 Troškovi kod AI implementacija

**Razvojno okruženje (procjena 80-150$/mj):**  
- Microsoft Foundry modeli (plaćanje po korištenju): 0-50$/mj (ovisno o korištenju tokena)  
- AI pretraživanje (osnovni sloj): 75$/mj  
- Container Apps (potrošnja): 0-20$/mj  
- Pohrana (standardna): 1-5$/mj

**Produkcijsko okruženje (procjena 300-3.500+$/mj):**  
- Microsoft Foundry modeli (PTU za konzistentne performanse): 3.000+$/mj ILI plaćanje po korištenju s velikim obujmom  
- AI pretraživanje (standardni sloj): 250$/mj  
- Container Apps (dedicirano): 50-100$/mj  
- Application Insights: 5-50$/mj  
- Pohrana (premium): 10-50$/mj

**💡 Savjeti za optimizaciju troškova:**  
- Koristite **besplatni sloj** Microsoft Foundry modela za učenje (uključeno 50.000 tokena/mj s Azure OpenAI)  
- Pokrenite `azd down` za prekid resursa kad ne razvijate aktivno  
- Počnite s potrošnjom po korištenju, PTU koristite samo za produkciju  
- Koristite `azd provision --preview` za procjenu troškova prije implementacije  
- Omogućite automatsko skaliranje: plaćajte samo za stvarnu upotrebu

**Praćenje troškova:**  
```bash
# Provjerite procijenjene mjesečne troškove
azd provision --preview

# Pratite stvarne troškove u Azure portalu
az consumption budget list --resource-group <your-rg>
```
  
---

### ⚙️ Poglavlje 3: Konfiguracija i autentifikacija  
**Preduvjeti**: Poglavlje 1 završeno  
**Trajanje**: 45-60 minuta  
**Kompleksnost**: ⭐⭐

#### Što ćete naučiti  
- Konfiguracija i upravljanje okolinama  
- Najbolje prakse za autentifikaciju i sigurnost  
- Imenovanje i organizacija resursa

#### Izvori za učenje  
- **📖 Konfiguracija**: [Vodič za konfiguraciju](docs/chapter-03-configuration/configuration.md) - Postavljanje okoline  
- **🔐 Sigurnost**: [Obrasci autentifikacije i managed identity](docs/chapter-03-configuration/authsecurity.md) - Obrasci autentifikacije  
- **📝 Primjeri**: [Primjer aplikacije s bazom](examples/database-app/README.md) - Primjeri baze podataka s AZD-om

#### Praktične vježbe  
- Konfigurirati više okolina (razvojna, testna, produkcija)  
- Postaviti autentifikaciju upravljanim identitetom  
- Implementirati konfiguracije specifične za okoliš

**💡 Ishod poglavlja**: Upravljajte višestrukim okolinama s pravom autentifikacijom i sigurnošću

---

### 🏗️ Poglavlje 4: Infrastruktura kao kod i implementacija  
**Preduvjeti**: Poglavlja 1-3 završena  
**Trajanje**: 1-1.5 sati  
**Kompleksnost**: ⭐⭐⭐

#### Što ćete naučiti  
- Napredni obrasci implementacije  
- Infrastruktura kao kod s Bicep-om  
- Strategije za provisioning resursa

#### Izvori za učenje  
- **📖 Implementacija**: [Vodič za implementaciju](docs/chapter-04-infrastructure/deployment-guide.md) - Cjelokupni procesi  
- **🏗️ Provisioning**: [Provisioning resursa](docs/chapter-04-infrastructure/provisioning.md) - Upravljanje Azure resursima  
- **📝 Primjeri**: [Primjer Container aplikacije](../../examples/container-app) - Containerizirane implementacije

#### Praktične vježbe  
- Kreirati prilagođene Bicep predloške  
- Implementirati višeservisne aplikacije  
- Primijeniti strategije plavo-zelene implementacije

**💡 Ishod poglavlja**: Implementirati složene višeservisne aplikacije koristeći prilagođene infrastrukture

---

### 🎯 Poglavlje 5: Više-agentna AI rješenja (Napredno)  
**Preduvjeti**: Poglavlja 1-2 završena  
**Trajanje**: 2-3 sata  
**Kompleksnost**: ⭐⭐⭐⭐

#### Što ćete naučiti  
- Obrasci arhitekture s više agenata  
- Orkestracija i koordinacija agenata  
- Produkcijski spremne AI implementacije

#### Izvori za učenje  
- **🤖 Istaknuti projekt**: [Rješenje s više agenata za maloprodaju](examples/retail-scenario.md) - Kompletna implementacija  
- **🛠️ ARM predlošci**: [Pakiranje ARM predložaka za više agenata](../../examples/retail-multiagent-arm-template) - Implementacija jednim klikom  
- **📖 Arhitektura**: [Koordinacijski obrasci za više agenata](docs/chapter-06-pre-deployment/coordination-patterns.md) - Obrasci

#### Praktične vježbe  
```bash
# Implementirajte kompletno maloprodajno višekwintu rješenje
cd examples/retail-multiagent-arm-template
./deploy.sh

# Istražite konfiguracije agenata
az deployment group show --resource-group <rg-name> --name <deployment-name>
```
  
**💡 Ishod poglavlja**: Implementirati i upravljati produkcijskim rješenjem AI s više agenata s agentima za korisnike i inventar

---

### 🔍 Poglavlje 6: Validacija i planiranje prije implementacije  
**Preduvjeti**: Poglavlje 4 završeno  
**Trajanje**: 1 sat  
**Kompleksnost**: ⭐⭐
#### Što ćete naučiti
- Planiranje kapaciteta i provjera resursa
- Strategije odabira SKU
- Provjere prije pokretanja i automatizacija

#### Resursi za učenje
- **📊 Planiranje**: [Planiranje kapaciteta](docs/chapter-06-pre-deployment/capacity-planning.md) - Validacija resursa
- **💰 Odabir**: [Odabir SKU](docs/chapter-06-pre-deployment/sku-selection.md) - Isplative opcije
- **✅ Validacija**: [Provjere prije pokretanja](docs/chapter-06-pre-deployment/preflight-checks.md) - Automatski skripti

#### Praktične vježbe
- Pokretanje skripti za validaciju kapaciteta
- Optimizacija odabira SKU za trošak
- Implementacija automatiziranih provjera prije implementacije

**💡 Ishod poglavlja**: Validirati i optimizirati implementacije prije izvršenja

---

### 🚨 Poglavlje 7: Otklanjanje poteškoća i ispravljanje pogrešaka
**Preduvjeti**: Bilo koje poglavlje o implementaciji završeno  
**Trajanje**: 1-1,5 sati  
**Složenost**: ⭐⭐

#### Što ćete naučiti
- Sustavni pristupi ispravljanju pogrešaka
- Uobičajeni problemi i rješenja
- Otklanjanje poteškoća specifičnih za AI

#### Resursi za učenje
- **🔧 Uobičajeni problemi**: [Uobičajeni problemi](docs/chapter-07-troubleshooting/common-issues.md) - FAQ i rješenja
- **🕵️ Ispravljanje pogrešaka**: [Vodič za ispravljanje pogrešaka](docs/chapter-07-troubleshooting/debugging.md) - Strategije korak po korak
- **🤖 AI problemi**: [Otklanjanje poteškoća AI](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Problemi AI servisa

#### Praktične vježbe
- Dijagnosticiranje neuspjeha implementacije
- Rješavanje problema s autentifikacijom
- Otklanjanje pogrešaka povezivanja AI servisa

**💡 Ishod poglavlja**: Samostalno dijagnosticirati i riješiti uobičajene probleme implementacije

---

### 🏢 Poglavlje 8: Obrasci za produkciju i poduzeća
**Preduvjeti**: Poglavlja 1-4 završena  
**Trajanje**: 2-3 sata  
**Složenost**: ⭐⭐⭐⭐

#### Što ćete naučiti
- Strategije implementacije u produkciji
- Obrasci sigurnosti za poduzeća
- Praćenje i optimizacija troškova

#### Resursi za učenje
- **🏭 Produkcija**: [Najbolje prakse AI u produkciji](docs/chapter-08-production/production-ai-practices.md) - Obrasci za poduzeća
- **📝 Primjeri**: [Primjer mikroservisa](../../examples/microservices) - Kompleksne arhitekture
- **📊 Praćenje**: [Integracija Application Insights](docs/chapter-06-pre-deployment/application-insights.md) - Praćenje

#### Praktične vježbe
- Implementirati obrasce sigurnosti za poduzeća
- Postaviti opsežno praćenje
- Implementirati u produkciju s odgovarajućim upravljanjem

**💡 Ishod poglavlja**: Implementirati aplikacije spremne za poduzeća s potpunim produkcijskim mogućnostima

---

## 🎓 Pregled radionice: Praktično iskustvo učenja

> **⚠️ STATUS RADIONICE: Aktivni razvoj**  
> Materijali radionice trenutno se razvijaju i usavršavaju. Osnovni moduli su funkcionalni, ali neki napredni dijelovi nisu dovršeni. Aktivno radimo na dovršavanju cjelokupnog sadržaja. [Prati napredak →](workshop/README.md)

### Interaktivni materijali radionice
**Kompletno praktično učenje s alatima u pregledniku i vođenim vježbama**

Naši materijali radionice pružaju strukturirano, interaktivno iskustvo učenja koje nadopunjuje poglavlja iz kurikuluma gore. Radionica je namijenjena za samostalno učenje i vođene sesije.

#### 🛠️ Značajke radionice
- **Sučelje u pregledniku**: Kompletna radionica temeljena na MkDocs-u s pretragom, kopiranjem i temama
- **Integracija GitHub Codespaces**: Jednim klikom postavljanje razvojne okoline
- **Strukturirani put učenja**: 8 modula vođenih vježbi (ukupno 3-4 sata)
- **Postupna metodologija**: Uvod → Odabir → Validacija → Razgradnja → Konfiguracija → Prilagodba → Rastavljanje → Zaključak
- **Interaktivno DevContainer okruženje**: Prekonfigurirani alati i ovisnosti

#### 📚 Struktura modula radionice
Radionica slijedi **8-modulnu progresivnu metodologiju** koja vodi od otkrića do majstorstva implementacije:

| Modul | Tema | Što ćete raditi | Trajanje |
|--------|-------|----------------|----------|
| **0. Uvod** | Pregled radionice | Razumjeti ciljeve učenja, preduvjete i strukturu radionice | 15 min |
| **1. Odabir** | Otkrivanje predložaka | Istražiti AZD predloške i odabrati pravi AI predložak za svoj slučaj | 20 min |
| **2. Validacija** | Implementacija i provjera | Implementirati predložak pomoću `azd up` i potvrditi funkcioniranje infrastrukture | 30 min |
| **3. Razgradnja** | Razumjeti strukturu | Koristiti GitHub Copilot za istraživanje arhitekture predloška, Bicep datoteka i organizacije koda | 30 min |
| **4. Konfiguracija** | duboko u azure.yaml | Savladati konfiguraciju `azure.yaml`, lifecycle hooks i varijable okoline | 30 min |
| **5. Prilagodba** | Prilagoditi sebi | Omogućiti AI pretraživanje, praćenje, evaluaciju i prilagoditi za svoj scenarij | 45 min |
| **6. Rastavljanje** | Očistiti | Sigurno ukloniti resurse s `azd down --purge` | 15 min |
| **7. Zaključak** | Sljedeći koraci | Pregledati postignuća, ključne koncepte i nastaviti učenje | 15 min |

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
Kroz završetak radionice sudionici će:
- **Implementirati AI aplikacije za produkciju**: Koristiti AZD s Microsoft Foundry servisima
- **Ovladati višestrukim AI agent arhitekturama**: Implementirati koordinirane AI agentske rješenja
- **Primijeniti najbolje prakse sigurnosti**: Konfigurirati autentifikaciju i kontrolu pristupa
- **Optimizirati za skaliranje**: Dizajnirati isplative i učinkovite implementacije
- **Otklanjati probleme implementacije**: Samostalno rješavati uobičajene probleme

#### 📖 Resursi radionice
- **🎥 Interaktivni vodič**: [Materijali radionice](workshop/README.md) - Učenje u pregledniku
- **📋 Upute po modulima**:
  - [0. Uvod](workshop/docs/instructions/0-Introduction.md) - Pregled i ciljevi radionice
  - [1. Odabir](workshop/docs/instructions/1-Select-AI-Template.md) - Pronalazak i odabir AI predložaka
  - [2. Validacija](workshop/docs/instructions/2-Validate-AI-Template.md) - Implementacija i provjera predložaka
  - [3. Razgradnja](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Istraživanje arhitekture predloška
  - [4. Konfiguracija](workshop/docs/instructions/4-Configure-AI-Template.md) - Savladavanje azure.yaml
  - [5. Prilagodba](workshop/docs/instructions/5-Customize-AI-Template.md) - Prilagodba za svoj scenarij
  - [6. Rastavljanje](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Čišćenje resursa
  - [7. Zaključak](workshop/docs/instructions/7-Wrap-up.md) - Pregled i sljedeći koraci
- **🛠️ AI laboratorij radionice**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI usredotočene vježbe
- **💡 Brzi početak**: [Vodič za postavljanje radionice](workshop/README.md#quick-start) - Konfiguracija okoline

**Idealno za**: korporativnu obuku, sveučilišne tečajeve, samostalno učenje i bootcampove za developere.

---

## 📖 Dubinski pregled: Mogućnosti AZD-a

Osim osnovnih funkcionalnosti, AZD nudi moćne značajke za produkcijske implementacije:

- **Implementacije temeljene na predlošcima** - Koristite unaprijed izrađene predloške za uobičajene obrasce aplikacija
- **Infrastruktura kao kod** - Upravljanje Azure resursima koristeći Bicep ili Terraform  
- **Integrirani tijekovi rada** - Besprijekorno postavljanje, implementacija i praćenje aplikacija
- **Prijateljski nastrojen prema developerima** - Optimiziran za produktivnost i iskustvo developera

### **AZD + Microsoft Foundry: Savršeno za AI implementacije**

**Zašto AZD za AI rješenja?** AZD rješava glavne izazove s kojima se suočavaju AI developeri:

- **AI-spremni predlošci** - Pred-konfigurirani predlošci za Microsoft Foundry modele, Cognitive Services i ML workload-e
- **Sigurne AI implementacije** - Ugrađeni sigurnosni obrasci za AI servise, API ključeve i krajnje točke modela  
- **Proizvodni AI obrasci** - Najbolje prakse za skalabilne, isplative AI aplikacije
- **End-to-End AI tijekovi rada** - Od razvoja modela do produkcijske implementacije s pravilnim praćenjem
- **Optimizacija troškova** - Pametna alokacija resursa i strategije skaliranja za AI workload-e
- **Integracija Microsoft Foundry-ja** - Besprijekorna veza s katalogom i krajnjim točkama Microsoft Foundry modela

---

## 🎯 Knjižnica predložaka i primjera

### Izbor: Microsoft Foundry predlošci
**Započnite ovdje ako implementirate AI aplikacije!**

> **Napomena:** Ovi predlošci prikazuju različite AI obrasce. Neki su vanjski Azure uzorci, drugi su lokalne implementacije.

| Predložak | Poglavlje | Složenost | Servisi | Tip |
|----------|---------|------------|----------|------|
| [**Započni s AI chatom**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | Vanjski |
| [**Započni s AI agentima**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Poglavlje 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| Vanjski |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | Vanjski |
| [**OpenAI Chat App Brzi početak**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | Vanjski |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | Vanjski |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | Vanjski |
| [**Retail Multi-Agent Rješenje**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Lokalno** |

### Izbor: Kompletični scenariji učenja
**Predlošci aplikacija spremni za produkciju usklađeni s poglavljima za učenje**

| Predložak | Poglavlje | Složenost | Ključna lekcija |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Poglavlje 2 | ⭐ | Osnovni obrasci AI implementacije |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Poglavlje 2 | ⭐⭐ | RAG implementacija s Azure AI Search |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Poglavlje 4 | ⭐⭐ | Integracija obrade dokumenata |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Poglavlje 5 | ⭐⭐⭐ | Agent okvir i pozivanje funkcija |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Poglavlje 8 | ⭐⭐⭐ | Orkestracija Enterprise AI |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Poglavlje 5 | ⭐⭐⭐⭐ | Višestruka agent arhitektura s Customer i Inventory agentima |

### Učenje kroz tip primjera

> **📌 Lokalni vs. Vanjski primjeri:**  
> **Lokalni primjeri** (u ovom repozitoriju) = Spremni za trenutnu upotrebu  
> **Vanjski primjeri** (Azure uzorci) = Klonirati iz povezanih repozitorija

#### Lokalni primjeri (spremni za upotrebu)
- [**Retail Multi-Agent Rješenje**](examples/retail-scenario.md) - Kompletna produkcijska implementacija s ARM predlošcima
  - Višestruka agentska arhitektura (Customer + Inventory agenti)
  - Opsežno praćenje i evaluacija
  - Jednim klikom postavljanje putem ARM predloška

#### Lokalni primjeri - Container aplikacije (Poglavlja 2-5)
**Kompletni primjeri implementacije kontejnera u ovom spremištu:**
- [**Primjeri Container Aplikacija**](examples/container-app/README.md) - Kompletan vodič za implementacije u kontejnerima
  - [Jednostavan Flask API](../../examples/container-app/simple-flask-api) - Osnovni REST API s scale-to-zero
  - [Arhitektura mikroservisa](../../examples/container-app/microservices) - Produkcijska višeservisna implementacija
  - Brzi početak, produkcija i napredni obrasci implementacije
  - Vodiči za praćenje, sigurnost i optimizaciju troškova

#### Vanjski primjeri - Jednostavne aplikacije (Poglavlja 1-2)
**Klonirajte ove Azure uzorke da započnete:**
- [Jednostavna web aplikacija - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Osnovni obrasci implementacije
- [Statička web stranica - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Implementacija statičkog sadržaja
- [Container aplikacija - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - Implementacija REST API-ja

#### Vanjski primjeri - Integracija baza podataka (Poglavlja 3-4)  

- [Baza Podataka Aplikacija - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Obrasci povezivanja s bazom podataka
- [Funkcije + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Bešavna obrada podataka

#### Vanjski Primjeri - Napredni Obrasci (Poglavlja 4-8)
- [Java Mikroservisi](https://github.com/Azure-Samples/java-microservices-aca-lab) - Arhitekture s više usluga
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Obrada u pozadini  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Obrasc i za proizvodnju spremne ML

### Vanjske Kolekcije Predložaka
- [**Službena Galerija AZD Predložaka**](https://azure.github.io/awesome-azd/) - Kurirana kolekcija službenih i zajedničkih predložaka
- [**Azure Developer CLI Predlošci**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Dokumentacija predložaka Microsoft Learn
- [**Direktorij Primjera**](examples/README.md) - Lokalni primjeri za učenje s detaljnim objašnjenjima

---

## 📚 Resursi za Učenje & Reference

### Brzi Reference
- [**Kratka Lista Komandi**](resources/cheat-sheet.md) - Osnovne azd komande organizirane po poglavljima
- [**Rječnik**](resources/glossary.md) - Terminologija Azure i azd  
- [**Najčešća Pitanja**](resources/faq.md) - Česta pitanja organizirana po poglavljima za učenje
- [**Vodič za Učenje**](resources/study-guide.md) - Sveobuhvatne vježbe

### Radionice s Praktičnim Radom
- [**AI Radionica Laboratorij**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Omogućite svoje AI rješenja za AZD implementaciju (2-3 sata)
- [**Interaktivna Radionica**](workshop/README.md) - 8-modulni vođeni zadaci s MkDocs i GitHub Codespaces
  - Slijedi: Uvod → Odabir → Validacija → Dekonstrukcija → Konfiguracija → Prilagodba → Rastavljanje → Zaključak

### Vanjski Resursi za Učenje
- Dokumentacija Azure Developer CLI-ja (https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- Azure Architecture Center (https://learn.microsoft.com/en-us/azure/architecture/)
- Azure Kalkulator Cijena (https://azure.microsoft.com/pricing/calculator/)
- Azure Status (https://status.azure.com/)

### Vještine AI Agenta za Tvoj Editor
- [**Microsoft Azure Vještine na skills.sh**](https://skills.sh/microsoft/github-copilot-for-azure) - 37 otvorenih vještina agenta za Azure AI, Foundry, implementaciju, dijagnostiku, optimizaciju troškova i još mnogo toga. Instalirajte ih u GitHub Copilot, Cursor, Claude Code ili bilo kojeg podržanog agenta:
  ```bash
  npx skills add microsoft/github-copilot-for-azure
  ```

---

## 🔧 Brzi Vodič za Otklanjanje Problema

**Česti problemi s kojima se početnici susreću i brza rješenja:**

<details>
<summary><strong>❌ "azd: command not found"</strong></summary>

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
<summary><strong>❌ "Nije pronađena pretplata" ili "Pretplata nije postavljena"</strong></summary>

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
<summary><strong>❌ "Nedovoljna Kvota" ili "Kvota premašena"</strong></summary>

```bash
# Pokušajte različitu Azure regiju
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
<summary><strong>❌ "azd up" prekida se na pola puta</strong></summary>

```bash
# Opcija 1: Očistite i pokušajte ponovo
azd down --force --purge
azd up

# Opcija 2: Samo popravite infrastrukturu
azd provision

# Opcija 3: Provjerite detaljni status
azd show

# Opcija 4: Provjerite zapise u Azure Monitoru
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Autentikacija nije uspjela" ili "Token je istekao"</strong></summary>

```bash
# Ponovno se autentificirajte za AZD
azd auth logout
azd auth login

# Opcionalno: osvježite i Azure CLI ako koristite az naredbe
az logout
az login

# Provjerite autentifikaciju
az account show
```
</details>

<details>
<summary><strong>❌ "Resurs već postoji" ili sukobi u imenovanju</strong></summary>

```bash
# AZD generira jedinstvena imena, ali ako dođe do sukoba:
azd down --force --purge

# Zatim pokušajte ponovo s novim okruženjem
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Implementacija predloška traje predugo</strong></summary>

**Uobičajena vremena čekanja:**
- Jednostavna web aplikacija: 5-10 minuta
- Aplikacija s bazom podataka: 10-15 minuta
- AI aplikacije: 15-25 minuta (Provisioning OpenAI-ja je spor)

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

# Potrebna vam je barem uloga "Suradnik"
# Zamolite svog Azure administratora da omogući:
# - Suradnik (za resurse)
# - Administrator pristupa korisnika (za dodjelu uloga)
```
</details>

<details>
<summary><strong>❌ Ne može se pronaći URL implementirane aplikacije</strong></summary>

```bash
# Prikaži sve krajnje točke usluge
azd show

# Ili otvorite Azure Portal
azd monitor

# Provjerite određenu uslugu
azd env get-values
# Potražite *_URL varijable
```
</details>

### 📚 Potpuni Resursi za Otklanjanje Problema

- **Vodič za Česte Probleme:** [Detaljna Rješenja](docs/chapter-07-troubleshooting/common-issues.md)
- **Problemi Specifični za AI:** [AI Otklanjanje Problema](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vodič za Debugiranje:** [Korak po korak Debugiranje](docs/chapter-07-troubleshooting/debugging.md)
- **Dobijte Pomoć:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Završetak Tečaja & Certifikacija

### Praćenje Napretka
Pratite svoj napredak kroz svako poglavlje:

- [ ] **Poglavlje 1**: Osnove & Brzi Start ✅
- [ ] **Poglavlje 2**: AI-Prvo Razvijanje ✅  
- [ ] **Poglavlje 3**: Konfiguracija & Autentikacija ✅
- [ ] **Poglavlje 4**: Infrastruktura kao Kod & Implementacija ✅
- [ ] **Poglavlje 5**: Višeagentna AI Rješenja ✅
- [ ] **Poglavlje 6**: Validacija & Planiranje Prije Implementacije ✅
- [ ] **Poglavlje 7**: Otklanjanje Problema & Debugiranje ✅
- [ ] **Poglavlje 8**: Proizvodni i Enterprise Obrasci ✅

### Provjera Znanja
Nakon završetka svakog poglavlja, provjerite svoje znanje:
1. **Praktična Vježba**: Završite poglavlje praktičnom implementacijom
2. **Provjera Znanja**: Pregledajte FAQ za svoje poglavlje
3. **Društvena Rasprava**: Podijelite iskustvo na Azure Discord-u
4. **Sljedeće Poglavlje**: Krenite na sljedeću razinu složenosti

### Prednosti Završetka Tečaja
Nakon završetka svih poglavlja, dobit ćete:
- **Iskustvo u Proizvodnji**: Implementirane stvarne AI aplikacije na Azure
- **Profesionalne Vještine**: Spremnost za enterprise implementaciju  
- **Priznanje u Zajednici**: Aktivni član Azure developerske zajednice
- **Napredovanje u Karijeri**: Potražena AZD i AI stručnost za implementaciju

---

## 🤝 Zajednica & Podrška

### Dobivanje Pomoći & Podrške
- **Tehnički Problemi**: [Prijavite greške i zahtjeve za značajkama](https://github.com/microsoft/azd-for-beginners/issues)
- **Pitanja o učenju**: [Microsoft Azure Discord Zajednica](https://discord.gg/microsoft-azure) i [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Pomoć Specifična za AI**: Pridružite se [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentacija**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Uvidi Zajednice iz Microsoft Foundry Discorda

**Nedavni Rezultati Anketa s #Azure Kanala:**
- **45%** developera želi koristiti AZD za AI zadatke
- **Glavni izazovi**: Implementacije s više usluga, upravljanje pristupnim podacima, spremnost za produkciju  
- **Najtraženije**: Predlošci za AI, vodiči za otklanjanje problema, najbolje prakse

**Pridružite se našoj zajednici da:**
- Dijelite svoja iskustva s AZD + AI i dobijete pomoć
- Imate pristup ranim pregledima novih AI predložaka
- Doprinijete najboljim praksama za AI implementacije
- Utičete na budući razvoj AI + AZD značajki

### Sudjelovanje u Tečaju
Pozivamo vas da doprinesete! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:
- **Poboljšanju sadržaja**: Unaprijedite postojeća poglavlja i primjere
- **Novim Primjerima**: Dodajte stvarne scenarije i predloške  
- **Prijevodu**: Pomozite u održavanju podrške za više jezika
- **Izvještavanju o Greškama**: Poboljšajte točnost i jasnoću
- **Standardima Zajednice**: Slijedite naše smjernice za inkluzivnu zajednicu

---

## 📄 Informacije o Tečaju

### Licenca
Ovaj projekt licenciran je pod MIT licencom - pogledajte datoteku [LICENSE](../../LICENSE) za detalje.

### Povezani Microsoft resursi za učenje

Naš tim producira druge sveobuhvatne tečajeve za učenje:

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
[![AI Agenti za početnike](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Serijal Generativnog AI
[![Generativni AI za početnike](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generativni AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Osnovno Učenje
[![ML za početnike](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data Science for Beginners](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI for Beginners](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Cybersecurity for Beginners](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web Dev for Beginners](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT for Beginners](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR Development for Beginners](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot Serija
[![Copilot for AI Paired Programming](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot for C#/.NET](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot Adventure](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---

## 🗺️ Navigacija kroz tečaj

**🚀 Spremni za početak učenja?**

**Početnici**: Započnite s [Poglavlje 1: Osnove i Brzi početak](#-chapter-1-foundation--quick-start)  
**AI programeri**: Preskočite na [Poglavlje 2: AI-prvi razvoj](#-chapter-2-ai-first-development-recommended-for-ai-developers)  
**Iskusni programeri**: Počnite s [Poglavlje 3: Konfiguracija i autentifikacija](#️-chapter-3-configuration--authentication)

**Sljedeći koraci**: [Započnite Poglavlje 1 - Osnove AZD-a](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:  
Ovaj dokument je preveden korištenjem AI prevodilačke usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazuma ili pogrešne interpretacije koje mogu proizaći iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->