# 7. Opsummering & Næste skridt

!!! tip "DE VIGTIGSTE BUDSKABER ER"

    - [ ] AZD-skabeloner accelererer udviklingen af AI-applikationer fra dage til timer
    - [ ] Discovery → Deployment → Customization-metodologien giver en struktureret læringsvej
    - [ ] GitHub Copilot med MCP-servere muliggør udforskning af komplekse kodebaser med naturligt sprog
    - [ ] Microsoft Foundry tilbyder indbygget observabilitet, evaluering og sikkerhedstest

---

## 1. Hvad du har opnået

Tillykke! I denne workshop har du med succes:

| Modul | Resultat |
|:---|:---|
| **Modul 1** | Opdagede Azure Developer CLI og valgte en AI-skabelon |
| **Modul 2** | Nedrullede og validerede en komplet AI-agentløsning |
| **Modul 3** | Nedbrød skabelonen for at forstå dens arkitektur |
| **Modul 4** | Udforskede `azure.yaml`-konfiguration og livscyklus hooks |
| **Modul 5** | Tilpassede skabelonen til dit eget scenarie |
| **Modul 6** | Nedtog sikkert infrastrukturen og håndterede ressourcer |

---

## 2. Centrale koncepter du har mestret

### Azure Developer CLI (azd)
- `azd init` - Initialiser projekter fra skabeloner
- `azd up` - Provisionér og udrul i én kommando
- `azd env` - Administrer miljøvariabler
- `azd down` - Ryd sikkert op i ressourcer

### AZD-skabelonstruktur
- `azure.yaml` - Konfiguration og udrulningshooks
- `infra/` - Bicep infrastruktur-som-kode
- `src/` - Applikationskildekode
- `scripts/` - Automatiserings- og opsætningsscripts

### Microsoft Foundry-funktioner
- AI Agent Service til intelligente assistenter
- File Search og Azure AI Search til vidensøgning
- Indbygget tracing, overvågning og evaluering
- Red teaming til validering af AI-sikkerhed

---

## 3. Fortsæt din læringsrejse

### Anbefalede næste skridt

| Vej | Ressource | Tid |
|:---|:---|:---|
| **Fuldfør kursus** | [AZD for Beginners Curriculum](../../README.md) | 8-12 timer |
| **Prøv en anden skabelon** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 timer |
| **Dyk dybere** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Løbende |
| **Fællesskab** | [Azure Discord](https://aka.ms/foundry/discord) | Deltag i dag! |

### Foreslåede skabeloner at prøve

1. **[Get Started with AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Grundlæggende chat med dine data
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Avancerede RAG-mønstre
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Virksomheds detailhandelsscenarier

---

## 4. Workshop-udfordring

Klar til at teste dine færdigheder? Prøv disse udfordringer:

| Udfordring | Beskrivelse | Sværhedsgrad |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | Udrul og tilpas til en anden branche (f.eks. sundhedsvæsen, finans) | ⭐⭐ |
| **2. Custom Knowledge Base** | Tilføj dine egne datafiler og opret et tilpasset søgeindeks | ⭐⭐⭐ |
| **3. Production Deployment** | Opsæt CI/CD med GitHub Actions ved hjælp af `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Del din feedback

Din feedback hjælper os med at forbedre denne workshop!

- **GitHub Issues**: [Indsend feedback](https://github.com/microsoft/azd-for-beginners/issues) - tag med `Workshop`
- **Discord**: Deltag i [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - skriv i `#get-help`
- **Bidrag**: Hjælp med at forbedre workshoppen ved at indsende pull requests!

---

## Tak! 🎉

Tak for at du gennemførte AZD for AI Developers Workshop. Vi håber, at denne oplevelse har givet dig færdighederne og selvtilliden til at bygge og udrulle AI-applikationer på Azure.

Bliv ved med at bygge, bliv ved med at lære, og velkommen til Azure AI-udviklerfællesskabet!

---

| | |
|:---|:---|
| **📚 Kursusside** | [AZD For Beginners](../../README.md) |
| **📖 Dokumentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI-skabeloner** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Fællesskab** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Ansvarsfraskrivelse:
Dette dokument er blevet oversat ved hjælp af AI-oversættelsestjenesten [Co-op Translator](https://github.com/Azure/co-op-translator). Selvom vi stræber efter nøjagtighed, skal du være opmærksom på, at automatiske oversættelser kan indeholde fejl eller unøjagtigheder. Det oprindelige dokument på originalsproget bør betragtes som den autoritative kilde. For kritisk information anbefales en professionel menneskelig oversættelse. Vi påtager os intet ansvar for misforståelser eller fejltolkninger, der måtte opstå som følge af brugen af denne oversættelse.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->