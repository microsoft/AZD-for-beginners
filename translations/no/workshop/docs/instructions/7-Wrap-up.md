# 7. Oppsummering & Neste Steg

!!! tip "DE VIKTIGSTE HOVEDBUDSKAPENE ER"

    - [ ] AZD-maler akselererer utviklingen av AI-applikasjoner fra dager til timer
    - [ ] Metodikken Oppdagelse → Distribusjon → Tilpasning gir en strukturert læringssti
    - [ ] GitHub Copilot med MCP-servere muliggjør utforskning av komplekse kodebaser med naturlig språk
    - [ ] Microsoft Foundry tilbyr innebygd observabilitet, evaluering og sikkerhetstesting

---

## 1. Hva Du Har Oppnådd

Gratulerer! I denne workshopen har du med hell:

| Modul | Oppnåelse |
|:---|:---|
| **Modul 1** | Oppdaget Azure Developer CLI og valgt en AI-mal |
| **Modul 2** | Distribuert og validert en komplett løsning for AI-agenter |
| **Modul 3** | De-konstruert malen for å forstå arkitekturen |
| **Modul 4** | Utforsket `azure.yaml` konfigurasjon og livssyklus-hooks |
| **Modul 5** | Tilpasset malen for ditt eget scenario |
| **Modul 6** | Sikker nedriving av infrastruktur og ressursstyring |

---

## 2. Viktige Konsepter Mestring

### Azure Developer CLI (azd)
- `azd init` - Initialiser prosjekter fra maler
- `azd up` - Provisjoner og distribuer i én kommando
- `azd env` - Administrer miljøvariabler
- `azd down` - Rydd opp ressurser trygt

### AZD Malkstruktur
- `azure.yaml` - Konfigurasjon og distribusjonshooks
- `infra/` - Bicep infrastruktur-som-kode
- `src/` - Applikasjonskildekode
- `scripts/` - Automatiserings- og oppsettskript

### Microsoft Foundry Kapabiliteter
- AI Agent Service for intelligente assistenter
- Fil-søk og Azure AI Search for kunnskapsinnhenting
- Innebygd sporing, overvåkning og evaluering
- Red teaming for validering av AI-sikkerhet

---

## 3. Fortsett Din Læringsreise

### Anbefalte Neste Steg

| Vei | Ressurs | Tid |
|:---|:---|:---|
| **Fullfør Kurs** | [AZD for Beginners Curriculum](../../README.md) | 8-12 timer |
| **Prøv En Annen Mal** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 timer |
| **Fordypning** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Løpende |
| **Fellesskap** | [Azure Discord](https://aka.ms/foundry/discord) | Bli med i dag! |

### Foreslåtte Maler å Prøve Neste

1. **[Kom i gang med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Grunnleggende chat med dine data
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Avanserte RAG-mønstre
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Enterprise retail-scenarier

---

## 4. Workshop-utfordring

Klar til å teste ferdighetene dine? Prøv disse utfordringene:

| Utfordring | Beskrivelse | Vanskelighetsgrad |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | Distribuer og tilpass for en annen bransje (f.eks. helse, finans) | ⭐⭐ |
| **2. Egendefinert Kunnskapsbase** | Legg til dine egne datafiler og lag en egen søkeindeks | ⭐⭐⭐ |
| **3. Produksjonsdistribusjon** | Sett opp CI/CD med GitHub Actions ved bruk av `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Del Din Tilbakemelding

Din tilbakemelding hjelper oss å forbedre denne workshopen!

- **GitHub Issues**: [Gi tilbakemelding](https://github.com/microsoft/azd-for-beginners/issues) - tagg med `Workshop`
- **Discord**: Bli med på [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - post i `#get-help`
- **Bidrag**: Hjelp til med å forbedre workshopen ved å sende inn pull requests!

---

## Takk! 🎉

Takk for at du fullførte AZD for AI Developers Workshop. Vi håper denne opplevelsen har gitt deg ferdighetene og selvtilliten til å bygge og distribuere AI-applikasjoner på Azure.

**Fortsett å bygge, fortsett å lære, og velkommen til Azure AI-utviklerfellesskapet!**

---

| | |
|:---|:---|
| **📚 Kurs Hjem** | [AZD For Beginners](../../README.md) |
| **📖 Dokumentasjon** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Maler** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Fellesskap** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfraskrivelse**:
Dette dokumentet er oversatt ved hjelp av AI-oversettelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selv om vi tilstreber nøyaktighet, vennligst vær oppmerksom på at automatiske oversettelser kan inneholde feil eller unøyaktigheter. Det originale dokumentet på dets opprinnelige språk bør anses som den autoritative kilden. For kritisk informasjon anbefales profesjonell menneskelig oversettelse. Vi er ikke ansvarlige for eventuelle misforståelser eller feiltolkninger som oppstår som følge av bruk av denne oversettelsen.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->