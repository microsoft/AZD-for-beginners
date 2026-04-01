# Poglavlje 3: Konfiguracija i autentifikacija

**📚 Tečaj**: [AZD za početnike](../../README.md) | **⏱️ Trajanje**: 45-60 minuta | **⭐ Kompleksnost**: Srednja

---

## Pregled

Ovo poglavlje pokriva konfiguraciju okruženja, obrasce autentifikacije i najbolje sigurnosne prakse za implementacije Azure Developer CLI-ja.

> Validirano s `azd 1.23.12` u ožujku 2026.

## Ciljevi učenja

Nakon dovršetka ovog poglavlja, naučit ćete:
- Savladati hijerarhiju konfiguracije AZD-a
- Upravljati višestrukim okruženjima (dev, staging, prod)
- Implementirati sigurnu autentifikaciju s upravljanim identitetima
- Konfigurirati postavke specifične za okruženje

---

## 📚 Lekcije

| # | Lekcija | Opis | Vrijeme |
|---|--------|-------------|------|
| 1 | [Vodič za konfiguraciju](configuration.md) | Postavljanje i upravljanje okruženjem | 30 min |
| 2 | [Autentifikacija i sigurnost](authsecurity.md) | Obrasci upravljanog identiteta i RBAC-a | 30 min |

---

## 🚀 Brzi početak

```bash
# Kreirajte više okruženja
azd env new dev
azd env new staging
azd env new prod

# Prebaci okruženja
azd env select prod

# Postavi varijable okruženja
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Pogledaj konfiguraciju
azd env get-values
```

---

## 🔧 Hijerarhija konfiguracije

AZD primjenjuje postavke ovim redoslijedom (kasnije poništava ranije):

1. **Zadane vrijednosti** (ugrađene u predloške)
2. **azure.yaml** (konfiguracija projekta)
3. **Varijable okruženja** (`azd env set`)
4. **Zastavice naredbenog retka** (`--location eastus`)

---

## 🔐 Najbolje sigurnosne prakse

```bash
# Koristite upravljani identitet (preporučeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Provjerite status AZD autentifikacije
azd auth status

# Opcionalno: provjerite Azure CLI kontekst ako planirate pokretati az naredbe
az account show

# Ponovno se autentificirajte ako je potrebno
azd auth login

# Opcionalno: osvježite Azure CLI autentifikaciju za az naredbe
az login
```

---

## 🔗 Navigacija

| Smjer | Poglavlje |
|-----------|---------|
| **Prethodno** | [Poglavlje 2: Razvoj AI](../chapter-02-ai-development/README.md) |
| **Sljedeće** | [Poglavlje 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Povezani resursi

- [Provjere prije implementacije](../chapter-06-pre-deployment/README.md)
- [Rješavanje problema](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o odricanju od odgovornosti**:  
Ovaj dokument preveden je pomoću AI prevoditeljskog servisa [Co-op Translator](https://github.com/Azure/co-op-translator). Iako se trudimo postići točnost, imajte na umu da automatski prijevodi mogu sadržavati pogreške ili netočnosti. Izvorni dokument na izvornom jeziku treba se smatrati autoritativnim izvorom. Za kritične informacije preporučuje se profesionalni ljudski prijevod. Ne snosimo odgovornost za bilo kakva nesporazumevanja ili pogrešne interpretacije koje proizlaze iz korištenja ovog prijevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->