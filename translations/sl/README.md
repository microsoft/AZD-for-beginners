<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T10:17:08+00:00",
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

#### Podprto prek GitHub Action (Avtomatizirano in vedno posodobljeno)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](./README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)

**Če želite dodati dodatne jezike, so podprti jeziki navedeni [tukaj](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**

## Uvod

Dobrodošli v celovitem vodniku za Azure Developer CLI (azd). Ta repozitorij je zasnovan za pomoč razvijalcem na vseh ravneh, od študentov do profesionalnih razvijalcev, pri učenju in obvladovanju Azure Developer CLI za učinkovite oblačne implementacije. Ta strukturiran učni vir ponuja praktične izkušnje z oblačnimi implementacijami Azure, odpravljanjem pogostih težav in izvajanjem najboljših praks za uspešne implementacije predlog AZD.

## Cilji učenja

Z delom skozi ta repozitorij boste:
- Obvladali osnove in ključne koncepte Azure Developer CLI
- Naučili se implementirati in zagotavljati Azure vire z uporabo Infrastructure as Code
- Razvili veščine odpravljanja težav pri pogostih težavah z implementacijo AZD
- Razumeli preverjanje pred implementacijo in načrtovanje zmogljivosti
- Izvajali varnostne najboljše prakse in strategije optimizacije stroškov
- Pridobili samozavest pri implementaciji aplikacij, pripravljenih za produkcijo, v Azure

## Rezultati učenja

Po zaključku tega tečaja boste sposobni:
- Uspešno namestiti, konfigurirati in uporabljati Azure Developer CLI
- Ustvariti in implementirati aplikacije z uporabo predlog AZD
- Odpravljati težave z avtentikacijo, infrastrukturo in implementacijo
- Izvesti preverjanja pred implementacijo, vključno z načrtovanjem zmogljivosti in izbiro SKU
- Izvajati najboljše prakse za spremljanje, varnost in upravljanje stroškov
- Integrirati delovne tokove AZD v CI/CD pipeline

## Kazalo vsebine

- [Kaj je Azure Developer CLI?](../..)
- [Hitri začetek](../..)
- [Dokumentacija](../..)
- [Primeri in predloge](../..)
- [Viri](../..)
- [Prispevanje](../..)

## Kaj je Azure Developer CLI?

Azure Developer CLI (azd) je ukazna vrstica, osredotočena na razvijalce, ki pospeši proces gradnje in implementacije aplikacij v Azure. Ponuja:

- **Implementacije na osnovi predlog** - Uporaba vnaprej pripravljenih predlog za pogoste vzorce aplikacij
- **Infrastructure as Code** - Upravljanje Azure virov z uporabo Bicep ali Terraform
- **Integrirani delovni tokovi** - Brezhibno zagotavljanje, implementacija in spremljanje aplikacij
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

### Vaša prva implementacija
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```

## Dokumentacija

### Začetek
- [**Osnove AZD**](docs/getting-started/azd-basics.md) - Ključni koncepti in terminologija
- [**Namestitev in nastavitev**](docs/getting-started/installation.md) - Vodniki za namestitev glede na platformo
- [**Konfiguracija**](docs/getting-started/configuration.md) - Nastavitev okolja in avtentikacija
- [**Vaš prvi projekt**](docs/getting-started/first-project.md) - Korak za korakom vadnica

### Implementacija in zagotavljanje
- [**Vodnik za implementacijo**](docs/deployment/deployment-guide.md) - Celotni delovni tokovi implementacije
- [**Zagotavljanje virov**](docs/deployment/provisioning.md) - Upravljanje Azure virov

### Preverjanja pred implementacijo
- [**Načrtovanje zmogljivosti**](docs/pre-deployment/capacity-planning.md) - Validacija zmogljivosti Azure virov
- [**Izbira SKU**](docs/pre-deployment/sku-selection.md) - Izbira ustreznih SKU-jev Azure
- [**Preverjanja pred implementacijo**](docs/pre-deployment/preflight-checks.md) - Avtomatizirani validacijski skripti

### Odpravljanje težav
- [**Pogoste težave**](docs/troubleshooting/common-issues.md) - Pogosto srečane težave in rešitve
- [**Vodnik za odpravljanje težav**](docs/troubleshooting/debugging.md) - Korak za korakom strategije odpravljanja težav

## Primeri in predloge
- [**Primeri**]([examples/README.md) - Praktični primeri, predloge in scenariji iz resničnega sveta za pomoč pri učenju Azure Developer CLI skozi praktično vadbo. Vsak primer vključuje popolno delujočo kodo, infrastrukturne predloge in podrobna navodila za različne arhitekture aplikacij in vzorce implementacije.

### Praktična delavnica
- [**AZD Za Začetnike**](workshop/README.md) - Ta delavnica se osredotoča na predlogo Get Started with AI Agents AZD in ponuja praktične najboljše prakse za implementacijo Azure AI storitev z uporabo AZD

## Viri

### Hitre reference
- [**Seznam ukazov**](resources/cheat-sheet.md) - Ključni azd ukazi
- [**Slovar**](resources/glossary.md) - Terminologija Azure in azd
- [**Pogosta vprašanja**](resources/faq.md) - Pogosta vprašanja
- [**Vodnik za študij**](resources/study-guide.md) - Celoviti učni cilji in vadbene naloge

### Zunanji viri
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)
- [Azure Pricing Calculator](https://azure.microsoft.com/pricing/calculator/)
- [Azure Status](https://status.azure.com/)

## Učna pot

### Za študente in začetnike
1. Začnite z [Osnovami AZD](docs/getting-started/azd-basics.md)
2. Sledite [Vodniku za namestitev](docs/getting-started/installation.md)
3. Zaključite [Vaš prvi projekt](docs/getting-started/first-project.md)
4. Vadite z [Primerom preproste spletne aplikacije](../../examples/simple-web-app)

### Za razvijalce
1. Preglejte [Vodnik za konfiguracijo](docs/getting-started/configuration.md)
2. Preučite [Vodnik za implementacijo](docs/deployment/deployment-guide.md)
3. Delajte na [Primeru aplikacije z bazo podatkov](../../examples/database-app)
4. Raziščite [Primer aplikacije v kontejnerju](../../examples/container-app)

### Za DevOps inženirje
1. Obvladujte [Zagotavljanje virov](docs/deployment/provisioning.md)
2. Izvedite [Preverjanja pred implementacijo](docs/pre-deployment/preflight-checks.md)
3. Vadite [Načrtovanje zmogljivosti](docs/pre-deployment/capacity-planning.md)
4. Napredni [Primer mikroservisov](../../examples/microservices)

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

Ta projekt je licenciran pod licenco MIT - glejte datoteko [LICENSE](../../LICENSE) za podrobnosti.

## 🎒 Drugi tečaji

Naša ekipa pripravlja tudi druge tečaje! Oglejte si:

- [**NOVO** Model Context Protocol (MCP) Za Začetnike](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Agents Za Začetnike](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativna AI Za Začetnike z uporabo .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)
- [Generativna AI Za Začetnike](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Generativna AI Za Začetnike z uporabo Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)
- [ML Za Začetnike](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)
- [Podatkovna Znanost Za Začetnike](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)
- [AI Za Začetnike](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)
- [Kibernetska Varnost Za Začetnike](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)
- [Spletni Razvoj Za Začetnike](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)
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
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku je treba obravnavati kot avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki bi nastale zaradi uporabe tega prevoda.