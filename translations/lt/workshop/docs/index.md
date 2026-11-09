# AZD AI kūrėjams dirbtuvės

> Šaltinio gairės peržiūrėtos pagal AZD 1.37.2 2026 m. lapkričio 4 d. Ekrano kopijos yra iliustracinės; paslaugų prieinamumas, portalo etiketės ir šablonų numatytoji reikšmė gali keistis.

> [!IMPORTANT]  
> **Šios dirbtuvės instrumentuotos su dirbtuvių vadovu, kurį galite peržiūrėti savo vietiniame naršyklėje. Norėdami pradėti, atidarykite saugyklą GitHub Codespaces, kūrėjo konteineryje arba vietinėje klonuotoje versijoje su įdiegta MkDocs—tada palaukite, kol pamatysite aktyvų VS Code terminalą ir įveskite:**  
> Iš kurso saugyklos šaknies įdiekite `requirements-dev.txt`, tada vykdykite `python -m mkdocs serve --config-file workshop/mkdocs.yml` pirmame plane.
> **Turėtumėte pamatyti iškylančiąją dialogo langą, kuriame galite atidaryti peržiūros puslapį naršyklėje.**

Sveiki atvykę į praktines dirbtuves, skirtas mokytis Azure Developer CLI (AZD) su dėmesiu AI programų diegimui. Šios dirbtuvės padės jums įgyti taikomą supratimą apie AZD šablonus per 3 žingsnius:

1. **Atranka** - raskite jums tinkamą šabloną.
1. **Diegimas** - įdiekite ir patikrinkite, ar veikia.
1. **Priderinimas** - modifikuokite ir iteruokite, kad jis taptų jūsų!

Per šių dirbtuvių laikotarpį taip pat susipažinsite su pagrindiniais kūrėjo įrankiais ir darbo eiga, kurie padės supaprastinti jūsų viso kūrimo proceso kelią.

| | | 
|:---|:---|
| **📚 Kurso Pagrindinis**| [AZD Pradedantiesiems](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentacija** | [Pradėkite su AI šablonais](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI Šablonai** | [Microsoft Foundry Šablonai](https://ai.azure.com/templates) |
|**🚀 Tolimesni Žingsniai** | [Imkitės Iššūkio](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Dirbtuvių Apžvalga

**Trukmė:** 3-4 valandos  
**Lygis:** Nuo pradedančiųjų iki vidutinio  
**Išankstinės sąlygos:** Susipažinimas su Azure, AI sąvokomis, VS Code ir komandinės eilutės įrankiais.

Tai praktinės dirbtuvės, kuriose mokotės veikdami. Baigę pratimus, rekomenduojame peržiūrėti AZD Pradedantiesiems programą, kad tęstumėte mokymosi kelią į saugumo ir produktyvumo gerąsias praktikas.

| Laikas| Modulis  | Tikslas |
|:---|:---|:---|
| 15 min | Įvadas | Nustatyti sceną, suprasti tikslus |
| 30 min | Pasirinkti AI Šabloną | Ištirti variantus ir pasirinkti pradinį | 
| 30 min | Patvirtinti AI Šabloną | Įdiegti numatytą sprendimą Azure |
| 30 min | Išnagrinėti AI Šabloną | Ištyrinėti struktūrą ir konfigūraciją |
| 30 min | Konfigūruoti AI Šabloną | Aktyvuoti ir išbandyti galimas funkcijas |
| 30 min | Priderinti AI Šabloną | Priderinti šabloną pagal savo poreikius |
| 30 min | Pašalinti Infrastrukturą | Išvalyti ir išlaisvinti išteklius |
| 15 min | Apibendrinimas & Tolimesni Žingsniai | Mokymosi ištekliai, dirbtuvių iššūkis |
| | |

## Ką Išmoksite

Galvokite apie AZD Šabloną kaip apie mokymosi smėlio dėžę, kurioje galite išbandyti įvairias galimybes ir įrankius viso kūrimo proceso metu Microsoft Foundry. Po šių dirbtuvių turėtumėte intuityviai suprasti įvairius įrankius ir sąvokas šiame kontekste.

| Sąvoka  | Tikslas |
|:---|:---|
| **Azure Developer CLI** | Suprasti įrankių komandas ir darbo eigą|
| **AZD Šablonai**| Suprasti projekto struktūrą ir konfigūraciją|
| **Azure AI Agentas**| Teikti ir diegti Microsoft Foundry projektą  |
| **Azure AI Paieška**| Įgalinti kontekstinę inžineriją su agentais |
| **Stebėjimas**| Ištirti sekimą, stebėjimą ir vertinimus |
| **Raudonųjų komandų testavimas**| Ištirti priešininko testavimą ir prevencijas |
| | |

## Dirbtuvių Moduliai

Pasirengę pradėti? Naršykite per dirbtuvių modulius:

- [1 modulis: Pasirinkti AI Šabloną](instructions/1-Select-AI-Template.md)
- [2 modulis: Patvirtinti AI Šabloną](instructions/2-Validate-AI-Template.md) 
- [3 modulis: Išnagrinėti AI Šabloną](instructions/3-Deconstruct-AI-Template.md)
- [4 modulis: Konfigūruoti AI Šabloną](instructions/4-Configure-AI-Template.md)
- [5 modulis: Priderinti AI Šabloną](instructions/5-Customize-AI-Template.md)
- [6 modulis: Pašalinti Infrastrukturą](instructions/6-Teardown-Infrastructure.md)
- [7 modulis: Apibendrinimas & Tolimesni Žingsniai](instructions/7-Wrap-up.md)

## Turite atsiliepimų?

Parašykite problemą šioje saugykloje (pažymėkite `Workshop`) arba prisijunkite prie mūsų [Discord](https://aka.ms/foundry/discord) ir paskelbkite mūsų `#get-help` kanale

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->