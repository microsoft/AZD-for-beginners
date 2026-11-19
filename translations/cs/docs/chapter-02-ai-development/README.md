# Kapitola 2: Vývoj s prioritou AI

**📚 Kurz**: [AZD pro začátečníky](../../README.md) | **⏱️ Délka**: 4-5 hodin včetně workshopu | **⭐ Složitost**: Středně pokročilá

---

## Přehled

Tato kapitola se zaměřuje na nasazování aplikací využívajících umělou inteligenci pomocí Azure Developer CLI a služeb Microsoft Foundry. Od jednoduchých AI chatovacích aplikací až po inteligentní agenty s nástroji.

> **Aktualizace Foundry GA (2026-11-09):** Balíček `microsoft.foundry` 1.0 je [obecně dostupný](https://devblogs.microsoft.com/azure-sdk/microsoft-foundry-azure-developer-cli-ga/). Použijte `azd >= 1.37.0`; hodnocení zůstávají samostatnou instalací. [Průvodce hostovaným agentem](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga) zahrnuje testování agenta Inspector lokálně a vzdálené nasazení kódu. Tato dokumentace je jen přehledem, nikoliv ověřením živého nasazení; volitelné náhledové funkce si zachovávají svůj vlastní status.

## Cíle učení

Dokončením této kapitoly budete umět:
- Nasadit AI aplikace pomocí předpřipravených šablon AZD
- Porozumět integraci Microsoft Foundry s AZD
- Nainstalovat GA balíček a otestovat hostovaného agenta lokálně před nasazením jeho zdroje do Foundry
- Projít `azure.yaml`, hodnotící aktiva a čištění projektu nového vs. znovupoužitého
- Konfigurovat a přizpůsobit AI agenty s nástroji
- Nasadit RAG (Retrieval-Augmented Generation) aplikace

---

## 📚 Lekce

| # | Lekce | Popis | Čas |
|---|--------|-------------|------|
| 1 | [Integrace Microsoft Foundry](microsoft-foundry-integration.md) | GA balíček, workflow hostovaného agenta z lokálu do cloudu a hodnocení | 60 min |
| 2 | [Průvodce AI agenty](agents.md) | Nasazení inteligentních agentů s nástroji | 45 min |
| 3 | [Nasazení AI modelu](ai-model-deployment.md) | Nasazení a konfigurace AI modelů | 30 min |
| 4 | [Workshop AI laboratoř](ai-workshop-lab.md) | Prakticky: Prozkoumejte šablonu a naplánujte svou konverzi | 2-3 hodiny |

---

## 🚀 Rychlý start

Vyberte jednu možnost v novém prázdném adresáři. Za příponou `.` se inicializuje aktuální adresář; jinak může AZD vytvořit podsložku, aniž by změnil pracovní adresář shellu.

Pro **GA cestu nasazení kódu hostovaného agenta** začněte s [průvodcem krok za krokem](microsoft-foundry-integration.md#hosted-agent-walkthrough-ga). Vyžaduje AZD 1.37.0+, aktuální uv, Python 3.13+, oprávnění Foundry a kvótu modelu. Plné šablony aplikací níže jsou alternativou, nikoliv předpokladem pro tento průvodce.

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

## 🤖 Doporučené AI šablony

| Šablona | Popis | Služby |
|----------|-------------|----------|
| [azure-search-openai-demo](https://github.com/Azure-Samples/azure-search-openai-demo) | RAG chat s citacemi | OpenAI + AI Search |
| [get-started-with-ai-agents](https://github.com/Azure-Samples/get-started-with-ai-agents) | AI agent s nástroji | AI Agent Service |
| [openai-chat-app-quickstart](https://github.com/Azure-Samples/openai-chat-app-quickstart) | Základní AI chat | OpenAI + Container Apps |

---

## 💰 Povědomí o nákladech

Toto jsou ilustrační rozpětí, nikoliv nabídky nebo limity; provoz modelů, SKU pro vyhledávání/výpočet, region a volitelné funkce je mohou překročit. Před nasazením si prostudujte aktuální cenové pokyny vybrané ukázky.

| Prostředí | Odhadované měsíční náklady |
|-------------|----------------------|
| Vývoj | $80-150 |
| Příprava | $150-300 |
| Produkce | $300-3,500+ |

**Čištění:** Před potvrzením si projděte `azd down`: pro nově vytvořený Foundry projekt odstraní skupinu zdrojů a vše v ní. Pro znovupoužitý Foundry projekt ponechá zdroje projektu a agenta; postupujte dle [návodu na čištění](microsoft-foundry-integration.md#7-clean-up-deliberately), abyste nechtěné zdroje odstranili zvlášť.

---

## 🔗 Navigace

| Směr | Kapitola |
|-----------|---------|
| **Předchozí** | [Kapitola 1: Základy](../chapter-01-foundation/README.md) |
| **Další** | [Kapitola 3: Konfigurace](../chapter-03-configuration/README.md) |
| **Přeskočit na** | [Kapitola 8: Produkční vzory](../chapter-08-production/README.md) |

---

## 📖 Související zdroje

- [Řešení problémů s AI](../chapter-07-troubleshooting/ai-troubleshooting.md)
- [Produkční postupy AI](../chapter-08-production/production-ai-practices.md)
- [Application Insights](../chapter-06-pre-deployment/application-insights.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->