# Prinesi svojo aplikacijo - Dodaj azd obstoječemu projektu

**Navigacija po poglavjih:**
- **📚 Domača stran tečaja**: [AZD za začetnike](../../README.md)
- **📖 Trenutno poglavje**: Poglavje 1 - Osnove in hiter začetek
- **⬅️ Prejšnje**: [Vaš prvi projekt](first-project.md)
- **➡️ Naslednje**: [Razvojni zabojniki in Codespaces](dev-containers.md)

> Pregled ukazov in konfiguracije cilj: `azd 1.37.2` (november 2026). Generirane datoteke so odvisne od zaznane aplikacije; Azure implementacija v tem pregledu ni bila izvedena.

## Uvod

V [Vašem prvem projektu](first-project.md) ste aplikacijo implementirali tako, da ste začeli s predlogo. Vendar pa večino časa že *imate* aplikacijo - Node.js API, Python Flask storitev, .NET spletno aplikacijo - ki sedi v mapi na vašem računalniku. Ta lekcija prikazuje, kako dodati azd tej obstoječi kodi, da jo lahko implementirate z `azd up`, brez potrebe po predlogi.

## Cilji učenja

Do konca te lekcije boste:
- Razumeli tri načine za začetek azd projekta
- Poganjali `azd init` v obstoječi kodi
- Razumeli, kaj za vašo aplikacijo počneta `azure.yaml` in mapa `infra/`
- Vedeli, kdaj pustiti azdju, da generira infrastrukturo in kdaj napisati svojo
- Implementirali svojo obstoječo aplikacijo v Azure z `azd up`

## Izhodišča učenja

Po opravljeni lekciji boste lahko:
- Inicializirali azd v projektu, ki ga že imate
- Prebrali in uredili osnovno datoteko `azure.yaml`
- Generirali začetno infrastrukturo z `azd infra generate`
- Izbrali ustreznega gostitelja v Azure za vašo aplikacijo
- Implementirali in očistili svojo aplikacijo

---

## Trije načini za začetek azd projekta

| Izhodišče | Ukaz | Kdaj uporabiti |
|----------|-------|---------------|
| **Iz predloge** | `azd init --template <name> .` (prazna mapa) | Učenje ali začetek nove aplikacije iz preverjenega vzorca |
| **Iz obstoječe kode** | `azd init` (v mapi vašega projekta) | Že imate aplikacijo in jo želite implementirati |
| **Iz Git repozitorija** | `azd init --from-code` (v kloniranem repozitoriju) | Sprejemanje azd za obstoječi repozitorij |

Praksa prve možnosti ste že opravili. Ta lekcija pokriva drugo—najpogostejši scenarij v resničnem svetu.

---

## Korak 1: Zaženite `azd init` v svojem projektu

Odprite terminal **znotraj mape svojega obstoječega projekta** in zaženite:

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

Izberite **"Uporabi kodo v trenutni mapi."** azd nato pregleda vašo mapo, zazna jezik in ogrodje ter predlaga gostitelja.

### Kaj azd zazna

azd išče aplikacijske signale, kot so `package.json`, `requirements.txt`, `pom.xml`, `*.csproj` ali `Dockerfile`. Tok iz kode ni splošni čarovnik za izbiro gostitelja za vsako podprto ciljno implementacijo:

| Vaša aplikacija | Verjetno zaznan gostitelj |
|-----------------|---------------------------|
| Podprta Node.js / Python / .NET spletna aplikacija | Običajno Azure Container Apps; preverite ustvarjeno definicijo |
| Aplikacija v kontejnerju (`Dockerfile`) | Azure Container Apps |
| Funkcijska aplikacija ali projekt Static Web Apps | Uporabite ustrezno predlogo ali napišite `azure.yaml` in infrastrukturo, če tok iz kode ne podpira vaše postavitve |

Potrdite zaznano storitev(e) in azd bo sestavil potrebne datoteke.

---

## Korak 2: Razumeti kaj je azd ustvaril

Po inicializaciji preglejte `azure.yaml`. Tok ustvarjene infrastrukture lahko ohrani infrastrukturo implicitno, dokler ne zaženete `azd infra generate`; ne domnevajte, da `infra/` že obstaja:

```
my-existing-app/
├── azure.yaml          # ← NEW: tells azd what to deploy and where
├── infra/              # Materialized with azd infra generate when using implicit infrastructure
│   ├── main.bicep
│   └── main.parameters.json
├── src/ (your code)    # unchanged
└── ...                 # your existing files, untouched
```

### `azure.yaml` — definicija projekta

To je jedro azd projekta. Naslednja **ilustrativna definicija App Service** zahteva ustrezno infrastrukturo App Service; ni razlog za spremembo gostitelja Container Apps, ki ga generira azd, brez spremembe infrastrukture:

```yaml
# azure.yaml
name: my-existing-app
services:
  web:
    project: ./src           # path to your app code
    language: js             # js | python | dotnet | java
    host: appservice         # appservice | containerapp | function | staticwebapp
```

Blok `services` je ključni del: vsaka vnosna točka preslika mapo vaše kode na Azure gostitelja. Če ima vaša aplikacija tako frontend kot API, boste imeli dve storitvi.

### `infra/` — vaši Azure viri kot koda

Mapa `infra/` vsebuje Bicep datoteke, ki definirajo Azure vire, ki jih vaša aplikacija potrebuje (App Service, podatkovna baza itd.). Ni vam jih treba pisati ročno—azd ustvari delujočo začetno točko. Kasneje jih *lahko* urejate za dodajanje virov ali zaostritev varnosti (pojasnjeno v [poglavju 4](../chapter-04-infrastructure/README.md)).

> **Namig:** Želite videti ali prilagoditi ustvarjeno infrastrukturo pred uvajanjem? Zaženite `azd infra generate` (na voljo tudi kot `azd infra synth`), da zapišete IaC na disk in ga lahko pregledate ter nadzorujete verzije.

---

## Korak 3: Nastavite zahtevano konfiguracijo

Če vaša aplikacija potrebuje nastavitve ali skrivnosti (povezovalni niz, ključ API), jih ne vpišite neposredno v kodo. Uporabite vrednosti okolja:

```bash
# Create an environment
azd env new dev

# Set a non-secret value
azd env set API_VERSION 1.0.0
```

Ta shrani samo lokalno vrednost. Da bi vplivali na aplikacijo, jo izrecno uporabite v parametrih infrastrukture, podprti nastavitvi storitve ali hook-u; nastavitev poljubne spremenljivke ne konfigurira nameščenega runtime-a.

Za resnične skrivnosti jih shranite v Key Vault in jih sklicujte iz vaše infrastrukture—glejte [poglavje 3: Konfiguracija in Overjanje](../chapter-03-configuration/authsecurity.md).

---

## Korak 4: Uvedba

Sedaj uporabite isti workflow, ki ga že poznate:

```bash
# Authenticate (required for azd)
azd auth login

# Preview the resources that will be created
azd provision --preview

# Provision infrastructure and deploy your code
azd up
```

Ko se konča, azd izpiše URL vaše aplikacije. Preverite jo na enak način kot katerokoli azd aplikacijo:

```bash
azd show           # show endpoints
azd monitor --logs # check logs if needed
```

---

## Pogoste težave ob prvi uporabi

| Simptom | Verjeten vzrok | Popravek |
|---------|--------------|-----|
| azd ni zaznal moje aplikacije | Manjka manifest (npr. `package.json`) | Dodajte manifest ali ročno izberite gostitelja med `azd init` |
| Gradnja med `azd up` ne uspe | Aplikacija potrebuje gradbeni korak | Konfigurirajte skripte paketa aplikacije ali hook storitve `prepackage`; za izhod uvajanja uporabite `dist`, ne `buildCommand`/`outputPath` |
| Aplikacija se zažene, a vrne napake | Manjkajoče nastavitve/skrivnosti | Vnesite vrednosti v runtime nastavitve aplikacije ali v Key Vault referenco; sam `azd env set` ni dovolj |
| Izbran napačen gostitelj | Samodejna zaznava ne ustreza vašim potrebam | Spremenite tako `host:` kot ustrezno infrastrukturo ali izberite ustrezno predlogo |

Za več si oglejte [poglavje 7: Odpravljanje težav](../chapter-07-troubleshooting/README.md).

---

## Počistite

```bash
azd down --force --purge
```

---

## Povzetek

- `azd init` → **"Uporabi kodo v trenutni mapi"** doda azd aplikaciji, ki jo že imate.
- `azure.yaml` preslika vaše mape kode na Azure gostitelje; `infra/` definira vire kot Bicep.
- `azd infra generate` vam omogoča pregled ali prilagoditev ustvarjene infrastrukture.
- Ko je inicializirana, vaša obstoječa aplikacija uporablja popolnoma isti `azd up` / `azd down` workflow kot aplikacija na osnovi predloge.

---

## 🔗 Navigacija

| Smer | Lekcija |
|-----------|--------|
| **Prejšnja** | [Vaš prvi projekt](first-project.md) |
| **Naslednja** | [Razvoj kontejnerjev in Codespaces](dev-containers.md) |

## 📖 Povezani viri

- [Osnove AZD](azd-basics.md)
- [Poglavje 4: Infrastruktura kot koda](../chapter-04-infrastructure/README.md)
- [Konfiguracija in Overjanje](../chapter-03-configuration/authsecurity.md)
- [Cheat Sheet Ukazov](../../resources/cheat-sheet.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->