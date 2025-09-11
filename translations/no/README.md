<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "c0984265b7a9357388f864c19606c80d",
  "translation_date": "2025-09-11T10:05:06+00:00",
  "source_file": "README.md",
  "language_code": "no"
}
-->
# AZD For Nybegynnere

![AZD-for-nybegynnere](../../translated_images/azdbeginners.5527441dd9f7406899cccfc907016b09f9370137543280d95f62ebf23637a2ee.no.png) 

[![GitHub watchers](https://img.shields.io/github/watchers/microsoft/azd-for-beginners.svg?style=social&label=Watch)](https://GitHub.com/microsoft/azd-for-beginners/watchers/?WT.mc_id=academic-105485-koreyst)  
[![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/network/?WT.mc_id=academic-105485-koreyst)  
[![GitHub stars](https://img.shields.io/github/stars/microsoft/azd-for-beginners.svg?style=social&label=Star)](https://GitHub.com/microsoft/azd-for-beginners/stargazers/?WT.mc_id=academic-105485-koreyst)  

[![Azure Discord](https://dcbadge.limes.yellow/api/server/kzRShWzttr)](https://discord.gg/microsoft-azure)  
[![Azure AI Discord](https://dcbadge.limes.pink/api/server/kzRShWzttr)](https://discord.gg/kzRShWzttr)  

Følg disse stegene for å komme i gang med ressursene:  
1. **Fork repositoryen**: Klikk [![GitHub forks](https://img.shields.io/github/forks/microsoft/azd-for-beginners.svg?style=social&label=Fork)](https://GitHub.com/microsoft/azd-for-beginners/fork)  
2. **Klon repositoryen**:   `git clone https://github.com/microsoft/azd-for-beginners.git`  
3. [**Bli med i Azure Discord-fellesskapene og møt eksperter og andre utviklere**](https://discord.com/invite/ByRwuEEgH4)  

### 🌐 Støtte for flere språk

#### Støttet via GitHub Action (Automatisk og alltid oppdatert)

[French](../fr/README.md) | [Spanish](../es/README.md) | [German](../de/README.md) | [Russian](../ru/README.md) | [Arabic](../ar/README.md) | [Persian (Farsi)](../fa/README.md) | [Urdu](../ur/README.md) | [Chinese (Simplified)](../zh/README.md) | [Chinese (Traditional, Macau)](../mo/README.md) | [Chinese (Traditional, Hong Kong)](../hk/README.md) | [Chinese (Traditional, Taiwan)](../tw/README.md) | [Japanese](../ja/README.md) | [Korean](../ko/README.md) | [Hindi](../hi/README.md) | [Bengali](../bn/README.md) | [Marathi](../mr/README.md) | [Nepali](../ne/README.md) | [Punjabi (Gurmukhi)](../pa/README.md) | [Portuguese (Portugal)](../pt/README.md) | [Portuguese (Brazil)](../br/README.md) | [Italian](../it/README.md) | [Polish](../pl/README.md) | [Turkish](../tr/README.md) | [Greek](../el/README.md) | [Thai](../th/README.md) | [Swedish](../sv/README.md) | [Danish](../da/README.md) | [Norwegian](./README.md) | [Finnish](../fi/README.md) | [Dutch](../nl/README.md) | [Hebrew](../he/README.md) | [Vietnamese](../vi/README.md) | [Indonesian](../id/README.md) | [Malay](../ms/README.md) | [Tagalog (Filipino)](../tl/README.md) | [Swahili](../sw/README.md) | [Hungarian](../hu/README.md) | [Czech](../cs/README.md) | [Slovak](../sk/README.md) | [Romanian](../ro/README.md) | [Bulgarian](../bg/README.md) | [Serbian (Cyrillic)](../sr/README.md) | [Croatian](../hr/README.md) | [Slovenian](../sl/README.md) | [Ukrainian](../uk/README.md) | [Burmese (Myanmar)](../my/README.md)  

**Hvis du ønsker støtte for flere språk, finner du en liste over tilgjengelige språk [her](https://github.com/Azure/co-op-translator/blob/main/getting_started/supported-languages.md)**  

## Introduksjon

Velkommen til den omfattende guiden for Azure Developer CLI (azd). Denne repositoryen er laget for å hjelpe utviklere på alle nivåer, fra studenter til profesjonelle utviklere, med å lære og mestre Azure Developer CLI for effektive skyimplementeringer. Dette strukturerte læringsressurset gir praktisk erfaring med Azure-skyimplementeringer, feilsøking av vanlige problemer og implementering av beste praksis for vellykkede AZD-malimplementeringer.

## Læringsmål

Ved å jobbe gjennom denne repositoryen vil du:  
- Mestre grunnleggende konsepter og kjernefunksjoner i Azure Developer CLI  
- Lære å implementere og klargjøre Azure-ressurser ved hjelp av Infrastructure as Code  
- Utvikle ferdigheter i feilsøking av vanlige AZD-implementeringsproblemer  
- Forstå validering før implementering og kapasitetsplanlegging  
- Implementere sikkerhetspraksis og kostnadsoptimaliseringsstrategier  
- Bygge selvtillit i å implementere produksjonsklare applikasjoner til Azure  

## Læringsutbytte

Etter å ha fullført dette kurset vil du kunne:  
- Installere, konfigurere og bruke Azure Developer CLI med suksess  
- Lage og implementere applikasjoner ved hjelp av AZD-maler  
- Feilsøke autentisering, infrastruktur og implementeringsproblemer  
- Utføre kontroller før implementering, inkludert kapasitetsplanlegging og valg av SKU  
- Implementere overvåking, sikkerhet og kostnadsstyring beste praksis  
- Integrere AZD-arbeidsflyter i CI/CD-pipelines  

## Innholdsfortegnelse

- [Hva er Azure Developer CLI?](../..)  
- [Kom i gang](../..)  
- [Dokumentasjon](../..)  
- [Eksempler og maler](../..)  
- [Ressurser](../..)  
- [Bidra](../..)  

## Hva er Azure Developer CLI?

Azure Developer CLI (azd) er et utviklerfokusert kommandolinjeverktøy som akselererer prosessen med å bygge og implementere applikasjoner til Azure. Det tilbyr:  

- **Malbaserte implementeringer** - Bruk ferdiglagde maler for vanlige applikasjonsmønstre  
- **Infrastructure as Code** - Administrer Azure-ressurser ved hjelp av Bicep eller Terraform  
- **Integrerte arbeidsflyter** - Klargjør, implementer og overvåk applikasjoner sømløst  
- **Utviklervennlig** - Optimalisert for utviklerproduktivitet og opplevelse  

## Kom i gang

### Forutsetninger  
- Azure-abonnement  
- Azure CLI installert  
- Git (for å klone maler)  

### Installasjon  
```bash
# Windows (PowerShell)
powershell -ex AllSigned -c "Invoke-RestMethod 'https://aka.ms/install-azd.ps1' | Invoke-Expression"

# macOS/Linux
curl -fsSL https://aka.ms/install-azd.sh | bash
```  

### Din første implementering  
```bash
# Initialize a new project
azd init --template todo-nodejs-mongo

# Provision Azure resources and deploy
azd up
```  

## Dokumentasjon

### Kom i gang  
- [**AZD Grunnleggende**](docs/getting-started/azd-basics.md) - Kjernekonsepter og terminologi  
- [**Installasjon og oppsett**](docs/getting-started/installation.md) - Plattformspesifikke installasjonsguider  
- [**Konfigurasjon**](docs/getting-started/configuration.md) - Miljøoppsett og autentisering  
- [**Ditt første prosjekt**](docs/getting-started/first-project.md) - Steg-for-steg veiledning  

### Implementering og klargjøring  
- [**Implementeringsguide**](docs/deployment/deployment-guide.md) - Fullstendige implementeringsarbeidsflyter  
- [**Klargjøring av ressurser**](docs/deployment/provisioning.md) - Administrasjon av Azure-ressurser  

### Kontroller før implementering  
- [**Kapasitetsplanlegging**](docs/pre-deployment/capacity-planning.md) - Validering av Azure-ressurskapasitet  
- [**Valg av SKU**](docs/pre-deployment/sku-selection.md) - Velge riktige Azure-SKUer  
- [**Forhåndskontroller**](docs/pre-deployment/preflight-checks.md) - Automatiserte valideringsskript  

### Feilsøking  
- [**Vanlige problemer**](docs/troubleshooting/common-issues.md) - Ofte møtte problemer og løsninger  
- [**Feilsøkingsguide**](docs/troubleshooting/debugging.md) - Steg-for-steg feilsøkingsstrategier  

## Eksempler og maler  
- [**Eksempler**](examples/README.md) - Praktiske eksempler, maler og virkelige scenarier for å hjelpe deg med å lære Azure Developer CLI gjennom praktisk øvelse. Hvert eksempel gir komplett fungerende kode, infrastrukturmaler og detaljerte instruksjoner for ulike applikasjonsarkitekturer og implementeringsmønstre.  

### Praktisk lab/workshop  
- [**AZD For Nybegynnere**](workshop/README.md) - Denne workshoppen fokuserer på å komme i gang med AI Agents AZD-malen og gir praktisk beste praksis for implementering av Azure AI-tjenester ved hjelp av AZD  

## Ressurser

### Hurtigreferanser  
- [**Kommandosnarveiark**](resources/cheat-sheet.md) - Essensielle azd-kommandoer  
- [**Ordliste**](resources/glossary.md) - Azure- og azd-terminologi  
- [**FAQ**](resources/faq.md) - Ofte stilte spørsmål  
- [**Studieguide**](resources/study-guide.md) - Omfattende læringsmål og øvelser  

### Eksterne ressurser  
- [Azure Developer CLI Dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  
- [Azure Arkitektursenter](https://learn.microsoft.com/en-us/azure/architecture/)  
- [Azure Priskalkulator](https://azure.microsoft.com/pricing/calculator/)  
- [Azure Status](https://status.azure.com/)  

## Læringssti

### For studenter og nybegynnere  
1. Start med [AZD Grunnleggende](docs/getting-started/azd-basics.md)  
2. Følg [Installasjonsguiden](docs/getting-started/installation.md)  
3. Fullfør [Ditt første prosjekt](docs/getting-started/first-project.md)  
4. Øv med [Enkel webapp-eksempel](../../examples/simple-web-app)  

### For utviklere  
1. Gå gjennom [Konfigurasjonsguide](docs/getting-started/configuration.md)  
2. Studer [Implementeringsguide](docs/deployment/deployment-guide.md)  
3. Jobb med [Databaseapp-eksempel](../../examples/database-app)  
4. Utforsk [Containerapp-eksempel](../../examples/container-app)  

### For DevOps-ingeniører  
1. Mestre [Klargjøring av ressurser](docs/deployment/provisioning.md)  
2. Implementer [Forhåndskontroller](docs/pre-deployment/preflight-checks.md)  
3. Øv på [Kapasitetsplanlegging](docs/pre-deployment/capacity-planning.md)  
4. Avansert [Mikrotjenester-eksempel](../../examples/microservices)  

## Bidra

Vi ønsker bidrag velkommen! Les vår [Bidragsguide](CONTRIBUTING.md) for detaljer om:  
- Hvordan sende inn problemer og funksjonsforespørsler  
- Retningslinjer for kodebidrag  
- Forbedringer av dokumentasjon  
- Fellesskapsstandarder  

## Støtte

- **Problemer**: [Rapporter feil og foreslå funksjoner](https://github.com/microsoft/azd-for-beginners/issues)  
- **Diskusjoner**: [Microsoft Azure Discord Community Q&A og diskusjoner](https://discord.gg/microsoft-azure)  
- **E-post**: For private henvendelser  
- **Microsoft Learn**: [Offisiell Azure Developer CLI dokumentasjon](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/)  

## Lisens

Dette prosjektet er lisensiert under MIT-lisensen - se [LICENSE](../../LICENSE) for detaljer.  

## 🎒 Andre kurs

Vårt team produserer andre kurs! Sjekk ut:  

- [**NY** Model Context Protocol (MCP) For Nybegynnere](https://github.com/microsoft/mcp-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI Agents for Nybegynnere](https://github.com/microsoft/ai-agents-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativ AI for Nybegynnere med .NET](https://github.com/microsoft/Generative-AI-for-beginners-dotnet?WT.mc_id=academic-105485-koreyst)  
- [Generativ AI for Nybegynnere](https://github.com/microsoft/generative-ai-for-beginners?WT.mc_id=academic-105485-koreyst)  
- [Generativ AI for Nybegynnere med Java](https://github.com/microsoft/generative-ai-for-beginners-java?WT.mc_id=academic-105485-koreyst)  
- [ML for Nybegynnere](https://aka.ms/ml-beginners?WT.mc_id=academic-105485-koreyst)  
- [Data Science for Nybegynnere](https://aka.ms/datascience-beginners?WT.mc_id=academic-105485-koreyst)  
- [AI for Nybegynnere](https://aka.ms/ai-beginners?WT.mc_id=academic-105485-koreyst)  
- [Cybersecurity for Nybegynnere](https://github.com/microsoft/Security-101??WT.mc_id=academic-96948-sayoung)  
- [Webutvikling for Nybegynnere](https://aka.ms/webdev-beginners?WT.mc_id=academic-105485-koreyst)  
- [IoT for nybegynnere](https://aka.ms/iot-beginners?WT.mc_id=academic-105485-koreyst)
- [XR-utvikling for nybegynnere](https://github.com/microsoft/xr-development-for-beginners?WT.mc_id=academic-105485-koreyst)
- [Behersk GitHub Copilot for AI-parprogrammering](https://aka.ms/GitHubCopilotAI?WT.mc_id=academic-105485-koreyst)
- [Behersk GitHub Copilot for C#/.NET-utviklere](https://github.com/microsoft/mastering-github-copilot-for-dotnet-csharp-developers?WT.mc_id=academic-105485-koreyst)
- [Velg ditt eget Copilot-eventyr](https://github.com/microsoft/CopilotAdventures?WT.mc_id=academic-105485-koreyst)

---

**Navigasjon**
- **Neste leksjon**: [AZD Grunnleggende](docs/getting-started/azd-basics.md)

---

**Ansvarsfraskrivelse**:  
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiserte oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på sitt opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.