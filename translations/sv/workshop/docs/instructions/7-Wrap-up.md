# 7. Sammanfattning & Nästa Steg

!!! tip "DE VIKTIGASTE BUDSKAPEN ÄR"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Vad Du Har Uppnått

Grattis! I denna workshop har du framgångsrikt:

| Modul | Uppnåelse |
|:---|:---|
| **Modul 1** | Upptäckt Azure Developer CLI och valt en AI-mall |
| **Modul 2** | Distribuerat och validerat en komplett AI-agentlösning |
| **Modul 3** | Dekonstruerat mallen för att förstå dess arkitektur |
| **Modul 4** | Utforskat `azure.yaml`-konfiguration och livscykelhakar |
| **Modul 5** | Anpassat mallen för ditt eget scenario |
| **Modul 6** | Tryggt tagit ned infrastrukturen och hanterat resurser |

---

## 2. Centrala Begrepp Du Behärskar

### Azure Developer CLI (azd)
- `azd init` - Initiera projekt från mallar
- `azd up` - Förse och distribuera med ett kommando
- `azd env` - Hantera miljövariabler
- `azd down` - Rensa upp resurser säkert

### AZD Mallstruktur
- `azure.yaml` - Konfigurations- och distributionshakar
- `infra/` - Bicep infrastruktur-som-kod
- `src/` - Applikationskällkod
- `scripts/` - Automatiserings- och installationsskript

### Microsoft Foundry Funktioner
- AI Agenttjänst för intelligenta assistenter
- Fil-sökning och Azure AI Search för kunskapsåtervinning
- Inbyggd spårning, övervakning och utvärdering
- Red teaming för AI-säkerhetsvalidering

---

## 3. Fortsätt Din Läranderesa

### Rekommenderade Nästa Steg

| Väg | Resurs | Tid |
|:---|:---|:---|
| **Slutför Kurs** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Självstudier |
| **Prova En Annan Mall** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 timmar |
| **Fördjupning** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Pågående |
| **Community** | [Azure Discord](https://aka.ms/foundry/discord) | Gå med idag! |

### Föreslagna Mallar att Prova Nästa

1. **[Kom Igång med AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Grundläggande chatt med dina data
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Avancerade RAG-mönster
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Enterprise detaljhandelsscenarier

---

## 4. Workshop Utmaning

Redo att testa dina färdigheter? Prova dessa utmaningar:

| Utmaning | Beskrivning | Svårighetsgrad |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | Distribuera och anpassa för en annan bransch (t.ex. vård, finans) | ⭐⭐ |
| **2. Anpassad Kunskapsbas** | Lägg till dina egna datafiler och skapa ett anpassat sökindex | ⭐⭐⭐ |
| **3. Produktionsdistribution** | Sätt upp CI/CD med GitHub Actions med `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Dela Din Feedback

Din feedback hjälper oss att förbättra denna workshop!

- **GitHub Issues**: [Lämna feedback](https://github.com/microsoft/azd-for-beginners/issues) - tagga med `Workshop`
- **Discord**: Gå med i [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - posta i `#get-help`
- **Bidrag**: Hjälp till att förbättra workshopen genom att skicka in pull requests!

---

## Tack! 🎉

Tack för att du slutförde AZD for AI Developers Workshop. Vi hoppas att denna erfarenhet har gett dig färdigheterna och självförtroendet att bygga och distribuera AI-applikationer på Azure.

**Fortsätt bygga, fortsätt lära, och välkommen till Azure AI utvecklargemenskap!**

---

| | |
|:---|:---|
| **📚 Kursstart** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Mallar** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Community** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->