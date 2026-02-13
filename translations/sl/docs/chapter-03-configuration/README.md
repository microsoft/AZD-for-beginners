# Poglavje 3: Konfiguracija & Avtentikacija

**📚 Tečaj**: [AZD For Beginners](../../README.md) | **⏱️ Trajanje**: 45-60 minut | **⭐ Raven zahtevnosti**: Srednje

---

## Pregled

To poglavje obravnava konfiguracijo okolij, vzorce avtentikacije in varnostne najboljše prakse za uvajanje z Azure Developer CLI.

## Cilji učenja

Po zaključku tega poglavja boste:
- Obvladali hierarhijo konfiguracije AZD
- Upravljali več okolij (dev, staging, prod)
- Izvedli varno avtentikacijo z upravljanimi identitetami
- Konfigurirali nastavitve, specifične za okolje

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Vodnik za konfiguracijo](configuration.md) | Nastavitev in upravljanje okolij | 30 min |
| 2 | [Avtentikacija in varnost](authsecurity.md) | Upravljane identitete in vzorci RBAC | 30 min |

---

## 🚀 Hitri začetek

```bash
# Ustvari več okolij
azd env new dev
azd env new staging
azd env new prod

# Preklopi med okolji
azd env select prod

# Nastavi okoljske spremenljivke
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Prikaži konfiguracijo
azd env get-values
```

---

## 🔧 Hierarhija konfiguracije

AZD uporablja nastavitve v tem zaporedju (kasnejše prepišejo prejšnje):

1. **Privzete vrednosti** (vgrajene v predloge)
2. **azure.yaml** (konfiguracija projekta)
3. **Okoljske spremenljivke** (`azd env set`)
4. **Možnosti ukazne vrstice** (`--location eastus`)

---

## 🔐 Najboljše varnostne prakse

```bash
# Uporabite upravljano identiteto (priporočeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Preverite stanje overjanja
azd auth whoami
az account show

# Ponovno se overite, če je potrebno
azd auth login
az login
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 2: Razvoj AI](../chapter-02-ai-development/README.md) |
| **Naslednje** | [Poglavje 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Sorodni viri

- [Preverjanje pred uvajanjem](../chapter-06-pre-deployment/README.md)
- [Odpravljanje težav](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
Izjava o omejitvi odgovornosti:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku se šteje za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Ne prevzemamo odgovornosti za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->