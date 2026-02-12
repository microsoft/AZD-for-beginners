<div align="center">
  <div style="background: linear-gradient(135deg, #0078d4, #106ebe); border-radius: 10px; padding: 20px; margin: 20px 0; box-shadow: 0 4px 15px rgba(0, 120, 212, 0.3); border: 2px solid #005a9e;">
    <h2 style="color: white; margin: 0; font-size: 24px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      🎯 Delavnica AZD za razvijalce AI
    </h2>
    <p style="color: white; margin: 10px 0 0 0; font-size: 16px; text-shadow: 1px 1px 2px rgba(0,0,0,0.3);">
      <strong>Praktična delavnica za ustvarjanje AI aplikacij z Azure Developer CLI.</strong><br>
      Dokončajte 7 modulov, da obvladate AZD predloge in delovne tokove uvajanja AI.
    </p>
    <div style="margin-top: 15px;">
      <span style="background: rgba(255,255,255,0.2); padding: 5px 10px; border-radius: 15px; color: white; font-size: 14px;">
        📅 Zadnja posodobitev: februar 2026
      </span>
    </div>
  </div>
</div>

# Delavnica AZD za razvijalce AI

Dobrodošli na praktični delavnici za učenje Azure Developer CLI (AZD) s poudarkom na uvajanju AI aplikacij. Ta delavnica vam pomaga pridobiti praktično razumevanje AZD predlog v 3 korakih:

1. **Odkritje** - poiščite predlogo, ki vam ustreza.
1. **Namestitev** - razmestite in potrdite, da deluje
1. **Prilagoditev** - spremenite in iterirajte, da bo vaša!

V času te delavnice boste spoznali tudi ključna orodja in delovne tokove za razvijalce, ki vam bodo pomagali poenostaviti vašo celotno razvojno pot.

<br/>

## Vodnik v brskalniku

Lekcije delavnice so v Markdown. Do njih lahko dostopate neposredno na GitHubu - ali pa zaženete predogled v brskalniku, kot je prikazano na spodnjem posnetku zaslona.

![Delavnica](../../../translated_images/sl/workshop.75906f133e6f8ba0.webp)

Za uporabo te možnosti - razvebite repozitorij v svoj profil in zaženite GitHub Codespaces. Ko je terminal v VS Code aktiven, vtipkajte ta ukaz:

```bash title="" linenums="0"
mkdocs serve > /dev/null 2>&1 &
```

Čez nekaj sekund se bo prikazalo pojavno okno. Izberite možnost `Open in browser`. Spletni vodnik se bo zdaj odprl v novem zavihku v brskalniku. Nekatere prednosti tega predogleda:

1. **Vgrajeno iskanje** - hitro poiščite ključne besede ali lekcije.
1. **Ikona za kopiranje** - postavite kazalec nad bloke kode, da vidite to možnost
1. **Preklop teme** - preklopite med temnim in svetlim načinom
1. **Pridobite pomoč** - kliknite ikono Discord v nogi strani, da se pridružite!

<br/>

## Pregled delavnice

**Trajanje:** 3-4 ure  
**Raven:** začetna do vmesna  
**Predpogoji:** Poznavanje Azure, konceptov AI, VS Code in orodij ukazne vrstice.

To je praktična delavnica, kjer se učite z dejanji. Ko zaključite vaje, priporočamo, da pregledate gradivo AZD za začetnike, da nadaljujete svojo učno pot v smeri varnosti in najboljših praks produktivnosti.

| Time| Module  | Objective |
|:---|:---|:---|
| 15 mins | [Uvod](docs/instructions/0-Introduction.md) | Vzpostavite izhodišča, razumite cilje |
| 30 mins | [Izbira AI predloge](docs/instructions/1-Select-AI-Template.md) | Raziskujte možnosti in izberite začetno predlogo | 
| 30 mins | [Potrditev AI predloge](docs/instructions/2-Validate-AI-Template.md) | Razmestite privzeto rešitev v Azure |
| 30 mins | [Razčlenitev AI predloge](docs/instructions/3-Deconstruct-AI-Template.md) | Raziščite strukturo in konfiguracijo |
| 30 mins | [Konfiguracija AI predloge](docs/instructions/4-Configure-AI-Template.md) | Aktivirajte in preizkusite razpoložljive funkcije |
| 30 mins | [Prilagoditev AI predloge](docs/instructions/5-Customize-AI-Template.md) | Prilagodite predlogo svojim potrebam |
| 30 mins | [Razgradnja infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) | Počistite in sprostite vire |
| 15 mins | [Zaključek in naslednji koraki](docs/instructions/7-Wrap-up.md) | Viri za učenje, izziv delavnice |

<br/>

## Kaj se boste naučili

Razmislite o AZD predlogi kot učni peskovnik za raziskovanje različnih zmožnosti in orodij za celoten razvoj na Microsoft Foundry. Do konca te delavnice bi morali pridobiti intuitiven občutek za različna orodja in koncepte v tem kontekstu.

| Concept  | Objective |
|:---|:---|
| **Azure Developer CLI** | Razumeti ukaze orodja in delovne tokove |
| **AZD predloge**| Razumeti strukturo projekta in konfiguracijo |
| **Azure AI Agent**| Zagotovitev in uvajanje Microsoft Foundry projekta  |
| **Azure AI Search**| Omogočanje kontekstnega inženirstva z agenti |
| **Opazljivost**| Raziščite sledenje, spremljanje in ocenjevanja |
| **Red Teaming**| Raziščite nasprotnosno (adversarialno) testiranje in blažilne ukrepe |

<br/>

## Struktura delavnice

Delavnica je strukturirana tako, da vas popelje na pot od odkritja predloge, do namestitve, razčlenitve in prilagoditve - z uporabo uradne [Pričetek z AI agenti](https://github.com/Azure-Samples/get-started-with-ai-agents) začetne predloge kot izhodišče.

### [Modul 1: Izbira AI predloge](docs/instructions/1-Select-AI-Template.md) (30 mins)

- Kaj so AI predloge?
- Kje lahko najdem AI predloge?
- Kako lahko začnem z izdelavo AI agentov?
- **Laboratorij**: Hiter začetek z GitHub Codespaces

### [Modul 2: Potrditev AI predloge](docs/instructions/2-Validate-AI-Template.md) (30 mins)

- Kaj je arhitektura AI predloge?
- Kaj je razvojni potek AZD?
- Kako lahko dobim pomoč pri razvoju z AZD?
- **Laboratorij**: Razmestitev in potrditev predloge AI agentov

### [Modul 3: Razčlenitev AI predloge](docs/instructions/3-Deconstruct-AI-Template.md) (30 mins)

- Raziščite svoje okolje v `.azure/` 
- Raziščite nastavitev virov v `infra/` 
- Raziščite svojo AZD konfiguracijo v `azure.yaml`s
- **Laboratorij**: Spremenite spremenljivke okolja & ponovno razmestite

### [Modul 4: Konfiguracija AI predloge](docs/instructions/4-Configure-AI-Template.md) (30 mins)
- Raziščite: Retrieval Augmented Generation
- Raziščite: ocenjevanje agentov in red teaming
- Raziščite: sledenje in spremljanje
- **Laboratorij**: Raziščite AI agenta + opazljivost 

### [Modul 5: Prilagoditev AI predloge](docs/instructions/5-Customize-AI-Template.md) (30 mins)
- Določite: PRD z zahtevami scenarija
- Konfigurirajte: spremenljivke okolja za AZD
- Implementirajte: lifecycle hooks za dodatna opravila
- **Laboratorij**: Prilagodite predlogo za moj scenarij

### [Modul 6: Razgradnja infrastrukture](docs/instructions/6-Teardown-Infrastructure.md) (30 mins)
- Povzetek: Kaj so AZD predloge?
- Povzetek: Zakaj uporabljati Azure Developer CLI?
- Naslednji koraki: Preizkusite drugo predlogo!
- **Laboratorij**: Odstranitev infrastrukture in čiščenje

<br/>

## Izziv delavnice

Želite izzvati sebe z več? Tukaj je nekaj predlogov projektov - ali delite svoje ideje z nami!!

| Projekt | Opis |
|:---|:---|
|1. **Razčlenite kompleksno AI predlogo** | Uporabite potek dela in orodja, ki smo jih opisali, in preverite, ali lahko razmestite, potrdite in prilagodite drugo AI rešitev. _Kaj ste se naučili?_|
|2. **Prilagodite glede na svoj scenarij**  | Poskusite napisati PRD (Product Requirements Document) za drug scenarij. Nato uporabite GitHub Copilot v svojem repozitoriju predloge v Agent Model - in ga prosite, naj vam ustvari delovni potek prilagoditve. _Kaj ste se naučili? Kako bi lahko izboljšali te predloge?_|
| | |

## Imate povratne informacije?

1. Objavite issue v tem repozitoriju - označite ga z `Workshop` za lažje iskanje.
1. Pridružite se Microsoft Foundry Discordu - povežite se s svojimi vrstniki!


| | | 
|:---|:---|
| **📚 Domov tečaja**| [AZD za začetnike](../README.md)|
| **📖 Dokumentacija** | [Začnite z AI predlogami](https://learn.microsoft.com/en-us/azure/ai-foundry/how-to/develop/ai-template-get-started)|
| **🛠️ AI predloge** | [Predloge Microsoft Foundry](https://ai.azure.com/templates) |
|**🚀 Naslednji koraki** | [Začni delavnico](../../../workshop) |
| | |

<br/>

---

**Navigacija:** [Glavni tečaj](../README.md) | [Uvod](docs/instructions/0-Introduction.md) | [Modul 1: Izbira AI predloge](docs/instructions/1-Select-AI-Template.md)

**Pripravljeni začeti graditi AI aplikacije z AZD?**

[Začni delavnico: Uvod →](docs/instructions/0-Introduction.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco Co-op Translator (https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v izvirnem jeziku velja za avtoritativni vir. Za kritične informacije priporočamo strokovni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki bi izhajale iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->