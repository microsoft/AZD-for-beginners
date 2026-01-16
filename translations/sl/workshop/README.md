<!--
CO_OP_TRANSLATOR_METADATA:
{
  "original_hash": "390da1a5d0feb705fa0eb9940f6f3b27",
  "translation_date": "2025-10-16T16:15:03+00:00",
  "source_file": "workshop/README.md",
  "language_code": "sl"
}
-->
<div align="center">
  <div style="background: linear-gradient(135deg, #ff6b35, #f7931e); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(255, 107, 53, 0.3); border: 2px solid #e55a2b;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🚧 Delavnica v gradnji 🚧
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Ta delavnica je trenutno v aktivnem razvoju.</strong><br>
      Vsebina je lahko nepopolna ali se spreminja. Kmalu preverite za posodobitve!
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Zadnja posodobitev: oktober 2025
      </span>
    </div>
  </div>
</div>

# AZD za AI razvijalce - delavnica

Dobrodošli na praktični delavnici za učenje Azure Developer CLI (AZD) s poudarkom na uvajanju AI aplikacij. Ta delavnica vam pomaga pridobiti praktično razumevanje AZD predlog v treh korakih:

1. **Odkritje** - poiščite predlogo, ki je prava za vas.
1. **Uvajanje** - uvedite in preverite, da deluje.
1. **Prilagoditev** - spremenite in prilagodite predlogo svojim potrebam!

Med delavnico boste spoznali tudi osnovna orodja za razvijalce in delovne procese, ki vam bodo pomagali optimizirati celoten razvojni proces.

<br/>

## Vodnik v brskalniku

Lekcije delavnice so v Markdownu. Lahko jih pregledujete neposredno na GitHubu - ali pa zaženete predogled v brskalniku, kot je prikazano na spodnjem posnetku zaslona.

![Delavnica](../../../translated_images/sl/workshop.75906f133e6f8ba0.webp)

Za uporabo te možnosti - razvejite repozitorij v svoj profil in zaženite GitHub Codespaces. Ko je terminal VS Code aktiven, vnesite naslednji ukaz:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

V nekaj sekundah se bo prikazalo pogovorno okno. Izberite možnost `Odpri v brskalniku`. Vodnik v brskalniku se bo zdaj odprl v novem zavihku. Nekatere prednosti tega predogleda:

1. **Vgrajeno iskanje** - hitro poiščite ključne besede ali lekcije.
1. **Ikona za kopiranje** - premaknite kazalec nad kode, da se prikaže ta možnost.
1. **Preklop teme** - preklapljajte med temno in svetlo temo.
1. **Pomoč** - kliknite ikono Discord v nogi za pridružitev!

<br/>

## Pregled delavnice

**Trajanje:** 3-4 ure  
**Raven:** Začetnik do srednje napreden  
**Predpogoji:** Osnovno poznavanje Azure, AI konceptov, VS Code in orodij ukazne vrstice.

To je praktična delavnica, kjer se učite z delom. Ko zaključite vaje, priporočamo pregled učnega načrta AZD za začetnike, da nadaljujete svojo učno pot v smeri varnosti in produktivnosti.

| Čas | Modul  | Cilj |
|:---|:---|:---|
| 15 min | [Uvod](docs/instructions/0-Introduction.md) | Postavite temelje, razumite cilje |
| 30 min | [Izbira AI predloge](docs/instructions/1-Select-AI-Template.md) | Raziščite možnosti in izberite začetno predlogo | 
| 30 min | [Preverjanje AI predloge](docs/instructions/2-Validate-AI-Template.md) | Uvedite privzeto rešitev na Azure |
| 30 min | [Razčlenitev AI predloge](docs/instructions/3-Deconstruct-AI-Template.md) | Raziščite strukturo in konfiguracijo |
| 30 min | [Konfiguracija AI predloge](docs/instructions/4-Configure-AI-Template.md) | Aktivirajte in preizkusite razpoložljive funkcije |
| 30 min | [Prilagoditev AI predloge](docs/instructions/5-Customize-AI-Template.md) | Prilagodite predlogo svojim potrebam |
| 30 min | [Odstranitev infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) | Očistite in sprostite vire |
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

Delavnica je zasnovana tako, da vas vodi od odkritja predloge, do uvajanja, razčlenitve in prilagoditve - z uporabo uradne začetne predloge [Začetek z AI agenti](https://github.com/Azure-Samples/get-started-with-ai-agents).

### [Modul 1: Izbira AI predloge](docs/instructions/1-Select-AI-Template.md) (30 min)

- Kaj so AI predloge?
- Kje lahko najdem AI predloge?
- Kako lahko začnem graditi AI agente?
- **Laboratorij**: Hitri začetek z GitHub Codespaces

### [Modul 2: Preverjanje AI predloge](docs/instructions/2-Validate-AI-Template.md) (30 min)

- Kaj je arhitektura AI predloge?
- Kaj je razvojni proces AZD?
- Kako lahko dobim pomoč pri razvoju z AZD?
- **Laboratorij**: Uvedba in preverjanje predloge AI agentov

### [Modul 3: Razčlenitev AI predloge](docs/instructions/3-Deconstruct-AI-Template.md) (30 min)

- Raziščite svoje okolje v `.azure/` 
- Raziščite nastavitev virov v `infra/` 
- Raziščite konfiguracijo AZD v `azure.yaml`
- **Laboratorij**: Spremenite okoljske spremenljivke in ponovno uvedite

### [Modul 4: Konfiguracija AI predloge](docs/instructions/4-Configure-AI-Template.md) (30 min)
- Raziščite: Pridobivanje z obogatitvijo generacije
- Raziščite: Evalvacija agentov in Red Teaming
- Raziščite: Sledenje in monitoring
- **Laboratorij**: Raziščite AI agenta + opazljivost 

### [Modul 5: Prilagoditev AI predloge](docs/instructions/5-Customize-AI-Template.md) (30 min)
- Določite: PRD s scenarijskimi zahtevami
- Konfigurirajte: Okoljske spremenljivke za AZD
- Implementirajte: Lifecycle Hooks za dodatne naloge
- **Laboratorij**: Prilagodite predlogo za svoj scenarij

### [Modul 6: Odstranitev infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) (30 min)
- Povzetek: Kaj so AZD predloge?
- Povzetek: Zakaj uporabljati Azure Developer CLI?
- Naslednji koraki: Preizkusite drugo predlogo!
- **Laboratorij**: Odstranitev infrastrukture in čiščenje

<br/>

## Izziv delavnice

Želite izzvati sami sebe in narediti več? Tukaj je nekaj predlogov za projekte - ali pa delite svoje ideje z nami!!

| Projekt | Opis |
|:---|:---|
|1. **Razčlenitev kompleksne AI predloge** | Uporabite delovni proces in orodja, ki smo jih opisali, ter preverite, ali lahko uvedete, preverite in prilagodite drugo predlogo AI rešitve. _Kaj ste se naučili?_|
|2. **Prilagoditev za vaš scenarij**  | Poskusite napisati PRD (dokument o zahtevah za izdelek) za drug scenarij. Nato uporabite GitHub Copilot v svojem repozitoriju predloge v Agent Model - in ga prosite, da ustvari prilagoditveni delovni proces za vas. _Kaj ste se naučili? Kako bi lahko izboljšali te predloge?_|
| | |

## Imate povratne informacije?

1. Objavite težavo v tem repozitoriju - označite jo z `Workshop` za lažjo identifikacijo.
1. Pridružite se Discordu Azure AI Foundry - povežite se s kolegi!


| | | 
|:---|:---|
| **📚 Domača stran tečaja**| [AZD za začetnike](../README.md)|
| **📖 Dokumentacija** | [Začetek z AI predlogami](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️AI predloge** | [Azure AI Foundry predloge](https://ai.azure.com/templates) |
|**🚀 Naslednji koraki** | [Sprejmite izziv](../../../workshop) |
| | |

<br/>

---

**Prejšnje:** [Vodnik za odpravljanje težav z AI](../docs/troubleshooting/ai-troubleshooting.md) | **Naslednje:** Začnite z [Laboratorij 1: Osnove AZD](../../../workshop/lab-1-azd-basics)

**Pripravljeni na začetek gradnje AI aplikacij z AZD?**

[Začnite Laboratorij 1: Osnove AZD →](./lab-1-azd-basics/README.md)

---

**Omejitev odgovornosti**:  
Ta dokument je bil preveden z uporabo storitve AI za prevajanje [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem maternem jeziku naj se šteje za avtoritativni vir. Za ključne informacije priporočamo profesionalni človeški prevod. Ne odgovarjamo za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.