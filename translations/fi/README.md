# AZD Aloittelijoille: Rakenteinen oppimispolku

![AZD-aloittelijoille](../../translated_images/fi/azdbeginners.5527441dd9f74068.webp) 

[![GitHub seuraajat](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/)
[![GitHub haarukat](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/)
[![GitHub tähdet](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/)

[![Azure Discord](https://dcbadge.limes.pink/api/server/https://discord.gg/microsoft-azure)](https://discord.gg/microsoft-azure)
[![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)

---

### Automaattiset käännökset (aina ajan tasalla)

<!-- CO-OP TRANSLATOR LANGUAGES TABLE START -->
[Arabia](../ar/README.md) | [Bengali](../bn/README.md) | [Bulgaria](../bg/README.md) | [Burmankieli (Myanmar)](../my/README.md) | [Kiina (yksinkertaistettu)](../zh-CN/README.md) | [Kiina (perinteinen, Hongkong)](../zh-HK/README.md) | [Kiina (perinteinen, Makao)](../zh-MO/README.md) | [Kiina (perinteinen, Taiwan)](../zh-TW/README.md) | [Kroatia](../hr/README.md) | [Tšekki](../cs/README.md) | [Tanska](../da/README.md) | [Hollanti](../nl/README.md) | [Viro](../et/README.md) | [Suomi](./README.md) | [Ranska](../fr/README.md) | [Saksa](../de/README.md) | [Kreikka](../el/README.md) | [Heprea](../he/README.md) | [Hindi](../hi/README.md) | [Unkari](../hu/README.md) | [Indonesia](../id/README.md) | [Italia](../it/README.md) | [Japani](../ja/README.md) | [Kannada](../kn/README.md) | [Korea](../ko/README.md) | [Liettua](../lt/README.md) | [Malaiji](../ms/README.md) | [Malayalam](../ml/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Nigerian Pidgin](../pcm/README.md) | [Norja](../no/README.md) | [Persia (Farsi)](../fa/README.md) | [Puola](../pl/README.md) | [Portugali (Brasilia)](../pt-BR/README.md) | [Portugali (Portugali)](../pt-PT/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Romania](../ro/README.md) | [Venäjä](../ru/README.md) | [Serbia (kirillinen)](../sr/README.md) | [Slovakki](../sk/README.md) | [Sloveeni](../sl/README.md) | [Espanja](../es/README.md) | [Svahili](../sw/README.md) | [Ruotsi](../sv/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Tamili](../ta/README.md) | [Telugu](../te/README.md) | [Thai](../th/README.md) | [Turkki](../tr/README.md) | [Ukraina](../uk/README.md) | [Urdu](../ur/README.md) | [Vietnam](../vi/README.md)

> **Haluatko mieluummin kloonata paikallisesti?**
>
> Tämä repositorio sisältää yli 50 käännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöksiä, käytä tiheää tarkkaa checkoutia (sparse checkout):
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
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen huomattavasti nopeammalla latauksella.
<!-- CO-OP TRANSLATOR LANGUAGES TABLE END -->

## 🚀 Mikä on Azure Developer CLI (azd)?

**Azure Developer CLI (azd)** on kehittäjäystävällinen komentorivityökalu, joka tekee sovellusten käyttöönotosta Azureen helppoa. Sen sijaan, että loisit ja yhdistäisit kymmeniä Azure-resursseja manuaalisesti, voit ottaa käyttöön koko sovelluksen yhdellä komennolla.

### "azd up" -komennon taika

```bash
# Tämä yksittäinen komento tekee kaiken:
# ✅ Luo kaikki Azure-resurssit
# ✅ Määrittää verkot ja tietoturvan
# ✅ Kääntää sovelluskoodisi
# ✅ Ottaa käyttöön Azureen
# ✅ Antaa toimivan URL-osoitteen
azd up
```

**Siinä se!** Ei Azure Portal -klikkailua, ei monimutkaisia ARM-malleja opittavaksi ensin, ei manuaalista konfigurointia — vain toimivat sovellukset Azuressa.

---

## ❓ Azure Developer CLI vs Azure CLI: Mikä ero?

Tämä on aloittelijoiden yleisin kysymys. Tässä yksinkertainen vastaus:

| Feature | **Azure CLI (`az`)** | **Azure Developer CLI (`azd`)** |
|---------|---------------------|--------------------------------|
| **Tarkoitus** | Hallitse yksittäisiä Azure-resursseja | Ota käyttöön kokonaisia sovelluksia |
| **Ajattelutapa** | Infrastrukturikeskeinen | Sovelluskeskeinen |
| **Esimerkki** | `az webapp create --name myapp...` | `azd up` |
| **Oppimiskäyrä** | Tunnet Azure-palvelut | Tunnet sovelluksesi |
| **Sopii parhaiten** | DevOps, infrastruktuuri | Kehittäjät, prototypointi |

### Yksinkertainen vertaus

- **Azure CLI** on kuin kaikki työkalut talon rakentamiseen — vasarat, sahat, naulat. Voit rakentaa mitä tahansa, mutta sinun on ymmärrettävä rakentaminen.
- **Azure Developer CLI** on kuin palkkaisit urakoitsijan — kuvailet mitä haluat, ja he hoitavat rakentamisen.

### Milloin käyttää mitäkin

| Tilanne | Käytä tätä |
|----------|----------|
| "Haluan ottaa web-sovellukseni nopeasti käyttöön" | `azd up` |
| "Tarvitsen vain tallennustilin" | `az storage account create` |
| "Rakennan täyden AI-sovelluksen" | `azd init --template azure-search-openai-demo` |
| "Tarvitsen debugata tiettyä Azure-resurssia" | `az resource show` |
| "Haluan tuotantovalmiin käyttöönoton minuuteissa" | `azd up --environment production` |

### Ne toimivat yhdessä!

AZD käyttää taustalla Azure CLI:tä. Voit käyttää molempia:
```bash
# Ota sovelluksesi käyttöön AZD:llä
azd up

# Säädä sitten tiettyjä resursseja Azure CLI:llä
az webapp config set --name myapp --always-on true
```

---

## 🌟 Löydä malleja Awesome AZD:stä

Älä aloita tyhjästä! **Awesome AZD** on yhteisön kokoama valikoima valmiita deploy-malleja:

| Resource | Description |
|----------|-------------|
| 🔗 [**Awesome AZD Gallery**](https://azure.github.io/awesome-azd/) | Selaa yli 200 mallia ja ota käyttöön yhdellä klikkauksella |
| 🔗 [**Lähetä malli**](https://github.com/Azure/awesome-azd/issues) | Lisää oma mallisi yhteisölle |
| 🔗 [**GitHub-repositorio**](https://github.com/Azure/awesome-azd) | Tähdä ja tutki lähdekoodia |

### Suositut AI-mallit Awesome AZD:stä

```bash
# RAG-keskustelu Azure OpenAI:lla + AI-haku
azd init --template azure-search-openai-demo

# Nopea tekoälykeskustelusovellus
azd init --template openai-chat-app-quickstart

# Tekoälyagentit Foundry-agenttien kanssa
azd init --template get-started-with-ai-agents
```

---

## 🎯 Aloita kolmessa vaiheessa

### Vaihe 1: Asenna AZD (2 minuuttia)

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

### Vaihe 2: Kirjaudu Azureen

```bash
azd auth login
```

### Vaihe 3: Ota ensimmäinen sovelluksesi käyttöön

```bash
# Alusta mallista
azd init --template todo-nodejs-mongo

# Ota käyttöön Azureen (luo kaiken!)
azd up
```

**🎉 Siinä se!** Sovelluksesi on nyt käytössä Azuressa.

### Siivous (Älä unohda!)

```bash
# Remove all resources when done experimenting
azd down --force --purge
```

---

## 📚 Miten käyttää tätä kurssia

Tämä kurssi on suunniteltu **etenevään oppimiseen** — aloita siitä, missä tunnet olosi mukavaksi, ja etene ylöspäin:

| Kokemuksesi | Aloita tästä |
|-----------------|------------|
| **Täysin uusi Azureen** | [Luku 1: Perusta](../..) |
| **Tunnet Azuren, mutta uusi AZD:ssä** | [Luku 1: Perusta](../..) |
| **Haluat ottaa AI-sovelluksia käyttöön** | [Luku 2: AI-ensimmäinen kehitys](../..) |
| **Haluat käytännön harjoituksia** | [🎓 Interaktiivinen työpaja](workshop/README.md) - 3-4 tunnin ohjattu lab |
| **Tarvitset tuotantokuvioita** | [Luku 8: Tuotanto & Enterprise](../..) |

### Nopeasti käyttöön

1. **Forkkaa tämä repositorio**: [![GitHub haarukat](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Kloonaa se**: `git clone https://github.com/YOUR-USERNAME/azd-for-beginners.git`
3. **Hanki apua**: [Azure Discord Community](https://discord.com/invite/ByRwuEEgH4)

> **Haluatko mieluummin kloonata paikallisesti?**

> Tämä repositorio sisältää yli 50 käännöstä, mikä kasvattaa latauskokoa merkittävästi. Jos haluat kloonata ilman käännöksiä, käytä tiheää tarkkaa checkoutia (sparse checkout):
> ```bash
> git clone --filter=blob:none --sparse https://github.com/microsoft/AZD-for-beginners.git
> cd AZD-for-beginners
> git sparse-checkout set --no-cone '/*' '!translations' '!translated_images'
> ```
> Tämä antaa sinulle kaiken tarvittavan kurssin suorittamiseen huomattavasti nopeammalla latauksella.


## Kurssin yleiskatsaus

Hallinnoi Azure Developer CLI:tä (azd) rakenteellisten lukujen kautta, jotka on suunniteltu etenevään oppimiseen. **Erityinen painotus AI-sovellusten käyttöönotolle Microsoft Foundry -integraation kanssa.**

### Miksi tämä kurssi on olennaista nykyaikaisille kehittäjille

Microsoft Foundry Discord -yhteisön näkemyksiin perustuen, **45 % kehittäjistä haluaa käyttää AZD:tä AI-työkuormissa**, mutta kohtaa haasteita kuten:
- Monimutkaiset monipalveluisten AI-arkkitehtuurien mallit
- Tuotannon AI-käyttöönoton parhaat käytännöt
- Azure AI -palvelujen integrointi ja konfigurointi
- Kustannusten optimointi AI-työkuormille
- AI-spesifisten käyttöönotto-ongelmien vianmääritys

### Oppimistavoitteet

Suorittamalla tämän rakenteisen kurssin, sinä:
- **Hallinnoit AZD:n perusteet**: Keskeiset käsitteet, asennus ja konfigurointi
- **Otat AI-sovelluksia käyttöön**: Käytä AZD:tä Microsoft Foundryn palvelujen kanssa
- **Toteutat infrastruktuurin koodina**: Hallitse Azure-resursseja Bicep-malleilla
- **Vianmäärität käyttöönotot**: Ratkaise yleisiä ongelmia ja debuggaa virheitä
- **Optimoi tuotantoa varten**: Turvallisuus, skaalaus, monitorointi ja kustannusten hallinta
- **Rakenna moni-agenttisia ratkaisuja**: Ota käyttöön monimutkaisia AI-arkkitehtuureja

## 🗺️ Kurssikartta: Nopea navigointi luvuittain

Jokaisella luvulla on oma README-tiedosto oppimistavoitteineen, pika-aloituksineen ja harjoituksineen:

| Luku | Aihe | Oppitunnit | Kesto | Vaikeus |
|---------|-------|---------|----------|------------|
| **[Luku 1: Perusta](docs/chapter-01-foundation/README.md)** | Aloittaminen | [AZD:n perusteet](docs/chapter-01-foundation/azd-basics.md) &#124; [Asennus](docs/chapter-01-foundation/installation.md) &#124; [Ensimmäinen projekti](docs/chapter-01-foundation/first-project.md) | 30-45 min | ⭐ |
| **[Luku 2: AI-kehitys](docs/chapter-02-ai-development/README.md)** | AI-ensimmäiset sovellukset | [Foundry-integraatio](docs/chapter-02-ai-development/microsoft-foundry-integration.md) &#124; [AI-agentit](docs/chapter-02-ai-development/agents.md) &#124; [Mallien käyttöönotto](docs/chapter-02-ai-development/ai-model-deployment.md) &#124; [Työpaja](docs/chapter-02-ai-development/ai-workshop-lab.md) | 1-2 h | ⭐⭐ |
| **[Luku 3: Konfigurointi](docs/chapter-03-configuration/README.md)** | Tunnistus & turvallisuus | [Konfigurointi](docs/chapter-03-configuration/configuration.md) &#124; [Tunnistus & turvallisuus](docs/chapter-03-configuration/authsecurity.md) | 45-60 min | ⭐⭐ |
| **[Luku 4: Infrastruktuuri](docs/chapter-04-infrastructure/README.md)** | IaC ja käyttöönotto | [Käyttöönotto-opas](docs/chapter-04-infrastructure/deployment-guide.md) &#124; [Provisionointi](docs/chapter-04-infrastructure/provisioning.md) | 1-1,5 tuntia | ⭐⭐⭐ |
| **[Luku 5: Moni-agenttinen](docs/chapter-05-multi-agent/README.md)** | Tekoälyagenttiratkaisut | [Vähittäiskaupan skenaario](examples/retail-scenario.md) &#124; [Koordinointimallit](docs/chapter-06-pre-deployment/coordination-patterns.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[Luku 6: Ennakkovalmistelut](docs/chapter-06-pre-deployment/README.md)** | Suunnittelu ja validointi | [Esitarkastukset](docs/chapter-06-pre-deployment/preflight-checks.md) &#124; [Kapasiteettisuunnittelu](docs/chapter-06-pre-deployment/capacity-planning.md) &#124; [SKU-valinta](docs/chapter-06-pre-deployment/sku-selection.md) &#124; [Application Insights](docs/chapter-06-pre-deployment/application-insights.md) | 1 tunti | ⭐⭐ |
| **[Luku 7: Vianmääritys](docs/chapter-07-troubleshooting/README.md)** | Vianetsintä ja korjaus | [Yleiset ongelmat](docs/chapter-07-troubleshooting/common-issues.md) &#124; [Vianetsintä](docs/chapter-07-troubleshooting/debugging.md) &#124; [Tekoälyongelmat](docs/chapter-07-troubleshooting/ai-troubleshooting.md) | 1-1,5 tuntia | ⭐⭐ |
| **[Luku 8: Tuotanto](docs/chapter-08-production/README.md)** | Yritystason mallit | [Tuotannon käytännöt](docs/chapter-08-production/production-ai-practices.md) | 2-3 tuntia | ⭐⭐⭐⭐ |
| **[🎓 Työpaja](workshop/README.md)** | Käytännön laboratorio | [Johdanto](workshop/docs/instructions/0-Introduction.md) &#124; [Valinta](workshop/docs/instructions/1-Select-AI-Template.md) &#124; [Validointi](workshop/docs/instructions/2-Validate-AI-Template.md) &#124; [Purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) &#124; [Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) &#124; [Räätälöinti](workshop/docs/instructions/5-Customize-AI-Template.md) &#124; [Infrastruktuurin purku](workshop/docs/instructions/6-Teardown-Infrastructure.md) &#124; [Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) | 3-4 tuntia | ⭐⭐ |

**Kokonaiskurssin kesto:** ~10-14 tuntia | **Taitotason eteneminen:** Aloittelija → Tuotantovalmis

---

## 📚 Oppimiskappaleet

*Valitse oppimispolkusi kokemustason ja tavoitteiden perusteella*

### 🚀 Luku 1: Perusta & Pikakäynnistys
**Esivaatimukset**: Azure-tilaus, peruskomentoriviosaaminen  
**Kesto**: 30-45 minuuttia  
**Monimutkaisuus**: ⭐

#### Mitä opit
- Azure Developer CLI:n perusteiden ymmärtäminen
- AZD:n asentaminen alustallesi
- Ensimmäinen onnistunut käyttöönotto

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Mikä on Azure Developer CLI?](../..)
- **📖 Teoria**: [AZD Basics](docs/chapter-01-foundation/azd-basics.md) - Peruskäsitteet ja terminologia
- **⚙️ Asennus**: [Installation & Setup](docs/chapter-01-foundation/installation.md) - Alustakohtaiset ohjeet
- **🛠️ Käytännön harjoitus**: [Ensimmäinen projektisi](docs/chapter-01-foundation/first-project.md) - Vaiheittainen opas
- **📋 Pikatuki**: [Command Cheat Sheet](resources/cheat-sheet.md)

#### Käytännön harjoitukset
```bash
# Nopea asennustarkistus
azd version

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up
```

**💡 Luvun tulos**: Ota onnistuneesti käyttöön yksinkertainen web-sovellus Azureen käyttäen AZD

**✅ Onnistumisen varmistus:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi pystyä:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Ajan tarve:** 30-45 minuuttia  
**📈 Taitotaso loppuvaiheessa:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti

**✅ Onnistumisen varmistus:**
```bash
# Luvun 1 suorittamisen jälkeen sinun pitäisi pystyä:
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                  # Julkaisee Azureen
azd show                # Näyttää käynnissä olevan sovelluksen URL-osoitteen
# Sovellus avautuu selaimessa ja toimii
azd down --force --purge  # Siivoaa resurssit
```

**📊 Ajan tarve:** 30-45 minuuttia  
**📈 Taitotaso loppuvaiheessa:** Pystyy ottamaan käyttöön perussovelluksia itsenäisesti

---

### 🤖 Luku 2: Tekoälykeskeinen kehitys (Suositellaan tekoälykehittäjille)
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 1-2 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Microsoft Foundryn integrointi AZD:n kanssa
- Tekoälyllä varustettujen sovellusten käyttöönotto
- Tekoälypalvelujen kokoonpanojen ymmärtäminen

#### Oppimateriaalit
- **🎯 Aloita tästä**: [Microsoft Foundry Integration](docs/chapter-02-ai-development/microsoft-foundry-integration.md)
- **🤖 AI-agentit**: [AI Agents Guide](docs/chapter-02-ai-development/agents.md) - Ota käyttöön älykkäitä agenteja AZD:llä
- **📖 Mallit**: [AI Model Deployment](docs/chapter-02-ai-development/ai-model-deployment.md) - Ota käyttöön ja hallinnoi tekoälymalleja
- **🛠️ Työpaja**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee tekoälyratkaisuistasi AZD-valmiita
- **🎥 Interaktiivinen opas**: [Workshop Materials](workshop/README.md) - Selainpohjainen oppiminen MkDocsilla * DevContainer-ympäristö
- **📋 Mallipohjat**: [#featured-microsoft-foundry-templates](../..)
- **📝 Esimerkit**: [AZD Deployment Examples](examples/README.md)

#### Käytännön harjoitukset
```bash
# Ota ensimmäinen tekoälysovelluksesi käyttöön
azd init --template azure-search-openai-demo
azd up

# Kokeile lisää tekoälymallipohjia
azd init --template openai-chat-app-quickstart
azd init --template agent-openai-python-prompty
```

**💡 Luvun tulos**: Ota käyttöön ja konfiguroi tekoälyllä toimiva chat-sovellus, jossa on RAG-ominaisuudet

**✅ Onnistumisen varmistus:**
```bash
# Luvun 2 jälkeen sinun pitäisi pystyä:
azd init --template azure-search-openai-demo
azd up
# Testata tekoälypohjaista chat-käyttöliittymää
# Esittää kysymyksiä ja saada tekoälyn tuottamia vastauksia lähteineen
# Varmistaa hakuintegraation toimivuus
azd monitor  # Tarkistaa, että Application Insights näyttää telemetriaa
azd down --force --purge
```

**📊 Ajan tarve:** 1-2 tuntia  
**📈 Taitotaso loppuvaiheessa:** Pystyy ottamaan käyttöön ja konfiguroimaan tuotantovalmiita tekoälysovelluksia  
**💰 Kustannustietoisuus:** Ymmärrä kehityskustannukset noin $80–150/kk, tuotantokustannukset $300–3500/kk

#### 💰 Kustannusnäkökohdat tekoälykäyttöönottoihin

**Kehitysympäristö (arviolta $80–150/kk):**
- Azure OpenAI (Pay-as-you-go): $0–50/kk (perustuu token-käyttöön)
- AI Search (Basic-taso): $75/kk
- Container Apps (Consumption): $0–20/kk
- Storage (Standard): $1–5/kk

**Tuotantoympäristö (arviolta $300–3,500+/kk):**
- Azure OpenAI (PTU vakaaseen suorituskykyyn): $3,000+/kk TAI Pay-as-go suurilla volyymeillä
- AI Search (Standard-taso): $250/kk
- Container Apps (Dedicated): $50–100/kk
- Application Insights: $5–50/kk
- Storage (Premium): $10–50/kk

**💡 Vinkkejä kustannusten optimointiin:**
- Käytä **Free Tier** -tasoa Azure OpenAI:sta oppimiseen (50 000 tokenia/kk sisältyy)
- Suorita `azd down` vapauttaaksesi resursseja, kun et kehitä aktiivisesti
- Aloita kulutuspohjaisella laskutuksella, päivitä PTU:hun vain tuotantoon
- Käytä `azd provision --preview` arvioidaksesi kustannuksia ennen käyttöönottoa
- Ota käyttöön automaattinen skaalaus: maksa vain todellisesta käytöstä

**Kustannusten seuranta:**
```bash
# Tarkista arvioidut kuukausikustannukset
azd provision --preview

# Seuraa todellisia kustannuksia Azure-portaalissa
az consumption budget list --resource-group <your-rg>
```

---

### ⚙️ Luku 3: Konfigurointi ja autentikointi
**Esivaatimukset**: Luku 1 suoritettu  
**Kesto**: 45-60 minuuttia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Ympäristön konfigurointi ja hallinta
- Todennus- ja tietoturvakäytännöt
- Resurssien nimeäminen ja organisointi

#### Oppimateriaalit
- **📖 Konfigurointi**: [Configuration Guide](docs/chapter-03-configuration/configuration.md) - Ympäristön määritys
- **🔐 Tietoturva**: [Authentication patterns and managed identity](docs/chapter-03-configuration/authsecurity.md) - Autentikointimallit
- **📝 Esimerkit**: [Database App Example](examples/database-app/README.md) - AZD-tietokantaesimerkit

#### Käytännön harjoitukset
- Konfiguroi useita ympäristöjä (dev, staging, prod)
- Ota käyttöön hallinnoitu identiteetti -todennus
- Toteuta ympäristökohtaiset määritykset

**💡 Luvun tulos**: Hallitse useita ympäristöjä asianmukaisella autentikoinnilla ja tietoturvalla

---

### 🏗️ Luku 4: Infrastruktuuri koodina ja käyttöönotto
**Esivaatimukset**: Luvut 1-3 suoritettu  
**Kesto**: 1-1,5 tuntia  
**Monimutkaisuus**: ⭐⭐⭐

#### Mitä opit
- Edistyneet käyttöönottoarkkitehtuurit
- Infrastruktuuri koodina Bicepillä
- Resurssien provisionointistrategiat

#### Oppimateriaalit
- **📖 Käyttöönotto**: [Deployment Guide](docs/chapter-04-infrastructure/deployment-guide.md) - Täydelliset työnkulut
- **🏗️ Provisionointi**: [Provisioning Resources](docs/chapter-04-infrastructure/provisioning.md) - Azure-resurssien hallinta
- **📝 Esimerkit**: [Container App Example](../../examples/container-app) - Säilöitetyt käyttöönotot

#### Käytännön harjoitukset
- Luo mukautettuja Bicep-malleja
- Ota käyttöön monipalvelusovelluksia
- Toteuta blue-green -käyttöönottoja

**💡 Luvun tulos**: Ota käyttöön monimutkaisia monipalvelusovelluksia käyttämällä mukautettuja infrastruktuurimalleja

---

### 🎯 Luku 5: Moni-agenttiset tekoälyratkaisut (Edistynyt)
**Esivaatimukset**: Luvut 1-2 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Moni-agenttiarkkitehtuurin mallit
- Agenttien orkestrointi ja koordinointi
- Tuotantovalmiit tekoälykäyttöönotot

#### Oppimateriaalit
- **🤖 Esittelyprojekti**: [Retail Multi-Agent Solution](examples/retail-scenario.md) - Täydellinen toteutus
- **🛠️ ARM-mallit**: [ARM Template Package](../../examples/retail-multiagent-arm-template) - Yhden klikkauksen käyttöönotto
- **📖 Arkkitehtuuri**: [Multi-agent coordination patterns](docs/chapter-06-pre-deployment/coordination-patterns.md) - Mallit

#### Käytännön harjoitukset
```bash
# Ota käyttöön täydellinen vähittäiskaupan moniagenttinen ratkaisu
cd examples/retail-multiagent-arm-template
./deploy.sh

# Tutki agenttien kokoonpanoja
az deployment group show --resource-group <rg-name> --name <deployment-name>
```

**💡 Luvun tulos**: Ota käyttöön ja hallitse tuotantovalmista moni-agenttista tekoälyratkaisua, joka sisältää Asiakas- ja Varasto-agentit

---

### 🔍 Luku 6: Ennakkovalidointi ja suunnittelu ennen käyttöönottoa
**Esivaatimukset**: Luku 4 suoritettu  
**Kesto**: 1 tunti  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Kapasiteettisuunnittelu ja resurssien validointi
- SKU-valintastrategiat
- Esitarkastukset ja automaatio

#### Oppimateriaalit
- **📊 Suunnittelu**: [Capacity Planning](docs/chapter-06-pre-deployment/capacity-planning.md) - Resurssien validointi
- **💰 Valinta**: [SKU Selection](docs/chapter-06-pre-deployment/sku-selection.md) - Kustannustehokkaat valinnat
- **✅ Varmennus**: [Pre-flight Checks](docs/chapter-06-pre-deployment/preflight-checks.md) - Automaattiset skriptit

#### Käytännön harjoitukset
- Suorita kapasiteetin validointiskriptit
- Optimoi SKU-valinnat kustannusten mukaan
- Toteuta automaattiset esitarkastukset ennen käyttöönottoa

**💡 Luvun tulos**: Varmenna ja optimoi käyttöönotot ennen suorittamista

---

### 🚨 Luku 7: Vianmääritys ja virheenkorjaus
**Esivaatimukset**: Mikä tahansa käyttöönottojakso suoritettu  
**Kesto**: 1-1,5 tuntia  
**Monimutkaisuus**: ⭐⭐

#### Mitä opit
- Järjestelmälliset virheenetsintämenetelmät
- Yleiset ongelmat ja ratkaisut
- Tekoälyyn liittyvä vianmääritys

#### Oppimateriaalit
- **🔧 Yleiset ongelmat**: [Common Issues](docs/chapter-07-troubleshooting/common-issues.md) - UKK ja ratkaisut
- **🕵️ Vianetsintä**: [Debugging Guide](docs/chapter-07-troubleshooting/debugging.md) - Vaiheittaiset strategiat
- **🤖 Tekoälyongelmat**: [AI-Specific Troubleshooting](docs/chapter-07-troubleshooting/ai-troubleshooting.md) - Tekoälypalvelujen ongelmat

#### Käytännön harjoitukset
- Diagnosoi käyttöönoton epäonnistumisia
- Ratkaise todennusongelmia
- Debuggaa tekoälypalvelujen yhteyksiä

**💡 Luvun tulos**: Pysty itsenäisesti diagnosoimaan ja ratkaisemaan yleisiä käyttöönotto-ongelmia

---

### 🏢 Luku 8: Tuotanto ja yritystason mallit
**Esivaatimukset**: Luvut 1-4 suoritettu  
**Kesto**: 2-3 tuntia  
**Monimutkaisuus**: ⭐⭐⭐⭐

#### Mitä opit
- Tuotantokäyttöönoton strategiat
- Yritystason tietoturvamallit
- Valvonta ja kustannusten optimointi

#### Oppimateriaalit
- **🏭 Tuotanto**: [Production AI Best Practices](docs/chapter-08-production/production-ai-practices.md) - Yritysmallit
- **📝 Esimerkit**: [Microservices Example](../../examples/microservices) - Monimutkaiset arkkitehtuurit
- **📊 Valvonta**: [Application Insights integration](docs/chapter-06-pre-deployment/application-insights.md) - Integraatio

#### Käytännön harjoitukset
- Toteuta yritystason tietoturvakäytännöt
- Ota käyttöön kattava valvonta
- Ota tuotantoon hallitusti ja governance-malleilla

**💡 Luvun tulos**: Ota käyttöön yritystason sovelluksia, joilla on täydet tuotantovalmiudet

---

## 🎓 Työpajan yleiskatsaus: käytännön oppimiskokemus

> **⚠️ TYÖPAJAN TILA: Kehitteillä**
> Työpajan materiaalit ovat parhaillaan kehitteillä ja hiottavana. Ydinmoduulit toimivat, mutta jotkin edistyneemmät osuudet ovat keskeneräisiä. Työskentelemme aktiivisesti saadaksemme kaiken sisällön valmiiksi. [Seuraa edistymistä →](workshop/README.md)

### Interaktiiviset työpajamateriaalit
**Kattava käytännön oppiminen selainpohjaisilla työkaluilla ja ohjatuilla harjoituksilla**

Työpajan materiaalit tarjoavat jäsennellyn, interaktiivisen oppimiskokemuksen, joka täydentää yllä olevaa lukuun perustuvaa opetussuunnitelmaa. Työpaja on suunniteltu sekä itsenäiseen opiskeluun että ohjattuihin istuntoihin.

#### 🛠️ Työpajan ominaisuudet
- **Selainpohjainen käyttöliittymä**: Täydellinen MkDocs-pohjainen työpaja, jossa haku, kopiointi ja teemavaihtoehdot
- **GitHub Codespaces -integraatio**: Yhden napsautuksen kehitysympäristön asennus
- **Jäsennelty oppimispolku**: 8-moduulinen ohjattu harjoitussarja (3–4 tuntia yhteensä)
- **Etenevä metodologia**: Johdanto → Valinta → Vahvistus → Rakenteen purku → Konfigurointi → Mukauttaminen → Resurssien poisto → Yhteenveto
- **Interaktiivinen DevContainer-ympäristö**: Esikonfiguroidut työkalut ja riippuvuudet

#### 📚 Työpajan moduulien rakenne
Työpaja noudattaa **8-moduulista etenevää metodologiaa**, joka vie sinut löytämisestä käyttöönoton hallintaan:

| Module | Topic | What You'll Do | Duration |
|--------|-------|----------------|----------|
| **0. Johdanto** | Työpajan yleiskatsaus | Ymmärrä oppimistavoitteet, ennakkoedellytykset ja työpajan rakenne | 15 min |
| **1. Valinta** | Mallien löytäminen | Tutustu AZD-malleihin ja valitse tilanteeseesi sopiva AI-malli | 20 min |
| **2. Vahvistus** | Ota käyttöön & Varmista | Ota malli käyttöön komennolla `azd up` ja varmista, että infrastruktuuri toimii | 30 min |
| **3. Rakenteen purku** | Ymmärrä rakenne | Käytä GitHub Copilotia tutkiaksesi mallin arkkitehtuuria, Bicep-tiedostoja ja koodin järjestelyä | 30 min |
| **4. Konfigurointi** | Syväsukellus azure.yaml:iin | Hallitse `azure.yaml`-konfigurointi, elinkaarikoukut ja ympäristömuuttujat | 30 min |
| **5. Mukauttaminen** | Tee siitä oma | Ota käyttöön AI-haku, jäljitys, arviointi ja mukauta tilanteeseesi | 45 min |
| **6. Resurssien poisto** | Siivoa | Poista resurssit turvallisesti komennolla `azd down --purge` | 15 min |
| **7. Yhteenveto** | Seuraavat askeleet | Käy läpi saavutukset, keskeiset käsitteet ja jatka oppimispolkuasi | 15 min |

**Työpajan kulku:**
```
Introduction → Selection → Validation → Deconstruction → Configuration → Customization → Teardown → Wrap-up
     ↓            ↓           ↓              ↓               ↓              ↓            ↓           ↓
  Overview    Find the     Deploy &      Explore        Master         Customize     Clean up    Review &
             right        verify        code &        azure.yaml      for your      resources   next steps
             template                   structure                     scenario
```

#### 🚀 Aloittaminen työpajan kanssa
```bash
# Vaihtoehto 1: GitHub Codespaces (Suositeltu)
# Napsauta repositoriossa "Code" → "Create codespace on main"

# Vaihtoehto 2: Paikallinen kehitys
git clone https://github.com/microsoft/azd-for-beginners.git
cd azd-for-beginners/workshop
# Noudata asennusohjeita tiedostossa workshop/README.md
```

#### 🎯 Työpajan oppimistulokset
Työpajan suorittamalla osallistujat:
- **Ota tuotantokäyttöön AI-sovelluksia**: Käytä AZD:tä yhdessä Microsoft Foundry -palveluiden kanssa
- **Hallinnoi moni-agentti-arkkitehtuureja**: Toteuta koordinoituja AI-agenttiratkaisuja
- **Ota käyttöön tietoturvan parhaita käytäntöjä**: Konfiguroi todennus ja käyttöoikeudet
- **Optimoi skaalautuvuutta varten**: Suunnittele kustannustehokkaita, suorituskykyisiä käyttöönottoja
- **Vianmääritys käyttöönotossa**: Ratkaise yleisiä ongelmia itsenäisesti

#### 📖 Työpajan resurssit
- **🎥 Interaktiivinen opas**: [Työpajamateriaalit](workshop/README.md) - Selainpohjainen oppimisympäristö
- **📋 Moduuli kohtaiset ohjeet**:
  - [0. Johdanto](workshop/docs/instructions/0-Introduction.md) - Työpajan yleiskatsaus ja tavoitteet
  - [1. Valinta](workshop/docs/instructions/1-Select-AI-Template.md) - Etsi ja valitse AI-malleja
  - [2. Vahvistus](workshop/docs/instructions/2-Validate-AI-Template.md) - Ota malli käyttöön ja varmista toiminta
  - [3. Rakenteen purku](workshop/docs/instructions/3-Deconstruct-AI-Template.md) - Tutki mallin arkkitehtuuria
  - [4. Konfigurointi](workshop/docs/instructions/4-Configure-AI-Template.md) - Hallitse azure.yaml
  - [5. Mukauttaminen](workshop/docs/instructions/5-Customize-AI-Template.md) - Mukauta skenaariollesi
  - [6. Resurssien poisto](workshop/docs/instructions/6-Teardown-Infrastructure.md) - Siivoa resurssit
  - [7. Yhteenveto](workshop/docs/instructions/7-Wrap-up.md) - Kertaaminen ja seuraavat askeleet
- **🛠️ AI-työpajalab**: [AI Workshop Lab](docs/chapter-02-ai-development/ai-workshop-lab.md) - AI-keskeiset harjoitukset
- **💡 Pika-aloitus**: [Workshop Setup Guide](workshop/README.md#quick-start) - Ympäristön konfigurointi

**Täydellinen kohde**: Yrityskoulutus, yliopistokurssit, itsenäinen opiskelu ja kehittäjäbootcampit.

---

## 📖 Syväsukellus: AZD:n ominaisuudet

Perusteiden lisäksi AZD tarjoaa tehokkaita ominaisuuksia tuotantokäyttöön:

- **Mallipohjaiset käyttöönotot** - Käytä valmiita malleja yleisiin sovelluskuvioihin
- **Infrastruktuuri koodina** - Hallitse Azure-resursseja Bicepillä tai Terraformilla  
- **Integroitu työnkulut** - Varusta, ota käyttöön ja valvo sovelluksia saumattomasti
- **Kehittäjäystävällinen** - Optimoitu kehittäjän tuottavuudelle ja kokemukselle

### **AZD + Microsoft Foundry: Täydellinen AI-käyttöönottoihin**

**Miksi AZD AI-ratkaisuille?** AZD vastaa AI-kehittäjien tärkeimpiin haasteisiin:

- **AI-valmiit mallit** - Esikonfiguroidut mallit Azure OpenAI:lle, Cognitive Services:lle ja ML-kuormille
- **Turvalliset AI-käyttöönotot** - Sisäänrakennetut turvallisuusmallit AI-palveluille, API-avaimille ja mallipäätepisteille  
- **Tuotannon AI-mallit** - Parhaat käytännöt skaalautuviin, kustannustehokkaisiin AI-sovelluksiin
- **End-to-End AI-työnkulut** - Mallin kehityksestä tuotantoon seurantaan
- **Kustannusoptimointi** - Älykäs resurssien allokointi ja skalauksen strategiat AI-kuormille
- **Microsoft Foundry -integraatio** - Saumaton yhteys Microsoft Foundryn malliluetteloon ja päätepisteisiin

---

## 🎯 Mallit ja esimerkkikirjasto

### Esittelyssä: Microsoft Foundry -mallit
**Aloita täältä, jos otat AI-sovelluksia käyttöön!**

> **Huom:** Nämä mallit esittelevät erilaisia AI-kuvioita. Osa on ulkoisia Azure Samples -esimerkkejä, osa paikallisia toteutuksia.

| Template | Chapter | Complexity | Services | Type |
|----------|---------|------------|----------|------|
| [**Aloita AI-chatin kanssa**](https://github.com/Azure-Samples/get-started-with-ai-chat) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Model Inference API + Azure AI Search + Azure Container Apps + Application Insights | External |
| [**Aloita AI-agenttien kanssa**](https://github.com/Azure-Samples/get-started-with-ai-agents) | Luku 2 | ⭐⭐ | Foundry Agents + AzureOpenAI + Azure AI Search + Azure Container Apps + Application Insights| External |
| [**Azure Search + OpenAI Demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | AzureOpenAI + Azure AI Search + App Service + Storage | External |
| [**OpenAI Chat App Quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | AzureOpenAI + Container Apps + Application Insights | External |
| [**Agent OpenAI Python Prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | AzureOpenAI + Azure Functions + Prompty | External |
| [**Contoso Chat RAG**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Cosmos DB + Container Apps | External |
| [**Vähittäiskaupan moni-agenttiratkaisu**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | AzureOpenAI + AI Search + Storage + Container Apps + Cosmos DB | **Paikallinen** |

### Esittelyssä: Täydelliset oppimistilanteet
**Tuotantovalmiit sovellusmallit kytkettynä oppimislukuihin**

| Template | Learning Chapter | Complexity | Key Learning |
|----------|------------------|------------|--------------|
| [**openai-chat-app-quickstart**](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Luku 2 | ⭐ | Perus AI-käyttöönoton mallit |
| [**azure-search-openai-demo**](https://github.com/Azure-Samples/azure-search-openai-demo) | Luku 2 | ⭐⭐ | RAG-toteutus Azure AI Searchin kanssa |
| [**ai-document-processing**](https://github.com/Azure-Samples/ai-document-processing) | Luku 4 | ⭐⭐ | Document Intelligence -integraatio |
| [**agent-openai-python-prompty**](https://github.com/Azure-Samples/agent-openai-python-prompty) | Luku 5 | ⭐⭐⭐ | Agent-kehys ja function calling |
| [**contoso-chat**](https://github.com/Azure-Samples/contoso-chat) | Luku 8 | ⭐⭐⭐ | Yritystason AI-orchestrointi |
| [**retail-multi-agent-solution**](examples/retail-scenario.md) | Luku 5 | ⭐⭐⭐⭐ | Moni-agentti-arkkitehtuuri, asiakas- ja varastoagentit |

### Oppiminen esimerkkien kautta

> **📌 Paikalliset vs. ulkoiset esimerkit:**  
> **Paikalliset esimerkit** (tässä repossa) = Valmiita käytettäväksi heti  
> **Ulkoiset esimerkit** (Azure Samples) = Klonattavissa linkitetyistä reposta

#### Paikalliset esimerkit (Valmiit käytettäväksi)
- [**Vähittäiskaupan moni-agenttiratkaisu**](examples/retail-scenario.md) - Täydellinen tuotantovalmiina toteutus ARM-malleilla
  - Moni-agentti-arkkitehtuuri (Asiakas + Varasto-agentit)
  - Kattava valvonta ja evaluointi
  - Yhden napsautuksen käyttöönotto ARM-mallin kautta

#### Paikalliset esimerkit - Container-sovellukset (luvut 2-5)
**Kattavat konttipohjaiset käyttöönottoesimerkit tässä repossa:**
- [**Container App Examples**](examples/container-app/README.md) - Täydellinen opas konttipohjaisiin käyttöönottoihin
  - [Yksinkertainen Flask API](../../examples/container-app/simple-flask-api) - Perus REST-API, joka tukee scale-to-zero -toimintoa
  - [Mikropalveluarkkitehtuuri](../../examples/container-app/microservices) - Tuotantovalmis monipalveluratkaisu
  - Pika-aloitus, tuotanto ja edistyneet käyttöönotto-kuviot
  - Valvonta, turvallisuus ja kustannusoptimointi

#### Ulkoiset esimerkit - Yksinkertaiset sovellukset (luvut 1-2)
**Kloonaa nämä Azure Samples -repositoriot aloittaaksesi:**
- [Simple Web App - Node.js + MongoDB](https://github.com/Azure-Samples/todo-nodejs-mongo) - Perus käyttöönoton mallit
- [Static Website - React SPA](https://github.com/Azure-Samples/todo-csharp-sql-swa-func) - Staattisen sisällön käyttöönotto
- [Container App - Python Flask](https://github.com/Azure-Samples/container-apps-store-api-microservice) - REST-API:n käyttöönotto

#### Ulkoiset esimerkit - Tietokantaintegraatio (luvut 3-4)  
- [Database App - C# + SQL](https://github.com/Azure-Samples/todo-csharp-sql) - Tietokantayhteyksien mallit
- [Functions + Cosmos DB](https://github.com/Azure-Samples/todo-python-mongo-swa-func) - Serverittömät datatyönkulut

#### Ulkoiset esimerkit - Edistyneet kuviot (luvut 4-8)
- [Java Microservices](https://github.com/Azure-Samples/java-microservices-aca-lab) - Monipalveluarkkitehtuurit
- [Container Apps Jobs](https://github.com/Azure-Samples/container-apps-jobs) - Taustaprosessointi  
- [Enterprise ML Pipeline](https://github.com/Azure-Samples/mlops-v2) - Tuotantovalmiit ML-mallit

### Ulkoiset mallikokoelmat
- [**Official AZD Template Gallery**](https://azure.github.io/awesome-azd/) - Kuratoitu kokoelma virallisista ja yhteisön malleista
- [**Azure Developer CLI Templates**](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates) - Microsoft Learn -mallidokumentaatio
- [**Examples Directory**](examples/README.md) - Paikalliset oppimisesimerkit yksityiskohtaisilla selityksillä

---

## 📚 Oppimateriaalit & viitteet

### Pikaviitteet
- [**Command Cheat Sheet**](resources/cheat-sheet.md) - Keskeiset azd-komennot järjestettynä luvun mukaan
- [**Glossary**](resources/glossary.md) - Azure- ja azd-termistö  
- [**FAQ**](resources/faq.md) - Yleisimmät kysymykset järjestettynä lukujen mukaan
- [**Study Guide**](resources/study-guide.md) - Kattavat harjoitustehtävät

### Käytännön työpajat
- [**AI Workshop Lab**](docs/chapter-02-ai-development/ai-workshop-lab.md) - Tee AI-ratkaisuistasi AZD:llä otettavia (2–3 tuntia)
- [**Interactive Workshop**](workshop/README.md) - 8-moduulinen ohjattu harjoitussarja MkDocsilla ja GitHub Codespacesilla
  - Seuraa: Johdanto → Valinta → Vahvistus → Rakenteen purku → Konfigurointi → Mukauttaminen → Resurssien poisto → Yhteenveto

### Ulkoiset oppimateriaalit
- [Azure Developer CLI Documentation](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

---

## 🔧 Pikainen vianmääritysohje

**Yleiset aloittelijoiden kohtaamat ongelmat ja nopeita ratkaisuja:**

<details>
<summary><strong>❌ "azd: komentoa ei löydy"</strong></summary>

```bash
# Asenna AZD ensin
# Windows (PowerShell):
winget install microsoft.azd

# macOS:
brew tap azure/azd && brew install azd

# Linux:
curl -fsSL https://aka.ms/install-azd.sh | bash

# Varmista asennus
azd version
```
</details>

<details>
<summary><strong>❌ "Tilausta ei löytynyt" tai "Tilausta ei ole asetettu"</strong></summary>

```bash
# Listaa saatavilla olevat tilaukset
az account list --output table

# Aseta oletustilaus
az account set --subscription "<subscription-id-or-name>"

# Aseta AZD-ympäristölle
azd env set AZURE_SUBSCRIPTION_ID "<subscription-id>"

# Tarkista
az account show
```
</details>
<details>
<summary><strong>❌ "InsufficientQuota" tai "Quota exceeded"</strong></summary>

```bash
# Kokeile eri Azure-aluetta
azd env set AZURE_LOCATION "westus2"
azd up

# Tai käytä pienempiä SKUja kehityksessä
# Muokkaa infra/main.parameters.json:
{
  "sku": "B1"  // Instead of "P1V2"
}
```
</details>

<details>
<summary><strong>❌ "azd up" epäonnistuu kesken</strong></summary>

```bash
# Vaihtoehto 1: Puhdista ja yritä uudelleen
azd down --force --purge
azd up

# Vaihtoehto 2: Korjaa vain infrastruktuuri
azd provision

# Vaihtoehto 3: Tarkista yksityiskohtainen tila
azd show

# Vaihtoehto 4: Tarkista lokit Azure Monitorista
azd monitor --logs
```
</details>

<details>
<summary><strong>❌ "Authentication failed" tai "Token expired"</strong></summary>

```bash
# Tunnistaudu uudelleen
az logout
az login

azd auth logout
azd auth login

# Varmista tunnistautuminen
az account show
```
</details>

<details>
<summary><strong>❌ "Resource already exists" tai nimeämiskonfliktit</strong></summary>

```bash
# AZD luo ainutlaatuisia nimiä, mutta jos ristiriita:
azd down --force --purge

# Sitten yritä uudelleen uudella ympäristöllä
azd env new dev-v2
azd up
```
</details>

<details>
<summary><strong>❌ Mallipohjan käyttöönotto kestää liian kauan</strong></summary>

**Normaalit odotusajat:**
- Yksinkertainen web-sovellus: 5–10 minuuttia
- Sovellus tietokannalla: 10–15 minuuttia
- AI-sovellukset: 15–25 minuuttia (OpenAI:n provisiointi on hidasta)

```bash
# Tarkista edistyminen
azd show

# Jos jumissa yli 30 minuuttia, tarkista Azure-portaali:
azd monitor
# Etsi epäonnistuneita käyttöönottoja
```
</details>

<details>
<summary><strong>❌ "Permission denied" tai "Forbidden"</strong></summary>

```bash
# Tarkista Azure-roolisi
az role assignment list --assignee $(az account show --query user.name -o tsv)

# Tarvitset vähintään "Contributor"-roolin
# Pyydä Azure-järjestelmänvalvojaasi myöntämään:
# - Contributor (resursseille)
# - User Access Administrator (roolien myöntämistä varten)
```
</details>

<details>
<summary><strong>❌ Käyttöönotetun sovelluksen URL-osoitetta ei löydy</strong></summary>

```bash
# Näytä kaikki palveluiden päätepisteet
azd show

# Tai avaa Azure-portaali
azd monitor

# Tarkista tietty palvelu
azd env get-values
# Etsi *_URL-muuttujia
```
</details>

### 📚 Kattavat vianmäärityslähteet

- **Yleisimmät ongelmat -opas:** [Yksityiskohtaiset ratkaisut](docs/chapter-07-troubleshooting/common-issues.md)
- **AI-kohtaiset ongelmat:** [AI-vianmääritys](docs/chapter-07-troubleshooting/ai-troubleshooting.md)
- **Vianetsinnän opas:** [Vaiheittainen vianetsintä](docs/chapter-07-troubleshooting/debugging.md)
- **Hanki apua:** [Azure Discord](https://discord.gg/microsoft-azure) #azure-developer-cli

---

## 🎓 Kurssin suorittaminen ja sertifiointi

### Edistymisen seuranta
Seuraa oppimisesi edistymistä jokaisen luvun kohdalla:

- [ ] **Luku 1**: Perusteet & Pika-aloitus ✅
- [ ] **Luku 2**: AI-lähtöinen kehitys ✅  
- [ ] **Luku 3**: Konfigurointi & todennus ✅
- [ ] **Luku 4**: Infrastruktuuri koodina & käyttöönotto ✅
- [ ] **Luku 5**: Moniagenttiset AI-ratkaisut ✅
- [ ] **Luku 6**: Käyttöönottoa edeltävä validointi & suunnittelu ✅
- [ ] **Luku 7**: Vianmääritys & vianetsintä ✅
- [ ] **Luku 8**: Tuotanto & yritystason mallit ✅

### Oppimisen varmistus
Kun olet suorittanut jokaisen luvun, varmista tietosi seuraavasti:
1. **Käytännön harjoitus**: Suorita luvun käytännön käyttöönotto
2. **Tiedon tarkistus**: Käy läpi kyseisen luvun UKK-osio
3. **Yhteisökeskustelu**: Jaa kokemuksesi Azure Discordissa
4. **Seuraava luku**: Siirry seuraavalle vaativuustasolle

### Kurssin suorittamisen edut
Kun olet suorittanut kaikki luvut, sinulla on:
- **Tuotantokokemus**: Olet ottanut käyttöön todellisia AI-sovelluksia Azureen
- **Ammatilliset taidot**: Yritystason käyttöönotto-osaaminen  
- **Yhteisön tunnustus**: Aktiivinen jäsen Azure-kehittäjäyhteisössä
- **Ura-edut**: Kysytyt AZD- ja AI-käyttöönotto-osaamiset

---

## 🤝 Yhteisö ja tuki

### Hanki apua ja tukea
- **Tekniset ongelmat**: [Ilmoita bugeista ja pyydä ominaisuuksia](https://github.com/microsoft/azd-for-beginners/issues)
- **Oppimiskysymykset**: [Microsoft Azure Discord -yhteisö](https://discord.gg/microsoft-azure) ja [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **AI-kohtainen apu**: Liity [![Microsoft Foundry Discord](https://dcbadge.limes.pink/api/server/nTYy5BXMWG)](https://discord.gg/nTYy5BXMWG)
- **Dokumentaatio**: [Virallinen Azure Developer CLI -dokumentaatio](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

### Yhteisön näkemykset Microsoft Foundry Discordista

**Viimeaikaiset äänestystulokset #Azure-kanavalta:**
- **45 %** kehittäjistä haluaa käyttää AZD:ta AI-työkuormiin
- **Suurimmat haasteet**: Monipalveluiden käyttöönotot, tunnusten hallinta, tuotantovalmius  
- **Eniten pyydetyt**: AI-kohtaiset mallipohjat, vianmääritysoppaat, parhaat käytännöt

**Liity yhteisöömme, jotta voit:**
- Jaa AZD- ja AI-kokemuksiasi ja saa apua
- Pääset käsiksi uusiin AI-mallipohjien esikatseluihin
- Osallistu AI-käyttöönoton parhaiden käytäntöjen kehittämiseen
- Vaikuta tulevien AI- ja AZD-ominaisuuksien kehitykseen

### Osallistuminen kurssin kehittämiseen
Otamme mielellämme vastaan panoksia! Lue meidän [Contributing Guide](CONTRIBUTING.md) saadaksesi lisätietoja:
- **Sisällön parannukset**: Paranna olemassa olevia lukuja ja esimerkkejä
- **Uusia esimerkkejä**: Lisää todellisen maailman skenaarioita ja mallipohjia  
- **Käännökset**: Auta ylläpitämään monikielistä tukea
- **Virheilmoitukset**: Paranna tarkkuutta ja selkeyttä
- **Yhteisön säännöt**: Noudata osallistavia yhteisön ohjeita

---

## 📄 Kurssitiedot

### Lisenssi
Tämä projekti on lisensioitu MIT-lisenssillä - katso [LICENSE](../../LICENSE) tiedostosta lisätiedot.

### Asiaankuuluvat Microsoftin oppimateriaalit

Tiimimme tuottaa myös muita kattavia oppimiskursseja:

<!-- CO-OP TRANSLATOR OTHER COURSES START -->
### LangChain
[![LangChain4j aloittelijoille](https://img.shields.io/badge/LangChain4j%20for%20Beginners-22C55E?style=for-the-badge&&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchain4j-for-beginners)
[![LangChain.js aloittelijoille](https://img.shields.io/badge/LangChain.js%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://aka.ms/langchainjs-for-beginners?WT.mc_id=m365-94501-dwahlin)
[![LangChain aloittelijoille](https://img.shields.io/badge/LangChain%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=0553D6)](https://github.com/microsoft/langchain-for-beginners?WT.mc_id=m365-94501-dwahlin)
---

### Azure / Edge / MCP / Agentit
[![AZD aloittelijoille](https://img.shields.io/badge/AZD%20for%20Beginners-0078D4?style=for-the-badge&labelColor=E5E7EB&color=0078D4)](https://github.com/microsoft/AZD-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Edge AI aloittelijoille](https://img.shields.io/badge/Edge%20AI%20for%20Beginners-00B8E4?style=for-the-badge&labelColor=E5E7EB&color=00B8E4)](https://github.com/microsoft/edgeai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![MCP aloittelijoille](https://img.shields.io/badge/MCP%20for%20Beginners-009688?style=for-the-badge&labelColor=E5E7EB&color=009688)](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
[![AI-agentit aloittelijoille](https://img.shields.io/badge/AI%20Agents%20for%20Beginners-00C49A?style=for-the-badge&labelColor=E5E7EB&color=00C49A)](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Generatiivinen AI -sarja
[![Generatiivinen AI aloittelijoille](https://img.shields.io/badge/Generative%20AI%20for%20Beginners-8B5CF6?style=for-the-badge&labelColor=E5E7EB&color=8B5CF6)](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (.NET)](https://img.shields.io/badge/Generative%20AI%20(.NET)-9333EA?style=for-the-badge&labelColor=E5E7EB&color=9333EA)](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (Java)](https://img.shields.io/badge/Generative%20AI%20(Java)-C084FC?style=for-the-badge&labelColor=E5E7EB&color=C084FC)](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
[![Generatiivinen AI (JavaScript)](https://img.shields.io/badge/Generative%20AI%20(JavaScript)-E879F9?style=for-the-badge&labelColor=E5E7EB&color=E879F9)](https://github.com/microsoft/generative-ai-with-javascript?WT.mc_id=academic-105485-koreyst)

---
 
### Perusopetus
[![ML aloittelijoille](https://img.shields.io/badge/ML%20for%20Beginners-22C55E?style=for-the-badge&labelColor=E5E7EB&color=22C55E)](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
[![Data-analytiikka aloittelijoille](https://img.shields.io/badge/Data%20Science%20for%20Beginners-84CC16?style=for-the-badge&labelColor=E5E7EB&color=84CC16)](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
[![AI aloittelijoille](https://img.shields.io/badge/AI%20for%20Beginners-A3E635?style=for-the-badge&labelColor=E5E7EB&color=A3E635)](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
[![Kyberturvallisuus aloittelijoille](https://img.shields.io/badge/Cybersecurity%20for%20Beginners-F97316?style=for-the-badge&labelColor=E5E7EB&color=F97316)](https://github.com/microsoft/Security-101?WT.mc_id=academic-96948-sayoung)
[![Web-kehitys aloittelijoille](https://img.shields.io/badge/Web%20Dev%20for%20Beginners-EC4899?style=for-the-badge&labelColor=E5E7EB&color=EC4899)](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
[![IoT aloittelijoille](https://img.shields.io/badge/IoT%20for%20Beginners-14B8A6?style=for-the-badge&labelColor=E5E7EB&color=14B8A6)](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
[![XR-kehitys aloittelijoille](https://img.shields.io/badge/XR%20Development%20for%20Beginners-38BDF8?style=for-the-badge&labelColor=E5E7EB&color=38BDF8)](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)

---
 
### Copilot-sarja
[![Copilot AI -pariohjelmointiin](https://img.shields.io/badge/Copilot%20for%20AI%20Paired%20Programming-FACC15?style=for-the-badge&labelColor=E5E7EB&color=FACC15)](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
[![Copilot C#/.NET:lle](https://img.shields.io/badge/Copilot%20for%20C%23/.NET-FBBF24?style=for-the-badge&labelColor=E5E7EB&color=FBBF24)](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
[![Copilot-seikkailu](https://img.shields.io/badge/Copilot%20Adventure-FDE68A?style=for-the-badge&labelColor=E5E7EB&color=FDE68A)](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)
<!-- CO-OP TRANSLATOR OTHER COURSES END -->

---
## 🗺️ Kurssin navigointi

**🚀 Valmis aloittamaan oppimisen?**

**Aloittelijat**: Aloita tästä [Luku 1: Perusta ja Pika-aloitus](../..)  
**AI-kehittäjät**: Siirry kohtaan [Luku 2: AI-lähtöinen kehitys](../..)  
**Kokeneet kehittäjät**: Aloita tästä [Luku 3: Konfigurointi ja Todennus](../..)

**Seuraavat askeleet**: [Aloita Luku 1 - AZD Basics](docs/chapter-01-foundation/azd-basics.md) →

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty käyttämällä tekoälykäännöspalvelua Co-op Translator (https://github.com/Azure/co-op-translator). Pyrimme varmistamaan tarkkuuden, mutta huomioithan, että automaattisissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää määräävänä lähteenä. Tärkeiden tietojen osalta suositellaan ammattimaisen ihmiskääntäjän käyttöä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai virhetulkintojen seurauksista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->