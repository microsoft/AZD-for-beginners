# 7. Oppsummering og neste skritt

!!! tip "DE VIKTIGSTE BUDSKAPENE ER"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Hva du har oppnådd

Gratulerer! I denne workshopen har du med suksess:

| Modul | Oppnåelse |
|:---|:---|
| **Modul 1** | Oppdaget Azure Developer CLI og valgt en AI-mal |
| **Modul 2** | Distribuert og validert en komplett AI-agentløsning |
| **Modul 3** | De-konstruert malen for å forstå arkitekturen |
| **Modul 4** | Utforsket `azure.yaml` konfigurasjon og livssyklus-kroker |
| **Modul 5** | Tilpasset malen til ditt eget scenario |
| **Modul 6** | Trygt demontert infrastruktur og håndtert ressurser |

---

## 2. Viktige konsepter mestret

### Azure Developer CLI (azd)
- `azd init` - Initialiser prosjekter fra maler
- `azd up` - Tilby og distribuer med én kommando
- `azd env` - Administrer miljøvariabler
- `azd down` - Rydd opp ressurser trygt

### AZD-malstruktur
- `azure.yaml` - Konfigurasjons- og distribusjons-kroker
- `infra/` - Bicep infrastruktur-som-kode
- `src/` - Applikasjonskildekode
- `scripts/` - Automatiserings- og oppsettskript

### Microsoft Foundry-funksjoner
- AI Agent Service for intelligente assistenter
- Fil-søk og Azure AI-søk for kunnskapsinnhenting
- Innebygd sporing, overvåking og evaluering
- Red teaming for sikkerhetsvalidering av AI

---

## 3. Fortsett din læringsreise

### Anbefalte neste steg

| Vei | Ressurs | Tid |
|:---|:---|:---|
| **Fullfør kurs** | [AZD for nybegynnere-kurrikulum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Selvstyrt |
| **Prøv en annen mal** | [Microsoft Foundry-maler](https://ai.azure.com/templates) | 1-2 timer |
| **Fordypning** | [Azure Developer CLI-dokumentasjon](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Pågående |
| **Fellesskap** | [Azure Discord](https://aka.ms/foundry/discord) | Bli med i dag! |

### Forslåtte maler å prøve neste

1. **[Kom i gang med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Grunnleggende chat med dine data
2. **[Azure Search OpenAI-demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Avanserte RAG-mønstre
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Enterprise retail-scenarier

---

## 4. Workshop-utfordring

Klar til å teste ferdighetene dine? Prøv disse utfordringene:

| Utfordring | Beskrivelse | Vanskelighetsgrad |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | Distribuer og tilpass for en annen bransje (f.eks. helsevesen, finans) | ⭐⭐ |
| **2. Egendefinert kunnskapsbase** | Legg til dine egne datafiler og lag en egendefinert søkeindeks | ⭐⭐⭐ |
| **3. Produksjonsdistribusjon** | Sett opp CI/CD med GitHub Actions ved bruk av `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Del din tilbakemelding

Din tilbakemelding hjelper oss å forbedre denne workshopen!

- **GitHub Issues**: [Legg inn tilbakemelding](https://github.com/microsoft/azd-for-beginners/issues) - tag med `Workshop`
- **Discord**: Bli med i [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - legg ut i `#get-help`
- **Bidrag**: Hjelp med å forbedre workshopen ved å sende inn pull requests!

---

## Takk! 🎉

Takk for at du fullførte AZD for AI-utviklerworkshopen. Vi håper denne opplevelsen har gitt deg ferdigheter og selvtillit til å bygge og distribuere AI-applikasjoner på Azure.

**Fortsett å bygge, fortsett å lære, og velkommen til Azure AI-utviklerfellesskapet!**

---

| | |
|:---|:---|
| **📚 Kurs Hjem** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentasjon** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI-maler** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Fellesskap** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi streber etter nøyaktighet, vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det opprinnelige dokumentet på originalspråket skal betraktes som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår ved bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->