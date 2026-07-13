# AZD AI-kehittäjille -työpaja

> Varmennettu versiolla `azd 1.27.1` heinäkuussa 2026.

> [!IMPORTANT]  
> **Tämä työpaja on varustettu työpajaoppaalla, jonka voit esikatsella paikallisessa selaimessasi. Aloittaaksesi avaa repositorio GitHub Codespacesissa, kehityskontissa tai paikallisessa kloonissa, jossa MkDocs on asennettuna — odota kunnes näet aktiivisen VS Code -päätteen ja kirjoita:**  
> `mkdocs serve > /dev/null 2>&1 &`  
> **Sinun pitäisi nähdä ponnahdusikkuna, joka kysyy, haluatko avata esikatselusivun selaimessa.**

Tervetuloa käytännönläheiseen työpajaan, jossa opit Azure Developer CLI:n (AZD) käytön AI-sovellusten käyttöönottoon. Tässä työpajassa saat käytännön ymmärryksen AZD-malleista kolmessa vaiheessa:

1. **Tutkiminen** – löydä sinulle sopiva malli.
1. **Käyttöönotto** – ota malli käyttöön ja varmista, että se toimii.
1. **Mukauttaminen** – muokkaa ja kehitä sitä omasi näköiseksi!

Työpajan aikana tutustut myös keskeisiin kehittäjätyökaluihin ja työnkulkuun, jotka auttavat sinua sujuvoittamaan koko kehitysprosessiasi.

| | | 
|:---|:---|
| **📚 Kurssin kotisivu**| [AZD Aloittelijoille](../README.md)|
| **📖 Dokumentaatio** | [Aloita AI-malleilla](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-mallit** | [Microsoft Foundryn mallit](https://ai.azure.com/templates) |
|**🚀 Seuraavat askeleet** | [Ota haaste vastaan](#workshop-challenge) |
| | |

## Työpajan yleiskatsaus

**Kesto:** 3-4 tuntia  
**Taso:** Aloittelija–Keskitaso  
**Esivaatimukset:** Tuntemus Azuresta, tekoälykäsitteistä, VS Codesta ja komentorivityökaluista.

Tämä on käytännönläheinen työpaja, jossa opit tekemällä. Kun olet suorittanut harjoitukset, suosittelemme käymään läpi AZD Aloittelijoille -opintokokonaisuuden jatkaaksesi oppimista suojaus- ja tuottavuuskäytänteistä.

| Aika| Moduuli  | Tavoite |
|:---|:---|:---|
| 15 min | Johdanto | Aseta tavoitteet, ymmärrä tarkoitus |
| 30 min | Valitse AI-malli | Tutki vaihtoehtoja ja valitse aloitusmalli | 
| 30 min | Varmenna AI-malli | Ota oletusratkaisu käyttöön Azureen |
| 30 min | Pure AI-malli | Tutki rakennetta ja asetuksia |
| 30 min | Määritä AI-malli | Aktivoi ja kokeile ominaisuuksia |
| 30 min | Mukauta AI-malli | Sovita malli tarpeisiisi |
| 30 min | Purka infrastruktuuri | Siivoa ja vapauta resurssit |
| 15 min | Yhteenveto & Seuraavat askeleet | Oppimisresurssit, työpajahaarastus |
| | |

## Mitä opit

Ajattele AZD-mallia oppimisympäristönä, jossa voit tutkia erilaisia Microsoft Foundryn lopusta-päähän kehitykseen liittyviä ominaisuuksia ja työkaluja. Tämän työpajan jälkeen sinulla tulisi olla intuitiivinen käsitys aiheesta.

| Käsite  | Tavoite |
|:---|:---|
| **Azure Developer CLI** | Ymmärrä komentojen käyttö ja työnkulut|
| **AZD-mallit**| Ymmärrä projektin rakenne ja asetukset|
| **Azure AI Agent**| Projektin provisiointi ja käyttöönotto Microsoft Foundryssa  |
| **Azure AI Search**| Mahdollistaa kontekstiinsinöörityksen agenteilla |
| **Havaittavuus**| Tutki seurantaa, valvontaa ja evaluointeja |
| **Red Teaming**| Tutki vastustajien testausta ja torjuntakeinoja |
| | |

## Työpajan moduulit

Valmis aloittamaan? Siirry työpajamoduuleihin:

- [Moduuli 1: Valitse AI-malli](instructions/1-Select-AI-Template.md)
- [Moduuli 2: Varmenna AI-malli](instructions/2-Validate-AI-Template.md) 
- [Moduuli 3: Pure AI-malli](instructions/3-Deconstruct-AI-Template.md)
- [Moduuli 4: Määritä AI-malli](instructions/4-Configure-AI-Template.md)
- [Moduuli 5: Mukauta AI-malli](instructions/5-Customize-AI-Template.md)
- [Moduuli 6: Pura infrastruktuuri](instructions/6-Teardown-Infrastructure.md)
- [Moduuli 7: Yhteenveto & Seuraavat askeleet](instructions/7-Wrap-up.md)

## Onko palautetta?

Lähetä ongelma tähän repositorioon (merkitse `Workshop`) tai liity Discordiin [Discord](https://aka.ms/foundry/discord) ja kirjoita viesti kanavallemme `#get-help`

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->