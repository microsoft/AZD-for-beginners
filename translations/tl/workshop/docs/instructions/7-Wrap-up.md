# 7. Pagwawakas at Mga Susunod na Hakbang

!!! tip "ANG MGA PANGUNAHING MENSAHE NA DAPAT DALUHIN AY"

    - [ ] AZD templates accelerate AI application development from days to hours
    - [ ] The Discovery → Deployment → Customization methodology provides a structured learning path
    - [ ] GitHub Copilot with MCP servers enables natural language exploration of complex codebases
    - [ ] Microsoft Foundry provides built-in observability, evaluation, and security testing

---

## 1. Ano ang Iyong Natapos

Binabati kita! Sa workshop na ito, matagumpay mong nagawa ang mga sumusunod:

| Module | Natapos |
|:---|:---|
| **Module 1** | Natuklasan ang Azure Developer CLI at pumili ng AI template |
| **Module 2** | Nai-deploy at na-validate ang kumpletong solusyon ng AI agents |
| **Module 3** | Binuwag ang template upang maunawaan ang arkitektura nito |
| **Module 4** | Na-explore ang `azure.yaml` configuration at lifecycle hooks |
| **Module 5** | Na-customize ang template para sa iyong sariling scenario |
| **Module 6** | Maingat na na-demolish ang infrastructure at na-manage ang mga resources |

---

## 2. Mga Pangunahing Konseptong Napag-aralan

### Azure Developer CLI (azd)
- `azd init` - Mag-initialize ng mga proyekto mula sa mga template
- `azd up` - Mag-provision at mag-deploy gamit ang isang utos
- `azd env` - Mag-manage ng mga environment variables
- `azd down` - Maglinis ng mga resources nang ligtas

### Strukturang AZD Template
- `azure.yaml` - Mga configuration at deployment hooks
- `infra/` - Bicep infrastructure-as-code
- `src/` - Application source code
- `scripts/` - Mga automation at setup scripts

### Mga Kakayahan ng Microsoft Foundry
- AI Agent Service para sa mga intelligent assistants
- File Search at Azure AI Search para sa pagkuha ng kaalaman
- Built-in tracing, monitoring, at evaluation
- Red teaming para sa AI safety validation

---

## 3. Ipagpatuloy ang Iyong Paglalakbay sa Pag-aaral

### Inirerekomendang Mga Susunod na Hakbang

| Landas | Resource | Oras |
|:---|:---|:---|
| **Kumpletuhin ang Kurso** | [AZD for Beginners Curriculum](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) | Self-paced |
| **Subukan ang Ibang Template** | [Microsoft Foundry Templates](https://ai.azure.com/templates) | 1-2 oras |
| **Malalimang Pag-aaral** | [Azure Developer CLI Documentation](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Patuloy |
| **Komunidad** | [Azure Discord](https://aka.ms/foundry/discord) | Sumali ngayon! |

### Mga Template na Inirerekomendang Subukan Kasunod

1. **[Magsimula sa AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Pangunahing chat gamit ang iyong data
2. **[Azure Search OpenAI Demo](https://github.com/Azure-Samples/azure-search-openai-demo)** - Advanced na RAG patterns
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Mga enterprise retail na scenario

---

## 4. Hamon sa Workshop

Handa ka na bang subukan ang iyong mga kasanayan? Subukan ang mga hamon na ito:

| Hamon | Paglalarawan | Antas ng Hirap |
|:---|:---|:---|
| **1. Multi-Agent Scenario** | I-deploy at i-customize para sa ibang industriya (halimbawa, healthcare, finance) | ⭐⭐ |
| **2. Custom Knowledge Base** | Magdagdag ng sarili mong mga data files at gumawa ng custom search index | ⭐⭐⭐ |
| **3. Production Deployment** | Mag-setup ng CI/CD gamit ang GitHub Actions gamit ang `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Ibahagi ang Iyong Feedback

Makakatulong ang iyong feedback sa pagpapabuti ng workshop na ito!

- **GitHub Issues**: [Mag-submit ng feedback](https://github.com/microsoft/azd-for-beginners/issues) - tag gamit ang `Workshop`
- **Discord**: Sumali sa [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - mag-post sa `#get-help`
- **Contributions**: Tumulong sa pagpapabuti ng workshop sa pamamagitan ng pagsusumite ng pull requests!

---

## Maraming Salamat! 🎉

Salamat sa pagtapos ng AZD for AI Developers Workshop. Sana ay nabigyan ka ng kasanayan at kumpiyansa para gumawa at mag-deploy ng AI applications sa Azure.

**Patuloy na magtayo, patuloy na matuto, at maligayang pagdating sa Azure AI developer community!**

---

| | |
|:---|:---|
| **📚 Course Home** | [AZD For Beginners](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md) |
| **📖 Documentation** | [Azure Developer CLI Docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
| **💬 Community** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->