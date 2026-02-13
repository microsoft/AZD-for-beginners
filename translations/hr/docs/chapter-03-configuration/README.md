# Chapter 3: Konfiguracija i autentikacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 45-60 minuta | **⭐ Složenost**: Srednje

---

## Pregled

Ovo poglavlje pokriva konfiguraciju okruženja, obrasce autentikacije i najbolje sigurnosne prakse za implementacije s Azure Developer CLI-jem.

## Ciljevi učenja

Nakon završetka ovog poglavlja, moći ćete:
- Savladati hijerarhiju konfiguracije AZD-a
- Upravljati više okruženja (dev, staging, prod)
- Implementirati sigurnu autentikaciju s upravljanim identitetima
- Konfigurirati postavke specifične za okruženje

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Vodič za konfiguraciju](configuration.md) | Postavljanje i upravljanje okruženjima | 30 min |
| 2 | [Autentikacija i sigurnost](authsecurity.md) | Obrasci upravljanih identiteta i RBAC-a | 30 min |

---

## 🚀 Brzi početak

```bash
# Kreiranje više okruženja
azd env new dev
azd env new staging
azd env new prod

# Prebacivanje okruženja
azd env select prod

# Postavljanje varijabli okruženja
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Pregled konfiguracije
azd env get-values
```

---

## 🔧 Hijerarhija konfiguracije

AZD primjenjuje postavke ovim redoslijedom (kasnije poništava prethodno):

1. **Zadane vrijednosti** (ugrađene u predloške)
2. **azure.yaml** (konfiguracija projekta)
3. **Varijable okruženja** (`azd env set`)
4. **Opcije naredbenog retka** (`--location eastus`)

---

## 🔐 Najbolje sigurnosne prakse

```bash
# Koristite upravljani identitet (preporučeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Provjerite status autentikacije
azd auth whoami
az account show

# Ponovno se autentificirajte ako je potrebno
azd auth login
az login
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 2: Razvoj AI-ja](../chapter-02-ai-development/README.md) |
| **Sljedeće** | [Poglavlje 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Rješavanje problema](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Odricanje odgovornosti:
Ovaj dokument preveden je pomoću AI usluge za prevođenje [Co-op Translator](https://github.com/Azure/co-op-translator). Iako nastojimo postići točnost, imajte na umu da automatizirani prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati mjerodavnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakve nesporazume ili pogrešna tumačenja koja proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->