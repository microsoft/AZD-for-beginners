<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T10:16:18+00:00",
  "source_file": "README.md",
  "language_code": "hr"
}
-->
# AZD Za Početnike

![AZD-za-početnike](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.hr.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Slijedite ove korake kako biste započeli korištenje ovih resursa:  
1. **Forkajte repozitorij**: Kliknite [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Klonirajte repozitorij**: `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Pridružite se Azure Discord zajednicama i upoznajte stručnjake i kolege developere**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Podrška za više jezika

#### Podržano putem GitHub Action (Automatizirano i uvijek ažurirano)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](../no/README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](./README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Ako želite dodati dodatne jezike, podržani jezici navedeni su [ovdje](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Uvod

Dobrodošli u sveobuhvatan vodič za Azure Developer CLI (azd). Ovaj repozitorij osmišljen je kako bi pomogao developerima svih razina, od studenata do profesionalaca, da nauče i savladaju Azure Developer CLI za učinkovite implementacije u oblaku. Ovaj strukturirani resurs za učenje pruža praktično iskustvo s implementacijama u Azure oblaku, rješavanjem uobičajenih problema i primjenom najboljih praksi za uspješne implementacije AZD predložaka.

## Ciljevi učenja

Radom kroz ovaj repozitorij, naučit ćete:  
- Osnove i ključne koncepte Azure Developer CLI  
- Kako implementirati i osigurati Azure resurse koristeći Infrastructure as Code  
- Razviti vještine rješavanja problema vezanih uz AZD implementacije  
- Razumjeti provjere prije implementacije i planiranje kapaciteta  
- Primijeniti najbolje prakse za sigurnost i optimizaciju troškova  
- Steći samopouzdanje u implementaciji aplikacija spremnih za produkciju na Azure  

## Ishodi učenja

Nakon završetka ovog tečaja, moći ćete:  
- Uspješno instalirati, konfigurirati i koristiti Azure Developer CLI  
- Kreirati i implementirati aplikacije koristeći AZD predloške  
- Rješavati probleme vezane uz autentifikaciju, infrastrukturu i implementaciju  
- Provoditi provjere prije implementacije, uključujući planiranje kapaciteta i odabir SKU-a  
- Primijeniti najbolje prakse za praćenje, sigurnost i upravljanje troškovima  
- Integrirati AZD radne procese u CI/CD pipeline  

## Sadržaj

- [Što je Azure Developer CLI?](../..)  
- [Brzi početak](../..)  
- [Dokumentacija](../..)  
- [Primjeri i predlošci](../..)  
- [Resursi](../..)  
- [Doprinos](../..)  

## Što je Azure Developer CLI?

Azure Developer CLI (azd) je sučelje naredbenog retka usmjereno na developere koje ubrzava proces izrade i implementacije aplikacija na Azure. Pruža:  

- **Implementacije temeljene na predlošcima** - Koristite unaprijed izrađene predloške za uobičajene aplikacijske obrasce  
- **Infrastructure as Code** - Upravljajte Azure resursima koristeći Bicep ili Terraform  
- **Integrirani radni procesi** - Jednostavno osigurajte, implementirajte i pratite aplikacije  
- **Prilagođeno developerima** - Optimizirano za produktivnost i iskustvo developera  

## Brzi početak

### Preduvjeti  
- Azure pretplata  
- Instaliran Azure CLI  
- Git (za kloniranje predložaka)  

### Instalacija  
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

### Početak  
- [**Osnove AZD-a**](docs/getting-started/azd-basics.md) - Ključni koncepti i terminologija  
- [**Instalacija i postavljanje**](docs/getting-started/installation.md) - Vodiči za instalaciju specifični za platformu  
- [**Konfiguracija**](docs/getting-started/configuration.md) - Postavljanje okruženja i autentifikacija  
- [**Vaš prvi projekt**](docs/getting-started/first-project.md) - Korak-po-korak vodič  

### Implementacija i osiguranje  
- [**Vodič za implementaciju**](docs/deployment/deployment-guide.md) - Kompletni radni procesi implementacije  
- [**Osiguranje resursa**](docs/deployment/provisioning.md) - Upravljanje Azure resursima  

### Provjere prije implementacije  
- [**Planiranje kapaciteta**](docs/pre-deployment/capacity-planning.md) - Validacija kapaciteta Azure resursa  
- [**Odabir SKU-a**](docs/pre-deployment/sku-selection.md) - Odabir pravih Azure SKU-ova  
- [**Provjere prije implementacije**](docs/pre-deployment/preflight-checks.md) - Automatizirani validacijski skripti  

### Rješavanje problema  
- [**Uobičajeni problemi**](docs/troubleshooting/common-issues.md) - Često susretani problemi i rješenja  
- [**Vodič za otklanjanje grešaka**](docs/troubleshooting/debugging.md) - Strategije otklanjanja grešaka korak-po-korak  

## Primjeri i predlošci  
- [**Primjeri**](examples/README.md) - Praktični primjeri, predlošci i scenariji iz stvarnog svijeta koji će vam pomoći da naučite Azure Developer CLI kroz praktičnu primjenu. Svaki primjer uključuje kompletan radni kod, infrastrukturne predloške i detaljne upute za različite arhitekture aplikacija i obrasce implementacije.  

### Praktična radionica  
- [**AZD Za Početnike**](workshop/README.md) - Ova radionica fokusira se na predložak Get Started with AI Agents AZD i pruža praktične najbolje prakse za implementaciju Azure AI usluga koristeći AZD  

## Resursi

### Brzi referentni materijali  
- [**Popis naredbi**](resources/cheat-sheet.md) - Ključne azd naredbe  
- [**Pojmovnik**](resources/glossary.md) - Terminologija Azure-a i azd-a  
- [**Česta pitanja**](resources/faq.md) - Najčešće postavljana pitanja  
- [**Vodič za učenje**](resources/study-guide.md) - Sveobuhvatni ciljevi učenja i vježbe  

### Vanjski resursi  
- [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Architecture Center](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Kalkulator cijena](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Put učenja

### Za studente i početnike  
1. Započnite s [Osnovama AZD-a](docs/getting-started/azd-basics.md)  
2. Slijedite [Vodič za instalaciju](docs/getting-started/installation.md)  
3. Završite [Vaš prvi projekt](docs/getting-started/first-project.md)  
4. Vježbajte s [Jednostavnim primjerom web aplikacije](../../examples/simple-web-app)  

### Za developere  
1. Pregledajte [Vodič za konfiguraciju](docs/getting-started/configuration.md)  
2. Proučite [Vodič za implementaciju](docs/deployment/deployment-guide.md)  
3. Radite na [Primjeru aplikacije s bazom podataka](../../examples/database-app)  
4. Istražite [Primjer aplikacije s kontejnerima](../../examples/container-app)  

### Za DevOps inženjere  
1. Savladajte [Osiguranje resursa](docs/deployment/provisioning.md)  
2. Provedite [Provjere prije implementacije](docs/pre-deployment/preflight-checks.md)  
3. Vježbajte [Planiranje kapaciteta](docs/pre-deployment/capacity-planning.md)  
4. Napredni [Primjer mikroservisa](../../examples/microservices)  

## Doprinos

Pozdravljamo doprinose! Molimo pročitajte naš [Vodič za doprinos](CONTRIBUTING.md) za detalje o:  
- Kako prijaviti probleme i predložiti značajke  
- Smjernice za doprinos kodu  
- Poboljšanja dokumentacije  
- Standardi zajednice  

## Podrška

- **Problemi**: [Prijavite greške i predložite značajke](https://github.com/microsoft/azd-for-beginners/issues)  
- **Diskusije**: [Microsoft Azure Discord zajednica za pitanja i diskusije](https://discord.gg/microsoft-azure)  
- **Email**: Za privatne upite  
- **Microsoft Learn**: [Službena dokumentacija Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Licenca

Ovaj projekt licenciran je pod MIT licencom - pogledajte [LICENSE](../../LICENSE) datoteku za detalje.  

## 🎒 Ostali tečajevi

Naš tim proizvodi i druge tečajeve! Pogledajte:  

- [**NOVO** Model Context Protocol (MCP) Za Početnike](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents Za Početnike](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativna AI Za Početnike koristeći .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generativna AI Za Početnike](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativna AI Za Početnike koristeći Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML Za Početnike](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science Za Početnike](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Za Početnike](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity Za Početnike](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Web Dev Za Početnike](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT za početnike](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)  
- [XR razvoj za početnike](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Savladavanje GitHub Copilota za AI programiranje u paru](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)  
- [Savladavanje GitHub Copilota za C#/.NET programere](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)  
- [Odaberi svoju Copilot avanturu](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)  

---

**Navigacija**  
- **Sljedeća lekcija**: [Osnove AZD-a](docs/getting-started/azd-basics.md)  

---

**Odricanje od odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za bilo kakva nesporazuma ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.