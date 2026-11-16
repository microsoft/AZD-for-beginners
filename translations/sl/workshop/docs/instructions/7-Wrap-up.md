# 7. Povzetek in Naslednji Koraki

!!! tip "GLAVNA SPOROČILA SO"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Kaj Ste Dosegli

Čestitke! V tej delavnici ste uspešno:

| Modul | Dosežek |
|:---|:---|
| **Modul 1** | Spoznali Azure Developer CLI in izbrali vzorec AI |
| **Modul 2** | Namestili in preverili celovito rešitev AI agentov |
| **Modul 3** | Razstavili vzorec za razumevanje njegove arhitekture |
| **Modul 4** | Raziščili `azure.yaml` konfiguracijo in življenjski cikel |
| **Modul 5** | Prilagodili vzorec za svoj scenarij |
| **Modul 6** | Varno odstranili infrastrukturo in upravljali vire |

---

## 2. Ključni Pojmi, Ki Ste Jih Obvladali

### Azure Developer CLI (azd)
- `azd init` - Inicializacija projektov iz vzorcev
- `azd up` - Zagotavljanje in nameščanje z eno ukazno vrstico
- `azd env` - Upravljanje okoljskih spremenljivk
- `azd down` - Varno čiščenje virov

### Struktura AZD Vzorca
- `azure.yaml` - Konfiguracijske in namestitvene kljuke
- `infra/` - Bicep infrastruktura kot koda
- `src/` - Izvorna koda aplikacije
- `scripts/` - Skripte za avtomatizacijo in nastavitev

### Zmožnosti Microsoft Foundry
- AI Agent Service za inteligentne pomočnike
- Iskanje datotek in Azure AI Search za pridobivanje znanja
- Vgrajeno sledenje, nadzor in evaluacija
- Rdeče ekipe za preverjanje varnosti AI

---

## 3. Nadaljujte Svojo Učno Pot

### Priporočeni Naslednji Koraki

| Pot | Vir | Čas |
|:---|:---|:---|
| **Izpopolnjen tečaj** | [AZD za začetnike Kurikulum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Samostojno |
| **Preizkusite drug vzorec** | [Microsoft Foundry Vzorci](https://ai.azure.com/templates) | 1-2 uri |
| **Podrobno** | [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Teče |
| **Skupnost** | [Azure Discord](https://aka.ms/foundry/discord) | Pridružite se danes! |

### Predlagani vzorci za naslednji preizkus

1. **[Začnite z AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Osnovni klepet z vašimi podatki
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Napredni RAG vzorci
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Scenariji za poslovno maloprodajo

---

## 4. Izziv Delavnice

Ste pripravljeni preizkusiti svoje sposobnosti? Poskusite te izzive:

| Izziv | Opis | Težavnost |
|:---|:---|:---|
| **1. Večagentni scenarij** | Namestite in prilagodite za drugo industrijo (npr. zdravstvo, finance) | ⭐⭐ |
| **2. Prilagojena baza znanja** | Dodajte svoje podatkovne datoteke in ustvarite po meri iskalni indeks | ⭐⭐⭐ |
| **3. Produkcijska namestitev** | Nastavite CI/CD z GitHub Actions z uporabo `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Delite svoje povratne informacije

Vaše povratne informacije nam pomagajo izboljšati to delavnico!

- **GitHub Issues**: [Objavite povratne informacije](https://github.com/microsoft/azd-for-beginners/issues) - označite z `Workshop`
- **Discord**: Pridružite se [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - objavite v `#get-help`
- **Prispevki**: Pomagajte izboljšati delavnico z oddajo pull requestov!

---

## Hvala! 🎉

Hvala, ker ste zaključili delavnico AZD za AI razvijalce. Upamo, da vam je ta izkušnja dala veščine in zaupanje za izgradnjo in nameščanje AI aplikacij na Azure.

**Nadaljujte z gradnjo, nadaljujte z učenjem in dobrodošli v skupnosti Azure AI razvijalcev!**

---

| | |
|:---|:---|
| **📚 Domovska stran tečaja** | [AZD za začetnike](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentacija** | [Dokumentacija Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Vzorci** | [Microsoft Foundry Vzorci](https://ai.azure.com/templates) |
| **💬 Skupnost** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->