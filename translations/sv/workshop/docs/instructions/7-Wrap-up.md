# 7. Avslutning och nästa steg

!!! tip "DE VIKTIGASTE BUDSKAPEN ÄR"

    - [ ] AZD-mallar påskyndar utvecklingen av AI-applikationer från dagar till timmar
    - [ ] Discovery → Deployment → Customization-metodiken ger en strukturerad inlärningsväg
    - [ ] GitHub Copilot med MCP-servrar möjliggör utforskning av komplexa kodbaser med naturligt språk
    - [ ] Microsoft Foundry erbjuder inbyggd observerbarhet, utvärdering och säkerhetstestning

---

## 1. Vad du har åstadkommit

Grattis! I den här workshoppen har du framgångsrikt:

| Modul | Resultat |
|:---|:---|
| **Module 1** | Upptäckte Azure Developer CLI och valde en AI-mall |
| **Module 2** | Distribuerade och validerade en komplett lösning för AI-agenter |
| **Module 3** | Bröt ned mallen för att förstå dess arkitektur |
| **Module 4** | Utforskade `azure.yaml`-konfiguration och livscykelhooks |
| **Module 5** | Anpassade mallen för ditt eget scenario |
| **Module 6** | Tog ner infrastrukturen på ett säkert sätt och hanterade resurser |

---

## 2. Viktiga begrepp som du behärskar

### Azure Developer CLI (azd)
- `azd init` - Initiera projekt från mallar
- `azd up` - Provisionera och distribuera med ett kommando
- `azd env` - Hantera miljövariabler
- `azd down` - Rensa upp resurser på ett säkert sätt

### AZD-mallstruktur
- `azure.yaml` - Konfiguration och distributionshooks
- `infra/` - Bicep-infrastruktur-som-kod
- `src/` - Applikationens källkod
- `scripts/` - Automations- och installationsskript

### Funktioner i Microsoft Foundry
- AI Agent Service för intelligenta assistenter
- File Search och Azure AI Search för kunskapsinhämtning
- Inbyggd spårning, övervakning och utvärdering
- Red teaming för validering av AI-säkerhet

---

## 3. Fortsätt din inlärningsresa

### Rekommenderade nästa steg

| Väg | Resurs | Tid |
|:---|:---|:---|
| **Complete Course** | [AZD for Beginners Curriculum](../../README.md) | 8–12 timmar |
| **Try Another Template** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1–2 timmar |
| **Deep Dive** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Pågående |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | Gå med idag! |

### Föreslagna mallar att prova härnäst

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Grundläggande chatt med dina data
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Avancerade RAG-mönster
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Företagsdetaljhandelsscenarier

---

## 4. Workshoputmaning

Redo att testa dina kunskaper? Prova dessa utmaningar:

| Utmaning | Beskrivning | Svårighetsgrad |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | Distribuera och anpassa för en annan bransch (t.ex. vård, finans) | ⭐⭐ |
| **2. Custom Knowledge Base** | Lägg till dina egna datafiler och skapa ett anpassat sökindex | ⭐⭐⭐ |
| **3. Production Deployment** | Sätt upp CI/CD med GitHub Actions med hjälp av `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Dela din feedback

Din feedback hjälper oss att förbättra denna workshop!

- **GitHub Issues**: [Post feedback](https://github.com/microsoft/azd-for-beginners/issues) - tagga med `Workshop`
- **Discord**: Gå med i [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - posta i `#get-help`
- **Contributions**: Hjälp till att förbättra workshoppen genom att skicka pull requests!

---

## Tack! 🎉

Tack för att du genomförde AZD for AI Developers Workshop. Vi hoppas att denna upplevelse har försett dig med de färdigheter och det självförtroende som krävs för att bygga och distribuera AI-applikationer på Azure.

**Fortsätt bygga, fortsätt lära dig, och välkommen till Azure AI-utvecklargemenskapen!**

---

| | |
|:---|:---|
| **📚 Kurshemsida** | [AZD For Beginners](../../README.md) |
| **📖 Dokumentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI-mallar** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Gemenskap** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfriskrivning:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi eftersträvar noggrannhet, observera att automatiska översättningar kan innehålla fel eller brister. Originaldokumentet i dess ursprungliga språk bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår genom användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->