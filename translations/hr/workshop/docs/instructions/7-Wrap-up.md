# 7. Zaključak i sljedeći koraci

!!! tip "GLAVNE PORUKE SU"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Što ste postigli

Čestitamo! U ovom radionici ste uspješno:

| Modul | Postignuće |
|:---|:---|
| **Modul 1** | Otkrijte Azure Developer CLI i odaberite AI predložak |
| **Modul 2** | Postavili i potvrdili kompletnu AI agentsku rješenje |
| **Modul 3** | Raspakirali predložak kako biste razumjeli njegovu arhitekturu |
| **Modul 4** | Istražili konfiguraciju `azure.yaml` i životni ciklus kuka |
| **Modul 5** | Prilagodili predložak za svoj scenarij |
| **Modul 6** | Sigurno uklonili infrastrukturu i upravljali resursima |

---

## 2. Ključni savladani koncepti

### Azure Developer CLI (azd)
- `azd init` - Inicijalizacija projekata iz predložaka
- `azd up` - Provision i postavljanje jednim naredbom
- `azd env` - Upravljanje varijablama okoline
- `azd down` - Sigurno čišćenje resursa

### Struktura AZD predloška
- `azure.yaml` - Konfiguracijski i deployment hookovi
- `infra/` - Bicep infrastruktura-ka-kodu
- `src/` - Izvorni kod aplikacije
- `scripts/` - Skripte za automatizaciju i postavljanje

### Mogućnosti Microsoft Foundryja
- AI Agent servis za inteligentne asistente
- Pretraživanje datoteka i Azure AI Search za dohvat znanja
- Ugrađeno praćenje, nadgledanje i evaluacija
- Red teaming za sigurnosnu validaciju AI-ja

---

## 3. Nastavite svoje učenje

### Preporučeni sljedeći koraci

| Put | Resurs | Vrijeme |
|:---|:---|:---|
| **Dovršite tečaj** | [AZD za početnike kurikulum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Samostalno |
| **Isprobajte drugi predložak** | [Microsoft Foundry predlošci](https://ai.azure.com/templates) | 1-2 sata |
| **Dubinska analiza** | [Dokumentacija za Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Neprekidno |
| **Zajednica** | [Azure Discord](https://aka.ms/foundry/discord) | Pridružite se danas! |

### Predloženi predlošci za isprobavanje

1. **[Početak s AI chatom](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Osnovni chat s vašim podacima
2. **[Azure Search OpenAI demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Napredni RAG obrasci
3. **[Contoso chat](https://github.com/Azure-Samples/contoso-chat)** - Scenariji za korporativnu maloprodaju

---

## 4. Izazov radionice

Spremni testirati svoje vještine? Isprobajte ove izazove:

| Izazov | Opis | Težina |
|:---|:---|:---|
| **1. Scenarij s više agenata** | Postavite i prilagodite za različitu industriju (npr. zdravstvo, financije) | ⭐⭐ |
| **2. Prilagođena baza znanja** | Dodajte vlastite podatkovne datoteke i kreirajte prilagođeni indeks pretraživanja | ⭐⭐⭐ |
| **3. Produkcijsko postavljanje** | Postavite CI/CD pomoću GitHub Actions koristeći `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Podijelite svoje povratne informacije

Vaše povratne informacije pomažu nam poboljšati ovu radionicu!

- **GitHub Issues**: [Pošaljite povratne informacije](https://github.com/microsoft/azd-for-beginners/issues) - označite s `Workshop`
- **Discord**: Pridružite se [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - objavite u `#get-help`
- **Doprinosi**: Pomozite poboljšati radionicu slanjem pull zahtjeva!

---

## Hvala vam! 🎉

Hvala što ste sudjelovali u radionici AZD za AI developere. Nadamo se da vas je ovo iskustvo osposobilo i dalo vam samopouzdanje za izgradnju i postavljanje AI aplikacija na Azure.

**Nastavite graditi, nastaviti učiti i dobrodošli u Azure AI zajednicu developera!**

---

| | |
|:---|:---|
| **📚 Početna stranica tečaja** | [AZD za početnike](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Dokumentacija** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI predlošci** | [Microsoft Foundry predlošci](https://ai.azure.com/templates) |
| **💬 Zajednica** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->