# Luku 1: Perusteet ja pikakäynnistys

**📚 Kurssi**: [AZD Aloittelijoille](../../README.md) | **⏱️ Kesto**: 30-45 minuuttia | **⭐ Vaikeustaso**: Aloittelija

---

## Yleiskatsaus

Tämä luku esittelee Azure Developer CLI:n (azd) perusteet. Opit keskeiset käsitteet, asennat työkalut ja otat ensimmäisen sovelluksesi käyttöön Azureen.

## Oppimistavoitteet

By completing this chapter, you will:
- Ymmärtää, mitä Azure Developer CLI on ja miten se eroaa Azure CLI:stä
- Asenna ja määritä AZD alustallesi
- Ota ensimmäinen sovelluksesi käyttöön Azureen komennolla `azd up`
- Siivoa resurssit komennolla `azd down`

---

## 📚 Lessons

| # | Oppitunti | Kuvaus | Aika |
|---|--------|-------------|------|
| 1 | [AZD-perusteet](azd-basics.md) | Keskeiset käsitteet, terminologia ja projektirakenne | 15 min |
| 2 | [Asennus ja käyttöönotto](installation.md) | Alustakohtaiset asennusohjeet | 10 min |
| 3 | [Ensimmäinen projektisi](first-project.md) | Käytännön harjoitus: Ota web-sovellus käyttöön Azureen | 20 min |

---

## 🚀 Pikakäynnistys

```bash
# Tarkista asennus
azd version

# Kirjaudu Azureen
azd auth login

# Ota ensimmäinen sovellus käyttöön
azd init --template todo-nodejs-mongo
azd up

# Siivoa lopuksi
azd down --force --purge
```

---

## ✅ Onnistumisen kriteerit

Tämän luvun suorittamisen jälkeen sinun tulisi pystyä:

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
| **Seuraava** | [Luku 2: AI-keskeinen kehitys](../chapter-02-ai-development/README.md) |
| **Siirry** | [Luku 3: Konfigurointi](../chapter-03-configuration/README.md) |

---

## 📖 Liittyvät resurssit

- [Komentojen pikaopas](../../resources/cheat-sheet.md)
- [UKK](../../resources/faq.md)
- [Sanasto](../../resources/glossary.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Vastuuvapauslauseke:
Tämä asiakirja on käännetty tekoälypohjaisella käännöspalvelulla [Co-op Translator](https://github.com/Azure/co-op-translator). Vaikka pyrimme tarkkuuteen, ota huomioon, että automaattisissa käännöksissä saattaa esiintyä virheitä tai epätarkkuuksia. Alkuperäistä asiakirjaa sen alkuperäiskielellä tulee pitää määräävänä lähteenä. Kriittisen tiedon osalta suositellaan ammattimaista käännöstä. Emme ole vastuussa tästä käännöksestä aiheutuvista väärinymmärryksistä tai virhetulkinnoista.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->