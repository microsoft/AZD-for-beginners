# 7. Shrnutí a další kroky

!!! tip "HLAVNÍ ZPRÁVY K ZAPAMATOVÁNÍ JSOU"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Co jste dokázali

Gratulujeme! V tomto workshopu jste úspěšně:

| Modul | Úspěch |
|:---|:---|
| **Modul 1** | Objevili Azure Developer CLI a vybrali šablonu AI |
| **Modul 2** | Nasadili a ověřili kompletní řešení AI agentů |
| **Modul 3** | Rozebrali šablonu, abyste pochopili její architekturu |
| **Modul 4** | Prozkoumali konfiguraci `azure.yaml` a životní cyklus háků |
| **Modul 5** | Přizpůsobili šablonu pro svůj vlastní scénář |
| **Modul 6** | Bezpečně rozebrali infrastrukturu a spravovali zdroje |

---

## 2. Klíčové osvojené koncepty

### Azure Developer CLI (azd)
- `azd init` - Inicializace projektů ze šablon
- `azd up` - Provisioning a nasazení jedním příkazem
- `azd env` - Správa proměnných prostředí
- `azd down` - Bezpečné čištění zdrojů

### Struktura šablony AZD
- `azure.yaml` - Konfigurační a nasazovací háky
- `infra/` - Infrastruktura jako kód v Bicep
- `src/` - Zdroje aplikace
- `scripts/` - Automatizační a instalační skripty

### Schopnosti Microsoft Foundry
- AI Agent Service pro inteligentní asistenty
- Vyhledávání souborů a Azure AI Search pro získávání znalostí
- Vestavěné sledování, monitorování a hodnocení
- Red teaming pro ověření bezpečnosti AI

---

## 3. Pokračujte ve svém učebním putování

### Doporučené další kroky

| Cesta | Zdroj | Čas |
|:---|:---|:---|
| **Dokončit kurz** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Vlastní tempo |
| **Vyzkoušet jinou šablonu** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 hodiny |
| **Hloubkové studium** | [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Průběžně |
| **Komunita** | [Azure Discord](https://aka.ms/foundry/discord) | Přidejte se dnes! |

### Doporučené šablony k vyzkoušení

1. **[Začínáme s AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Základní chat s vašimi daty
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Pokročilé RAG vzory
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Firmní maloobchodní scénáře

---

## 4. Výzva workshopu

Připraveni otestovat své dovednosti? Vyzkoušejte tyto výzvy:

| Výzva | Popis | Obtížnost |
|:---|:---|:---|
| **1. Multi-agentní scénář** | Nasadit a přizpůsobit pro jiný obor (např. zdravotnictví, finance) | ⭐⭐ |
| **2. Vlastní znalostní báze** | Přidat vlastní datové soubory a vytvořit vlastní vyhledávací index | ⭐⭐⭐ |
| **3. Produkční nasazení** | Nastavit CI/CD pomocí GitHub Actions využívajících `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Sdílejte své připomínky

Vaše zpětná vazba nám pomáhá workshop vylepšovat!

- **GitHub Issues**: [Zveřejněte zpětnou vazbu](https://github.com/microsoft/azd-for-beginners/issues) - označte `Workshop`
- **Discord**: Přidejte se k [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - příspěvky v `#get-help`
- **Příspěvky**: Pomozte zlepšit workshop zasláním pull requestů!

---

## Děkujeme! 🎉

Děkujeme vám za absolvování workshopu AZD for AI Developers. Doufáme, že vám tato zkušenost poskytla dovednosti a sebevědomí pro vytváření a nasazování AI aplikací na Azure.

**Pokračujte v budování, pokračujte v učení a vítejte v komunitě vývojářů Azure AI!**

---

| | |
|:---|:---|
| **📚 Domov kurzu** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentace** | [Dokumentace Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI šablony** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Komunita** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Prohlášení o omezení odpovědnosti**:
Tento dokument byl přeložen pomocí AI překladatelské služby [Co-op Translator](https://github.com/Azure/co-op-translator). Přestože usilujeme o co největší přesnost, mějte prosím na paměti, že automatizované překlady mohou obsahovat chyby nebo nepřesnosti. Originální dokument v jeho mateřském jazyce by měl být považován za autoritativní zdroj. Pro kritické informace se doporučuje profesionální lidský překlad. Nejsme odpovědní za jakékoli nedorozumění nebo nesprávné interpretace vzniklé použitím tohoto překladu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->