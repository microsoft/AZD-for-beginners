# AZD AI-kehittäjille -työpaja

> Lähdeohjeistus tarkistettu AZD 1.37.2:n mukaan 4. marraskuuta 2026. Kuvakaappaukset ovat kuvitteellisia; palvelun saatavuus, portaalin nimikkeet ja mallipohjan oletukset voivat muuttua.

> [!IMPORTANT]  
> **Tässä työpajassa on työpajaohje, jonka voit esikatsella paikallisessa selaimessasi. Aloita avaamalla repo GitHub Codespacesissa, kehityssäiliössä tai paikallisessa kloonissa, johon on asennettu MkDocs — ja odota, kunnes näet aktiivisen VS Code -päätteen, ja kirjoita sitten:**  
> Kurssin repojen juurihakemistosta asenna `requirements-dev.txt`, sitten suorita `python -m mkdocs serve --config-file workshop/mkdocs.yml` etualalla.
> **Sinun pitäisi nähdä ponnahdusikkuna, joka kysyy haluatko avata esikatselusivun selaimessa.**

Tervetuloa käytännön työpajaan Azure Developer CLI:n (AZD) oppimiseksi AI-sovellusten käyttöönottoon keskittyen. Tässä työpajassa opit soveltamaan AZD-malleja kolmessa vaiheessa:

1. **Löytö** – löydä sinulle sopivin malli.
1. **Käyttöönotto** – ota käyttöön ja varmista, että se toimii.
1. **Mukautus** – muokkaa ja kehitä mallia omaksesi!

Työpajan aikana tutustut myös keskeisiin kehittäjätyökaluihin ja työnkulkuun, jotka auttavat sujuvoittamaan koko kehitysprosessiasi.

| | | 
|:---|:---|
| **📚 Kurssin kotisivu**| [AZD Aloittelijoille](https://github.com/microsoft/AZD-for-beginners/blob/main/README.md)|
| **📖 Dokumentaatio** | [Aloita AI-mallien kanssa](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI-mallit** | [Microsoft Foundry -mallit](https://ai.azure.com/templates) |
|**🚀 Seuraavat askeleet** | [Haasta itsesi](instructions/7-Wrap-up.md#4-workshop-challenge) |
| | |

## Työpajan yleiskatsaus

**Kesto:** 3-4 tuntia  
**Taso:** Aloittelija–keskitaso  
**Edellytykset:** Azureen, tekoälykäsitteisiin, VS Codeen ja komentorivityökaluihin perehtyneisyys.

Tämä on käytännön työpaja, jossa opit tekemällä. Kun olet suorittanut harjoitukset, suosittelemme tutustumaan AZD Aloittelijoille -oppimäärään jatkaaksesi oppimista tietoturvan ja tuottavuuden parhaiden käytäntöjen parissa.

| Aika | Moduuli  | Tavoite |
|:---|:---|:---|
| 15 min | Johdanto | Aseta tavoite ja ymmärrä päämäärät |
| 30 min | Valitse AI-malli | Tutustu vaihtoehtoihin ja valitse aloitusmalli | 
| 30 min | Vahvista AI-malli | Ota oletusratkaisu käyttöön Azureen |
| 30 min | Pure AI-malli osiin | Tutki rakenne ja määritykset |
| 30 min | Konfiguroi AI-malli | Aktivoi ja kokeile käytettävissä olevia ominaisuuksia |
| 30 min | Muokkaa AI-mallia | Säädä malli tarpeidesi mukaan |
| 30 min | Pura infrastruktuuri | Siivoa ja vapauta resurssit |
| 15 min | Yhteenveto & seuraavat askeleet | Oppimateriaalit, työpajahaarukka |
| | |

## Mitä opit

Ajattele AZD-mallia oppimisleikkikenttänä, jossa voit tutkia erilaisia ominaisuuksia ja työkaluja Microsoft Foundryn loppuun asti kehittämiseen. Tämän työpajan lopussa sinulla pitäisi olla intuitiivinen ymmärrys monista työkaluista ja käsitteistä tässä kontekstissa.

| Käsite  | Tavoite |
|:---|:---|
| **Azure Developer CLI** | Ymmärrä työkalun komennot ja työnkulut|
| **AZD-mallit**| Ymmärrä projektin rakenne ja määritykset|
| **Azure AI Agent**| Varaus ja käyttöönotto Microsoft Foundry -projektille  |
| **Azure AI Search**| Ota käyttöön konteksti-innovaatiot agenttien avulla |
| **Havaittavuus**| Tutustu jäljitykseen, valvontaan ja arviointeihin |
| **Red Teaming**| Tutki vihamielistä testausta ja torjuntakeinoja |
| | |

## Työpajan moduulit

Valmiina aloittamaan? Selaa työpajan moduuleja:

- [Moduuli 1: Valitse AI-malli](instructions/1-Select-AI-Template.md)
- [Moduuli 2: Vahvista AI-malli](instructions/2-Validate-AI-Template.md) 
- [Moduuli 3: Pura AI-malli osiin](instructions/3-Deconstruct-AI-Template.md)
- [Moduuli 4: Konfiguroi AI-malli](instructions/4-Configure-AI-Template.md)
- [Moduuli 5: Muokkaa AI-mallia](instructions/5-Customize-AI-Template.md)
- [Moduuli 6: Pura infrastruktuuri](instructions/6-Teardown-Infrastructure.md)
- [Moduuli 7: Yhteenveto & seuraavat askeleet](instructions/7-Wrap-up.md)

## Onko palautetta?

Julkaise ongelma tässä repossa (merkkaa se `Workshop`) tai liity Discordiin [Discord](https://aka.ms/foundry/discord) ja julkaise `#get-help`-kanavalla

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->