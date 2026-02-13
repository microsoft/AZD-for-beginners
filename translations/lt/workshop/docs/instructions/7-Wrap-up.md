# 7. Apibendrinimas ir tolesni žingsniai

!!! tip "PAGRINDINIAI IŠSINEŠTI DALYKAI"

    - [ ] AZD šablonai pagreitina AI programų kūrimą nuo dienų iki valandų
    - [ ] Discovery → Deployment → Customization metodika suteikia struktūrizuotą mokymosi kelią
    - [ ] GitHub Copilot su MCP serveriais leidžia natūralios kalbos būdu tyrinėti sudėtingas kodo bazes
    - [ ] Microsoft Foundry suteikia integruotą stebėjimą, vertinimą ir saugumo testavimą

---

## 1. Ką pasiekėte

Sveikiname! Šioje dirbtuvėje sėkmingai atlikote:

| Modulis | Pasiekimas |
|:---|:---|
| **Modulis 1** | Susipažinote su Azure Developer CLI ir pasirinkote AI šabloną |
| **Modulis 2** | Išdiegėte ir patvirtinote pilną AI agentų sprendimą |
| **Modulis 3** | Išardėte šabloną, kad suprastumėte jo architektūrą |
| **Modulis 4** | Išnagrinėjote `azure.yaml` konfigūraciją ir gyvenimo ciklo hook'us |
| **Modulis 5** | Priderinote šabloną pagal savo scenarijų |
| **Modulis 6** | Saugiai nugriovėte infrastruktūrą ir valdėte išteklius |

---

## 2. Pagrindinės įsisavintos sąvokos

### Azure Developer CLI (azd)
- `azd init` - Inicializuoti projektus iš šablonų
- `azd up` - Paruošti ir išdiegti vienu komandu
- `azd env` - Valdyti aplinkos kintamuosius
- `azd down` - Saugiai pašalinti išteklius

### AZD šablono struktūra
- `azure.yaml` - Konfigūracija ir diegimo hook'ai
- `infra/` - Bicep infrastruktūra kaip kodas
- `src/` - Programos šaltinio kodas
- `scripts/` - Automatizacijos ir konfigūracijos scenarijai

### Microsoft Foundry galimybės
- AI Agent Service intelektualiems asistentams
- File Search ir Azure AI Search žinių gavimui
- Integruotas sekimas, stebėjimas ir vertinimas
- Red teaming AI saugumo patikrai

---

## 3. Tęskite savo mokymosi kelią

### Rekomenduojami tolesni žingsniai

| Kryptis | Išteklius | Laikas |
|:---|:---|:---|
| **Užbaigti kursą** | [AZD pradedantiesiems kursas](../../README.md) | 8-12 valandų |
| **Išbandyti kitą šabloną** | [Microsoft Foundry šablonai](https://ai.azure.com/templates) | 1-2 valandos |
| **Gilesnis įsigilinimas** | [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Nuolat |
| **Bendruomenė** | [Azure Discord](https://aka.ms/foundry/discord) | Prisijunkite šiandien! |

### Siūlomi šablonai, kuriuos verta išbandyti toliau

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Pagrindinis pokalbis su jūsų duomenimis
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Išplėstiniai RAG modeliai
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Verslo mažmeninės prekybos scenarijai

---

## 4. Dirbtuvių iššūkis

Pasiruošę išbandyti įgūdžius? Išmėginkite šiuos iššūkius:

| Iššūkis | Aprašymas | Sunkumo lygis |
|:---|:---|:---|
| **1. Daugiagentis scenarijus** | Įdiekite ir pritaikykite skirtingam sektoriui (pvz., sveikatos priežiūra, finansai) | ⭐⭐ |
| **2. Pasirinktinė žinių bazė** | Pridėkite savo duomenų failus ir sukurkite pasirinktą paieškos indeksą | ⭐⭐⭐ |
| **3. Diegimas į gamybą** | Nustatykite CI/CD su GitHub Actions naudojant `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Pasidalinkite atsiliepimais

Jūsų atsiliepimai padeda mums tobulinti šias dirbtuves!

- **GitHub Issues**: [Pateikti atsiliepimą](https://github.com/microsoft/azd-for-beginners/issues) - pažymėkite žyma `Workshop`
- **Discord**: Prisijunkite prie [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - rašykite kanale `#get-help`
- **Prisidėjimai**: Padėkite tobulinti dirbtuves pateikdami pull request'us!

---

## Ačiū! 🎉

Dėkojame, kad baigėte AZD for AI Developers dirbtuves. Tikimės, kad ši patirtis suteikė jums įgūdžių ir pasitikėjimo kurti ir diegti AI programas Azure platformoje.

**Tęskite kūrimą, toliau mokykitės ir sveiki atvykę į Azure AI kūrėjų bendruomenę!**

---

| | |
|:---|:---|
| **📚 Kurso pradžia** | [AZD pradedantiesiems](../../README.md) |
| **📖 Dokumentacija** | [Azure Developer CLI dokumentacija](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI šablonai** | [Microsoft Foundry šablonai](https://ai.azure.com/templates) |
| **💬 Bendruomenė** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Atsakomybės apribojimas:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors stengiamės užtikrinti tikslumą, atkreipkite dėmesį, kad automatiniai vertimai gali turėti klaidų arba netikslumų. Originalus dokumentas jo gimtąja kalba turi būti laikomas autoritetingu šaltiniu. Svarbios informacijos atveju rekomenduojamas profesionalus žmogaus atliktas vertimas. Mes neatsakome už jokius nesusipratimus ar neteisingus aiškinimus, kilusius dėl šio vertimo naudojimo.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->