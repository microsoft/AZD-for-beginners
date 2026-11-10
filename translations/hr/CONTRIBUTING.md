# Sudjelovanje u AZD za početnike

Hvala vam na interesu za doprinos tečaju AZD za početnike! Ovaj dokument pruža smjernice i informacije za suradnike.

## Kako doprinositi

### Prijava problema

Ako pronađete greške, pogreške ili imate prijedloge za poboljšanja:

1. **Provjerite postojeće probleme**: Pregledajte [postojeće probleme](https://github.com/microsoft/azd-for-beginners/issues) da izbjegnete duplikate
2. **Kreirajte novi problem**: Koristite odgovarajući predložak za problem
3. **Dajte detalje**: Uključite korake za reprodukciju, očekivano ponašanje i snimke zaslona ako je primjenjivo

### Predlaganje promjena

1. **Forkajte repozitorij**: Kreirajte vlastiti fork projekta
2. **Kreirajte granu**: Napravite granu za nove značajke za svoje promjene
3. **Napravite promjene**: Slijedite naše standarde za kodiranje i dokumentaciju
4. **Testirajte svoje promjene**: Provjerite rade li svi linkovi i prikazuje li se sadržaj ispravno
5. **Pošaljite Pull Request**: Osigurajte jasan opis vaših promjena

### Vrste doprinosa

Dobrodošli su sljedeći tipovi doprinosa:

#### Poboljšanja sadržaja
- Ispravljanje tipfelera, gramatike i problema s formatiranjem
- Poboljšanje jasnoće postojeće dokumentacije
- Ažuriranje zastarjelih informacija
- Dodavanje nedostajućih objašnjenja ili konteksta

#### Novi primjeri
- Dodavanje stvarnih scenarija implementacije
- Kreiranje novih AZD predložaka za uobičajene slučajeve korištenja
- Pružanje dodatnih uzoraka koda i vježbi

#### Podrška za prijevod
- Pomoć pri održavanju postojećih prijevoda
- Poboljšanje kvalitete prijevoda
- Dodavanje prijevoda za novi sadržaj

#### Prijave bagova
- Prijavljivanje neispravnih veza ili netočnih primjera koda
- Identificiranje nedosljednosti u dokumentaciji
- Označavanje problema pristupačnosti

## Smjernice za doprinos

### Standardi za dokumentaciju

- Koristite jasan jezik prilagođen početnicima
- Uključite ciljeve učenja i ishode
- Pružite upute korak po korak s očekivanim rezultatima
- Dodajte navigacijske poveznice na povezani sadržaj
- Koristite dosljedan stil formatiranja i markdown

### Primjeri koda

- Osigurajte da su svi primjeri koda testirani i funkcionalni
- Uključite komentare koji objašnjavaju ključne koncepte
- Slijedite najbolje prakse za Azure i AZD
- Pružite očekivane izlaze gdje je primjenjivo

### Validacija engleske dokumentacije

Iz korijena repozitorija instalirajte postojeće razvojne zahtjeve i pokrenite:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Offline provjerivač linkova provjerava engleske Markdown/HTML putanje, naslove, eksplicitne sidrišta i prazne rezervirane oznake za linkove. Izuzima generirane `translations/` i `translated_images/`, uključujući linkove u te direktorije. Ne dohvaća vanjske web stranice niti validira Azure implementacije. Koristite `--json <report-path>` za izvoz neuspjelih provjera i inventara vanjskih URL-ova za zasebnu mrežnu provjeru. Provjerite trenutne naredbe iz gornjih izvora i uzorke preduvjeta prilikom mijenjanja tehničkih uputa; razlikujte testirane aplikacije od dizajnerskih nacrta.

### Poruke commit-a

Koristite jasne i opisne poruke commit-a:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Kodeks ponašanja

Molimo vas da pročitate i slijedite naš [Kodeks ponašanja](CODE_OF_CONDUCT.md) kako bismo održali dobrodošlu i uključivu zajednicu.

## Dobivanje pomoći

- **Pitanja**: Pretražite ili otvorite [GitHub issue](https://github.com/microsoft/AZD-for-beginners/issues)
- **Zajednica**: Pridružite se [Azure Discord](https://discord.gg/microsoft-azure)
- **Dokumentacija**: Pregledajte [Azure Developer CLI docs](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licenca

Doprinosom ovom repozitoriju pristajete da će vaši doprinosi biti licencirani pod [MIT licencom](../../LICENSE).

---

Hvala što pomažete da AZD za početnike bude bolji resurs za učenje zajednici!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->