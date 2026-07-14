# Luku 1: Perusteet & Pikakirjaus

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 30-45 minuuttia | **⭐ Vaativuus**: Aloittelija

---

## Yleiskatsaus

Tässä luvussa esitellään Azure Developer CLI (azd) perusteet. Opit ydinkäsitteet, asennat työkalut ja otat ensimmäisen sovelluksesi käyttöön Azureen.

> Vahvistettu `azd 1.27.1` -version kanssa heinäkuussa 2026.

## Oppimistavoitteet

Tämän luvun suorittamisen jälkeen osaat:
- Ymmärtää, mitä Azure Developer CLI on ja miten se eroaa Azure CLI:stä
- Asentaa ja konfiguroida AZD omalle alustallesi
- Ota ensimmäinen sovelluksesi käyttöön Azureen käyttäen `azd up`
- Siivota resurssit käyttäen `azd down`

---

## 📚 Oppitunnit

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [AZD Perusteet](azd-basics.md) | Ydinkäsitteet, termistö ja projektin rakenne | 15 min |
| 2 | [Asennus & Asetukset](installation.md) | Alustakohtaiset asennusohjeet | 10 min |
| 3 | [Ensimmäinen Projekti](first-project.md) | Käytännön harjoitus: Web-sovelluksen käyttöönotto Azureen | 20 min |
| 4 | [Oman Sovelluksen Tuonti](bring-your-own-app.md) | Lisää azd olemassa olevaan projektiin | 15 min |
| 5 | [Kehityssäiliöt & Kooditilat](dev-containers.md) | Toistettavat azd-ympäristöt kehityssäiliöillä | 15 min |

---

## ✅ Aloita tästä: Vahvista asennuksesi

Ennen aloittamista varmista, että paikallinen koneesi on valmis Luku 1:n mallipohjaa varten:

**Windows:**
```powershell
.\validate-setup.ps1
```

**macOS / Linux:**
```bash
bash ./validate-setup.sh
```

Jos skripti ilmoittaa puuttuvista työkaluista, korjaa ne ensin ja jatka sitten luvun parissa.

---

## 🚀 Pikakirjaus

```bash
# Tarkista asennus
azd version

# Todennus AZD:lle
# Vapaaehtoinen: käytä az login -komentoa, jos aiot suorittaa Azure CLI -komentoja suoraan
azd auth login

# Ota ensimmäinen sovelluksesi käyttöön
azd init --template todo-nodejs-mongo
azd up

# Puhdista, kun olet valmis
azd down --force --purge
```

---

## ✅ Onnistumisen kriteerit

Tämän luvun suorittamisen jälkeen sinun pitäisi pystyä:

```bash
azd version              # Näyttää asennetun version
azd init --template todo-nodejs-mongo  # Alustaa projektin
azd up                   # Julkaisee Azureen
azd show                 # Näyttää käynnissä olevan sovelluksen URL-osoitteen
azd down --force --purge # Siivoaa resurssit
```

---

## 🔗 Navigointi

| Suunta | Luku |
|-----------|---------|
| **Seuraava** | [Luku 2: AI-Ensisijainen Kehitys](../chapter-02-ai-development/README.md) |
| **Siirry kohtaan** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |

---

## 📖 Aiheeseen liittyviä resursseja

- [Komentojen pikalinkki](../../resources/cheat-sheet.md)
- [Usein kysytyt kysymykset (UKK)](../../resources/faq.md)
- [Sanasto](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Vastuuvapauslauseke**:
Tämä asiakirja on käännetty käyttämällä tekoälypohjaista käännöspalvelua [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, otathan huomioon, että automaattiset käännökset saattavat sisältää virheitä tai epätarkkuuksia. Alkuperäinen asiakirja sen alkuperäiskielellä on virallinen lähde. Tärkeissä asioissa suositellaan ammattimaista ihmiskäännöstä. Emme ole vastuussa tämän käännöksen käytöstä aiheutuvista väärinymmärryksistä tai tulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->