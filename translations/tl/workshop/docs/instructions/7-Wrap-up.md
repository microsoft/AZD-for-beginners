# 7. Pagwawakas at Susunod na Mga Hakbang

!!! tip "ANG MGA PANGUNAHING PAALALA AY"

    - [ ] Pinapabilis ng mga AZD template ang pagbuo ng mga aplikasyon ng AI mula sa loob ng mga araw hanggang sa mga oras
    - [ ] Nagbibigay ang metodolohiyang Discovery → Deployment → Customization ng isang estrukturadong landas ng pagkatuto
    - [ ] Pinapahintulutan ng GitHub Copilot na may MCP servers ang paggalugad ng komplikadong mga codebase gamit ang natural na wika
    - [ ] Nagbibigay ang Microsoft Foundry ng naka-built-in na obserbasyon, ebalwasyon, at pagsubok sa seguridad

---

## 1. Ano ang Iyong Nakamit

Binabati kita! Sa workshop na ito, matagumpay mong nagawa ang mga sumusunod:

| Modul | Nakamit |
|:---|:---|
| **Modul 1** | Nadiskubre ang Azure Developer CLI at pumili ng AI template |
| **Modul 2** | Na-deploy at na-validate ang kumpletong solusyon para sa AI agents |
| **Modul 3** | Sinuri nang detalyado ang template upang maunawaan ang arkitektura nito |
| **Modul 4** | Ineksplora ang `azure.yaml` na konfigurasyon at mga lifecycle hook |
| **Modul 5** | Inangkop ang template para sa iyong sariling senaryo |
| **Modul 6** | Maingat na tinanggal ang imprastruktura at pinamahalaan ang mga resource |

---

## 2. Mga Pangunahing Konseptong Natutunan

### Azure Developer CLI (azd)
- `azd init` - I-initialize ang mga proyekto mula sa mga template
- `azd up` - Mag-provision at mag-deploy sa isang utos
- `azd env` - Pamahalaan ang mga environment variable
- `azd down` - Ligtas na linisin ang mga resource

### AZD Template Structure
- `azure.yaml` - Konfigurasyon at mga deployment hook
- `infra/` - Bicep infrastructure-as-code
- `src/` - Source code ng aplikasyon
- `scripts/` - Mga script para sa automation at setup

### Microsoft Foundry Capabilities
- AI Agent Service para sa mga intelihenteng assistant
- File Search at Azure AI Search para sa pagkuha ng kaalaman
- Naka-built-in na tracing, pagsubaybay, at ebalwasyon
- Red teaming para sa pagpapatunay ng kaligtasan ng AI

---

## 3. Ipagpatuloy ang Iyong Paglalakbay sa Pagkatuto

### Inirerekomendang Susunod na Mga Hakbang

| Landas | Mapagkukunan | Oras |
|:---|:---|:---|
| **Kumpletong Kurso** | [Kurikulum ng AZD para sa mga Nagsisimula](../../README.md) | 8-12 oras |
| **Subukan ang Ibang Template** | [Mga Template ng Microsoft Foundry](https://ai.azure.com/templates) | 1-2 oras |
| **Mas Malalim na Pagsisid** | [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) | Patuloy |
| **Komunidad** | [Azure Discord](https://aka.ms/foundry/discord) | Sumali ngayon! |

### Mga Inirekomendang Template na Subukan Susunod

1. **[Magsimula sa AI Chat](https://github.com/Azure-Samples/get-started-with-ai-chat)** - Pangunahing chat gamit ang iyong data
2. **[Demo ng Azure Search OpenAI](https://github.com/Azure-Samples/azure-search-openai-demo)** - Mas advanced na mga pattern ng RAG
3. **[Contoso Chat](https://github.com/Azure-Samples/contoso-chat)** - Mga senaryong retail ng enterprise

---

## 4. Hamon ng Workshop

Handa na bang subukan ang iyong mga kasanayan? Subukan ang mga hamong ito:

| Hamon | Paglalarawan | Antas ng Kahirapan |
|:---|:---|:---|
| **1. Senaryong Multi-Agent** | I-deploy at i-customize para sa ibang industriya (hal., healthcare, finance) | ⭐⭐ |
| **2. Pasadyang Knowledge Base** | Magdagdag ng sarili mong data files at gumawa ng pasadyang search index | ⭐⭐⭐ |
| **3. Deployment sa Produksyon** | I-set up ang CI/CD gamit ang GitHub Actions gamit ang `azd pipeline config` | ⭐⭐⭐⭐ |

---

## 5. Ibahagi ang Iyong Feedback

Ang iyong feedback ay tumutulong sa amin na pagbutihin ang workshop na ito!

- **Mga Isyu sa GitHub**: [Mag-post ng feedback](https://github.com/microsoft/azd-for-beginners/issues) - tag with `Workshop`
- **Discord**: Sumali sa [Microsoft Foundry Discord](https://aka.ms/foundry/discord) - mag-post sa `#get-help`
- **Mga Ambag**: Tumulong pagbutihin ang workshop sa pamamagitan ng pagsusumite ng pull requests!

---

## Salamat! 🎉

Salamat sa pagtapos ng AZD for AI Developers Workshop. Inaasahan namin na ang karanasang ito ay nagbigay sa iyo ng mga kasanayan at kumpiyansa upang bumuo at mag-deploy ng mga aplikasyon ng AI sa Azure.

**Magpatuloy sa pagbuo, magpatuloy sa pag-aaral, at maligayang pagdating sa komunidad ng mga developer ng Azure AI!**

---

| | |
|:---|:---|
| **📚 Tahanan ng Kurso** | [AZD Para sa mga Nagsisimula](../../README.md) |
| **📖 Dokumentasyon** | [Dokumentasyon ng Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/) |
| **🛠️ Mga Template ng AI** | [Mga Template ng Microsoft Foundry](https://ai.azure.com/templates) |
| **💬 Komunidad** | [Azure Discord](https://aka.ms/foundry/discord) |

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Isinalin ang dokumentong ito gamit ang serbisyong pagsasalin ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsusumikap kami para sa katumpakan, pakitandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o di-tumpak na impormasyon. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa kritikal na impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->