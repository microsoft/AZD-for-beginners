# AZD tehisintellekti arendajatele mõeldud töötuba

> Kinnitatud versiooniga `azd 1.23.12` märtsis 2026.

> [!IMPORTANT]  
> **Selles töötubas on kaasas juhend, mida saad eelvaadata oma lokaalses brauseris. Töötamise alustamiseks ava repo GitHub Codespaces'is, arenduskonteineris või lokaalses kloonis, kus on installitud MkDocs — seejärel oota kuni näed aktiivset VS Code terminali ning kirjuta:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Sa peaksid nägema hüpikuakent, mis kutsub avama eelvaatelehe brauseris.**

Tere tulemast praktilisse töötuppa, kus õpid Azure arendaja CLI-d (AZD), keskendudes AI rakenduste juurutamisele. See töötuba aitab sul saada praktilise arusaama AZD mallidest 3 sammuga:

1. **Avastamine** – leia endale sobiv mall.
1. **Juurutamine** – juuruta ja veendu, et see töötab.
1. **Kohandamine** – muuda ja arenda, kuni see on sinu oma!

Selle töötuba jooksul tutvustatakse sulle ka olulisi arendustööriistu ja töölugusid, et aidata sujuvamaks muuta kogu arendusprotsessi.

| | | 
|:---|:---|
| **📚 Kursuse ava**| [AZD algajatele](../README.md)|
| **📖 Dokumentatsioon** | [AI mallide kasutuselevõtt](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI mallid** | [Microsoft Foundry mallid](https://ai.azure.com/templates) |
|**🚀 Järgmised sammud** | [Võta väljakutse vastu](#workshop-challenge) |
| | |

## Töötuba ülevaade

**Kestus:** 3-4 tundi  
**Tase:** Algaja kuni kesktase  
**Eeldused:** Tutvumine Azure'iga, AI mõisted, VS Code ja käsurea tööriistad.

See on praktiline töötuba, kus õpid tegevuse kaudu. Kui oled harjutused lõpetanud, soovitame jätkata õpinguid AZD algajatele kursuse programmi kaudu, et süvendada teadmisi turvalisuse ja tootlikkuse parimatest tavadest.

| Aeg | Moodul  | Eesmärk |
|:---|:---|:---|
| 15 min | Sissejuhatus | Seada taust, mõista eesmärke |
| 30 min | AI malli valimine | Uurida võimalusi ja valida algusmall | 
| 30 min | AI malli valideerimine | Juurutada vaikevõte Azure'i peale |
| 30 min | AI malli lahtihargnemine | Uurida struktuuri ja konfiguratsiooni |
| 30 min | AI malli konfigureerimine | Aktiviseerida ja proovida olemasolevaid funktsioone |
| 30 min | AI malli kohandamine | Kohandada malli vastavalt oma vajadustele |
| 30 min | Infrastruktuuri lõpetamine | Puhastada ja vabastada ressursid |
| 15 min | Kokkuvõte ja edasised sammud | Õppematerjalid, töötoa väljakutse |
| | |

## Mida sa selle käigus õpid

Mõtle AZD mallile kui õpiharule, kus saad uurida Microsoft Foundry täisprotsessi arenduse erinevaid võimeid ja tööriistu. Töötuba lõpuks peaks sul olema intuitiivne arusaam nende tööriistade ja mõistete kasutamisest.

| Mõiste  | Eesmärk |
|:---|:---|
| **Azure Developer CLI** | Mõista käske ja töövooge |
| **AZD mallid**| Mõista projekti struktuuri ja konfiguratsiooni |
| **Azure AI Agent**| Loob ja juurutab Microsoft Foundry projekti |
| **Azure AI Search**| Võimalda konteksti loomisega seotud agente |
| **Jälgitavus**| Uuri jälgimist, monitooringut ja hindamist |
| **Red Teaming**| Uuri vastuseisulatseid katseid ja leevendusi |
| | |

## Töötuba moodulid

Valmis alustama? Liigu läbi töötuba moodulite:

- [Moodul 1: AI malli valimine](instructions/1-Select-AI-Template.md)
- [Moodul 2: AI malli valideerimine](instructions/2-Validate-AI-Template.md) 
- [Moodul 3: AI malli lahtihargnemine](instructions/3-Deconstruct-AI-Template.md)
- [Moodul 4: AI malli konfigureerimine](instructions/4-Configure-AI-Template.md)
- [Moodul 5: AI malli kohandamine](instructions/5-Customize-AI-Template.md)
- [Moodul 6: Infrastruktuuri lõpetamine](instructions/6-Teardown-Infrastructure.md)
- [Moodul 7: Kokkuvõte ja edasised sammud](instructions/7-Wrap-up.md)

## Tagasiside?

Postita probleem selle repo lehel (märgista `Workshop`) või liitu meiega [Discordis](https://aka.ms/foundry/discord) ja postita `#get-help` kanalisse.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastutusest loobumine**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame täpsust, tuleb arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle emakeeles tuleks pidada autoriteetseks allikaks. Kriitilise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->