# Kapitel 2: AI-Först Utveckling

**📚 Kurs**: [AZD För Nybörjare](../../README.md) | **⏱️ Varaktighet**: 4-5 timmar inklusive workshop | **⭐ Svårighetsgrad**: Medelnivå

---

## Översikt

Detta kapitel fokuserar på att distribuera AI-drivna applikationer med Azure Developer CLI och Microsoft Foundry-tjänster. Från enkla AI-chattappar till intelligenta agenter med verktyg.

> **Versionsgranskning (2026-11-04):** AI CLI-vägledning kontrollerades mot publicerad `azd` `1.37.2`, `azure.ai.agents` `1.0.0-beta.23`, och `azure.ai.evaluations` `1.0.0-beta.2` dokumentation/källa. Använd `azd >= 1.37.0` för den kombinerade arbetsflödet. Utvärderingar använder nu det separata `azd ai eval` namnområdet; se [versionsändringar och migrationsvägledning](../chapter-08-production/production-ai-practices.md#recent-release-changes-and-fixes). Detta är inte en live-distributionsvalidering.

## Lärandemål

Genom att slutföra detta kapitel kommer du att:
- Distribuera AI-applikationer med färdiga AZD-mallar
- Förstå Microsoft Foundry-integration med AZD
- Konfigurera och anpassa AI-agenter med verktyg
- Distribuera RAG (Retrieval-Augmented Generation) applikationer

---

## 📚 Lektioner

| # | Lektion | Beskrivning | Tid |
|---|--------|-------------|------|
| 1 | [Microsoft Foundry Integration](microsoft-foundry-integration.md) | Koppla AZD med Foundry-tjänster | 30 min |
| 2 | [AI Agents Guide](agents.md) | Distribuera intelligenta agenter med verktyg | 45 min |
| 3 | [AI Model Deployment](ai-model-deployment.md) | Distribuera och konfigurera AI-modeller | 30 min |
| 4 | [AI Workshop Lab](ai-workshop-lab.md) | Praktiskt: Utforska en mall och planera din omvandling | 2-3 timmar |

---

## 🚀 Kom igång snabbt

Välj ett alternativ i en ny tom katalog. Det avslutande `.` initierar den aktuella katalogen; annars kan AZD skapa en undermapp utan att ändra din shells arbetskatalog.

```bash
# Option 1: RAG Chat Application
azd init --template azure-search-openai-demo .
azd up

# Option 2: AI Agents
azd init --template get-started-with-ai-agents .
azd up

# Option 3: Quick Chat App
azd init --template openai-chat-app-quickstart .
azd up
```

---

## 🤖 Utvalda AI-mallar

| Mall | Beskrivning | Tjänster |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG-chatt med källhänvisningar | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI-agent med verktyg | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Grundläggande AI-chatt | OpenAI + Container Apps |

---

## 💰 Kostnadsmedvetenhet

Detta är illustrativa intervall, inte offerter eller tak; modelltrafik, Search/compute SKUs, region och valfria funktioner kan överskrida dem. Granska din valda exempels aktuella prisrekommendation innan provisioning.

| Miljö | Uppskattad månads kostnad |
|-------------|----------------------|
| Utveckling | $80-150 |
| Utrullning | $150-300 |
| Produktion | $300-3,500+ |

**Tips:** Kör `azd down` efter testning för att undvika avgifter.

---

## 🔗 Navigering

| Riktning | Kapitel |
|-----------|---------|
| **Föregående** | [Kapitel 1: Grundläggande](../chapter-01-foundation/README.md) |
| **Nästa** | [Kapitel 3: Konfiguration](../chapter-03-configuration/README.md) |
| **Hoppa till** | [Kapitel 8: Produktionsmönster](../chapter-08-production/README.md) |

---

## 📖 Relaterade resurser

- [AI Felsökning](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produktionspraxis för AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Ansvarsfriskrivning**:
Detta dokument har översatts med hjälp av AI-översättningstjänsten [Co-op Translator](https://github.com/Azure/co-op-translator). Även om vi strävar efter noggrannhet, var vänlig notera att automatiska översättningar kan innehålla fel eller brister. Det ursprungliga dokumentet på dess modersmål bör betraktas som den auktoritativa källan. För kritisk information rekommenderas professionell mänsklig översättning. Vi ansvarar inte för några missförstånd eller feltolkningar som uppstår till följd av användningen av denna översättning.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->