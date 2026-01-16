<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T15:55:20+00:00",
  "source_file": "workshop/README.md",
  "language_code": "fi"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Työpaja työn alla 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Tämä työpaja on parhaillaan kehitteillä.</strong><br>
      Sisältö voi olla keskeneräistä tai muuttua. Tarkista päivitykset pian!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Viimeksi päivitetty: lokakuu 2025
      </span>
    </div>
  </div>
</div>

# AZD-työpaja tekoälykehittäjille

Tervetuloa käytännönläheiseen työpajaan, jossa opit käyttämään Azure Developer CLI:tä (AZD) keskittyen tekoälysovellusten käyttöönottoon. Työpaja auttaa sinua ymmärtämään AZD-mallipohjia kolmessa vaiheessa:

1. **Tutustuminen** - löydä sinulle sopiva mallipohja.
1. **Käyttöönotto** - ota käyttöön ja varmista, että se toimii.
1. **Mukauttaminen** - muokkaa ja kehitä mallipohjaa omiin tarpeisiisi!

Työpajan aikana tutustut myös keskeisiin kehittäjätyökaluihin ja -työnkulkuihin, jotka auttavat sinua tehostamaan koko kehitysprosessiasi.

<br/>

## Selaimessa toimiva opas

Työpajan oppitunnit ovat Markdown-muodossa. Voit selata niitä suoraan GitHubissa tai avata selaimessa esikatselun, kuten alla olevassa kuvakaappauksessa.

![Työpaja](../../../translated_images/fi/workshop.75906f133e6f8ba0.webp)

Jos haluat käyttää tätä vaihtoehtoa, haaroita arkisto omaan profiiliisi ja käynnistä GitHub Codespaces. Kun VS Code -pääte on aktiivinen, kirjoita tämä komento:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Muutaman sekunnin kuluttua näet ponnahdusikkunan. Valitse vaihtoehto `Avaa selaimessa`. Selaimessa toimiva opas avautuu nyt uuteen välilehteen. Tämän esikatselun etuja:

1. **Sisäänrakennettu haku** - löydä avainsanoja tai oppitunteja nopeasti.
1. **Kopiointikuvake** - vie hiiri koodilohkojen päälle nähdäksesi tämän vaihtoehdon.
1. **Teeman vaihto** - vaihda tumma ja vaalea teema.
1. **Apua** - napsauta alatunnisteen Discord-kuvaketta liittyäksesi mukaan!

<br/>

## Työpajan yleiskatsaus

**Kesto:** 3-4 tuntia  
**Taso:** Aloittelija - Keskitaso  
**Esitiedot:** Perustiedot Azuresta, tekoälykonsepteista, VS Codesta ja komentorivityökaluista.

Tämä on käytännönläheinen työpaja, jossa opit tekemällä. Kun olet suorittanut harjoitukset, suosittelemme tutustumaan AZD For Beginners -opetusohjelmaan jatkaaksesi oppimista turvallisuus- ja tuottavuuskäytännöistä.

| Aika | Moduuli  | Tavoite |
|:---|:---|:---|
| 15 min | [Johdanto](docs/instructions/0-Introduction.md) | Aseta lähtökohdat, ymmärrä tavoitteet |
| 30 min | [Valitse AI-mallipohja](docs/instructions/1-Select-AI-Template.md) | Tutki vaihtoehtoja ja valitse aloituspohja | 
| 30 min | [Vahvista AI-mallipohja](docs/instructions/2-Validate-AI-Template.md) | Ota oletusratkaisu käyttöön Azuren kautta |
| 30 min | [Pura AI-mallipohja](docs/instructions/3-Deconstruct-AI-Template.md) | Tutki rakennetta ja konfiguraatiota |
| 30 min | [Konfiguroi AI-mallipohja](docs/instructions/4-Configure-AI-Template.md) | Aktivoi ja kokeile käytettävissä olevia ominaisuuksia |
| 30 min | [Mukauta AI-mallipohja](docs/instructions/5-Customize-AI-Template.md) | Sovita mallipohja omiin tarpeisiisi |
| 30 min | [Poista infrastruktuuri](docs/instructions/6-Teardown-Infrastructure.md) | Siivoa ja vapauta resurssit |
| 15 min | [Yhteenveto ja seuraavat askeleet](docs/instructions/7-Wrap-up.md) | Oppimisresurssit, työpajahaaste |

<br/>

## Mitä opit?

Ajattele AZD-mallipohjaa oppimisympäristönä, jossa voit tutkia erilaisia työkaluja ja ominaisuuksia Azuren tekoälyratkaisujen kehittämiseen. Työpajan päätteeksi sinulla pitäisi olla intuitiivinen käsitys eri työkaluista ja konsepteista tässä kontekstissa.

| Konsepti  | Tavoite |
|:---|:---|
| **Azure Developer CLI** | Ymmärrä työkalun komennot ja työnkulut |
| **AZD-mallipohjat**| Ymmärrä projektin rakenne ja konfiguraatio |
| **Azure AI Agent**| Luo ja ota käyttöön Azure AI Foundry -projekti |
| **Azure AI Search**| Mahdollista kontekstin hallinta agenteilla |
| **Havainnointi**| Tutki jäljitystä, seurantaa ja arviointia |
| **Red Teaming**| Tutki hyökkäystestauksia ja niiden torjuntaa |

<br/>

## Työpajan rakenne

Työpaja on suunniteltu viemään sinut matkalle mallipohjan löytämisestä sen käyttöönottoon, purkamiseen ja mukauttamiseen - käyttäen virallista [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) -aloitusmallipohjaa perustana.

### [Moduuli 1: Valitse AI-mallipohja](docs/instructions/1-Select-AI-Template.md) (30 min)

- Mitä AI-mallipohjat ovat?
- Mistä löydän AI-mallipohjia?
- Kuinka voin aloittaa AI-agenttien rakentamisen?
- **Lab**: Pikakäynnistys GitHub Codespacesilla

### [Moduuli 2: Vahvista AI-mallipohja](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Mikä on AI-mallipohjan arkkitehtuuri?
- Mikä on AZD-kehitystyönkulku?
- Miten voin saada apua AZD-kehitykseen?
- **Lab**: Ota käyttöön ja vahvista AI-agenttien mallipohja

### [Moduuli 3: Pura AI-mallipohja](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Tutki ympäristöäsi `.azure/`-hakemistossa
- Tutki resurssiasetuksia `infra/`-hakemistossa
- Tutki AZD-konfiguraatiota `azure.yaml`-tiedostoissa
- **Lab**: Muokkaa ympäristömuuttujia ja ota käyttöön uudelleen

### [Moduuli 4: Konfiguroi AI-mallipohja](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Tutki: Retrieval Augmented Generation
- Tutki: Agenttien arviointi ja Red Teaming
- Tutki: Jäljitys ja seuranta
- **Lab**: Tutki AI-agenttia + havainnointia 

### [Moduuli 5: Mukauta AI-mallipohja](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Määrittele: PRD skenaariovaatimuksilla
- Konfiguroi: Ympäristömuuttujat AZD:lle
- Toteuta: Elinkaarikoukut lisätehtäville
- **Lab**: Mukauta mallipohja omaan skenaarioosi

### [Moduuli 6: Poista infrastruktuuri](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Yhteenveto: Mitä ovat AZD-mallipohjat?
- Yhteenveto: Miksi käyttää Azure Developer CLI:tä?
- Seuraavat askeleet: Kokeile toista mallipohjaa!
- **Lab**: Poista infrastruktuuri ja siivoa

<br/>

## Työpajahaaste

Haluatko haastaa itsesi tekemään enemmän? Tässä muutama projektiehdotus - tai jaa omat ideasi kanssamme!

| Projekti | Kuvaus |
|:---|:---|
|1. **Pura monimutkainen AI-mallipohja** | Käytä esitettyä työnkulkua ja työkaluja ja katso, pystytkö ottamaan käyttöön, vahvistamaan ja mukauttamaan toisen AI-ratkaisumallipohjan. _Mitä opit?_|
|2. **Mukauta omalla skenaariollasi**  | Kokeile kirjoittaa PRD (tuotevaatimusten dokumentti) eri skenaariolle. Käytä sitten GitHub Copilotia mallipohjasi repossa Agent Model -tilassa ja pyydä sitä luomaan mukautustyönkulku sinulle. _Mitä opit? Miten voisit parantaa näitä ehdotuksia?_|
| | |

## Onko sinulla palautetta?

1. Lähetä issue tähän repositorioon - merkitse se `Workshop` helpottaaksesi käsittelyä.
1. Liity Azure AI Foundry Discordiin - verkostoidu muiden kanssa!


| | | 
|:---|:---|
| **📚 Kurssin kotisivu**| [AZD For Beginners](../README.md)|
| **📖 Dokumentaatio** | [Aloita AI-mallipohjien kanssa](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI-mallipohjat** | [Azure AI Foundry Templates](https://ai.azure.com/templates) |
|**🚀 Seuraavat askeleet** | [Ota haaste vastaan](../../../workshop) |
| | |

<br/>

---

**Edellinen:** [AI-vianetsintäopas](../docs/troubleshooting/ai-troubleshooting.md) | **Seuraava:** Aloita [Lab 1: AZD Basics](../../../workshop/lab-1-azd-basics)

**Valmis aloittamaan tekoälysovellusten rakentamisen AZD:llä?**

[Aloita Lab 1: AZD Foundations →](./lab-1-azd-basics/README.md)

---

**Vastuuvapauslauseke**:  
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, huomioithan, että automaattiset käännökset voivat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäisellä kielellä tulisi pitää ensisijaisena lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa väärinkäsityksistä tai virhetulkinnoista, jotka johtuvat tämän käännöksen käytöstä.