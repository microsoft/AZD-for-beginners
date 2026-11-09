# AZD para sa AI Developers Workshop

> Ang pinagbatayan na patnubay ay sinuri laban sa AZD 1.37.2 noong Nobyembre 4, 2026. Ang mga screenshot ay ilustratibo; maaaring magbago ang availability ng serbisyo, mga label sa portal, at default ng mga template.

> [!IMPORTANT]  
> **Ang workshop na ito ay may kasamang workshop guide na maaari mong tingnan sa iyong lokal na browser. Upang makapagsimula, buksan ang repo sa GitHub Codespaces, isang dev container, o lokal na clone na may nakainstall na MkDocs—pagkatapos maghintay hanggang makita mo ang aktibong terminal ng VS Code at i-type:**  
> Mula sa root ng kursong repository, i-install ang `requirements-dev.txt`, pagkatapos ay patakbuhin ang `python -m mkdocs serve --config-file workshop/mkdocs.yml` sa foreground.
> **Dapat kang makakita ng pop-up dialog upang buksan ang preview page sa browser.**

Maligayang pagdating sa hands-on workshop para matutunan ang Azure Developer CLI (AZD) na may pokus sa deployment ng AI application. Ang workshop na ito ay tutulong sa iyo na magkaroon ng praktikal na pag-unawa sa AZD templates sa 3 hakbang:

1. **Discovery** - hanapin ang template na akma sa iyo.
1. **Deployment** - i-deploy at tiyaking gumagana ito
1. **Customization** - baguhin at paunlarin para maging iyo!

Sa kabuuan ng workshop na ito, ipakikilala rin sa iyo ang mga pangunahing developer tools at workflows, upang matulungan kang mapadali ang iyong end-to-end development journey.

| | | 
|:---|:---|
| **📚 Home ng Kurso**| [AZD Para sa Mga Baguhan](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentasyon** | [Magsimula sa AI templates](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Templates** | [Microsoft Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Susunod na Mga Hakbang** | [Kunin ang Hamon](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Pangkalahatang Ideya ng Workshop

**Tagal:** 3-4 na oras  
**Antas:** Baguhan hanggang Intermediate  
**Kailangang Kaalaman:** Pamilyar sa Azure, mga konsepto ng AI, VS Code at mga command-line tool.

Ito ay isang hands-on workshop kung saan natututo ka sa pamamagitan ng paggawa. Kapag natapos mo na ang mga ehersisyo, inirerekomenda naming suriin ang AZD Para sa Mga Baguhan na kurikulum upang ipagpatuloy ang iyong paglalakbay sa pag-aaral patungo sa mga pinakamahusay na kasanayan sa Seguridad at Produktibidad.

| Oras| Module  | Layunin |
|:---|:---|:---|
| 15 minuto | Panimula | Ihanda ang entablado, unawain ang mga layunin |
| 30 minuto | Pumili ng AI Template | Tuklasin ang mga opsyon at pumili ng simula | 
| 30 minuto | Patunayan ang AI Template | I-deploy ang default na solusyon sa Azure |
| 30 minuto | Isa-isahin ang AI Template | Suriin ang istruktura at konfigurasyon |
| 30 minuto | I-configure ang AI Template | I-activate at subukan ang mga tampok na magagamit |
| 30 minuto | I-customize ang AI Template | Iangkop ang template ayon sa iyong pangangailangan |
| 30 minuto | I-teardown ang Infrastructure | Linisin at palayain ang mga resources |
| 15 minuto | Pagsasara at Susunod na Mga Hakbang | Mga pinagkukunan ng pag-aaral, Workshop challenge |
| | |

## Ang mga Matututuhan Mo

Isipin ang AZD Template bilang isang learning sandbox para tuklasin ang iba't ibang kakayahan at mga tool para sa end-to-end development sa Microsoft Foundry. Sa pagtatapos ng workshop na ito, dapat ay magkakaroon ka ng intuitibong pagkaunawa sa iba't ibang tool at konsepto sa kontekstong ito.

| Konsepto  | Layunin |
|:---|:---|
| **Azure Developer CLI** | Unawain ang mga utos ng tool at mga workflow|
| **AZD Templates**| Unawain ang istruktura ng proyekto at config|
| **Azure AI Agent**| Mag-provision at mag-deploy ng proyekto sa Microsoft Foundry  |
| **Azure AI Search**| Paganahin ang context engineering gamit ang mga ahente |
| **Observability**| Tuklasin ang tracing, monitoring, at mga evaluation |
| **Red Teaming**| Tuklasin ang adversarial testing at mga mitigasyon |
| | |

## Mga Module ng Workshop

Handa ka na bang magsimula? Tuklasin ang mga module ng workshop:

- [Module 1: Pumili ng AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: Patunayan ang AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: Isa-isahin ang AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: I-configure ang AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: I-customize ang AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: I-teardown ang Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Pagsasara at Susunod na Mga Hakbang](instructions/7-Wrap-up.md)

## Mayroon ka bang feedback?

Mag-post ng isyu sa repo na ito (i-tag ito ng `Workshop`) o sumali sa amin sa [Discord](https://aka.ms/foundry/discord) at mag-post sa aming `#get-help` channel

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->