# AZD dirbtinio intelekto kūrėjams dirbtuvės

> Patikrinta su `azd 1.27.1` 2026 m. liepos mėn.

> [!IMPORTANT]  
> **Šios dirbtuvių metu naudojamas dirbtuvių vadovas, kurį galite peržiūrėti savo vietiniame naršyklės lange. Norėdami pradėti, atidarykite repo GitHub Codespaces, kūrimo konteineryje arba vietiniame klone su įdiegta MkDocs — tada palaukite, kol pamatysite aktyvų VS Code terminalą ir įveskite:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Turėtumėte pamatyti iššokantį dialogą, siūlantį atidaryti peržiūros puslapį naršyklėje.**

Sveiki atvykę į praktines dirbtuves apie Azure Developer CLI (AZD), orientuotas į dirbtinio intelekto programų diegimą. Šios dirbtuvės padės jums įgyti praktinių žinių apie AZD šablonus 3 žingsniais:

1. **Atranka** - raskite sau tinkamą šabloną.
1. **Diegimas** - įdiekite ir patikrinkite, ar veikia
1. **Priešinimas** - modifikuokite ir tobulinkite pagal save!

Per šias dirbtuves taip pat susipažinsite su pagrindiniais kūrėjų įrankiais ir darbo eigomis, kurios padės jums supaprastinti visą kūrimo procesą nuo pradžios iki pabaigos.

| | | 
|:---|:---|
| **📚 Kurso pradžia**| [AZD Pradedantiesiems](../README.md)|
| **📖 Dokumentacija** | [Pradėkite dirbti su DI šablonais](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️DI Šablonai** | [Microsoft Foundry Šablonai](https://ai.azure.com/templates) |
|**🚀 Kiti žingsniai** | [Imkitės Iššūkio](#workshop-challenge) |
| | |

## Dirbtuvių peržvalga

**Trukmė:** 3-4 valandos  
**Lygis:** Pradedantysis iki vidutinio  
**Išankstinės sąlygos:** Susipažinimas su Azure, DI koncepcijomis, VS Code ir komandų eilutės įrankiais.

Tai praktinės dirbtuvės, kuriose mokotės darydami. Baigę pratimus rekomenduojame peržiūrėti AZD Pradedantiesiems programą, kad tęstumėte mokymąsi apie saugumo ir produktyvumo gerąsias praktikas.

| Laikas| Modulis  | Tikslas |
|:---|:---|:---|
| 15 min | Įvadas | Nustatyti pagrindus, suprasti tikslus |
| 30 min | Pasirinkti DI šabloną | Išnagrinėti galimybes ir pasirinkti pradžios tašką | 
| 30 min | Patvirtinti DI šabloną | Įdiegti numatytą sprendimą į Azure |
| 30 min | Išanalizuoti DI šabloną | Išnagrinėti struktūrą ir konfigūraciją |
| 30 min | Konfigūruoti DI šabloną | Aktyvuoti ir išbandyti prieinamas funkcijas |
| 30 min | Pritaikyti DI šabloną | Priderinti šabloną pagal savo poreikius |
| 30 min | Nutraukti infrastruktūrą | Išvalyti ir atlaisvinti resursus |
| 15 min | Apibendrinimas ir kiti žingsniai | Mokymosi ištekliai, dirbtuvių iššūkis |
| | |

## Ko išmoksite

Žiūrėkite į AZD šabloną kaip į mokymosi smėlio dėžę, kurioje galite tyrinėti įvairias Microsoft Foundry įrankių ir galimybių pabaigos iki pabaigos kūrimo kontekste. Baigę šias dirbtuves, turėtumėte turėti intuityvų supratimą apie įvairius įrankius ir koncepcijas šioje srityje.

| Koncepcija  | Tikslas |
|:---|:---|
| **Azure Developer CLI** | Suprasti įrankio komandas ir darbo eigas|
| **AZD Šablonai**| Suprasti projekto struktūrą ir konfigūraciją|
| **Azure DI agentas**| Įdiegti ir diegti Microsoft Foundry projektą  |
| **Azure DI paieška**| Įgalinti kontekstinę inžineriją su agentais |
| **Stebėjimas**| Tyrinėti sekimą, monitoringą ir vertinimus |
| **Raudonųjų komandų testai**| Tyrinėti priešiškų testavimų ir rizikų mažinimą |
| | |

## Dirbtuvių moduliai

Pasiruošę pradėti? Pereikite prie dirbtuvių modulių:

- [1 modulis: Pasirinkite DI šabloną](instructions/1-Select-AI-Template.md)
- [2 modulis: Patvirtinkite DI šabloną](instructions/2-Validate-AI-Template.md) 
- [3 modulis: Išanalizuokite DI šabloną](instructions/3-Deconstruct-AI-Template.md)
- [4 modulis: Konfigūruokite DI šabloną](instructions/4-Configure-AI-Template.md)
- [5 modulis: Pritaikykite DI šabloną](instructions/5-Customize-AI-Template.md)
- [6 modulis: Nutraukite infrastruktūrą](instructions/6-Teardown-Infrastructure.md)
- [7 modulis: Apibendrinimas ir kiti žingsniai](instructions/7-Wrap-up.md)

## Turite atsiliepimų?

Praneškite apie problemą šiame repo (pažymėkite jį `Workshop`) arba prisijunkite prie mūsų per [Discord](https://aka.ms/foundry/discord) ir rašykite kanale `#get-help`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Atsakomybės apribojimas**:
Šis dokumentas buvo išverstas naudojant dirbtinio intelekto vertimo paslaugą [Co-op Translator](https://github.com/Azure/co-op-translator). Nors siekiame tikslumo, prašome atkreipti dėmesį, kad automatiniai vertimai gali turėti klaidų ar netikslumų. Originalus dokumentas jo gimtąja kalba laikomas autoritetingu šaltiniu. Svarbiai informacijai rekomenduojama naudoti profesionalų žmogiškąjį vertimą. Mes neatsakome už jokius nesusipratimus ar neteisingą interpretaciją, kilusią naudojantis šiuo vertimu.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->