# 7. Zhrnutie a ďalšie kroky

!!! tip "HLAVNÉ ZÁVERY"

    - [ ] Šablóny AZD zrýchľujú vývoj AI aplikácií z dní na hodiny
    - [ ] Metodika Discovery → Deployment → Customization poskytuje štruktúrovanú cestu učenia
    - [ ] GitHub Copilot s MCP servermi umožňuje prieskum zložitých úložísk kódu pomocou prirodzeného jazyka
    - [ ] Microsoft Foundry poskytuje vstavanú pozorovateľnosť, hodnotenie a testovanie bezpečnosti

---

## 1. Čo ste dosiahli

Gratulujeme! V tomto workshope ste úspešne:

| Modul | Dosiahnuté |
|:---|:---|
| **Module 1** | Objavili Azure Developer CLI a vybrali AI šablónu |
| **Module 2** | Nasadili a overili kompletné riešenie AI agentov |
| **Module 3** | Rozobrali šablónu, aby ste pochopili jej architektúru |
| **Module 4** | Preskúmali konfiguráciu `azure.yaml` a háky životného cyklu |
| **Module 5** | Prispôsobili šablónu pre váš vlastný scenár |
| **Module 6** | Bezpečne zrušili infraštruktúru a spravovali zdroje |

---

## 2. Kľúčové pojmy, ktoré ste zvládli

### Azure Developer CLI (azd)
- `azd init` - Inicializovať projekty zo šablón
- `azd up` - Zabezpečiť infraštruktúru a nasadiť v jednom príkaze
- `azd env` - Spravovať premenné prostredia
- `azd down` - Bezpečne odstrániť prostriedky

### AZD Template Structure
- `azure.yaml` - Konfigurácia a háky nasadenia
- `infra/` - Bicep infraštruktúra ako kód
- `src/` - Zdrojový kód aplikácie
- `scripts/` - Skripty pre automatizáciu a nastavenie

### Microsoft Foundry Capabilities
- Služba AI Agent pre inteligentné asistenty
- File Search a Azure AI Search na získavanie znalostí
- Vstavané trasovanie, monitorovanie a vyhodnocovanie
- Red teaming pre overenie bezpečnosti AI

---

## 3. Pokračujte vo svojej vzdelávacej ceste

### Odporúčané ďalšie kroky

| Cesta | Zdroj | Čas |
|:---|:---|:---|
| **Dokončiť kurz** | [Kurz AZD pre začiatočníkov](../../README.md) | 8-12 hodín |
| **Vyskúšajte inú šablónu** | [Šablóny Microsoft Foundry](https://ai.azure.com/templates) | 1-2 hodiny |
| **Hlbší ponor** | [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Prebiehajúce |
| **Komunita** | [Azure Discord](https://aka.ms/foundry/discord) | Pridajte sa ešte dnes! |

### Odporúčané šablóny na vyskúšanie

1. **[Začnite s AI Chatom](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Základný chat s vašimi dátami
2. **[Ukážka Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Pokročilé RAG vzory
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Podnikové maloobchodné scenáre

---

## 4. Výzva workshopu

Pripravení otestovať svoje zručnosti? Skúste tieto výzvy:

| Výzva | Popis | Náročnosť |
|:---|:---|:---|
| **1. Scenár viacerých agentov** | Nasadiť a prispôsobiť pre iné odvetvie (napr. zdravotníctvo, financie) | ⭐⭐ |
| **2. Vlastná databáza znalostí** | Pridajte svoje dátové súbory a vytvorte vlastný vyhľadávací index | ⭐⭐⭐ |
| **3. Produkčné nasadenie** | Nastavte CI/CD s GitHub Actions použitím `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Podeľte sa o svoju spätnú väzbu

Vaša spätná väzba nám pomáha zlepšiť tento workshop!

- **GitHub Issues**: [Zanechajte spätnú väzbu](https://github.com/microsoft/azd-for-beginners/issues) - označte štítkom `Workshop`
- **Discord**: Pridajte sa [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - napíšte do `#get-help`
- **Príspevky**: Pomôžte zlepšiť workshop zaslaním pull requestov!

---

## Ďakujeme! 🎉

Ďakujeme, že ste dokončili workshop AZD pre AI vývojárov. Dúfame, že vás táto skúsenosť vybavila zručnosťami a dôverou pri vytváraní a nasadzovaní AI aplikácií na Azure.

**Pokračujte v budovaní, pokračujte v učení a vitajte v komunite Azure AI vývojárov!**

---

| | |
|:---|:---|
| **📚 Domov kurzu** | [AZD pre začiatočníkov](../../README.md) |
| **📖 Dokumentácia** | [Dokumentácia Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI šablóny** | [Šablóny Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Komunita** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vyhlásenie o vylúčení zodpovednosti:
Tento dokument bol preložený pomocou služby prekladu založenej na umelej inteligencii [Co-op Translator](https://github.com/Azure/co-op-translator). Hoci sa snažíme o presnosť, vezmite prosím na vedomie, že automatické preklady môžu obsahovať chyby alebo nepresnosti. Originálny dokument v jeho pôvodnom jazyku by mal byť považovaný za autoritatívny zdroj. Pre kritické informácie sa odporúča profesionálny ľudský preklad. Nie sme zodpovední za žiadne nedorozumenia alebo nesprávne výklady vyplývajúce z použitia tohto prekladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->