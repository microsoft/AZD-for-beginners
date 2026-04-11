# Poglavje 3: Konfiguracija & Overjanje

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 45-60 minutes | **⭐ Kompleksnost**: Srednje zahtevno

---

## Pregled

To poglavje obravnava konfiguracijo okolja, vzorce overjanja in varnostne najboljše prakse za uvajanja z Azure Developer CLI.

> Preverjeno proti `azd 1.23.12` v marcu 2026.

## Cilji učenja

Z zaključkom tega poglavja boste:
- Obvladajte hierarhijo konfiguracije AZD
- Upravljajte več okolij (dev, staging, prod)
- Izvedite varno overjanje z upravljanimi identitetami
- Konfigurirajte nastavitve, specifične za okolje

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Vodnik za konfiguracijo](configuration.md) | Nastavitev in upravljanje okolja | 30 min |
| 2 | [Overjanje & Varnost](authsecurity.md) | Vzorce z upravljano identiteto in RBAC | 30 min |

---

## 🚀 Hiter začetek

```bash
# Ustvarite več okolij
azd env new dev
azd env new staging
azd env new prod

# Preklopite med okolji
azd env select prod

# Nastavite spremenljivke okolja
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Oglejte si konfiguracijo
azd env get-values
```

---

## 🔧 Hierarhija konfiguracije

AZD uporablja nastavitve v tem vrstnem redu (kasnejše prepiše prejšnje):

1. **Privzete vrednosti** (vgrajene v predloge)
2. **azure.yaml** (konfiguracija projekta)
3. **Okoljske spremenljivke** (`azd env set`)
4. **Zastavice ukazne vrstice** (`--location eastus`)

---

## 🔐 Varnostne najboljše prakse

```bash
# Uporabite upravljano identiteto (priporočeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Preverite stanje overitve AZD
azd auth status

# Izbirno: preverite kontekst Azure CLI, če nameravate zagnati ukaze az
az account show

# Ponovno se prijavite, če je potrebno
azd auth login

# Izbirno: osvežite prijavo v Azure CLI za ukaze az
az login
```

---

## 🔗 Navigacija

| Smer | Poglavje |
|-----------|---------|
| **Prejšnje** | [Poglavje 2: Razvoj AI](../chapter-02-ai-development/README.md) |
| **Naslednje** | [Poglavje 4: Infrastruktura](../chapter-04-infrastructure/README.md) |

---

## 📖 Povezani viri

- [Preveritve pred uvajanjem](../chapter-06-pre-deployment/README.md)
- [Odpravljanje težav](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Izjava o omejitvi odgovornosti**:
Ta dokument je bil preveden z uporabo storitve za prevajanje z umetno inteligenco [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, upoštevajte, da lahko avtomatizirani prevodi vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku naj velja za avtoritativni vir. Za ključne informacije priporočamo strokovni človeški prevod. Nismo odgovorni za morebitne nesporazume ali napačne razlage, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->