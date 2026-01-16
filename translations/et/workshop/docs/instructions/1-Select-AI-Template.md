<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "06d6207eff634aefcaa41739490a5324",
  "translation_date": "2025-10-11T15:43:03+00:00",
  "source_file": "workshop/docs/instructions/1-Select-AI-Template.md",
  "language_code": "et"
}
-->
# 1. Valige mall

!!! tip "PÄRAST SELLE MOODULI LÄBIMIST SAATE"

    - [ ] Kirjeldada, mis on AZD mallid
    - [ ] Avastada ja kasutada AZD malle AI jaoks
    - [ ] Alustada AI Agents malliga
    - [ ] **Labor 1:** AZD kiirstart GitHub Codespaces'iga

---

## 1. Ehitaja analoogia

Kaasaegse ettevõtte jaoks valmis AI-rakenduse _nullist_ ehitamine võib tunduda hirmutav. See on natuke nagu oma uue kodu ehitamine ise, kivi kivi haaval. Jah, see on võimalik! Kuid see ei ole kõige tõhusam viis soovitud tulemuse saavutamiseks!

Selle asemel alustame sageli olemasoleva _disainiplaaniga_ ja töötame koos arhitektiga, et kohandada seda vastavalt oma isiklikele vajadustele. Just sellist lähenemist tuleks kasutada intelligentsete rakenduste ehitamisel. Kõigepealt leidke hea disaini arhitektuur, mis sobib teie probleemivaldkonnaga. Seejärel tehke koostööd lahenduse arhitektiga, et kohandada ja arendada lahendust teie konkreetse stsenaariumi jaoks.

Kuid kust leida neid disainiplaane? Ja kuidas leida arhitekti, kes on valmis õpetama, kuidas neid plaane ise kohandada ja juurutada? Selles töötoas vastame neile küsimustele, tutvustades teile kolme tehnoloogiat:

1. [Azure Developer CLI](https://aka.ms/azd) - avatud lähtekoodiga tööriist, mis kiirendab arendaja teekonda kohalikust arendusest (ehitamine) pilve juurutamiseni (laadimine).
1. [Azure AI Foundry Templates](https://ai.azure.com/templates) - standardiseeritud avatud lähtekoodiga repositooriumid, mis sisaldavad näidiskoodi, infrastruktuuri ja konfiguratsioonifaile AI lahenduse arhitektuuri juurutamiseks.
1. [GitHub Copilot Agent Mode](https://code.visualstudio.com/docs/copilot/chat/chat-agent-mode) - kodeerimisagent, mis põhineb Azure'i teadmistel ja aitab meil navigeerida koodibaasis ning teha muudatusi - kasutades loomulikku keelt.

Nende tööriistade abil saame nüüd _avastada_ õige malli, _juurutada_ selle, et kinnitada selle toimimist, ja _kohandada_ seda vastavalt oma konkreetsetele stsenaariumidele. Sukeldume ja õpime, kuidas need töötavad.

---

## 2. Azure Developer CLI

[Azure Developer CLI](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/) (või `azd`) on avatud lähtekoodiga käsurea tööriist, mis võib kiirendada teie teekonda koodist pilve, pakkudes arendajasõbralikke käske, mis töötavad ühtlaselt teie IDE (arendus) ja CI/CD (devops) keskkondades.

`azd` abil võib teie juurutamise teekond olla nii lihtne:

- `azd init` - Initsialiseerib uue AI projekti olemasolevast AZD mallist.
- `azd up` - Loob infrastruktuuri ja juurutab rakenduse ühe sammuga.
- `azd monitor` - Pakub reaalajas jälgimist ja diagnostikat teie juurutatud rakenduse jaoks.
- `azd pipeline config` - Seadistab CI/CD torustikud Azure'i automaatseks juurutamiseks.

**🎯 | HARJUTUS**: <br/> Uurige `azd` käsurea tööriista oma GitHub Codespaces keskkonnas. Alustage selle käsu sisestamisest, et näha, mida tööriist teha suudab:

```bash title="" linenums="0"
azd help
```

![Flow](../../../../../translated_images/et/azd-flow.19ea67c2f81eaa66.png)

---

## 3. AZD mall

Selleks, et `azd` saaks seda saavutada, peab ta teadma, millist infrastruktuuri luua, milliseid konfiguratsiooniseadeid rakendada ja millist rakendust juurutada. Siin tulevad mängu [AZD mallid](https://learn.microsoft.com/en-us/azure/developer/azure-developer-cli/azd-templates?tabs=csharp).

AZD mallid on avatud lähtekoodiga repositooriumid, mis ühendavad näidiskoodi infrastruktuuri ja konfiguratsioonifailidega, mis on vajalikud lahenduse arhitektuuri juurutamiseks. Kasutades _Infrastructure-as-Code_ (IaC) lähenemist, võimaldavad need mallid ressursside määratlusi ja konfiguratsiooniseadeid versioonihalduses hoida (nagu rakenduse lähtekood) - luues korduvkasutatavaid ja järjepidevaid töövooge projekti kasutajate vahel.

Kui loote või kasutate AZD malli _oma_ stsenaariumi jaoks, kaaluge järgmisi küsimusi:

1. Mida te ehitate? → Kas on olemas mall, mis sisaldab algkoodi selle stsenaariumi jaoks?
1. Kuidas teie lahendus on arhitektuuriliselt üles ehitatud? → Kas on olemas mall, mis sisaldab vajalikke ressursse?
1. Kuidas teie lahendus juurutatakse? → Mõelge `azd deploy` koos eel-/järgtöötluse konksudega!
1. Kuidas seda veelgi optimeerida? → Mõelge sisseehitatud jälgimisele ja automatiseerimise torustikele!

**🎯 | HARJUTUS**: <br/> 
Külastage [Awesome AZD](https://azure.github.io/awesome-azd/) galeriid ja kasutage filtreid, et uurida praegu saadaval olevaid 250+ malle. Vaadake, kas leiate malli, mis vastab _teie_ stsenaariumi nõuetele.

![Code](../../../../../translated_images/et/azd-code-to-cloud.2d9503d69d3400da.png)

---

## 4. AI rakenduste mallid

---

**Lahtiütlus**:  
See dokument on tõlgitud AI tõlketeenuse [Co-op Translator](https://github.com/Azure/co-op-translator) abil. Kuigi püüame tagada täpsust, palume arvestada, et automaatsed tõlked võivad sisaldada vigu või ebatäpsusi. Algne dokument selle algses keeles tuleks pidada autoriteetseks allikaks. Olulise teabe puhul soovitame kasutada professionaalset inimtõlget. Me ei vastuta selle tõlke kasutamisest tulenevate arusaamatuste või valesti tõlgenduste eest.