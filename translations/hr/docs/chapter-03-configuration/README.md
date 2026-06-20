# Poglavlje 3: Konfiguracija i autentikacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 45-60 minuta | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje pokriva konfiguraciju okruženja, obrasce autentikacije i najbolje prakse sigurnosti za Azure Developer CLI implementacije.

> Provjereno s `azd 1.25.6` u lipnju 2026.

## Ciljevi učenja

Nakon završetka ovog poglavlja, moći ćete:
- Ovladati hijerarhijom konfiguracije AZD-a
- Upravljati više okruženja (dev, staging, prod)
- Implementirati sigurnu autentikaciju s upravljanim identitetima
- Konfigurirati postavke specifične za okruženje

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|---------|-------|---------|
| 1 | [Vodič za konfiguraciju](configuration.md) | Postavljanje i upravljanje okruženjem | 30 min |
| 2 | [Autentikacija i sigurnost](authsecurity.md) | Obrasci upravljanog identiteta i RBAC-a | 30 min |

---

## 🚀 Brzi početak

```bash
# Izradi višestruka okruženja
azd env new dev
azd env new staging
azd env new prod

# Prebaci okruženja
azd env select prod

# Postavi varijable okruženja
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Pregled konfiguracije
azd env get-values
```

---

## 🔧 Hijerarhija konfiguracije

AZD primjenjuje postavke redoslijedom (kasnije nadjačava ranije):

1. **Zadane vrijednosti** (ugrađene u predloške)
2. **azure.yaml** (konfiguracija projekta)
3. **Promjenjive okruženja** (`azd env set`)
4. **Zastavice naredbenog retka** (`--location eastus`)

---

## 🔐 Najbolje sigurnosne prakse

```bash
# Koristite upravljani identitet (preporučeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Provjerite status autentifikacije AZD-a
azd auth status

# Opcionalno: provjerite Azure CLI kontekst ako planirate pokretati az naredbe
az account show

# Ponovno se autentificirajte ako je potrebno
azd auth login

# Opcionalno: osvježite autentifikaciju Azure CLI-ja za az naredbe
az login
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-------|-----------|
| **Prethodno** | [Poglavlje 2: AI razvoj](../chapter-02-ai-development/README.md) |
| **Sljedeće** | [Poglavlje 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Rješavanje problema](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Napomena**:
Ovaj dokument je preveden korištenjem AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako težimo točnosti, imajte na umu da automatski prijevodi mogu sadržavati greške ili netočnosti. Izvorni dokument na izvornom jeziku treba smatrati autoritativnim izvorom. Za važne informacije preporuča se profesionalni ljudski prijevod. Nismo odgovorni za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->