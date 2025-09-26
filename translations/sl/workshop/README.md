<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "9cc966416ab431c38b2ab863884b196c",
  "translation_date": "2025-09-25T01:34:02+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sl"
}
-->
# AZD za delavnico AI razvijalcev

Dobrodošli na praktični delavnici za učenje Azure Developer CLI (AZD) s poudarkom na uvajanju AI aplikacij. Ta delavnica vam pomaga pridobiti praktično razumevanje AZD predlog v 3 korakih:

1. **Raziskovanje** - poiščite predlogo, ki je prava za vas.
1. **Uvajanje** - uvedite in preverite, da deluje.
1. **Prilagoditev** - spremenite in prilagodite, da postane vaša!

Med delavnico boste spoznali tudi osnovna orodja za razvijalce in delovne procese, ki vam bodo pomagali optimizirati celoten razvojni proces.

<br/>

## Vodnik v brskalniku

Lekcije delavnice so zapisane v Markdownu. Lahko jih pregledujete neposredno na GitHubu - ali pa zaženete predogled v brskalniku, kot je prikazano na spodnjem posnetku zaslona.

![Delavnica](../../../translated_images/workshop.75906f133e6f8ba07ab0302ce17f67ff90f357513f3d4c4bbafa5978b10f058b.sl.png)

Za uporabo te možnosti - razvejite repozitorij v svoj profil in zaženite GitHub Codespaces. Ko je terminal v VS Code aktiven, vnesite ta ukaz:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

V nekaj sekundah se bo prikazal pojavni dialog. Izberite možnost `Odpri v brskalniku`. Vodnik v brskalniku se bo zdaj odprl v novem zavihku brskalnika. Nekatere prednosti tega predogleda:

1. **Vgrajeno iskanje** - hitro poiščite ključne besede ali lekcije.
1. **Ikona za kopiranje** - premaknite kazalec nad kode, da vidite to možnost.
1. **Preklop teme** - preklapljajte med temno in svetlo temo.
1. **Pomoč** - kliknite ikono Discord v nogi za pridružitev!

<br/>

## Pregled delavnice

**Trajanje:** 3-4 ure  
**Raven:** Začetnik do srednje napreden  
**Predpogoji:** Poznavanje Azure, AI konceptov, VS Code in orodij ukazne vrstice.

To je praktična delavnica, kjer se učite z delom. Ko zaključite vaje, priporočamo pregled učnega načrta AZD za začetnike, da nadaljujete svojo učno pot v smeri varnosti in produktivnosti.

| Čas | Modul  | Cilj |
|:---|:---|:---|
| 15 min | [Uvod](docs/instructions/0-Introduction.md) | Postavite temelje, razumite cilje |
| 30 min | [Izbira AI predloge](docs/instructions/1-Select-AI-Template.md) | Raziščite možnosti in izberite začetno predlogo | 
| 30 min | [Preverjanje AI predloge](docs/instructions/2-Validate-AI-Template.md) | Uvedite privzeto rešitev v Azure |
| 30 min | [Razčlenitev AI predloge](docs/instructions/3-Deconstruct-AI-Template.md) | Raziščite strukturo in konfiguracijo |
| 30 min | [Konfiguracija AI predloge](docs/instructions/4-Configure-AI-Template.md) | Aktivirajte in preizkusite razpoložljive funkcije |
| 30 min | [Prilagoditev AI predloge](docs/instructions/5-Customize-AI-Template.md) | Prilagodite predlogo svojim potrebam |
| 30 min | [Razgradnja infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) | Očistite in sprostite vire |
| 15 min | [Zaključek in naslednji koraki](docs/instructions/7-Wrap-up.md) | Učni viri, izziv delavnice |

<br/>

## Kaj boste naučili

AZD predlogo si predstavljajte kot učni peskovnik za raziskovanje različnih zmogljivosti in orodij za celoten razvoj na Azure AI Foundry. Do konca delavnice boste intuitivno razumeli različna orodja in koncepte v tem kontekstu.

| Koncept  | Cilj |
|:---|:---|
| **Azure Developer CLI** | Razumevanje ukazov in delovnih procesov orodja |
| **AZD predloge**| Razumevanje strukture projekta in konfiguracije |
| **Azure AI Agent**| Uvedba in uvajanje projekta Azure AI Foundry |
| **Azure AI Search**| Omogočanje kontekstnega inženiringa z agenti |
| **Opazljivost**| Raziskovanje sledenja, monitoringa in evalvacij |
| **Red Teaming**| Raziskovanje testiranja in ublažitev napadov |

<br/>

## Struktura delavnice

Delavnica je zasnovana kot potovanje od odkrivanja predloge, do uvajanja, razčlenitve in prilagoditve - z uporabo uradne začetne predloge [Getting Started with AI Agents](https://github.com/Azure-Samples/get-started-with-ai-agents).

### [Modul 1: Izbira AI predloge](docs/instructions/1-Select-AI-Template.md) (30 min)

- Kaj so AI predloge?
- Kje lahko najdem AI predloge?
- Kako lahko začnem graditi AI agente?
- **Laboratorij**: Hitri začetek z GitHub Codespaces

### [Modul 2: Preverjanje AI predloge](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Kakšna je arhitektura AI predloge?
- Kakšen je razvojni proces AZD?
- Kako lahko dobim pomoč pri razvoju z AZD?
- **Laboratorij**: Uvedba in preverjanje predloge AI agentov

### [Modul 3: Razčlenitev AI predloge](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Raziščite svoje okolje v `.azure/` 
- Raziščite nastavitev virov v `infra/` 
- Raziščite konfiguracijo AZD v `azure.yaml`
- **Laboratorij**: Spremenite okoljske spremenljivke in ponovno uvedite

### [Modul 4: Konfiguracija AI predloge](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Raziščite: Pridobivanje z obogateno generacijo
- Raziščite: Evalvacija agentov in Red Teaming
- Raziščite: Sledenje in monitoring
- **Laboratorij**: Raziščite AI agenta + opazljivost 

### [Modul 5: Prilagoditev AI predloge](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Določite: PRD s scenarijskimi zahtevami
- Konfigurirajte: Okoljske spremenljivke za AZD
- Implementirajte: Lifecycle Hooks za dodatne naloge
- **Laboratorij**: Prilagodite predlogo za svoj scenarij

### [Modul 6: Razgradnja infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Povzetek: Kaj so AZD predloge?
- Povzetek: Zakaj uporabljati Azure Developer CLI?
- Naslednji koraki: Preizkusite drugo predlogo!
- **Laboratorij**: Deprovision infrastrukture in čiščenje

<br/>

## Izziv delavnice

Želite izzvati sami sebe, da naredite več? Tukaj je nekaj predlogov za projekte - ali pa delite svoje ideje z nami!!

| Projekt | Opis |
|:---|:---|
|1. **Razčlenitev kompleksne AI predloge** | Uporabite delovni proces in orodja, ki smo jih opisali, ter preverite, ali lahko uvedete, preverite in prilagodite drugo predlogo AI rešitve. _Kaj ste se naučili?_|
|2. **Prilagoditev za vaš scenarij**  | Poskusite napisati PRD (Product Requirements Document) za drug scenarij. Nato uporabite GitHub Copilot v svojem repozitoriju predloge v Agent Model - in ga prosite, da ustvari prilagoditveni delovni proces za vas. _Kaj ste se naučili? Kako bi lahko izboljšali te predloge?_|
| | |

## Imate povratne informacije?

1. Objavite težavo v tem repozitoriju - označite jo z `Workshop` za lažjo identifikacijo.
1. Pridružite se Discordu Azure AI Foundry - povežite se s svojimi vrstniki!


| | | 
|:---|:---|
| **📚 Domača stran tečaja**| [AZD za začetnike](../README.md)|
| **📖 Dokumentacija** | [Začetek z AI predlogami](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI predloge** | [Azure AI Foundry predloge](https://ai.azure.com/templates) |
|**🚀 Naslednji koraki** | [Sprejmite izziv](../../../workshop) |
| | |

<br/>

---

**Prejšnje:** [Vodnik za odpravljanje težav z AI](../docs/troubleshooting/ai-troubleshooting.md) | **Naslednje:** Začnite z [Laboratorijem 1: Osnove AZD](../../../workshop/lab-1-azd-basics)

**Pripravljeni na začetek gradnje AI aplikacij z AZD?**

[Začnite Laboratorij 1: Osnove AZD →](./lab-1-azd-basics/README.md)

---

