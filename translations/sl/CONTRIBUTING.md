# Prispevanje k AZD For Beginners

Hvala za vaše zanimanje za prispevanje k tečaju AZD For Beginners! Ta dokument vsebuje smernice in informacije za prispevajoče.

## Kako prispevati

### Prijava težav

Če najdete napake, hrošče ali imate predloge za izboljšave:

1. **Preverite obstoječe težave**: Poiščite [obstoječe težave](https://github.com/microsoft/azd-for-beginners/issues), da se izognete podvajanj
2. **Ustvarite novo težavo**: Uporabite ustrezno predlogo za težavo
3. **Podajte podrobnosti**: Vključite korake za ponovitev, pričakovano vedenje in posnetke zaslona, če je primerno

### Predlaganje sprememb

1. **Razvejte repozitorij**: Ustvarite svoj fork projekta
2. **Ustvarite vejo**: Ustvarite funkcijsko vejo za svoje spremembe
3. **Naredite spremembe**: Upoštevajte naše standarde za kodiranje in dokumentacijo
4. **Preizkusite svoje spremembe**: Preverite, da vse povezave delujejo in da se vsebina pravilno prikaže
5. **Oddajte pull zahtevek**: Podajte jasno opis sprememb

### Vrste prispevkov

Dobrodošli so naslednji tipi prispevkov:

#### Izboljšave vsebine
- Popravljanje tipkarskih napak, slovnice in oblikovanja
- Izboljšanje jasnosti obstoječe dokumentacije
- Posodabljanje zastarelih informacij
- Dodajanje manjkajočih pojasnil ali konteksta

#### Novi primeri
- Dodajanje realnih scenarijev nameščanja
- Ustvarjanje novih AZD predlog za pogoste primere uporabe
- Zagotavljanje dodatnih vzorcev kode in vaj

#### Podpora za prevode
- Pomoč pri vzdrževanju obstoječih prevodov
- Izboljšanje kakovosti prevodov
- Dodajanje prevodov za novo vsebino

#### Poročila o hroščih
- Prijavljanje nedelujočih povezav ali napačnih primerov kode
- Prepoznavanje neskladnosti v dokumentaciji
- Opozorila o težavah z dostopnostjo

## Smernice za prispevanje

### Standardi dokumentacije

- Uporabljajte jasen, začetniku prijazen jezik
- Vključite učne cilje in rezultate
- Zagotovite navodila korak za korakom z pričakovanimi izhodi
- Dodajte navigacijske povezave do sorodnih vsebin
- Uporabljajte dosledno oblikovanje in markdown slog

### Primeri kode

- Preverite, da so vsi primeri kode testirani in delujoči
- Vključite komentarje za razlago ključnih konceptov
- Upoštevajte najboljše prakse Azure in AZD
- Tam, kjer je primerno, zagotovite pričakovan izhod

### Preverjanje angleške dokumentacije

Iz korena repozitorija namestite obstoječe razvojne zahteve in zaženite:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline preverjevalnik povezav preverja angleške Markdown/HTML poti, naslove, eksplicitne sidrne točke in prazne označbe povezav. Izključuje generirane `translations/` in `translated_images/`, vključno s povezavami v te imenike. Ne dostopa do zunanjih spletnih strani ali ne preverja nameščanj Azure. Uporabite `--json <report-path>` za izvoz neuspehov in zunanjega seznama URL-jev za ločeno omrežno preverjanje. Ob spreminjanju tehničnih navodil preverite trenutne ukaze gorvodno in vzorce predpogojev; ločite testirane aplikacije od zasnovnih načrtov.

### Sporočila commitov

Uporabljajte jasna in opisna sporočila commitov:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kodeks vedenja

Prosimo, preberite in upoštevajte naš [Kodeks vedenja](CODE_OF_CONDUCT.md), da ohranimo prijazno in vključujočo skupnost.

## Pridobivanje pomoči

- **Vprašanja**: Poiščite ali odprite [GitHub vprašanje](https://github.com/microsoft/AZD-for-beginners/issues)
- **Skupnost**: Pridružite se [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentacija**: Preglejte [Azure Developer CLI docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licenca

S prispevanjem k temu repozitoriju soglašate, da bodo vaši prispevki licencirani pod [MIT licenco](../../LICENSE).

---

Hvala, ker pomagate, da je AZD For Beginners boljši učni vir za skupnost!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->