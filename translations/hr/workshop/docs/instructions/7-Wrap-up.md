# 7. Zaključenje i sljedeći koraci

!!! tip "GLAVNE PORUKE ZA PAMĆENJE SU"

    - [ ] AZD predlošci ubrzavaju razvoj AI aplikacija sa dana na sate
    - [ ] Metodologija Discovery → Deployment → Customization pruža strukturirani put učenja
    - [ ] GitHub Copilot s MCP poslužiteljima omogućuje istraživanje složenih kodnih baza prirodnim jezikom
    - [ ] Microsoft Foundry pruža ugrađenu promatraljivost, evaluaciju i sigurnosna testiranja

---

## 1. Što ste postigli

Čestitamo! Na ovom radionici uspješno ste:

| Modul | Postignuće |
|:---|:---|
| **Modul 1** | Otkrićete Azure Developer CLI i odabrali AI predložak |
| **Modul 2** | Deployali i validirali cjelovito AI agents rješenje |
| **Modul 3** | Rastavili predložak da biste razumjeli njegovu arhitekturu |
| **Modul 4** | Istražili konfiguraciju `azure.yaml` i životne cikluse |
| **Modul 5** | Prilagodili predložak za vlastiti scenarij |
| **Modul 6** | Sigurno rastavili infrastrukturu i upravljali resursima |

---

## 2. Ključni usvojeni pojmovi

### Azure Developer CLI (azd)
- `azd init` - Inicijalizacija projekata iz predložaka
- `azd up` - Provision i deploy u jednoj naredbi
- `azd env` - Upravljanje varijablama okruženja
- `azd down` - Sigurno čišćenje resursa

### Struktura AZD predloška
- `azure.yaml` - Konfiguracija i deploy hookovi
- `infra/` - Bicep infrastruktura kao kod
- `src/` - Izvorni kod aplikacije
- `scripts/` - Automatizacijski i setup skripti

### Mogućnosti Microsoft Foundry-ja
- AI Agent Service za inteligentne asistente
- File Search i Azure AI Search za dohvat znanja
- Ugrađeno praćenje, nadzor i evaluacija
- Red teaming za validaciju sigurnosti AI-ja

---

## 3. Nastavite svoje učiti

### Preporučeni sljedeći koraci

| Put | Resurs | Vrijeme |
|:---|:---|:---|
| **Završite tečaj** | [AZD za početnike kurikulum](../../README.md) | 8-12 sati |
| **Isprobajte drugi predložak** | [Microsoft Foundry predlošci](https://ai.azure.com/templates) | 1-2 sata |
| **Dubinska analiza** | [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | U tijeku |
| **Zajednica** | [Azure Discord](https://aka.ms/foundry/discord) | Pridružite se danas! |

### Predloženi predlošci za isprobati sljedeće

1. **[Započnite s AI chatom](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Osnovni chat s vašim podacima
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Napredni RAG obrasci
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Enterprise scenariji maloprodaje

---

## 4. Izazov radionice

Spremni testirati svoje vještine? Isprobajte ove izazove:

| Izazov | Opis | Težina |
|:---|:---|:---|
| **1. Multi-agentni scenarij** | Deployajte i prilagodite za drugu industriju (npr. zdravstvena njega, financije) | ⭐⭐ |
| **2. Prilagođena baza znanja** | Dodajte vlastite podatkovne datoteke i kreirajte prilagođeni indeks pretraživanja | ⭐⭐⭐ |
| **3. Deploy u produkciji** | Postavite CI/CD s GitHub Actions korištenjem `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Podijelite svoje povratne informacije

Vaše povratne informacije pomažu nam poboljšati ovu radionicu!

- **GitHub Issues**: [Objavite povratnu informaciju](https://github.com/microsoft/azd-for-beginners/issues) - označite s `Workshop`
- **Discord**: Pridružite se [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - objavite u `#get-help`
- **Doprinosi**: Pomozite poboljšati radionicu slanjem pull requestova!

---

## Hvala vam! 🎉

Hvala što ste završili AZD za AI Developere radionicu. Nadamo se da vam je ovo iskustvo dalo vještine i samopouzdanje za izgradnju i deploy AI aplikacija na Azure.

**Nastavite graditi, nastaviti učiti i dobrodošli u Azure AI developersku zajednicu!**

---

| | |
|:---|:---|
| **📚 Početna stranica tečaja** | [AZD za početnike](../../README.md) |
| **📖 Dokumentacija** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Predlošci** | [Microsoft Foundry predlošci](https://ai.azure.com/templates) |
| **💬 Zajednica** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Odricanje od odgovornosti**:
Ovaj dokument je preveden korištenjem AI prevoditeljske usluge [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim i autoritativnim izvorom. Za važne informacije preporučuje se profesionalni ljudski prijevod. Ne odgovaramo za bilo kakva nerazumijevanja ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->