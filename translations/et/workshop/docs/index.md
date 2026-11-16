# AZD tehisintellekti arendajatele töötoas

> Allika juhendamine on vaadatud üle AZD 1.37.2 alusel 4. novembril 2026. Kuvaripildid on illustratiivsed; teenuse saadavus, portaali sildid ja mallide vaikeseaded võivad muutuda.

> [!IMPORTANT]  
> **See töötuba on varustatud töötoa juhendiga, mida saate eelvaadata oma lokaalses brauseris. Alustamiseks avage repositoorium GitHub Codespaces’is, arenduskonteineris või kohalikus kloonis MkDocs-iga — seejärel oodake, kuni näete aktiivset VS Code terminali ja tippige:**  
> Kursuse repositooriumi juurkataloogist paigaldage `requirements-dev.txt`, seejärel käivitage `python -m mkdocs serve --config-file workshop/mkdocs.yml` esiplaanil.
> **Te näete hüpikakent, mis kutsub avama eelvaate lehe brauseris.**

Tere tulemast käed-külge töötoasse, kus õpite Azure Developer CLI-d (AZD) keskendudes tehisintellekti rakenduste juurutamisele. See töötuba aitab teil mõista AZD malle praktiliselt 3 sammu kaudu:

1. **Avastamine** - leidke endale sobiv mall.
1. **Juurutamine** - juurutage ja kinnitage, et see töötab.
1. **Kohandamine** - muutke ja arendage seda enda jaoks!

Töötoa jooksul tutvustame teile ka põhilisi arendustööriistu ja töövooge, mis aitavad sujuvamaks teha teie kogu arendusprotsessi.

| | | 
|:---|:---|
| **📚 Kursuse avaleht**| [AZD algajatele](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentatsioon** | [Alustage AI mallidega](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI mallid** | [Microsoft Foundry mallid](https://ai.azure.com/templates) |
|**🚀 Järgmised sammud** | [Võta väljakutse vastu](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Töötoa ülevaade

**Kestus:** 3-4 tundi  
**Tase:** Algaja kuni kesktase  
**Eeldused:** Tutvumine Azuriga, AI kontseptsioonidega, VS Code ja käsurea tööriistadega.

See on praktiline töötuba, kus õpite tegutsedes. Pärast harjutuste lõpetamist soovitame vaadata üle AZD algajatele kursuse sisu, et jätkata õppimist turvalisuse ja tootlikkuse parimate tavade osas.

| Aeg| Moodul | Eesmärk |
|:---|:---|:---|
| 15 min | Sissejuhatus | Määrata eesmärgid ja mõista eesmärke |
| 30 min | AI malli valimine | Uurida võimalusi ja valida algusmall | 
| 30 min | AI malli valideerimine | Juurutada vaikimisi lahendus Azuresse |
| 30 min | AI malli lagundamine | Uurida struktuuri ja seadistust |
| 30 min | AI malli seadistamine | Aktiveerida ja proovida olemasolevaid funktsioone |
| 30 min | AI malli kohandamine | Kohandada malli teie vajadustele |
| 30 min | Taristu lammutamine | Puhastamine ja ressursside vabastamine |
| 15 min | Kokkuvõte ja järgmised sammud | Õppematerjalid, töötuba väljakutse |
| | |

## Mida õpite

Mõelge AZD mallile kui õppe liivakastile, kus saate uurida erinevaid võimalusi ja tööriistu Microsoft Foundry lõpp-punktide arenduseks. Selle töötoa lõpuks peaksite tundma erinevaid tööriistu ja mõisteid selles kontekstis intuitiivselt.

| Kontseptsioon | Eesmärk |
|:---|:---|
| **Azure Developer CLI** | Mõista tööriista käske ja töövooge|
| **AZD mallid**| Mõista projekti struktuuri ja konfiguratsiooni|
| **Azure AI Agent**| Microsoft Foundry projekti loomine ja juurutamine  |
| **Azure AI Search**| Konteksti arendamine agentidega |
| **Jälgitavus**| Uurida jälgimist, monitooringut ja hindamisi |
| **Punumine (Red Teaming)**| Uurida vastandlikku testimist ja leevendusi |
| | |

## Töötoa moodulid

Valmis alustama? Liikuge töötoa moodulite vahel:

- [Moodul 1: AI malli valimine](instructions/1-Select-AI-Template.md)
- [Moodul 2: AI malli valideerimine](instructions/2-Validate-AI-Template.md) 
- [Moodul 3: AI malli lagundamine](instructions/3-Deconstruct-AI-Template.md)
- [Moodul 4: AI malli seadistamine](instructions/4-Configure-AI-Template.md)
- [Moodul 5: AI malli kohandamine](instructions/5-Customize-AI-Template.md)
- [Moodul 6: Taristu lammutamine](instructions/6-Teardown-Infrastructure.md)
- [Moodul 7: Kokkuvõte ja järgmised sammud](instructions/7-Wrap-up.md)

## Kas teil on tagasisidet?

Esitage selle repositooriumi probleem (märgistage see `Workshop`) või liituge meiega [Discord](https://aka.ms/foundry/discord) ja postitage meie `#get-help` kanalisse

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->