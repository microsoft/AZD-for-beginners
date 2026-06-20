# AZD para sa Mga Developer ng AI Workshop

> Napatunayan gamit ang `azd 1.25.6` noong Hunyo 2026.

> [!IMPORTANT]  
> **Ang workshop na ito ay may kasamang workshop guide na maaari mong i-preview sa iyong lokal na browser. Upang magsimula, buksan ang repo sa GitHub Codespaces, isang dev container, o isang lokal na clone na may naka-install na MkDocs—pagkatapos maghintay hanggang makita mo ang isang aktibong VS Code terminal at i-type:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Dapat mong makita ang isang pop-up dialog upang buksan ang preview page sa isang browser.**

Maligayang pagdating sa hands-on na workshop para sa pag-aaral ng Azure Developer CLI (AZD) na nakatuon sa deployment ng mga AI application. Ang workshop na ito ay tutulong sa iyo na magkaroon ng praktikal na pag-unawa sa mga AZD template sa 3 hakbang:

1. **Discovery** - hanapin ang template na angkop sa iyo.
1. **Deployment** - i-deploy at patunayan na gumagana ito
1. **Customization** - i-modify at i-iterate upang ito ay maging iyo!

Sa kabuuan ng workshop na ito, ipakikilala rin sa iyo ang mga pangunahing developer tool at workflows, upang matulungan kang pabilisin ang iyong end-to-end na development journey.

| | | 
|:---|:---|
| **📚 Tahanan ng Kurso**| [AZD Para sa Mga Nagsisimula](../README.md)|
| **📖 Dokumentasyon** | [Magsimula gamit ang mga template ng AI](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ Mga Template ng AI** | [Mga Template ng Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Susunod na Mga Hakbang** | [Tanggapin ang Hamon](#workshop-challenge) |
| | |

## Pangkalahatang-ideya ng Workshop

**Tagal:** 3-4 na oras  
**Antas:** Baguhan hanggang Intermediate  
**Mga Kinakailangan:** Pamilyaridad sa Azure, mga konsepto ng AI, VS Code at mga tool sa command-line.

Ito ay isang hands-on na workshop kung saan natututo ka sa pamamagitan ng paggawa. Kapag natapos mo na ang mga ehersisyo, inirerekomenda naming repasuhin ang AZD Para sa Mga Nagsisimula na kurikulum upang ipagpatuloy ang iyong paglalakbay sa pag-aaral patungo sa mga pinakamahusay na kasanayan sa Seguridad at Produktibidad.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | Panimula | Itakda ang konteksto, unawain ang mga layunin |
| 30 mins | Pumili ng Template ng AI | Siyasatin ang mga opsyon at pumili ng panimula | 
| 30 mins | Patunayan ang Template ng AI | I-deploy ang default na solusyon sa Azure |
| 30 mins | Buwagin ang Template ng AI | Siyasatin ang estruktura at konfigurasyon |
| 30 mins | I-configure ang Template ng AI | I-activate at subukan ang mga magagamit na tampok |
| 30 mins | I-customize ang Template ng AI | Iangkop ang template sa iyong mga pangangailangan |
| 30 mins | Tanggalin ang Infrastrukturang | Linisin at palayain ang mga resources |
| 15 mins | Pagsasara at Susunod na Mga Hakbang | Mga mapagkukunan para sa pag-aaral, Hamon ng Workshop |
| | |

## Ano ang Iyong Matututuhan

Isipin ang AZD Template bilang isang learning sandbox upang tuklasin ang iba't ibang kakayahan at tool para sa end-to-end development sa Microsoft Foundry. Sa pagtatapos ng workshop na ito, dapat mayroon kang isang intuitive na pakiramdam para sa iba't ibang tools at konsepto sa kontekstong ito.

| Konsepto  | Layunin |
|:---|:---|
| **Azure Developer CLI** | Unawain ang mga utos ng tool at mga workflows|
| **AZD Templates**| Unawain ang estruktura ng proyekto at konfigurasyon|
| **Azure AI Agent**| Mag-provision at mag-deploy ng Microsoft Foundry na proyekto  |
| **Azure AI Search**| Paganahin ang context engineering gamit ang mga agent |
| **Observability**| Siyasatin ang tracing, monitoring at mga pagsusuri |
| **Red Teaming**| Siyasatin ang adversarial testing at mga mitigasyon |
| | |

## Mga Module ng Workshop

Handa nang magsimula? Mag-navigate sa mga module ng workshop:

- [Module 1: Piliin ang Template ng AI](instructions/1-Select-AI-Template.md)
- [Module 2: Patunayan ang Template ng AI](instructions/2-Validate-AI-Template.md) 
- [Module 3: Buwagin ang Template ng AI](instructions/3-Deconstruct-AI-Template.md)
- [Module 4: I-configure ang Template ng AI](instructions/4-Configure-AI-Template.md)
- [Module 5: I-customize ang Template ng AI](instructions/5-Customize-AI-Template.md)
- [Module 6: Pag-alis ng Infrastrukturang](instructions/6-Teardown-Infrastructure.md)
- [Module 7: Pagsasara at Susunod na Mga Hakbang](instructions/7-Wrap-up.md)

## May feedback?

Mag-post ng isyu sa repo na ito (lagyan ng tag na `Workshop`) o sumali sa amin sa [Discord](https://aka.ms/foundry/discord) at mag-post sa aming `#get-help` channel

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Pagtatanggi**:
Ang dokumentong ito ay isinalin gamit ang serbisyo ng AI translation na [Co-op Translator](https://github.com/Azure/co-op-translator). Bagama't nagsusumikap kami para sa katumpakan, pakatandaan na ang awtomatikong pagsasalin ay maaaring maglaman ng mga pagkakamali o hindi pagkakatugma. Ang orihinal na dokumento sa orihinal nitong wika ang dapat ituring na pangunahing sanggunian. Para sa mahahalagang impormasyon, inirerekomenda ang propesyonal na pagsasalin ng tao. Hindi kami mananagot sa anumang maling pagkakaintindi o maling interpretasyon na nagmula sa paggamit ng pagsasaling ito.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->