# Contribuirea la AZD Pentru Începători

Vă mulțumim pentru interesul de a contribui la cursul AZD Pentru Începători! Acest document oferă linii directoare și informații pentru contributori.

## Cum să contribuiți

### Raportarea problemelor

Dacă găsiți erori, probleme sau aveți sugestii pentru îmbunătățiri:

1. **Verificați Problemele Existente**: Căutați în [problemele existente](https://github.com/microsoft/azd-for-beginners/issues) pentru a evita duplicate
2. **Creați o Problemă Nouă**: Folosiți șablonul corespunzător
3. **Oferiți Detalii**: Includeți pașii pentru reproducere, comportamentul așteptat și capturi de ecran dacă este cazul

### Propunerea de modificări

1. **Faceți Fork la Repozitoriu**: Creați propriul fork al proiectului
2. **Creați un Branch**: Faceți un branch de funcționalitate pentru modificările dvs.
3. **Faceți Modificările**: Urmați standardele noastre de codare și documentare
4. **Testați Modificările**: Verificați dacă toate linkurile funcționează și conținutul se afișează corect
5. **Trimiteți un Pull Request**: Oferiți o descriere clară a modificărilor

### Tipuri de contribuții

Primim cu plăcere următoarele tipuri de contribuții:

#### Îmbunătățiri de conținut
- Corectarea greșelilor de tipar, gramatică și de formatare
- Îmbunătățirea clarității documentației existente
- Actualizarea informațiilor învechite
- Adăugarea explicațiilor sau contextului lipsă

#### Exemple noi
- Adăugarea scenariilor reale de implementare
- Crearea de șabloane AZD noi pentru cazuri de utilizare comune
- Furnizarea de exemple suplimentare de cod și exerciții

#### Suport pentru traduceri
- Ajutor la menținerea traducerilor existente
- Îmbunătățirea calității traducerilor
- Adăugarea traducerilor pentru conținut nou

#### Raportarea bug-urilor
- Raportarea linkurilor rupte sau a exemplelor de cod incorecte
- Identificarea neconcordanțelor din documentație
- Semnalarea problemelor de accesibilitate

## Linii directoare pentru contribuții

### Standardele documentației

- Folosiți un limbaj clar, accesibil începătorilor
- Includeți obiectivele de învățare și rezultatele așteptate
- Oferiți instrucțiuni pas cu pas cu rezultatele anticipate
- Adăugați linkuri de navigare către conținut conex
- Utilizați un stil consecvent de formatare și markdown

### Exemple de cod

- Asigurați-vă că toate exemplele de cod sunt testate și funcționale
- Includeți comentarii care explică conceptele cheie
- Urmați cele mai bune practici Azure și AZD
- Oferiți rezultatul așteptat acolo unde este cazul

### Validarea documentației în limba engleză

Din rădăcina repozitoriului, instalați cerințele de dezvoltare existente și rulați:

```bash
python -m pip install -r requirements-dev.txt
python -m unittest discover -s .github/scripts -p "test_*.py"
python .github/scripts/check_links.py
python -m mkdocs build --strict --config-file workshop/mkdocs.yml
```

Verificatorul offline de linkuri analizează căile Markdown/HTML în engleză, titlurile, ancorele explicite și locurile libere pentru linkuri. Exclude directoarele generate `translations/` și `translated_images/`, inclusiv linkurile către aceste directoare. Nu preia site-uri externe sau nu validează implementările Azure. Folosiți `--json <report-path>` pentru a exporta eșecurile și inventarul URL extern pentru o verificare separată în rețea. Verificați comenzile upstream curente și prerechizitele de exemple când modificați instrucțiunile tehnice; distingeți aplicațiile testate de planurile de proiectare.

### Mesaje de commit

Folosiți mesaje de commit clare și descriptive:
- `docs: fix typo in installation guide`
- `feat: add new container app example`
- `fix: correct broken link in chapter 2`

## Codul de conduită

Vă rugăm să citiți și să respectați [Codul nostru de conduită](CODE_OF_CONDUCT.md) pentru a menține o comunitate primitoare și incluzivă.

## Obținerea ajutorului

- **Întrebări**: Căutați sau deschideți o [problemă GitHub](https://github.com/microsoft/AZD-for-beginners/issues)
- **Comunitate**: Alăturați-vă [Discord Azure](https://discord.gg/microsoft-azure)
- **Documentație**: Consultați [docurile Azure Developer CLI](https://learn.microsoft.com/azure/developer/azure-developer-cli/)

## Licență

Prin contribuția la acest repozitoriu sunteți de acord ca contribuțiile dvs. să fie licențiate sub [Licența MIT](../../LICENSE).

---

Vă mulțumim că ajutați AZD Pentru Începători să devină o resursă mai bună de învățare pentru comunitate!

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Declinare a responsabilității**:
Acest document a fost tradus folosind serviciul de traducere AI [Co-op Translator](https://github.com/Azure/co-op-translator). În timp ce ne străduim pentru acuratețe, vă rugăm să rețineți că traducerile automate pot conține erori sau inexactități. Documentul original în limba sa nativă trebuie considerat sursa autorizată. Pentru informații critice, se recomandă traducerea profesională realizată de un om. Nu ne asumăm responsabilitatea pentru eventualele neînțelegeri sau interpretări greșite care decurg din utilizarea acestei traduceri.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->