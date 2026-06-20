# Poglavje 3: Konfiguracija & Avtentikacija

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 45-60 minut | **⭐ Zahtevnost**: Srednja

---

## Pregled

To poglavje zajema konfiguracijo okolja, vzorce avtentikacije in najboljše varnostne prakse za uvajanje z Azure Developer CLI.

> Preverjeno z `azd 1.25.6` junija 2026.

## Učni cilji

Z dokončanjem tega poglavja boste:
- Obvladajte hierarhijo konfiguracije AZD
- Upravljajte več okolij (dev, staging, prod)
- Implementirajte varno avtentikacijo z upravljanimi identitetami
- Konfigurirajte nastavitve, specifične za posamezno okolje

---

## 📚 Lekcije

| # | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Vodnik za konfiguracijo](configuration.md) | Nastavitev in upravljanje okolij | 30 min |
| 2 | [Avtentikacija & Varnost](authsecurity.md) | Vzorce upravljanih identitet in RBAC | 30 min |

---

## 🚀 Hiter začetek

```bash
# Ustvari več okolij
azd env new dev
azd env new staging
azd env new prod

# Preklopi med okolji
azd env select prod

# Nastavi spremenljivke okolja
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Prikaži konfiguracijo
azd env get-values
```

---

## 🔧 Hierarhija konfiguracije

AZD uporablja nastavitve v tem vrstnem redu (kasnejše preglasi prejšnje):

1. **Privzete vrednosti** (vgrajene v predloge)
2. **azure.yaml** (konfiguracija projekta)
3. **Okoljske spremenljivke** (`azd env set`)
4. **Preklopniki ukazne vrstice** (`--location eastus`)

---

## 🔐 Najboljše varnostne prakse

```bash
# Uporabite upravljano identiteto (priporočeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Preverite stanje overjanja AZD
azd auth status

# Neobvezno: preverite kontekst Azure CLI, če nameravate izvajati ukaze az
az account show

# Ponovno se overite, če je potrebno
azd auth login

# Neobvezno: osvežite overjanje Azure CLI za ukaze az
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
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->