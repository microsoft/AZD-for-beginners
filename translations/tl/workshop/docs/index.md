# AZD para sa Mga Developer ng AI Workshop

> Nasubok gamit ang `azd 1.27.1` noong Hulyo 2026.

> [!IMPORTANT]  
> **Ang workshop na ito ay may kasamang workshop guide na maaari mong makita sa iyong lokal na browser. Upang magsimula, buksan ang repo sa GitHub Codespaces, isang dev container, o lokal na kopya na may naka-install na MkDocs—pagkatapos ay hintayin hanggang makita mo ang aktibong VS Code terminal at i-type:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Dapat kang makakita ng pop-up dialog upang buksan ang preview page sa browser.**

Maligayang pagdating sa hands-on workshop para matutunan ang Azure Developer CLI (AZD) na nakatuon sa deployment ng AI application. Tinutulungan ka ng workshop na ito na magkaroon ng praktikal na pag-unawa sa AZD templates sa 3 hakbang:

1. **Paghahanap** - hanapin ang tamang template para sa iyo.
1. **Deployment** - i-deploy at i-validate na gumagana ito
1. **Pag-customize** - baguhin at paunlarin upang maging sa iyo ito!

Sa kabuuan ng workshop na ito, ipakikilala ka rin sa mga pangunahing developer tools at workflows, upang makatulong sa pag-streamline ng iyong kabuuang proseso ng pag-develop.

| | | 
|:---|:---|
| **📚 Course Home**| [AZD Para sa Mga Nagsisimula](../README.md)|
| **📖 Dokumentasyon** | [Magsimula gamit ang AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Mga Template ng Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Mga Susunod na Hakbang** | [Tanggapin ang Hamon](#workshop-challenge) |
| | |

## Pangkalahatang Ideya ng Workshop

**Tagal:** 3-4 na oras  
**Antas:** Nagsisimula hanggang Gitnang Antas  
**Kailangang Kaalaman:** Pamilyar sa Azure, mga konsepto ng AI, VS Code at mga command-line tools.

Ito ay isang hands-on workshop kung saan natututo ka sa pamamagitan ng paggawa. Pagkatapos mong matapos ang mga ehersisyo, inirerekomenda naming suriin ang AZD Para sa Mga Nagsisimula na kurikulum upang ipagpatuloy ang iyong pag-aaral sa Seguridad at mga pinakamahuhusay na gawain sa Produktibidad.

| Oras| Module  | Layunin |
|:---|:---|:---|
| 15 minuto | Panimula | Itakda ang layunin, unawain ang mga hangarin |
| 30 minuto | Piliin ang AI Template | Tuklasin ang mga opsyon at pumili ng panimula | 
| 30 minuto | I-validate ang AI Template | I-deploy ang default solusyon sa Azure |
| 30 minuto | I-deconstruct ang AI Template | Tuklasin ang istruktura at konfigurasyon |
| 30 minuto | I-configure ang AI Template | I-activate at subukan ang mga magagamit na tampok |
| 30 minuto | I-customize ang AI Template | Iangkop ang template ayon sa iyong pangangailangan |
| 30 minuto | I-teardown ang Infrastructure | Linisin at pakawalan ang mga resources |
| 15 minuto | Wrap-Up at Mga Susunod na Hakbang | Mga mapagkukunan sa pag-aaral, hamon ng Workshop |
| | |

## Ano ang Matututunan Mo

Isipin ang AZD Template bilang isang learning sandbox upang tuklasin ang iba't ibang kakayahan at mga tools para sa end-to-end development sa Microsoft Foundry. Sa pagtatapos ng workshop na ito, dapat ay mayroon kang intuitive na pag-unawa sa iba't ibang tools at konsepto sa kontekstong ito.

| Konsepto  | Layunin |
|:---|:---|
| **Azure Developer CLI** | Unawain ang mga utos ng tool at mga workflow|
| **AZD Templates**| Unawain ang istruktura ng proyekto at config|
| **Azure AI Agent**| Mag-provision at mag-deploy ng Microsoft Foundry project  |
| **Azure AI Search**| Paganahin ang context engineering gamit ang mga agents |
| **Observability**| Tuklasin ang tracing, monitoring at evaluations |
| **Red Teaming**| Tuklasin ang adversarial testing at mga mitigasyon |
| | |

## Mga Module ng Workshop

Handa ka na bang magsimula? Mag-navigate sa mga module ng workshop:

- [Module 1: Piliin ang AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: I-validate ang AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: I-deconstruct ang AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: I-configure ang AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: I-customize ang AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: I-teardown ang Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up at Mga Susunod na Hakbang](instructions/7-Wrap-up.md)

## May feedback?

Mag-post ng isyu sa repo na ito (i-tag ito bilang `Workshop`) o sumali sa amin sa [Discord](https://aka.ms/foundry/discord) at mag-post sa aming `#get-help` channel

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->