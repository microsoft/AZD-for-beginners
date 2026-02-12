<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 AZD radionica za AI programere
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Praktična radionica za izradu AI aplikacija s Azure Developer CLI-jem.</strong><br>
      Završite 7 modula da ovladate AZD predlošcima i AI radnim tokovima za implementaciju.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Zadnje ažuriranje: veljača 2026.
      </span>
    </div>
  </div>
</div>

# AZD radionica za AI programere

Dobrodošli u praktičnu radionicu za učenje Azure Developer CLI-ja (AZD) s fokusom na implementaciju AI aplikacija. Ova radionica pomaže vam da steknete praktično razumijevanje AZD predložaka u 3 koraka:

1. **Otkrivanje** - pronađite predložak koji vam odgovara.
1. **Implementacija** - implementirajte i provjerite da li radi
1. **Prilagodba** - mijenjajte i iterirajte da bude vaš!

Tijekom ove radionice također ćete biti upoznati sa osnovnim programerskim alatima i radnim tokovima, kako biste pojednostavili svoj razvojni put od početka do kraja.

<br/>

## Vodič u pregledniku

Lekcije radionice su u Markdown formatu. Možete ih pregledavati izravno na GitHubu – ili pokrenuti pregled u pregledniku kao što je prikazano na slici ispod.

![Workshop](../../../translated_images/hr/workshop.75906f133e6f8ba0.webp)

Za korištenje ove opcije – forkajte repozitorij na svoj profil i pokrenite GitHub Codespaces. Kad je VS Code terminal aktivan, upišite ovu naredbu:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Za nekoliko sekundi vidjet ćete skočni dijalog. Odaberite opciju `Open in browser`. Vodič u pregledniku će se sada otvoriti u novoj kartici. Neke prednosti ovog pregleda:

1. **Ugrađeno pretraživanje** - brzo pronađite ključne riječi ili lekcije.
1. **Ikona za kopiranje** - prijeđite mišem preko blokova koda da vidite ovu opciju
1. **Izbor teme** - prebacite se između tamne i svijetle teme
1. **Pomoć** - kliknite ikonu Discord u podnožju da se pridružite!

<br/>

## Pregled radionice

**Trajanje:** 3-4 sata  
**Razina:** Početna do srednja  
**Preduvjeti:** Poznavanje Azure, AI pojmova, VS Code-a i alata naredbenog retka.

Ovo je praktična radionica gdje učite kroz rad. Nakon završetka vježbi, preporučamo da pregledate program "AZD za početnike" kako biste nastavili svoje učenje o sigurnosti i najboljim praksama produktivnosti.

| Vrijeme| Modul  | Cilj |
|:---|:---|:---|
| 15 min | [Uvod](docs/instructions/0-Introduction.md) | Postavite temelje, razumite ciljeve |
| 30 min | [Odabir AI predloška](docs/instructions/1-Select-AI-Template.md) | Istražite opcije i odaberite početni predložak | 
| 30 min | [Validacija AI predloška](docs/instructions/2-Validate-AI-Template.md) | Implementirajte zadano rješenje na Azure |
| 30 min | [Analiza AI predloška](docs/instructions/3-Deconstruct-AI-Template.md) | Istražite strukturu i konfiguraciju |
| 30 min | [Konfiguracija AI predloška](docs/instructions/4-Configure-AI-Template.md) | Aktivirajte i isprobajte dostupne značajke |
| 30 min | [Prilagodba AI predloška](docs/instructions/5-Customize-AI-Template.md) | Prilagodite predložak svojim potrebama |
| 30 min | [Rastavljanje infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) | Očistite i oslobodite resurse |
| 15 min | [Zaključak i sljedeći koraci](docs/instructions/7-Wrap-up.md) | Edukativni resursi, izazov radionice |

<br/>

## Što ćete naučiti

Promislite o AZD predlošku kao o učionici za istraživanje različitih mogućnosti i alata za razvoj od početka do kraja na Microsoft Foundry platformi. Do kraja ove radionice trebali biste imati intuitivno razumijevanje raznih alata i koncepata u ovom kontekstu.

| Koncept  | Cilj |
|:---|:---|
| **Azure Developer CLI** | Razumjeti naredbe alata i radne tokove |
| **AZD predlošci**| Razumjeti strukturu projekta i konfiguraciju|
| **Azure AI Agent**| Postaviti i implementirati Microsoft Foundry projekt  |
| **Azure AI Search**| Omogućiti kontekstualno inženjerstvo pomoću agenata |
| **Promatranje**| Istražiti praćenje, nadzor i evaluacije |
| **Red Teaming**| Istražiti protivničko testiranje i mjere ublažavanja |

<br/>

## Struktura radionice

Radionica je strukturirana da vas vodi kroz put od pronalaska predloška preko implementacije, analize i prilagodbe – koristeći službeni [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) početni predložak kao osnovu.

### [Modul 1: Odabir AI predloška](docs/instructions/1-Select-AI-Template.md) (30 minuta)

- Što su AI predlošci?
- Gdje mogu pronaći AI predloške?
- Kako mogu započeti izradu AI agenata?
- **Laboratorij**: Brzi početak s GitHub Codespaces

### [Modul 2: Validacija AI predloška](docs/instructions/2-Validate-AI-Template.md) (30 minuta)

- Što je arhitektura AI predloška?
- Što je AZD razvojni radni tok?
- Kako mogu dobiti pomoć za AZD razvoj?
- **Laboratorij**: Implementirajte i validirajte AI Agents predložak

### [Modul 3: Analiza AI predloška](docs/instructions/3-Deconstruct-AI-Template.md) (30 minuta)

- Istražite svoje okruženje u `.azure/` 
- Istražite postavke resursa u `infra/` 
- Istražite AZD konfiguraciju u `azure.yaml` datotekama
- **Laboratorij**: Promijenite varijable okruženja i ponovno implementirajte

### [Modul 4: Konfiguracija AI predloška](docs/instructions/4-Configure-AI-Template.md) (30 minuta)
- Istražite: Retrieval Augmented Generation
- Istražite: Evaluaciju agenta i Red Teaming
- Istražite: Praćenje i nadzor
- **Laboratorij**: Istražite AI agenta + Promatranje

### [Modul 5: Prilagodba AI predloška](docs/instructions/5-Customize-AI-Template.md) (30 minuta)
- Definirajte: PRD s zahtjevima scenarija
- Konfigurirajte: Varijable okruženja za AZD
- Implementirajte: Lifecycle Hooks za dodatne zadatke
- **Laboratorij**: Prilagodite predložak svom scenariju

### [Modul 6: Rastavljanje infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) (30 minuta)
- Sažetak: Što su AZD predlošci?
- Sažetak: Zašto koristiti Azure Developer CLI?
- Sljedeći koraci: Isprobajte drugi predložak!
- **Laboratorij**: Uklonite infrastrukturu i očistite

<br/>

## Izazov radionice

Želite li se izazvati da napravite više? Evo nekoliko prijedloga projekata – ili podijelite svoje ideje s nama!!

| Projekt | Opis |
|:---|:---|
|1. **Rastavite složeni AI predložak** | Koristite radne tokove i alate koje smo opisali i pokušajte implementirati, validirati i prilagoditi neki drugi AI predložak. _Što ste naučili?_|
|2. **Prilagodite prema svom scenariju**  | Pokušajte napisati PRD (dokument s zahtjevima proizvoda) za drugi scenarij. Zatim upotrijebite GitHub Copilot u svojem repozitoriju predloška u Agent Modelu – i zatražite da generira radni tok prilagodbe za vas. _Što ste naučili? Kako biste mogli poboljšati ove prijedloge?_|
| | |

## Imate povratnu informaciju?

1. Objavite issue na ovom repozitoriju - označite je `Workshop` radi lakše pretrage.
1. Pridružite se Microsoft Foundry Discordu - povežite se s kolegama!


| | | 
|:---|:---|
| **📚 Početak tečaja**| [AZD za početnike](../README.md)|
| **📖 Dokumentacija** | [Započnite s AI predlošcima](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI predlošci** | [Microsoft Foundry predlošci](https://ai.azure.com/templates) |
|**🚀 Sljedeći koraci** | [Započnite radionicu](../../../workshop) |
| | |

<br/>

---

**Navigacija:** [Glavni tečaj](../README.md) | [Uvod](docs/instructions/0-Introduction.md) | [Modul 1: Odabir predloška](docs/instructions/1-Select-AI-Template.md)

**Spremni započeti s izradom AI aplikacija koristeći AZD?**

[Započni radionicu: Uvod →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena o odricanju odgovornosti**:
Ovaj dokument preveden je pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili nepravilnosti. Izvorni dokument na izvornom jeziku treba smatrati službenim i autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazumevanja ili pogrešna tumačenja proizašla iz uporabe ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->