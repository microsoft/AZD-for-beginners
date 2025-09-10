<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "3bd0e0644b110276e4364eb753ddcef8",
  "translation_date": "2025-09-10T05:39:41+00:00",
  "source_file": "README.md",
  "language_code": "sl"
}
-->
# AZD Za Začetnike

![AZD-za-začetnike](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.sl.png) 

Sledite tem korakom, da začnete uporabljati te vire:
1. **Forkajte repozitorij**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)
2. **Klonirajte repozitorij**:   `git clone https://github.com/microsoft/azd-for-beginners.git`
3. [**Pridružite se Azure Discord skupnostim in spoznajte strokovnjake ter druge razvijalce**](https://discord.com/invite/ByRwuEEgH4)

### 🌐 Podpora za več jezikov

#### Podprto prek GitHub Action (Avtomatizirano & Vedno posodobljeno)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](./README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Če želite dodati dodatne jezike, so podprti jeziki navedeni [tukaj](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Uvod

Dobrodošli v celovitem vodniku za Azure Developer CLI (azd). Ta repozitorij je zasnovan za pomoč razvijalcem na vseh ravneh, od študentov do profesionalnih razvijalcev, pri učenju in obvladovanju Azure Developer CLI za učinkovite oblačne namestitve. Ta strukturiran učni vir ponuja praktične izkušnje z oblačnimi namestitvami na Azure, odpravljanjem pogostih težav in izvajanjem najboljših praks za uspešne namestitve predlog AZD.

## Cilji učenja

Z delom skozi ta repozitorij boste:
- Obvladali osnove in ključne koncepte Azure Developer CLI
- Naučili se nameščati in zagotavljati Azure vire z uporabo Infrastructure as Code
- Razvili veščine odpravljanja težav pri pogostih težavah z namestitvijo AZD
- Razumeli preverjanje pred namestitvijo in načrtovanje zmogljivosti
- Izvajali varnostne najboljše prakse in strategije optimizacije stroškov
- Pridobili samozavest pri nameščanju aplikacij, pripravljenih za produkcijo, na Azure

## Rezultati učenja

Po zaključku tega tečaja boste sposobni:
- Uspešno namestiti, konfigurirati in uporabljati Azure Developer CLI
- Ustvariti in namestiti aplikacije z uporabo predlog AZD
- Odpravljati težave z avtentikacijo, infrastrukturo in namestitvijo
- Izvajati preverjanja pred namestitvijo, vključno z načrtovanjem zmogljivosti in izbiro SKU
- Izvajati najboljše prakse za spremljanje, varnost in upravljanje stroškov
- Integrirati delovne tokove AZD v CI/CD pipeline

## Kazalo vsebine

- [Kaj je Azure Developer CLI?](../..)
- [Hitri začetek](../..)
- [Dokumentacija](../..)
- [Primeri & Predloge](../..)
- [Viri](../..)
- [Prispevanje](../..)

## Kaj je Azure Developer CLI?

Azure Developer CLI (azd) je ukazna vrstica, osredotočena na razvijalce, ki pospeši proces gradnje in nameščanja aplikacij na Azure. Ponuja:

- **Namestitve na osnovi predlog** - Uporaba predhodno pripravljenih predlog za pogoste vzorce aplikacij
- **Infrastructure as Code** - Upravljanje Azure virov z uporabo Bicep ali Terraform
- **Integrirani delovni tokovi** - Brezhibno zagotavljanje, nameščanje in spremljanje aplikacij
- **Prijazno do razvijalcev** - Optimizirano za produktivnost in izkušnjo razvijalcev

## Hitri začetek

### Predpogoji
- Azure naročnina
- Nameščen Azure CLI
- Git (za kloniranje predlog)

### Namestitev
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```

### Vaša prva namestitev
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Dokumentacija

### Začetek
- [**Osnove AZD**](docs/getting-started/azd-basics.md) - Ključni koncepti in terminologija
- [**Namestitev & Nastavitev**](docs/getting-started/installation.md) - Vodniki za namestitev glede na platformo
- [**Konfiguracija**](docs/getting-started/configuration.md) - Nastavitev okolja in avtentikacija
- [**Vaš prvi projekt**](docs/getting-started/first-project.md) - Korak za korakom vadnica

### Namestitev & Zagotavljanje
- [**Vodnik za namestitev**](docs/deployment/deployment-guide.md) - Celotni delovni tokovi namestitve
- [**Zagotavljanje virov**](docs/deployment/provisioning.md) - Upravljanje Azure virov

### Preverjanja pred namestitvijo
- [**Načrtovanje zmogljivosti**](docs/pre-deployment/capacity-planning.md) - Validacija zmogljivosti Azure virov
- [**Izbira SKU**](docs/pre-deployment/sku-selection.md) - Izbira ustreznih SKU za Azure
- [**Pre-flight preverjanja**](docs/pre-deployment/preflight-checks.md) - Avtomatizirani validacijski skripti

### Odpravljanje težav
- [**Pogoste težave**](docs/troubleshooting/common-issues.md) - Pogosto srečane težave in rešitve
- [**Vodnik za odpravljanje težav**](docs/troubleshooting/debugging.md) - Korak za korakom strategije odpravljanja težav

## Primeri & Predloge

### Začetne predloge
- [**Preprosta spletna aplikacija**](../../examples/simple-web-app) - Osnovna namestitev Node.js spletne aplikacije
- [**Statična spletna stran**](../../examples/static-website) - Gostovanje statične spletne strani na Azure Storage
- [**Aplikacija v kontejnerju**](../../examples/container-app) - Namestitev aplikacije v kontejnerju
- [**Aplikacija z bazo podatkov**](../../examples/database-app) - Spletna aplikacija z integracijo baze podatkov

### Napredni scenariji
- [**Mikrostoritve**](../../examples/microservices) - Arhitektura aplikacije z več storitvami
- [**Serverless funkcije**](../../examples/serverless-function) - Namestitev Azure Functions
- [**Primeri konfiguracij**](../../examples/configurations) - Ponovno uporabni vzorci konfiguracij

## Viri

### Hitri referenčni vodiči
- [**Seznam ukazov**](resources/cheat-sheet.md) - Ključni azd ukazi
- [**Glosar**](resources/glossary.md) - Terminologija Azure in azd
- [**Pogosta vprašanja**](resources/faq.md) - Pogosta vprašanja
- [**Učni vodič**](resources/study-guide.md) - Celoviti učni cilji in vadbene naloge

### Zunanji viri
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

## Učna pot

### Za študente & začetnike
1. Začnite z [Osnovami AZD](docs/getting-started/azd-basics.md)
2. Sledite [Vodniku za namestitev](docs/getting-started/installation.md)
3. Zaključite [Vaš prvi projekt](docs/getting-started/first-project.md)
4. Vadite s [Primerom preproste spletne aplikacije](../../examples/simple-web-app)

### Za razvijalce
1. Preglejte [Vodnik za konfiguracijo](docs/getting-started/configuration.md)
2. Preučite [Vodnik za namestitev](docs/deployment/deployment-guide.md)
3. Delajte na [Primeru aplikacije z bazo podatkov](../../examples/database-app)
4. Raziščite [Primer aplikacije v kontejnerju](../../examples/container-app)

### Za DevOps inženirje
1. Obvladujte [Zagotavljanje virov](docs/deployment/provisioning.md)
2. Izvedite [Pre-flight preverjanja](docs/pre-deployment/preflight-checks.md)
3. Vadite [Načrtovanje zmogljivosti](docs/pre-deployment/capacity-planning.md)
4. Napredni [Primer mikrostoritev](../../examples/microservices)

## Prispevanje

Veseli smo prispevkov! Prosimo, preberite naš [Vodnik za prispevanje](CONTRIBUTING.md) za podrobnosti o:
- Kako oddati težave in zahteve za funkcije
- Smernice za prispevanje kode
- Izboljšave dokumentacije
- Standardi skupnosti

## Podpora

- **Težave**: [Prijavite napake in zahtevajte funkcije](https://github.com/microsoft/azd-for-beginners/issues)
- **Razprave**: [Microsoft Azure Discord skupnost Q&A in razprave](https://discord.gg/microsoft-azure)
- **E-pošta**: Za zasebne poizvedbe
- **Microsoft Learn**: [Uradna dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)

## Licenca

Ta projekt je licenciran pod MIT licenco - glejte datoteko [LICENSE](../../LICENSE) za podrobnosti.

## 🎒 Drugi tečaji

Naša ekipa pripravlja tudi druge tečaje! Oglejte si:

- [**NOVO** Model Context Protocol (MCP) Za Začetnike](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agenti za Začetnike](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativna AI za Začetnike z uporabo .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativna AI za Začetnike](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativna AI za Začetnike z uporabo Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML za Začetnike](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Podatkovna Znanost za Začetnike](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI za Začetnike](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kibernetska Varnost za Začetnike](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Spletni razvoj za začetnike](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
- [IoT za začetnike](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [Razvoj XR za začetnike](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Obvladovanje GitHub Copilot za AI programiranje v paru](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Obvladovanje GitHub Copilot za razvijalce C#/.NET](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Izberi svojo Copilot pustolovščino](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigacija**
- **Naslednja lekcija**: [Osnove AZD](docs/getting-started/azd-basics.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitna nesporazumevanja ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.