# AZD tehisintellekti arendajatele mõeldud töötuba

> Kontrollitud vastu `azd 1.25.6` 2026. aasta juunis.

> [!IMPORTANT]  
> **See töötuba on varustatud juhendiga, mida saate vaadata oma kohalikus brauseris. Alustamiseks avage repositoorium GitHub Codespacesis, arenduskonteineris või kohaliku kloonina, kus on installitud MkDocs—seejärel oodake, kuni näete aktiivset VS Code terminali ja tippige:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Teile peaks ilmuma hüpikaken, mis pakub eelvaate avamist brauseris.**

Tere tulemast praktilisse töötuppa Azure Developer CLI (AZD) õppimiseks, keskendudes tehisintellekti rakenduste juurutamisele. See töötuba aitab teil saada praktilise arusaama AZD mallidest 3 sammuga:

1. **Avastamine** - leidke endale sobiv mall.
1. **Juurutamine** - juurutage ja kontrollige, et see töötab.
1. **Kohandamine** - muutke ja korrake, et see oleks teie oma!

Selle töötoa jooksul tutvustatakse teile ka põhiarendusvahendeid ja töövooge, mis aitavad teie lõpptoote arendusteekonda lihtsustada.

| | | 
|:---|:---|
| **📚 Kursuse avaleht**| [AZD algajatele](../README.md)|
| **📖 Dokumentatsioon** | [Alustamine AI mallidega](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI mallid** | [Microsoft Foundry mallid](https://ai.azure.com/templates) |
| **🚀 Järgmised sammud** | [Võta väljakutse vastu](#workshop-challenge) |
| | |

## Töötoa ülevaade

**Kestus:** 3-4 tundi  
**Tase:** Algaja kuni kesktase  
**Eeltingimused:** Tutvumine Azure’i, tehisintellekti kontseptsioonide, VS Code’i ja käsurea tööriistadega.

See on praktiline töötuba, kus õpite tehes. Pärast harjutuste lõpetamist soovitame vaadata üle AZD algajate õppekava, et jätkata õppimist turvalisuse ja tootlikkuse parimate tavade teemadel.

| Aeg| Moodul  | Eesmärk |
|:---|:---|:---|
| 15 min | Sissejuhatus | Pane olukord paika, mõista eesmärke |
| 30 min | AI malli valimine | Uurige valikuid ja valige algus |
| 30 min | AI malli kontrollimine | Juurutage vaikevõte Azure’i |
| 30 min | AI malli lahtimuukimine | Uurige ülesehitust ja seadistust |
| 30 min | AI malli seadistamine | Aktiveerige ja proovige saadaolevaid funktsioone |
| 30 min | AI malli kohandamine | Kohandage mall oma vajadustele |
| 30 min | Taristu lammutamine | Puhastage ja vabastage ressursid |
| 15 min | Kokkuvõte ja järgmised sammud | Õppematerjalid, töötoa väljakutse |
| | |

## Mida te õpite

Mõelge AZD mallile kui õppesimulaatorile, kus saate uurida erinevaid võimekusi ja tööriistu Microsoft Foundry lõpp-to-lõpp arenduse jaoks. Selle töötoa lõpuks peaks teil olema intuitiivne arusaam erinevatest tööriistadest ja kontseptsioonidest selles kontekstis.

| Kontseptsioon  | Eesmärk |
|:---|:---|
| **Azure Developer CLI** | Mõista tööriista käske ja töövooge |
| **AZD mallid** | Mõista projekti struktuuri ja seadistust |
| **Azure AI agent** | Provisioneerige ja juurutage Microsoft Foundry projekt |
| **Azure AI otsing** | Võimaldage konteksti inseneritööd agentide abil |
| **Jälgitavus** | Uurige jälgimist, monitooringut ja hindamisi |
| **Punane meeskond** | Uurige vastuvõtlikku testimist ja leevendusi |
| | |

## Töötoa moodulid

Olete valmis alustama? Liikuge läbi töötoa moodulite:

- [Moodul 1: AI malli valimine](instructions/1-Select-AI-Template.md)
- [Moodul 2: AI malli kontrollimine](instructions/2-Validate-AI-Template.md) 
- [Moodul 3: AI malli lahtimuukimine](instructions/3-Deconstruct-AI-Template.md)
- [Moodul 4: AI malli seadistamine](instructions/4-Configure-AI-Template.md)
- [Moodul 5: AI malli kohandamine](instructions/5-Customize-AI-Template.md)
- [Moodul 6: Taristu lammutamine](instructions/6-Teardown-Infrastructure.md)
- [Moodul 7: Kokkuvõte ja järgmised sammud](instructions/7-Wrap-up.md)

## Kas teil on tagasisidet?

Postitage probleem selle repo. peale (märgistage see `Workshop`) või liituge meiega [Discordis](https://aka.ms/foundry/discord) ja postitage meie kanalis `#get-help`.

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Lahtiütlus**:
See dokument on tõlgitud kasutades AI tõlketeenust [Co-op Translator](https://github.com/Azure/co-op-translator). Kuigi me püüdleme täpsuse poole, palun pange tähele, et automatiseeritud tõlgetes võib esineda vigu või ebatäpsusi. Originaaldokument selle emakeeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitatakse kasutada professionaalset inimtõlget. Me ei vastuta selle tõlkega seotud eksimustest või valesti mõistmistest.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->