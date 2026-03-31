# AZD para sa Mga Developer ng AI Workshop

> Na-validate laban sa `azd 1.23.12` noong Marso 2026.

> [!IMPORTANT]  
> **Ang workshop na ito ay may kasamang gabay ng workshop na maaari mong i-preview sa iyong lokal na browser. Upang magsimula, buksan ang repo sa GitHub Codespaces, isang dev container, o isang lokal na kopya na may MkDocs na naka-install—pagkatapos maghintay hanggang makita mo ang isang aktibong VS Code terminal at i-type:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Dapat mong makita ang isang pop-up dialog upang buksan ang preview na pahina sa isang browser.**

Maligayang pagdating sa praktikal na workshop para sa pag-aaral ng Azure Developer CLI (AZD) na may pokus sa pag-deploy ng AI na aplikasyon. Tutulungan ka ng workshop na ito na magkaroon ng praktikal na pag-unawa sa mga AZD template sa 3 hakbang:

1. **Pagtuklas** - hanapin ang template na angkop para sa iyo.
1. **Pag-deploy** - i-deploy at patunayan na ito ay gumagana
1. **Pagpapasadya** - baguhin at ulitin upang maging iyo!

Sa kabuuan ng workshop na ito, ipakikilala ka rin sa mga pangunahing developer tool at workflows, upang tulungan kang i-streamline ang iyong end-to-end na paglalakbay sa pag-develop.

| | | 
|:---|:---|
| **📚 Tahanan ng Kurso**| [AZD Para sa Mga Nagsisimula](../README.md)|
| **📖 Dokumentasyon** | [Magsimula gamit ang mga AI template](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️Mga AI Template** | [Mga Template ng Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Susunod na Mga Hakbang** | [Tanggapin ang Hamon](#workshop-challenge) |
| | |

## Pangkalahatang-ideya ng Workshop

**Tagal:** 3-4 oras  
**Antas:** Baguhan hanggang Katamtaman  
**Mga Kinakailangan:** Pamilyaridad sa Azure, mga konsepto ng AI, VS Code at mga command-line na tool.

Ito ay isang praktikal na workshop kung saan natututo ka sa pamamagitan ng paggawa. Kapag natapos mo na ang mga ehersisyo, inirerekumenda naming suriin ang AZD Para sa Mga Nagsisimula curriculum upang ipagpatuloy ang iyong pag-aaral patungkol sa pinakamahusay na mga kasanayan sa Seguridad at Produktibidad.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Introduction | Set the stage, understand the goals |
| 30 mins | Select AI Template | Explore options and pick starter | 
| 30 mins | Validate AI Template | Deploy default solution to Azure |
| 30 mins | Deconstruct AI Template | Explore structure and configuration |
| 30 mins | Configure AI Template | Activate and try available features |
| 30 mins | Customize AI Template | Adapt the template to your needs |
| 30 mins | Teardown Infrastructure | Cleanup and release resources |
| 15 mins | Wrap-Up & Next Steps | Learning resources, Workshop challenge |
| | |

## Mga Matututuhan Mo

Isipin ang AZD Template bilang isang learning sandbox upang tuklasin ang iba't ibang kakayahan at tool para sa end-to-end na pag-develop sa Microsoft Foundry. Sa pagtatapos ng workshop na ito, dapat mayroon kang isang intuitibong pag-unawa sa iba't ibang tool at konsepto sa kontekstong ito.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Unawain ang mga command ng tool at mga workflow|
| **AZD Templates**| Unawain ang istraktura ng proyekto at config|
| **Azure AI Agent**| Mag-provision at mag-deploy ng Microsoft Foundry project  |
| **Azure AI Search**| Paganahin ang context engineering gamit ang mga agent |
| **Observability**| Tuklasin ang tracing, monitoring at evaluations |
| **Red Teaming**| Tuklasin ang adversarial testing at mga mitigations |
| | |

## Workshop Modules

Handa nang magsimula? Mag-navigate sa mga module ng workshop:

- [Module 1: Piliin ang AI Template](instructions/1-Select-AI-Template.md)
- [Module 2: I-validate ang AI Template](instructions/2-Validate-AI-Template.md) 
- [Module 3: I-deconstruct ang AI Template](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: I-configure ang AI Template](instructions/4-Configure-AI-Template.md)
- [Module 5: I-customize ang AI Template](instructions/5-Customize-AI-Template.md)
- [Module 6: I-teardown ang Infrastructure](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Wrap-up & Next Steps](instructions/7-Wrap-up.md)

## Mayroon bang feedback?

Mag-post ng isyu sa repo na ito (lagyan ito ng tag na `Workshop`) o sumali sa amin sa [Discord](https://aka.ms/foundry/discord) at mag-post sa aming `#get-help` channel

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Paunawa**:
Ang dokumentong ito ay isinalin gamit ang serbisyong pagsasalin ng AI na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagaman nagsisikap kami para sa kawastuhan, pakitandaan na ang awtomatikong mga salin ay maaaring maglaman ng mga pagkakamali o iba pang kamalian. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na awtoritatibong sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin na ginawa ng tao. Hindi kami mananagot sa anumang hindi pagkakaunawaan o maling interpretasyon na nagmumula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->