# Poglavje 3: Konfiguracija in avtentikacija

**📚 Tečaj**: [AZD za začetnike](../../README.md) | **⏱️ Trajanje**: 45-60 minut | **⭐ Kompleksnost**: Srednja

---

## Pregled

To poglavje zajema konfiguracijo okolja, vzorce avtentikacije in varnostne dobre prakse za implementacije Azure Developer CLI.

> Preverjeno z `azd 1.27.1` julija 2026.

## Cilji učenja

Z dokončanjem tega poglavja boste:
- Obvladali hierarhijo konfiguracije AZD
- Upravili več okolij (dev, staging, prod)
- Implementirali varno avtentikacijo z upravljanimi identitetami
- Konfigurirali nastavitve, specifične za okolje

---

## 📚 Lekcije

| št. | Lekcija | Opis | Čas |
|---|--------|-------------|------|
| 1 | [Vodnik po konfiguraciji](configuration.md) | Nastavitev in upravljanje okolja | 30 min |
| 2 | [Avtentikacija in varnost](authsecurity.md) | Vzorce upravljane identitete in RBAC | 30 min |

---

## 🚀 Hiter začetek

```bash
# Ustvari več okolij
azd env new dev
azd env new staging
azd env new prod

# Preklopi okolja
azd env select prod

# Nastavi spremenljivke okolja
azd env set AZURE_LOCATION eastus
azd env set SKU_NAME P1v3

# Poglej konfiguracijo
azd env get-values
```

---

## 🔧 Hierarhija konfiguracije

AZD uporabi nastavitve v tem vrstnem redu (kasnejše preglasijo prejšnje):

1. **Privzete vrednosti** (vgrajene v predloge)
2. **azure.yaml** (konfiguracija projekta)
3. **Sistemske spremenljivke** (`azd env set`)
4. **Preklopniki ukazne vrstice** (`--location eastus`)

---

## 🔐 Najboljše varnostne prakse

```bash
# Uporabite upravljano identiteto (priporočeno)
azd env set AZURE_USE_MANAGED_IDENTITY true

# Preverite stanje avtentikacije AZD
azd auth status

# Neobvezno: preverite kontekst Azure CLI, če nameravate zagnati az ukaze
az account show

# Po potrebi ponovno izvedite avtentikacijo
azd auth login

# Neobvezno: osvežite Azure CLI avtentikacijo za az ukaze
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

- [Preverjanja pred implementacijo](../chapter-06-pre-deployment/README.md)
- [Odpravljanje težav](../chapter-07-troubleshooting/common-issues.md)

---

<!-- CO-OP TRANSLATOR DISCLAIMER START -->
**Omejitev odgovornosti**:
Ta dokument je bil preveden z uporabo AI prevajalske storitve [Co-op Translator](https://github.com/Azure/co-op-translator). Čeprav si prizadevamo za natančnost, vas prosimo, da upoštevate, da avtomatizirani prevodi lahko vsebujejo napake ali netočnosti. Izvirni dokument v njegovem izvirnem jeziku je treba obravnavati kot avtoritativni vir. Za kritične informacije je priporočljiv strokovni človeški prevod. Ne odgovarjamo za morebitna nesporazume ali napačne interpretacije, ki izhajajo iz uporabe tega prevoda.
<!-- CO-OP TRANSLATOR DISCLAIMER END -->