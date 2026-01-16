<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:13:45+00:00",
  "source_file": "workshop/README.md",
  "language_code": "hr"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Radionica u izradi 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Ova radionica je trenutno u aktivnom razvoju.</strong><br>
      Sadržaj može biti nepotpun ili podložan promjenama. Provjerite uskoro za ažuriranja!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Zadnje ažuriranje: listopad 2025
      </span>
    </div>
  </div>
</div>

# AZD radionica za AI developere

Dobrodošli na praktičnu radionicu za učenje Azure Developer CLI (AZD) s fokusom na implementaciju AI aplikacija. Ova radionica pomaže vam steći praktično razumijevanje AZD predložaka u 3 koraka:

1. **Istraživanje** - pronađite predložak koji vam odgovara.
1. **Implementacija** - implementirajte i provjerite da li radi.
1. **Prilagodba** - izmijenite i prilagodite predložak svojim potrebama!

Tijekom radionice također ćete se upoznati s osnovnim alatima za developere i radnim procesima koji će vam pomoći optimizirati vaš razvojni put od početka do kraja.

<br/>

## Vodič u pregledniku

Lekcije radionice su u Markdown formatu. Možete ih pregledavati direktno na GitHubu - ili pokrenuti pregled u pregledniku, kao što je prikazano na slici ispod.

![Radionica](../../../translated_images/hr/workshop.75906f133e6f8ba0.png)

Za korištenje ove opcije - napravite fork repozitorija na svoj profil i pokrenite GitHub Codespaces. Kada terminal u VS Code-u postane aktivan, upišite ovu naredbu:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Za nekoliko sekundi pojavit će se dijalog. Odaberite opciju `Open in browser`. Vodič u pregledniku sada će se otvoriti u novoj kartici preglednika. Neke prednosti ovog pregleda:

1. **Ugrađena pretraga** - brzo pronađite ključne riječi ili lekcije.
1. **Ikona za kopiranje** - zadržite pokazivač iznad blokova koda da biste vidjeli ovu opciju.
1. **Prebacivanje teme** - mijenjajte između tamne i svijetle teme.
1. **Pomoć** - kliknite na ikonu Discorda u podnožju za pridruživanje!

<br/>

## Pregled radionice

**Trajanje:** 3-4 sata  
**Razina:** Početna do srednja  
**Preduvjeti:** Osnovno poznavanje Azure-a, AI koncepata, VS Code-a i alata naredbenog retka.

Ovo je praktična radionica u kojoj učite kroz rad. Nakon što završite vježbe, preporučujemo pregled AZD za početnike kurikuluma kako biste nastavili svoje učenje o sigurnosnim i produktivnim najboljim praksama.

| Vrijeme | Modul  | Cilj |
|:---|:---|:---|
| 15 min | [Uvod](docs/instructions/0-Introduction.md) | Postavljanje temelja, razumijevanje ciljeva |
| 30 min | [Odabir AI predloška](docs/instructions/1-Select-AI-Template.md) | Istražite opcije i odaberite početni predložak | 
| 30 min | [Provjera AI predloška](docs/instructions/2-Validate-AI-Template.md) | Implementirajte zadano rješenje na Azure |
| 30 min | [Rastavljanje AI predloška](docs/instructions/3-Deconstruct-AI-Template.md) | Istražite strukturu i konfiguraciju |
| 30 min | [Konfiguracija AI predloška](docs/instructions/4-Configure-AI-Template.md) | Aktivirajte i isprobajte dostupne značajke |
| 30 min | [Prilagodba AI predloška](docs/instructions/5-Customize-AI-Template.md) | Prilagodite predložak svojim potrebama |
| 30 min | [Uklanjanje infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) | Čišćenje i oslobađanje resursa |
| 15 min | [Zaključak i sljedeći koraci](docs/instructions/7-Wrap-up.md) | Resursi za učenje, izazov radionice |

<br/>

## Što ćete naučiti

AZD predložak zamislite kao sandbox za učenje i istraživanje različitih mogućnosti i alata za razvoj na Azure AI Foundry. Na kraju radionice trebali biste imati intuitivno razumijevanje različitih alata i koncepata u ovom kontekstu.

| Koncept  | Cilj |
|:---|:---|
| **Azure Developer CLI** | Razumjeti naredbe alata i radne procese |
| **AZD predlošci**| Razumjeti strukturu projekta i konfiguraciju |
| **Azure AI Agent**| Postaviti i implementirati projekt Azure AI Foundry |
| **Azure AI Search**| Omogućiti kontekstualno inženjerstvo s agentima |
| **Promatranje**| Istražiti praćenje, nadzor i evaluacije |
| **Red Teaming**| Istražiti testiranje otpornosti i mjere ublažavanja |

<br/>

## Struktura radionice

Radionica je strukturirana tako da vas vodi kroz proces od otkrivanja predloška, preko implementacije, rastavljanja i prilagodbe - koristeći službeni [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents) početni predložak kao osnovu.

### [Modul 1: Odabir AI predloška](docs/instructions/1-Select-AI-Template.md) (30 min)

- Što su AI predlošci?
- Gdje mogu pronaći AI predloške?
- Kako mogu započeti s izradom AI agenata?
- **Laboratorij**: Brzi početak s GitHub Codespaces

### [Modul 2: Provjera AI predloška](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Što je arhitektura AI predloška?
- Što je AZD razvojni proces?
- Kako mogu dobiti pomoć za AZD razvoj?
- **Laboratorij**: Implementirajte i provjerite predložak AI agenata

### [Modul 3: Rastavljanje AI predloška](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Istražite svoje okruženje u `.azure/` 
- Istražite postavke resursa u `infra/` 
- Istražite AZD konfiguraciju u `azure.yaml`
- **Laboratorij**: Izmijenite varijable okruženja i ponovno implementirajte

### [Modul 4: Konfiguracija AI predloška](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Istražite: Generiranje uz pomoć pretraživanja
- Istražite: Evaluaciju agenata i Red Teaming
- Istražite: Praćenje i nadzor
- **Laboratorij**: Istražite AI agenta + promatranje 

### [Modul 5: Prilagodba AI predloška](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Definirajte: PRD sa zahtjevima scenarija
- Konfigurirajte: Varijable okruženja za AZD
- Implementirajte: Lifecycle Hooks za dodatne zadatke
- **Laboratorij**: Prilagodite predložak za svoj scenarij

### [Modul 6: Uklanjanje infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Recap: Što su AZD predlošci?
- Recap: Zašto koristiti Azure Developer CLI?
- Sljedeći koraci: Isprobajte drugi predložak!
- **Laboratorij**: Uklonite infrastrukturu i očistite

<br/>

## Izazov radionice

Želite li se dodatno izazvati? Evo nekoliko prijedloga za projekte - ili podijelite svoje ideje s nama!

| Projekt | Opis |
|:---|:---|
|1. **Rastavljanje složenog AI predloška** | Koristite radni proces i alate koje smo opisali i provjerite možete li implementirati, provjeriti i prilagoditi drugi predložak AI rješenja. _Što ste naučili?_|
|2. **Prilagodba za vaš scenarij**  | Pokušajte napisati PRD (dokument zahtjeva proizvoda) za drugi scenarij. Zatim koristite GitHub Copilot u svom repozitoriju predloška u Agent Modelu - i zamolite ga da generira workflow prilagodbe za vas. _Što ste naučili? Kako biste mogli poboljšati ove prijedloge?_|
| | |

## Imate povratne informacije?

1. Objavite problem na ovom repozitoriju - označite ga `Workshop` radi lakšeg pronalaženja.
1. Pridružite se Azure AI Foundry Discordu - povežite se s kolegama!

| | | 
|:---|:---|
| **📚 Početna stranica tečaja**| [AZD za početnike](../README.md)|
| **📖 Dokumentacija** | [Početak rada s AI predlošcima](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI predlošci** | [Azure AI Foundry predlošci](https://ai.azure.com/templates) |
|**🚀 Sljedeći koraci** | [Prihvatite izazov](../../../workshop) |
| | |

<br/>

---

**Prethodno:** [Vodič za rješavanje problema s AI](../docs/troubleshooting/ai-troubleshooting.md) | **Sljedeće:** Započnite s [Laboratorij 1: Osnove AZD-a](../../../workshop/lab-1-azd-basics)

**Spremni za početak izrade AI aplikacija s AZD-om?**

[Započnite Laboratorij 1: Osnove AZD-a →](./lab-1-azd-basics/README.md)

---

**Izjava o odricanju odgovornosti**:  
Ovaj dokument je preveden pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo osigurati točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za ključne informacije preporučuje se profesionalni prijevod od strane čovjeka. Ne preuzimamo odgovornost za nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.