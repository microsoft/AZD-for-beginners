# Uporabite svojo aplikacijo - Dodajte azd v obstoječ projekt

**Chapter Navigation:**
- **📚 Course Home**: [AZD za začetnike](../../README.md)
- **📖 Current Chapter**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Previous**: [Vaš prvi projekt](first-project.md)
- **➡️ Next**: [Razvojni kontejnerji & Codespaces](dev-containers.md)

> Preverjeno z `azd 1.25.6` junija 2026.

## Uvod

V [Vaš prvi projekt](first-project.md) ste razmestili aplikacijo tako, da ste začeli iz predloge. A večinoma že imate aplikacijo — Node.js API, Python Flask storitev, .NET spletno aplikacijo — v mapi na svojem računalniku. Ta lekcija pokaže, kako dodati azd tej obstoječi kodi, da jo lahko razmestite z `azd up`, brez uporabe predloge.

## Cilji učenja

Do konca te lekcije boste:
- Razumeli tri načine za začetek azd projekta
- Zagnali `azd init` znotraj obstoječe baze kode
- Razumeli, kaj počneta `azure.yaml` in mapa `infra/` za vašo aplikacijo
- Vedeli, kdaj naj azd ustvari infrastrukturo in kdaj jo je bolje napisati sami
- Razmestili svojo obstoječo aplikacijo v Azure z `azd up`

## Rezultati učenja

Po zaključku te lekcije boste znali:
- Inicializirati azd v projektu, ki ga že imate
- Brati in urejati osnovno datoteko `azure.yaml`
- Generirati začetno infrastrukturo z `azd infra generate`
- Izbrati primeren Azure gostitelj za vašo aplikacijo
- Razmestiti in počistiti lastno aplikacijo

---

## Trije načini za začetek azd projekta

| Začetna točka | Ukaz | Kdaj uporabiti |
|----------------|---------|-------------|
| **Iz predloge** | `azd init --template <name>` | Učenje ali začetek nove aplikacije iz preizkušenega vzorca |
| **Iz obstoječe kode** | `azd init` (v vaši projektni mapi) | Že imate aplikacijo in jo želite razmestiti |
| **Iz Git repozitorija** | `azd init --from-code` (v skloniranem repoju) | Uvajanje azd v obstoječ repozitorij |

Prvikrat ste že preizkusili prvo možnost. Ta lekcija pokriva drugo — najpogostejši primer v resničnem svetu.

---

## Korak 1: Zaženite `azd init` v vašem projektu

Odprite terminal **znotraj mape vašega obstoječega projekta** in zaženite:

```bash
cd my-existing-app
azd init
```

azd vas bo vprašal, kako želite inicializirati. Izberite:

```
? How do you want to initialize your app?
> Use code in the current directory
  Select a template
```

Izberite **"Uporabi kodo v trenutnem imeniku."** azd nato pregleda vašo mapo, zazna jezik in ogrodje ter predlaga gostitelja.

### Kaj zazna azd

azd išče znake, kot so `package.json`, `requirements.txt`, `pom.xml`, `*.csproj`, ali `Dockerfile`, in predlaga ustrezen Azure gostitelj:

| Vaša aplikacija | Verjetno zaznan gostitelj |
|----------|----------------------|
| Node.js / Python / .NET spletna aplikacija | Azure App Service ali Container Apps |
| Aplikacija v kontejnerju (`Dockerfile`) | Azure Container Apps |
| Function app | Azure Functions |
| Statična spletna stran (izhod gradnje React/Vue) | Azure Static Web Apps |

Potrdite zaznano storitev(e) in azd ustvari potrebne datoteke.

---

## Korak 2: Razumite, kaj je azd ustvaril

Po inicializaciji boste v projektu imeli dve novi stvari:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # ← NEW: Infrastructure as Code (Bicep by default)
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definicija projekta

To je srce azd projekta. Minimalna različica izgleda takole:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je ključni del: vsak vnos preslika mapo vaše kode na Azure gostitelja. Če ima vaša aplikacija tako frontend kot API, boste imeli dve storitvi.

### `infra/` — vaši Azure viri kot koda

Mapa `infra/` vsebuje Bicep datoteke, ki definirajo Azure vire, ki jih vaša aplikacija potrebuje (App Service, baza podatkov itd.). Ni jih treba pisati ročno—azd generira delujočo začetno točko. Kasneje jih *lahko* uredite, da dodate vire ali okrepite varnost (obravnavano v [Poglavje 4](../chapter-04-infrastructure/README.md)).

> **Nasvet:** Želite videti ali prilagoditi ustvarjeno infrastrukturo pred razmestitvijo? Zaženite `azd infra generate` (na voljo tudi kot `azd infra synth`), da zapišete IaC na disk in ga pregledate ter vključite v verzioniranje.

---

## Korak 3: Nastavite zahtevano konfiguracijo

Če vaša aplikacija potrebuje nastavitve ali skrivnosti (povezovalni niz, API ključ), jih ne vpisujte neposredno v kodo. Uporabite vrednosti okolja:

```bash
# Ustvarite okolje
azd env new dev

# Nastavite vrednost, ki ni skrivna
azd env set API_VERSION 1.0.0
```

Za resnične skrivnosti jih shranite v Key Vault in jih referencirajte iz vaše infrastrukture — glejte [Poglavje 3: Konfiguracija in overjanje](../chapter-03-configuration/authsecurity.md).

---

## Korak 4: Razmestitev

Zdaj uporabite isti potek dela, ki ga že poznate:

```bash
# Prijava (zahtevano za azd)
azd auth login

# Predogled virov, ki bodo ustvarjeni
azd provision --preview

# Zagotovite infrastrukturo in razmestite svojo kodo
azd up
```

Ko konča, azd izpiše URL vaše aplikacije. Preverite jo na enak način kot katero koli azd aplikacijo:

```bash
azd show           # prikaži končne točke
azd monitor --logs # preveri dnevnike, če je potrebno
```

---

## Pogoste začetne težave

| Simptom | Verjeten vzrok | Popravek |
|---------|--------------|-----|
| azd ni zaznal moje aplikacije | Manjkajoči manifest (npr. `package.json`) | Dodajte manifest ali izberite gostitelja ročno med `azd init` |
| Gradnja spodleti med `azd up` | Aplikacija potrebuje gradbeni korak | Dodajte `buildCommand`/`outputPath` pod storitvijo v `azure.yaml` |
| Aplikacija se zažene, vendar vrača napake | Manjkajoča konfiguracija/skrivnost | Nastavite vrednosti z `azd env set` ali povežite Key Vault |
| Izbran napačen gostitelj | Samodejna zaznava napačno domnevala | Uredite `host:` v `azure.yaml` in znova zaženite `azd up` |

Za več informacij glejte [Poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md).

---

## Čiščenje

```bash
azd down --force --purge
```

---

## Povzetek

- `azd init` → **"Uporabi kodo v trenutnem imeniku"** doda azd v aplikacijo, ki jo že imate.
- `azure.yaml` preslika mape z vašo kodo na Azure gostitelje; `infra/` definira vire kot Bicep.
- `azd infra generate` vam omogoča pregled ali prilagoditev ustvarjene infrastrukture.
- Ko je inicializirano, vaša obstoječa aplikacija uporablja točno isti potek `azd up` / `azd down` kot aplikacija iz predloge.

---

## 🔗 Navigacija

| Direction | Lesson |
|-----------|--------|
| **Previous** | [Vaš prvi projekt](first-project.md) |
| **Next** | [Razvojni kontejnerji & Codespaces](dev-containers.md) |

## 📖 Povezani viri

- [Osnove AZD](azd-basics.md)
- [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/README.md)
- [Konfiguracija in overjanje](../chapter-03-configuration/authsecurity.md)
- [Hitri pregled ukazov](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->